package com.rh.wallet.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @Author RongHaoLu
 * @Date 2023/3/4 00:29
 */
@NoArgsConstructor
@AllArgsConstructor
@Data
public class Wallet {
    private int uid;
    private int cardId;
    private BigDecimal money;
    private String payPassword;
    private String name;
    private String identityCard;
    private String salt;
    private String version;
}
