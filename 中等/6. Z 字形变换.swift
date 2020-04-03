//
//  6. Z 字形变换.swift
//  
//
//  Created by KT--stc08 on 2020/4/3.
//
//将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。
//
//比如输入字符串为 "LEETCODEISHIRING" 行数为 3 时，排列如下：
//
//L   C   I   R
//E T O E S I I G
//E   D   H   N
//之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"。
//
//请你实现这个将字符串进行指定行数变换的函数：
//
//string convert(string s, int numRows);
//示例 1:
//
//输入: s = "LEETCODEISHIRING", numRows = 3
//输出: "LCIRETOESIIGEDHN"
//示例 2:
//
//输入: s = "LEETCODEISHIRING", numRows = 4
//输出: "LDREOEIIECIHNTSG"
//解释:
//
//L     D     R
//E   O E   I I
//E C   I H   N
//T     S     G
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/zigzag-conversion
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
class Solution {
    func convert(_ s: String, _ numRows: Int) -> String {
 let lenght  = s.count;
         if(lenght < numRows || numRows == 1)
        {
            return s;
        }
        let rowCount  = (numRows - 1)*2;                    //每行的第几个 4
        let columnCount : Int = lenght/numRows;             //           5
        
        var string : String = String.init();
        
        for i in 0..<numRows{
            if( i == 0 || i == numRows-1)
            {
                for j in 0...columnCount
                {
                    let index = j*rowCount + i;
                    if(index < lenght)
                    {
                        let index3 = s.index(s.startIndex, offsetBy: j*rowCount + i)
                        string.append( String(s[index3...index3]))
                    }
                    
                }
            }
            else
            {
                for j in 0...columnCount
                {
                    var index = i + j * rowCount;
                    if(index < lenght)
                    {
                        let index3 = s.index(s.startIndex, offsetBy: index)
                        string.append( String(s[index3...index3]))
                    }
                    index = rowCount-i + j * rowCount ;
                    if(index < lenght)
                    {
                        let index3 = s.index(s.startIndex, offsetBy: index)
                        string.append( String(s[index3...index3]))
                    }
                    
                    
                }
            }

        }
        return string
    }
}
