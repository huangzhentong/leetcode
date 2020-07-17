//
//  441. 排列硬币.swift
//  
//
//  Created by KT--stc08 on 2020/7/17.
//
/*
 你总共有 n 枚硬币，你需要将它们摆成一个阶梯形状，第 k 行就必须正好有 k 枚硬币。

 给定一个数字 n，找出可形成完整阶梯行的总行数。

 n 是一个非负整数，并且在32位有符号整型的范围内。

 示例 1:

 n = 5

 硬币可排列成以下几行:
 ¤
 ¤ ¤
 ¤ ¤

 因为第三行不完整，所以返回2.
 示例 2:

 n = 8

 硬币可排列成以下几行:
 ¤
 ¤ ¤
 ¤ ¤ ¤
 ¤ ¤

 因为第四行不完整，所以返回3.

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/arranging-coins
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
class Solution {
    func arrangeCoins(_ n: Int) -> Int {
        
        //因为 行数总和 r 为 个数的总和为 (r+1)*r / 2
        //所以 根据 n个数推出 它的行数
        let row = Int( sqrt( Double( n * 2)))
        let count =  (row + 1) * row / 2
        print("row = \(row) | count ")
        if count > n{
            
            return row - 1
        }
        else if(count == n)
        {
           
            return row
        }
        else {
           
            return row
        }
       
    }
}

