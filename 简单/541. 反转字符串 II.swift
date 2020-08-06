//
//  541. 反转字符串 II.swift
//  
//
//  Created by KT--stc08 on 2020/7/22.
//
/*
 给定一个字符串 s 和一个整数 k，你需要对从字符串开头算起的每隔 2k 个字符的前 k 个字符进行反转。

 如果剩余字符少于 k 个，则将剩余字符全部反转。
 如果剩余字符小于 2k 但大于或等于 k 个，则反转前 k 个字符，其余字符保持原样。
  

 示例:

 输入: s = "abcdefg", k = 2
 输出: "bacdfeg"
  

 提示：

 该字符串只包含小写英文字母。
 给定字符串的长度和 k 在 [1, 10000] 范围内。


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/reverse-string-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
class Solution {
    func reverseStr(_ s: String, _ k: Int) -> String {
        if k == 1 {
            return s
        }
        if s.count < k {
            return String(s.reversed())
        }
        var str = ""
        var count = s.count /  (2 * k)
        
        if s.count % (2 * k) == 0 {
            count -= 1
        }
        
        print("count = \(count)")
        for i in 0...count{
            var endIndex = 2*(i+1)*k
            if endIndex >= s.count {
                endIndex = s.count
            }
        
            let value = s.substingInRange(2*i*k ..< endIndex)
            if value!.count < k {
               str.append( contentsOf: value!.reversed())
            }
            else {
                str.append( contentsOf: (value?.substingInRange(0..<k))!.reversed())
                str.append((value?.substingInRange(k..<value!.count))!)
            }
            print("str = \(str)")
        }
        
        return str
        
    }
}
extension String {
   //获取子字符串
    func substingInRange(_ r: Range<Int>) -> String? {
        if r.lowerBound < 0 || r.upperBound > self.count {
            return nil
        }
        let startIndex = self.index(self.startIndex, offsetBy:r.lowerBound)
        let endIndex   = self.index(self.startIndex, offsetBy:r.upperBound)
        return String(self[startIndex..<endIndex])
    }
}
