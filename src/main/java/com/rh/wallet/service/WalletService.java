package com.rh.wallet.service;

import com.rh.wallet.entity.Wallet;
import com.rh.wallet.entity.WalletLog;

import java.math.BigDecimal;
import java.util.List;

/**
 * @Author RongHaoLu
 * @Date 2023/3/4 01:33
 */
public interface WalletService {

    Wallet getMoney(Wallet wallet);

    void userConsume(BigDecimal consumeMoney, Wallet wallet);

    void userRefund(BigDecimal userRefund, Wallet wallet);

    List<WalletLog> details(Wallet wallet);
}
