//
//  29. 两数相除.swift
//  
//
//  Created by KT--stc08 on 2020/7/9.
//
/*
 给定两个整数，被除数 dividend 和除数 divisor。将两数相除，要求不使用乘法、除法和 mod 运算符。

 返回被除数 dividend 除以除数 divisor 得到的商。

 整数除法的结果应当截去（truncate）其小数部分，例如：truncate(8.345) = 8 以及 truncate(-2.7335) = -2

  

 示例 1:

 输入: dividend = 10, divisor = 3
 输出: 3
 解释: 10/3 = truncate(3.33333..) = truncate(3) = 3
 示例 2:

 输入: dividend = 7, divisor = -3
 输出: -2
 解释: 7/-3 = truncate(-2.33333..) = -2
  

 提示：

 被除数和除数均为 32 位有符号整数。
 除数不为 0。
 假设我们的环境只能存储 32 位有符号整数，其数值范围是 [−231,  231 − 1]。本题中，如果除法结果溢出，则返回 231 − 1。

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/divide-two-integers
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
    
    if dividend  == 0 {
        return 0
    }
    if divisor == 1  {
        
        if dividend >= Int32.max {
            return Int(Int32.max  )
        }
        
        return dividend
    }
    else if divisor == -1
    {
        if dividend < 0  {
            if  dividend > Int(Int32.min) {
                return -dividend
            }
            else {
                return Int(Int32.max)
            }
            
        }
        else{
            return -dividend
        }
    }
    else if dividend == 1
    {
        return 0
    }
    var minus = 1 // 1表示正数  -1表示 负数
    
    if (dividend < 0  && divisor < 0) || (dividend > 0 && divisor > 0) {
        minus = 1
    }
    else{
        minus = -1
    }
    
    var fabDividend = Int(fabs(Double(dividend)))
    let fabDivisor  = Int(fabs(Double(divisor)))
    print("fabDividend = \(fabDividend) + fabDivisor = \(fabDivisor)")

    var result = 0;
    for i in (0...31).reversed() {
        if ((fabDividend >> i) >= fabDivisor) {//找出足够大的数2^n*divisor
            result += 1 << i;//将结果加上2^n
            fabDividend -= fabDivisor << i;//将被除数减去2^n*divisor
        }
    }
    return minus  > 0 ? result : -result
   
}
}
