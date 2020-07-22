//
//  387. 字符串中的第一个唯一字符.swift
//  
//
//  Created by KT--stc08 on 2020/7/20.
//
/*
 给定一个字符串，找到它的第一个不重复的字符，并返回它的索引。如果不存在，则返回 -1。

  

 示例：

 s = "leetcode"
 返回 0

 s = "loveleetcode"
 返回 2

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/first-unique-character-in-a-string
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        
        var dic : [String : [Int]] = [:]
        var firstIndex = -1;
        for (index,c)  in s.enumerated() {
            let value = String(c)
            var item = dic[value]
            if item == nil {
                item = [1,index]
            }
            else {
                item![0] = item![0] + 1
            }
            dic[value] = item
        }
        
        let values = dic.values
        let filterList = values.filter { (list) -> Bool in
            
            let res = list.first  == 1
            return res
        }
        if filterList.count >= 2 {
            let sortedList = filterList.sorted { (l1, l2) -> Bool in
                
                return l1[1] < l2[1]
            }
            firstIndex = sortedList[0][1]
        }
        else if filterList.count == 1
        {
             firstIndex = filterList[0][1]
        }

        
        return firstIndex
    }
}
