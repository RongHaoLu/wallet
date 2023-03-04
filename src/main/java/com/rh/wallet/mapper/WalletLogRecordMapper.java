package com.rh.wallet.mapper;

import com.rh.wallet.entity.WalletLogRecord;
import org.apache.ibatis.annotations.Mapper;

/**
 * @Author RongHaoLu
 * @Date 2023/3/4 14:39
 */
@Mapper
public interface WalletLogRecordMapper {
    void insertRecord(WalletLogRecord walletLogRecord);

    WalletLogRecord getByRecordSN(String record_sn);

}
