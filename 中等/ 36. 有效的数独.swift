//
//   36. 有效的数独.swift
//  
//
//  Created by KT--stc08 on 2020/7/10.
//

import Foundation
/*
 36. 有效的数独
 难度
 中等

 369

 收藏

 分享
 切换为英文
 关注
 反馈
 判断一个 9x9 的数独是否有效。只需要根据以下规则，验证已经填入的数字是否有效即可。

 数字 1-9 在每一行只能出现一次。
 数字 1-9 在每一列只能出现一次。
 数字 1-9 在每一个以粗实线分隔的 3x3 宫内只能出现一次。


 上图是一个部分填充的有效的数独。

 数独部分空格内已填入了数字，空白格用 '.' 表示。

 示例 1:

 输入:
 [
   ["5","3",".",".","7",".",".",".","."],
   ["6",".",".","1","9","5",".",".","."],
   [".","9","8",".",".",".",".","6","."],
   ["8",".",".",".","6",".",".",".","3"],
   ["4",".",".","8",".","3",".",".","1"],
   ["7",".",".",".","2",".",".",".","6"],
   [".","6",".",".",".",".","2","8","."],
   [".",".",".","4","1","9",".",".","5"],
   [".",".",".",".","8",".",".","7","9"]
 ]
 输出: true
 示例 2:

 输入:
 [
   ["8","3",".",".","7",".",".",".","."],
   ["6",".",".","1","9","5",".",".","."],
   [".","9","8",".",".",".",".","6","."],
   ["8",".",".",".","6",".",".",".","3"],
   ["4",".",".","8",".","3",".",".","1"],
   ["7",".",".",".","2",".",".",".","6"],
   [".","6",".",".",".",".","2","8","."],
   [".",".",".","4","1","9",".",".","5"],
   [".",".",".",".","8",".",".","7","9"]
 ]
 输出: false
 解释: 除了第一行的第一个数字从 5 改为 8 以外，空格内其他数字均与 示例1 相同。
      但由于位于左上角的 3x3 宫内有两个 8 存在, 因此这个数独是无效的。
 说明:

 一个有效的数独（部分已被填充）不一定是可解的。
 只需要根据以上规则，验证已经填入的数字是否有效即可。
 给定数独序列只包含数字 1-9 和字符 '.' 。
 给定数独永远是 9x9 形式的。

 */
class Solution {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
       
        //行
        for row in board {
            if( containsDuplicate(row))
            {
                return false
            }
        }
        //列
        for i in 0..<board.count {
            var listArray = [Character]()
            for j in 0..<board.count {
                listArray.append(board[j][i])
            }
            if( containsDuplicate(listArray))
            {
                return false
            }
        }
        
        //方格
        for i in 0..<board.count {
            
            let row = i % 3
            let column = i / 3
            var listArray = [Character]()
            for j in 0 ..< 3 {
                for k in 0 ..< 3 {
                    listArray.append( board[column*3+j][row*3+k])
                }
            }
            if( containsDuplicate(listArray))
            {
                return false
            }
            
        }

        return true
    }
    
    
    //true 表示有重复 false 表示没重复
    func containsDuplicate(_ nums : [Character])->Bool{
        let nums = nums.sorted()
        for i in 0..<nums.count-1 {
            if nums[i] == "." {
                continue
            }
            else if nums[i] == nums[i+1] {
                return true
            }
        }
        return false
    }
    
}

var s = Solution()
s.isValidSudoku([
    ["5","3",".",".","7",".",".",".","."],
    ["6",".",".","1","9","5",".",".","."],
    [".","9","8",".",".",".",".","6","."],
    ["8",".",".",".","6",".",".",".","3"],
    ["4",".",".","8",".","3",".",".","1"],
    ["7",".",".",".","2",".",".",".","6"],
    [".","6",".",".",".",".","2","8","."],
    [".",".",".","4","1","9",".",".","5"],
    [".",".",".",".","8",".",".","7","9"]
])


s.isValidSudoku([
  ["8","3",".",".","7",".",".",".","."],
  ["6",".",".","1","9","5",".",".","."],
  [".","9","8",".",".",".",".","6","."],
  ["8",".",".",".","6",".",".",".","3"],
  ["4",".",".","8",".","3",".",".","1"],
  ["7",".",".",".","2",".",".",".","6"],
  [".","6",".",".",".",".","2","8","."],
  [".",".",".","4","1","9",".",".","5"],
  [".",".",".",".","8",".",".","7","9"]
])
