package com.rh.wallet.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

/**
 * @Author RongHaoLu
 * @Date 2023/3/4 00:29
 */
@AllArgsConstructor
@NoArgsConstructor     
@Data
public class WalletLogRecord {
    private Integer recordId;
    private String recordSn;
    private int walletType;
    private BigDecimal money;
    private String payStatus;
    private String payTime;
    private String fetchStatus;
    private String fetchTime;
    private String remark;
}
