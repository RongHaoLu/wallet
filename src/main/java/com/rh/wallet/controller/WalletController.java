package com.rh.wallet.controller;

import com.rh.wallet.entity.Wallet;
import com.rh.wallet.entity.WalletLog;
import com.rh.wallet.service.WalletService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author RongHaoLu
 * @Date 2023/3/4 01:28
 */
@RestController
@RequestMapping("/user")
public class WalletController {

    @Autowired
    private WalletService walletService;

    /**
     * 查询用户钱包余额
     * @param wallet
     * @return
     */
    @PostMapping("/getMoney")
    public ResponseEntity getMoney(Wallet wallet){
        Wallet resultWallet = walletService.getMoney(wallet);
        if (resultWallet!=null){
            HashMap<String, String> map = new HashMap<>();
            map.put("name",resultWallet.getName());
            map.put("money", String.valueOf(resultWallet.getMoney()));
            return ResponseEntity.status(HttpStatus.OK).body(map);
        }
        return ResponseEntity.status(500).body(null);
    }

    /**
     * 消费接口
     * @param consumeMoney
     * @param wallet
     * @return
     */
    @PostMapping("/consume")
    public ResponseEntity userConsume(@RequestParam(required = true,value = "consumeMoney")BigDecimal consumeMoney,Wallet wallet){

        walletService.userConsume(consumeMoney,wallet);

        return ResponseEntity.ok(null);
    }

    /**
     * 退款接口
     * @param userRefund
     * @param wallet
     * @return
     */
    @PostMapping("/refund")
    public ResponseEntity userRefund(@RequestParam(required = true,value = "userRefundMoney")BigDecimal userRefund,Wallet wallet){

        walletService.userRefund(userRefund,wallet);

        return ResponseEntity.ok(null);
    }


    /**
     * 查询明细接口
     * @param wallet
     * @return
     */
    @PostMapping("/details")
    public ResponseEntity userDetails(Wallet wallet){

        List<WalletLog> details = walletService.details(wallet);

        return ResponseEntity.ok(details);
    }



}
