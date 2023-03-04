package com.rh.wallet.mapper;

import com.rh.wallet.entity.Wallet;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.math.BigDecimal;

/**
 * @Author RongHaoLu
 * @Date 2023/3/4 01:37
 */
@Mapper
public interface WalletMapper {

    Wallet getMoney(Wallet wallet);

    String getSalt(Integer uid);

    void userConsume(@Param("uid") Integer uid, @Param("consumeMoney") BigDecimal consumeMoney, @Param("version") String version);

    void userRefund(@Param("uid") int uid, @Param("userRefund") BigDecimal userRefund, @Param("version") String version);

}
