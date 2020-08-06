//
//  520. 检测大写字母.swift
//  
//
//  Created by KT--stc08 on 2020/8/6.
//
/*
 给定一个单词，你需要判断单词的大写使用是否正确。

 我们定义，在以下情况时，单词的大写用法是正确的：

 全部字母都是大写，比如"USA"。
 单词中所有字母都不是大写，比如"leetcode"。
 如果单词不只含有一个字母，只有首字母大写， 比如 "Google"。
 否则，我们定义这个单词没有正确使用大写字母。

 示例 1:

 输入: "USA"
 输出: True
 示例 2:

 输入: "FlaG"
 输出: False
 注意: 输入是由大写和小写拉丁字母组成的非空单词。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/detect-capital
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
import UIKit
class Solution {
    func detectCapitalUse(_ word: String) -> Bool {
        //判断是否为大写
        if word == word.uppercased() {
            return true
        }
        else if word == word.lowercased(){          //判断是否为小写
            return true
        }
        else if word == word.capitalized {          //判断首字母大写
            return true
        }
        else
        {
            return false
        }
    }
}
