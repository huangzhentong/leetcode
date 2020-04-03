//
//  Excel表列序号.swift
//  
//
//  Created by KT--stc08 on 2020/4/3.
//
//给定一个Excel表格中的列名称，返回其相应的列序号。
//
//例如，
//
//    A -> 1
//    B -> 2
//    C -> 3
//    ...
//    Z -> 26
//    AA -> 27
//    AB -> 28
//    ...
//示例 1:
//
//输入: "A"
//输出: 1
//示例 2:
//
//输入: "AB"
//输出: 28
//示例 3:
//
//输入: "ZY"
//输出: 701
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/excel-sheet-column-number
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
import Foundation

class Solution {
    func titleToNumber(_ s: String) -> Int {
     var i  : Int = s.count - 1;
        var number:UInt32 = 0
        let allTitle = 26;
        var count = 0 ;
        for code in s.unicodeScalars {
            //幂次方
           let powCount =  pow(Double(allTitle) , Double(i))
            number = code.value - 64
            count +=  Int(powCount) * Int(number)
            i -= 1
  
        }
        return count
    }
}
