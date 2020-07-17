//
//  451. 根据字符出现频率排序.swift
//  
//
//  Created by KT--stc08 on 2020/7/17.
//
/*
 给定一个字符串，请将字符串里的字符按照出现的频率降序排列。

 示例 1:

 输入:
 "tree"

 输出:
 "eert"

 解释:
 'e'出现两次，'r'和't'都只出现一次。
 因此'e'必须出现在'r'和't'之前。此外，"eetr"也是一个有效的答案。
 示例 2:

 输入:
 "cccaaa"

 输出:
 "cccaaa"

 解释:
 'c'和'a'都出现三次。此外，"aaaccc"也是有效的答案。
 注意"cacaca"是不正确的，因为相同的字母必须放在一起。
 示例 3:

 输入:
 "Aabb"

 输出:
 "bbAa"

 解释:
 此外，"bbaA"也是一个有效的答案，但"Aabb"是不正确的。
 注意'A'和'a'被认为是两种不同的字符。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sort-characters-by-frequency
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
class Solution {
    func frequencySort(_ s: String) -> String {
        
        var dic : [Character : Int] = [:]
        for c in s {
            let num = dic[c]
            if num != nil {
                dic[c] = num! + 1
            }
            else {
                dic[c] = 1
            }
        }
        //排序
        let sortedDic = dic.sorted { (arg0, arg1) -> Bool in
            
            let (_, value2) = arg1
            let (_, value1) = arg0
            return value2 < value1
        }
        var result = ""
        for (key ,value) in sortedDic {
        
            result.append(stringWithNum(key, num: value))
        }

        
        return result
    }
    
    func stringWithNum(_ c : Character , num : Int) -> String {
        var string = ""
        for _ in 0..<num {
            string.append(c)
        }
        return string
    }
    
}

var s = Solution()
s.frequencySort("tree")
s.frequencySort("cccaaa")
