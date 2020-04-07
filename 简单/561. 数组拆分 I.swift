//
//  561. 数组拆分 I.swift
//  
//
//  Created by KT--stc08 on 2020/4/7.
//
/*
 给定长度为 2n 的数组, 你的任务是将这些数分成 n 对, 例如 (a1, b1), (a2, b2), ..., (an, bn) ，使得从1 到 n 的 min(ai, bi) 总和最大。
 
 示例 1:
 
 输入: [1,4,3,2]
 
 输出: 4
 解释: n 等于 2, 最大总和为 4 = min(1, 2) + min(3, 4).
 提示:
 
 n 是正整数,范围在 [1, 10000].
 数组中的元素范围在 [-10000, 10000].
 通过次数32,993提交次数46,964
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/array-partition-i
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
class Solution {
    func arrayPairSum(_ nums: [Int]) -> Int {
        
        var newNums = nums
        newNums.sort()
        let count = nums.count / 2
        var allNum = 0
        for i in 0..<count{
            allNum += newNums[i*2]
        }
        return allNum
    }
}
