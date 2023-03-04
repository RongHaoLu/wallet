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
public class WalletLog {
    private Integer logId;
    private String recordSn;
    private Integer uid;
    private BigDecimal changeMoney;
    private BigDecimal money;
    private String createTime;
    private String remark;

    private WalletLogRecord walletLogRecord;
}
