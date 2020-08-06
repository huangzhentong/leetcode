//
//  557. 反转字符串中的单词 III.swift
//  
//
//  Created by KT--stc08 on 2020/7/22.
//
/*
给定一个字符串，你需要反转字符串中每个单词的字符顺序，同时仍保留空格和单词的初始顺序。

示例 1:

输入: "Let's take LeetCode contest"
输出: "s'teL ekat edoCteeL tsetnoc"
注意：在字符串中，每个单词由单个空格分隔，并且字符串中不会有任何额外的空格。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/reverse-words-in-a-string-iii
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/
import Foundation
class Solution {
    func reverseWords(_ s: String) -> String {
        
       
        if s.isEmpty {
            return s
        }
        let list = s.components(separatedBy: " ")
        var reslut = [String]()
        for value in list {
            if !value.isEmpty && value != " " {
                reslut.append(String(value.reversed()))
            }
        }
        
        return reslut.joined(separator: " ")
    }
}
