//
//  532. 数组中的K-diff数对.swift
//  
//
//  Created by KT--stc08 on 2020/7/22.
//
/*
 给定一个整数数组和一个整数 k, 你需要在数组里找到不同的 k-diff 数对。这里将 k-diff 数对定义为一个整数对 (i, j), 其中 i 和 j 都是数组中的数字，且两数之差的绝对值是 k.
 
 示例 1:
 
 输入: [3, 1, 4, 1, 5], k = 2
 输出: 2
 解释: 数组中有两个 2-diff 数对, (1, 3) 和 (3, 5)。
 尽管数组中有两个1，但我们只应返回不同的数对的数量。
 示例 2:
 
 输入:[1, 2, 3, 4, 5], k = 1
 输出: 4
 解释: 数组中有四个 1-diff 数对, (1, 2), (2, 3), (3, 4) 和 (4, 5)。
 示例 3:
 
 输入: [1, 3, 1, 5, 4], k = 0
 输出: 1
 解释: 数组中只有一个 0-diff 数对，(1, 1)。
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/k-diff-pairs-in-an-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation

class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        
        
        if nums.count < 2 {
            return 0
        }
        //因为 1 - 3  跟 3 - 1 只能算是一，所以需要去重
        var dic : [String : Int] = [:]
        for i in 0 ... (nums.count-2) {
            for j in (i+1) ... nums.count-1 {
                if Int( fabs (Double(nums[i] - nums[j]))) == k{
                    var key = ""
                    if(nums[i] > nums[j]){
                        key = String(nums[i]) + "-" + String(nums[j])
                    }
                    else {
                        key = String(nums[j]) + "-" + String(nums[i])
                    }
                    dic[key] = k
                }
            }
        }
        return dic.values.count
    }
}
//方法二
func findPairs(_ nums: [Int], _ k: Int) -> Int {
    
    
    if nums.count < 2  || k < 0{
        return 0
    }
    if k == 0 {
        
        var dic : [Int : Int] = [:]
        for value  in nums {
            
            let num = dic[value]
            
            if (num != nil) {
                dic[value] = num! + 1
            }
            else {
                dic[value] = 1
            }
            
            
        }
        
        let list = dic.values.filter { (x) -> Bool in
            x >= 2
        }
        return list.count
        
        
    }
    else {
        
        //因为 1 - 3  跟 3 - 1 只能算是一，所以需要去重
        var dic = Set<String>()
        for i in 0 ... (nums.count-1) {
            let value1 =  nums[i] - k
            let value2 =  nums[i] + k
            var key = ""
            if value1 > 0 {
                key = String(nums[i]) + "-" + String(value1)
                if nums.contains(value1) {
                    dic.insert(key)
                }
                
                
            }
            if nums.contains(value2) {
                key = String(value2) + "-" + String(nums[i])
                dic.insert(key)
                
            }
            
        }
        
        return dic.count
    }
}

