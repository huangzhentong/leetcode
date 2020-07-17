//
//  400. 第N个数字.swift
//  
//
//  Created by KT--stc08 on 2020/7/16.
//
/*
 在无限的整数序列 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ...中找到第 n 个数字。

 注意:
 n 是正数且在32位整数范围内 ( n < 231)。

 示例 1:

 输入:
 3

 输出:
 3
 示例 2:

 输入:
 11

 输出:
 0

 说明:
 第11个数字在序列 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, ... 里是0，它是10的一部分。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/nth-digit
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
import UIKit
class Solution {
    func findNthDigit(_ n: Int) -> Int {

    if n < 10 {
        return n
    }
    var list = [Int]()
    var num = 0
    for i in 0...8
    {
        num  += 9 * (i+1) * Int(pow(Double(10), Double(i)))
        list.append(num)
    }
    var powNum = 0          //表示有多少位数
    var balance = 0         //算差值 用于表示哪个区间
    for (index , value) in list.enumerated(){
        if n < value {
            balance = n - list[index-1]
            powNum = index+1;
            break
        }
    }
    //
    let rowCount = Int(pow(Double(10), Double(powNum-1))) * powNum
    //首位
    let digit = balance / rowCount + 1
    //剩余位
    let remainder = balance % rowCount
    //判断当前的值 为多少
    var value = (remainder / powNum ) - (remainder % powNum == 0 ? 1 : 0)
    if value < 0 {
        value =  value + Int(pow(Double(10), Double(powNum-1)))
    }
    let powNum2 =  remainder % powNum
    // powNum2 表示当前位数 0 ，1，2，3，4，5 对应的位数 个，十万，万，千，百，十
    // 1表示首位
    if powNum2 == 1 {
        return digit
    }
    // 0表示 个位
    if powNum2 == 0 {
       return value  % 10
    }
    let allValue = (value / Int(pow(Double(10), Double(powNum-powNum2)))) % 10
    return allValue
}
}
