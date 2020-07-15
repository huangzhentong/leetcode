//
//  File.swift
//  
//
//  Created by KT--stc08 on 2020/7/8.
//

import Foundation
/*
 给定一个整数数组，判断是否存在重复元素。

示例 1:

输入: [1,2,3,1]
输出: true
示例 2:

输入: [1,2,3,4]
输出: false
示例 3:

输入: [1,1,1,3,3,4,3,2,4,2]
输出: true
//如果任意一值在数组中出现至少两次，函数返回 true 。如果数组中每个元素都不相同，则返回 false 。
 */
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
    
        let set = Set(nums)
        if set.count == nums.count {
            return false
        }
        return true
        
    }
}
