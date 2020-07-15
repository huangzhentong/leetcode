//
//  74. 搜索二维矩阵.swift
//  
//
//  Created by KT--stc08 on 2020/7/13.
//
/*
 74. 搜索二维矩阵
 难度
 中等

 207

 收藏

 分享
 切换为英文
 关注
 反馈
 编写一个高效的算法来判断 m x n 矩阵中，是否存在一个目标值。该矩阵具有如下特性：

 每行中的整数从左到右按升序排列。
 每行的第一个整数大于前一行的最后一个整数。
 示例 1:

 输入:
 matrix = [
   [1,   3,  5,  7],
   [10, 11, 16, 20],
   [23, 30, 34, 50]
 ]
 target = 3
 输出: true
 示例 2:

 输入:
 matrix = [
   [1,   3,  5,  7],
   [10, 11, 16, 20],
   [23, 30, 34, 50]
 ]
 target = 13
 输出: false
 */
import Foundation
class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        for (index , valuse) in matrix.enumerated() {
            if valuse.isEmpty {
                continue
            }
            if valuse.last! >= target {
                for nums in valuse {
                    if nums == target {
                        return true
                    }
                }
            }
        }
        return false
    }
}
