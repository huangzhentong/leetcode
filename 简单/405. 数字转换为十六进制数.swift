//
//  405. 数字转换为十六进制数.swift
//  
//
//  Created by KT--stc08 on 2020/7/17.
//
/*
 给定一个整数，编写一个算法将这个数转换为十六进制数。对于负整数，我们通常使用 补码运算 方法。

 注意:

 十六进制中所有字母(a-f)都必须是小写。
 十六进制字符串中不能包含多余的前导零。如果要转化的数为0，那么以单个字符'0'来表示；对于其他情况，十六进制字符串中的第一个字符将不会是0字符。
 给定的数确保在32位有符号整数范围内。
 不能使用任何由库提供的将数字直接转换或格式化为十六进制的方法。
 示例 1：

 输入:
 26

 输出:
 "1a"
 示例 2：

 输入:
 -1

 输出:
 "ffffffff"

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/convert-a-number-to-hexadecimal
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation


class Solution {
    func toHex(_ num: Int) -> String {
        
        var newNum = num
        var lastNum = num
        if num < 0 {
            //负数从ffffffff开始
            //ffffffff 对应的整数 为 4294967295
            newNum =  4294967295 + num + 1
            lastNum = newNum
        }
        else if num < 16
        {
            return transitionTo16(num)
        }
        
        var count = 0
        while newNum  >= 16 {
            //计算当前首位
            newNum = newNum >> 4
            count += 1
        }
        //首位转换成16进字
        var string = transitionTo16(newNum)
        //计算剩余数字
        let other = lastNum - newNum * (1 << (count*4))
        //剩余数字判断是否需要补 0
        for i in 1 ... count {
            let nextValue = ( 1 << ((count - i) * 4))
            if other < nextValue {
                string.append("0")
            }
            else {
                break
            }
        }
        if other > 0 {
            string  = string + toHex(other)
        }
        return string
         
    }
    
    func transitionTo16(_ n : Int) -> String {
        switch n {
        case 10:
            return "a"
            case 11:
            return "b"
            case 12:
            return "c"
            case 13:
            return "d"
            case 14:
            return "e"
            case 15:
            return "f"
        default:
            return String(n)
        }
    }
    
}
