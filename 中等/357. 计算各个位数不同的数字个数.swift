//
//  357. 计算各个位数不同的数字个数.swift
//  
//
//  Created by KT--stc08 on 2020/7/20.
//
/*
 357. 计算各个位数不同的数字个数
 难度
 中等

 74

 收藏

 分享
 切换为英文
 关注
 反馈
 给定一个非负整数 n，计算各位数字都不同的数字 x 的个数，其中 0 ≤ x < 10n 。

 示例:

 输入: 2
 输出: 91
 解释: 答案应为除去 11,22,33,44,55,66,77,88,99 外，在 [0,100) 区间内的所有数字。
 */
import Foundation
class Solution {
    func countNumbersWithUniqueDigits(_ n: Int) -> Int {
        
        var list = [Int]()
        if n == 0 {
            return 1
        }
        //数学中的排列组合问题 用A来处理
        // n = 1 10
        //n = 2 // 9*9+ n1
        // n =3 // 9*9*8 + n2
        // n =4 // 9*9*8*7 + n3
        for i in 1...n {
            var sum = 9
            for j in 0 ..< i-1 {
               sum *=  (9-j)
            }
            if i == 1 {
                list.append(10)
            }
            else {
                list.append(sum + list.last!)
                
            }
       
        }
        return list.last!
    }
}
