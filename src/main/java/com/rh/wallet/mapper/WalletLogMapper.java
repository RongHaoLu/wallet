package com.rh.wallet.mapper;

import com.rh.wallet.entity.WalletLog;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * @Author RongHaoLu
 * @Date 2023/3/4 14:39
 */
@Mapper
public interface WalletLogMapper {
    void insertLog(WalletLog walletLog);

    List<WalletLog> getByUid(int uid);

}
