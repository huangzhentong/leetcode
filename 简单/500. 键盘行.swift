//
//  500. 键盘行.swift
//  
//
//  Created by KT--stc08 on 2020/7/21.
//
/*
 给定一个单词列表，只返回可以使用在键盘同一行的字母打印出来的单词。键盘如下图所示。

  



  

 示例：

 输入: ["Hello", "Alaska", "Dad", "Peace"]
 输出: ["Alaska", "Dad"]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/keyboard-row
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
class Solution {
    func findWords(_ words: [String]) -> [String] {
        
        var list = [String]()
        let l0 = ["q","w","e","r","t","y","u","i","o","p"]
        let l1 = ["a","s","d","f","g","h","j","k","l"]
//        let l2 = ["z","x","c","v","b","n","m"]
        for str in words {
            var next = 0
            var isInRow = true
            for (index , s) in str.lowercased().enumerated() {
                var last = 0
                if l0.contains(String(s)) {
                    last = 0
                }
                else if l1.contains(String(s))
                {
                     last = 1
                }
                else {
                     last = 2
                }
                if index == 0 {
                    next = last
                }
                else if(next != last)
                {
                    isInRow = false
                    break
                }
            }
            if isInRow {
                list.append(str)
            }
        }
        
        return list
    }
}
