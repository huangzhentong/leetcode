//
//  551. 学生出勤记录 I.swift
//  
//
//  Created by KT--stc08 on 2020/7/22.
//
/*
 给定一个字符串来代表一个学生的出勤记录，这个记录仅包含以下三个字符：

 'A' : Absent，缺勤
 'L' : Late，迟到
 'P' : Present，到场
 如果一个学生的出勤记录中不超过一个'A'(缺勤)并且不超过两个连续的'L'(迟到),那么这个学生会被奖赏。

 你需要根据这个学生的出勤记录判断他是否会被奖赏。

 示例 1:

 输入: "PPALLP"
 输出: True
 示例 2:

 输入: "PPALLL"
 输出: False

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/student-attendance-record-i
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
class Solution {
    func checkRecord(_ s: String) -> Bool {
        var aCount = 0          //计算A的个数
        var lCount = 0          //计算L的连续数
        for str in s {
            if str == "A" {
                aCount += 1
                lCount = 0
                if aCount >= 2 {
                    return false
                }
            } else if(str == "L")
            {
                lCount += 1
                if lCount >= 3 {
                    return false
                }
            }
            else {
                lCount = 0
            }
            
        }
        
        return true
        
    }
}
