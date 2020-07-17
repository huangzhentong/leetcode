//
//  409. 最长回文串.swift
//  
//
//  Created by KT--stc08 on 2020/7/17.
//
/*
 给定一个包含大写字母和小写字母的字符串，找到通过这些字母构造成的最长的回文串。

 在构造过程中，请注意区分大小写。比如 "Aa" 不能当做一个回文字符串。

 注意:
 假设字符串的长度不会超过 1010。

 示例 1:

 输入:
 "abccccdd"

 输出:
 7

 解释:
 我们可以构造的最长的回文串是"dccaccd", 它的长度是 7。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/longest-palindrome
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
import UIKit
class Solution {
    func longestPalindrome(_ s: String) -> Int {
        
        if s.count == 1 {
            return 1
        }
        var dic : [Character : Int] = [:]
        for  value in s {
            let num = dic[value]
            if num != nil {
                dic[value] = num! + 1
            }
            else{
                dic[value] = 1
            }
        }
        let array = Array(dic.values)
        //偶数
        let evenList = array.filter({$0 % 2 == 0})
        //奇数
        let unevenList = array.filter({$0 % 2 == 1 })
        var allUneven = 0
        var allEven  =  0
        
        if !unevenList.isEmpty {
            
            if unevenList.count >= 2 {
                allUneven  = unevenList.reduce(0) { (average, num) -> Int in
                    //将奇数变成偶数
                    return average + (num > 2 ? num - 1 : 0)
                }
                
                allUneven += 1
            }
            else {
                
                allUneven = unevenList.first!
            }

        }
        if  !evenList.isEmpty {
           
            if evenList.count >= 2 {
                allEven  = evenList.reduce(0) { (average, num) -> Int in
                    return average + num
                }
            }
            else {
                allEven = evenList.first!
            }
          
        }

        return allEven + allUneven
    }
}
