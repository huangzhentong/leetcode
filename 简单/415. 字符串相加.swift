//
//  415. 字符串相加.swift
//  
//
//  Created by KT--stc08 on 2020/7/20.
//
/*
 给定两个字符串形式的非负整数 num1 和num2 ，计算它们的和。

 注意：

 num1 和num2 的长度都小于 5100.
 num1 和num2 都只包含数字 0-9.
 num1 和num2 都不包含任何前导零。
 你不能使用任何內建 BigInteger 库， 也不能直接将输入的字符串转换为整数形式。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-strings
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
class Solution {
    func addStrings(_ num1: String, _ num2: String) -> String {
        
        if num1.isEmpty {
            return num2
        }
        if num2.isEmpty {
            return num1
        }
        
        let l1 = Array(num1).reversed() as [Character]
        let l2 = Array(num2).reversed() as [Character]
        var maxList = l1
        var minList = l2
        if l1.count < l2.count {
            maxList = l2
            minList = l1
        }
        var isbeyond = 0
        var res = ""
        for (index , value) in maxList.enumerated() {
          
            var l1 = Int(String(value))!
            var l2 = 0
        
            if index  > minList.count - 1  {
                l2 = 0
            }
            else{
                l2 = Int(String(minList[index]))!
            }
            let count = l1 + l2 + isbeyond
            if count >= 10{
                isbeyond = 1
            }
            else {
                isbeyond = 0
            }
            res.append(String(count % 10))
    
        }
        if isbeyond == 1 {
            res.append("1")
        }
        let result = res.reversed()
        
        return  String(result)
    }
}

var s = Solution()
s.addStrings("123", "4567")


