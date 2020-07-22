//
//  498. 对角线遍历.swift
//  
//
//  Created by KT--stc08 on 2020/7/21.
//
/*
 给定一个含有 M x N 个元素的矩阵（M 行，N 列），请以对角线遍历的顺序返回这个矩阵中的所有元素，对角线遍历如下图所示。

  

 示例:

 输入:
 [
  [ 1, 2, 3 ],
  [ 4, 5, 6 ],
  [ 7, 8, 9 ]
 ]

 输出:  [1,2,4,7,5,3,6,8,9]

 解释:

  

 说明:

 给定矩阵中的元素总数不会超过 100000 。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/diagonal-traverse
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
class Solution {
    func findDiagonalOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.isEmpty {
            return []
        }
        
        var list = [Int]()
        //X轴数
        let xCount = matrix[0].count
        //Y轴数
        let yCount = matrix.count
        var add = 1
        //X轴开始位置
        var startX = 0
        //Y轴开始僧
        var startY = 0
        if yCount == 1{
            return matrix[0]
        }
        else if(xCount == 1)
        {
            for (index , value) in matrix.enumerated() {
                list.append(value[0])
            }
            return list
        }
        for  _ in 0..<xCount*yCount {
            
            list.append(matrix[startY][startX])
            print(list)
           
            if(startY - add < 0)
            {
             
                if startX + 1 >= xCount {
                    startY += 1
                
                }
                else {
                    startY = 0
                    startX += 1
                }
                add *= -1
            }
            else if(startY - add >= yCount)
            {
                startX += 1
                add *= -1
            }
            else if(startX - (-1 * add) < 0 )
            {
                if startY + 1 >= yCount{
                    
                    startY = 0
                    startX += 1
                    add *= -1
                }
                else{
                    startY += 1
                    startX = 0
                    add *= -1
                  
                }
                
            }
            else if(startX - (-1 * add) >= xCount )
            {
                startY += 1
                add *= -1
            }
            else {
                startY -= add
                startX += add
              
            }
        }
        return list
    }
}
