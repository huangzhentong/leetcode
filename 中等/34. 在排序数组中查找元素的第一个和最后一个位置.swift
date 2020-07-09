//
//  34. 在排序数组中查找元素的第一个和最后一个位置.swift
//  
//
//  Created by KT--stc08 on 2020/7/9.
//
/*
 34. 在排序数组中查找元素的第一个和最后一个位置
 难度
 中等

 494

 收藏

 分享
 切换为英文
 关注
 反馈
 给定一个按照升序排列的整数数组 nums，和一个目标值 target。找出给定目标值在数组中的开始位置和结束位置。

 你的算法时间复杂度必须是 O(log n) 级别。

 如果数组中不存在目标值，返回 [-1, -1]。

 示例 1:

 输入: nums = [5,7,7,8,8,10], target = 8
 输出: [3,4]
 示例 2:

 输入: nums = [5,7,7,8,8,10], target = 6
 输出: [-1,-1]
 */
import Foundation
class Solution {
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        
        if nums.count == 0 {
            return [-1,-1]
        }
        if target  < nums.first! || target > nums.last! {
            return [-1,-1]
        }
        
        var startIndex = -1
        var endIndex = -1
        for (index , val) in nums.enumerated() {
            if startIndex == -1 && val == target {
                startIndex = index
                endIndex = index
            }
            else if(val == target)
            {
                endIndex = index
            }
        }
        
        
        return [startIndex,endIndex]
    }
}
var s = Solution()
s.searchRange([5,7,7,8,8,10], 8)
s.searchRange([5,7,7,8,8,10], 6)
s.searchRange([5], 6)
s.searchRange([5], 5)
s.searchRange([], 5)
