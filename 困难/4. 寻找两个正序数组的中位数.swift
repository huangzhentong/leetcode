//
//  4. 寻找两个正序数组的中位数.swift
//  
//
//  Created by KT--stc08 on 2020/7/8.
//

import Foundation
/*
 给定两个大小为 m 和 n 的正序（从小到大）数组 nums1 和 nums2。

 请你找出这两个正序数组的中位数，并且要求算法的时间复杂度为 O(log(m + n))。

 你可以假设 nums1 和 nums2 不会同时为空。

  

 示例 1:

 nums1 = [1, 3]
 nums2 = [2]

 则中位数是 2.0
 示例 2:

 nums1 = [1, 2]
 nums2 = [3, 4]

 则中位数是 (2 + 3)/2 = 2.5

 
 //中位数 数组为奇数 则中位数为数组中间的数值 [1,2,5,8,9,10,11]  中位数 为 8
 数组为偶数选数组中间的两个数加再除于2 [1,2,3,4,5,6]  中位数为 （3+4）/2
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/median-of-two-sorted-arrays
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class Solution {
    
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        //判断数组是为空
        if nums1.count == 0{
            return medianSortedArrays(nums2)
        }
        else if(nums2.count == 0)
        {
            return medianSortedArrays(nums1)
        }
        
        let count = nums1.count + nums2.count
        let mid = count/2
        let num = count % 2
        var medianList = [Int]()
        var nums1Location = 0
        var nums2Location = 0
        for var i in 0 ..< count
        {
            //对比数据插入到数组中
            if nums1[nums1Location] <= nums2[nums2Location] {
                
                medianList.append(nums1[nums1Location]);
                nums1Location += 1
                //判断数组是否结束
                if(nums1Location == nums1.count)
                {
                    //把剩余数据插入到数组中
                    for last in nums2Location..<nums2.count{
                        if(i >= mid)
                        {
                            break;
                        }
                        i += 1;
                        medianList.append(nums2[last])
                    }
                }
            }
            else {
                medianList.append(nums2[nums2Location]);
                nums2Location += 1
                if(nums2Location == nums2.count)
                {
                    for last in nums1Location..<nums1.count{
                        if(i >= mid)
                        {
                            break;
                        }
                        i += 1;
                        medianList.append(nums1[last])
                    }
                }
                
            }
            if(i >= mid)
            {
                break;
            }
        }
        print(medianList)
        if(num == 1)
        {
            return Double(medianList[mid])
        }
        else{
            return  Double(medianList.last! + medianList[mid-1])/2
        }
    }
    
    func medianSortedArrays(_ nums : [Int]) ->Double
    {
        
        if nums.count == 0 {
            return Double(0)
        }
        
        let mid = nums.count/2
        if( nums.count % 2 == 0)
        {
            return Double(nums[mid] + nums[mid-1] )/2
        }
        else{
            return Double(nums[mid])
        }
    }
    
}
