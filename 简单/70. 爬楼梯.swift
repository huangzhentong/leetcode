//
//  70. 爬楼梯.swift
//  
//
//  Created by KT--stc08 on 2020/7/13.
//
/*
 假设你正在爬楼梯。需要 n 阶你才能到达楼顶。

 每次你可以爬 1 或 2 个台阶。你有多少种不同的方法可以爬到楼顶呢？

 注意：给定 n 是一个正整数。

 示例 1：

 输入： 2
 输出： 2
 解释： 有两种方法可以爬到楼顶。
 1.  1 阶 + 1 阶
 2.  2 阶
 示例 2：

 输入： 3
 输出： 3
 解释： 有三种方法可以爬到楼顶。
 1.  1 阶 + 1 阶 + 1 阶
 2.  1 阶 + 2 阶
 3.  2 阶 + 1 阶

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/climbing-stairs
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */


/* 规律  每个数的种类为前两个数之和
   case 1: result = 1; break;
   case 2: result = 2; break;
   case 3: result = 3; break;
   case 4: result = 5; break;
   case 5: result = 8; break;
   case 6: result = 13; break;
   case 7: result = 21; break;
   case 8: result = 34; break;
 */
import Foundation
class Solution {
    func climbStairs(_ n: Int) -> Int {
        
        var l1 = 1
        var l2 = 2
        if n <= 2 {
            return n
        }
        for _ in 3...n {
            let temp = l1 + l2
            l1 = l2;
            l2 = temp;
        }
        return l2
        
    }
    
}
