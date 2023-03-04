package com.rh.wallet.service.impl;

import com.rh.wallet.entity.Wallet;
import com.rh.wallet.entity.WalletLog;
import com.rh.wallet.entity.WalletLogRecord;
import com.rh.wallet.mapper.WalletLogMapper;
import com.rh.wallet.mapper.WalletLogRecordMapper;
import com.rh.wallet.mapper.WalletMapper;
import com.rh.wallet.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.DigestUtils;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @Author RongHaoLu
 * @Date 2023/3/4 01:34
 */
@Service
public class WalletServiceImpl implements WalletService {

    @Autowired
    private WalletMapper walletMapper;

    @Autowired
    private WalletLogMapper walletLogMapper;

    @Autowired
    private WalletLogRecordMapper walletLogRecordMapper;

    /**
     * 查询余额
     * @param wallet
     * @return
     */
    @Override
    public Wallet getMoney(Wallet wallet) {

        String salt = walletMapper.getSalt(wallet.getUid());
        //将用户输入的密码和数据库中的salt相加比较密码（md5加盐）
        wallet.setPayPassword(DigestUtils.md5DigestAsHex((wallet.getPayPassword() + salt).getBytes()));
        Wallet resultWallet = walletMapper.getMoney(wallet);

        return resultWallet;
    }

    /**
     * 消费函数
     * @param consumeMoney
     * @param wallet
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void userConsume(BigDecimal consumeMoney, Wallet wallet) {

        //消费需要验证密码，可以直接调用上面的查询余额接口
        Wallet getMoneyUser = getMoney(wallet);
        if (getMoneyUser!=null) {
            BigDecimal dbMoney = getMoneyUser.getMoney();
            //判断余额是否够
            if (dbMoney.compareTo(consumeMoney)>=0) {
                //伪代码：购买商品消费，然后下面进行余额扣减
                //要保证接口的幂等性，可以使用防重令牌，这里使用数据库的乐观锁简单实现（version版本号实现）
                walletMapper.userConsume(getMoneyUser.getUid(),consumeMoney,getMoneyUser.getVersion());
                //下面开始封装日志表的数据
                WalletLog walletLog = new WalletLog();
                walletLog.setChangeMoney(consumeMoney);
                walletLog.setMoney(dbMoney.subtract(consumeMoney));
                //UUID生成流水编号
                String recordSN = UUID.randomUUID().toString();
                walletLog.setRecordSn(recordSN);
                walletLog.setCreateTime(new SimpleDateFormat().format(new Date()));
                walletLog.setRemark("购买某某商品消费");
                walletLog.setUid(getMoneyUser.getUid());
                walletLogMapper.insertLog(walletLog);
                //下面开始封装流水明细表的数据
                WalletLogRecord walletLogRecord = new WalletLogRecord();
                walletLogRecord.setRecordSn(recordSN);
                walletLogRecord.setMoney(consumeMoney);
                //伪代码，调用支付接口的回调函数，如果支付成功设置支付状态
                walletLogRecord.setPayStatus("1");
                walletLogRecord.setPayTime(new SimpleDateFormat().format(new Date()));
                //伪代码，调用收款接口的回调函数，如果收款到账设置支付状态
                walletLogRecord.setFetchStatus("1");
                walletLogRecord.setFetchTime(new SimpleDateFormat().format(new Date()));
                //0是充值，1是消费，2是退款，此交易类型是消费，故设1
                walletLogRecord.setWalletType(1);
                walletLogRecord.setRemark("购买某某商品消费");
                walletLogRecordMapper.insertRecord(walletLogRecord);
            }
        }
    }

    /**
     * 退款接口
     * @param userRefund
     * @param wallet
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public void userRefund(BigDecimal userRefund, Wallet wallet) {
        //退款需要验证密码
        Wallet getMoneyUser = getMoney(wallet);
        //验证正确走以下代码
        if (getMoneyUser!=null){
            //此处也是使用乐观锁，避免并发出现问题
            walletMapper.userRefund(getMoneyUser.getUid(),userRefund,getMoneyUser.getVersion());
            //开始封装日志类
            WalletLog walletLog = new WalletLog();
            walletLog.setChangeMoney(userRefund);
            walletLog.setMoney(getMoneyUser.getMoney().add(userRefund));
            String recordSN = UUID.randomUUID().toString();
            walletLog.setRecordSn(recordSN);
            walletLog.setCreateTime(new SimpleDateFormat().format(new Date()));
            walletLog.setRemark("退款某某商品");
            walletLog.setUid(getMoneyUser.getUid());
            walletLogMapper.insertLog(walletLog);
            //开始封装流水明显表
            WalletLogRecord walletLogRecord = new WalletLogRecord();
            walletLogRecord.setRecordSn(recordSN);
            walletLogRecord.setMoney(userRefund);
            walletLogRecord.setPayStatus("1");
            walletLogRecord.setPayTime(new SimpleDateFormat().format(new Date()));
            walletLogRecord.setFetchStatus("1");
            walletLogRecord.setFetchTime(new SimpleDateFormat().format(new Date()));
            //0是充值，1是消费，2是退款，此交易类型是消费，故设2
            walletLogRecord.setWalletType(2);
            walletLogRecord.setRemark("退款某某商品");
            walletLogRecordMapper.insertRecord(walletLogRecord);
        }
    }

    @Override
    public List<WalletLog>  details(Wallet wallet) {

        List<WalletLog> byUid = walletLogMapper.getByUid(wallet.getUid());


        return byUid;
    }
}
