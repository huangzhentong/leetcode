//
//  412. Fizz Buzz.swift
//  
//
//  Created by KT--stc08 on 2020/7/17.
//
/*
 写一个程序，输出从 1 到 n 数字的字符串表示。

 1. 如果 n 是3的倍数，输出“Fizz”；

 2. 如果 n 是5的倍数，输出“Buzz”；

 3.如果 n 同时是3和5的倍数，输出 “FizzBuzz”。

 示例：

 n = 15,

 返回:
 [
     "1",
     "2",
     "Fizz",
     "4",
     "Buzz",
     "Fizz",
     "7",
     "8",
     "Fizz",
     "Buzz",
     "11",
     "Fizz",
     "13",
     "14",
     "FizzBuzz"
 ]


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/fizz-buzz
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */
import Foundation
class Solution {
    func fizzBuzz(_ n: Int) -> [String] {
        
        var list = [String]()
        for i in 1...n {
            
            if i % 3 == 0 && i % 5 == 0 {
                list.append("FizzBuzz")
            }
            else if i % 3 == 0{
                 list.append("Fizz")
            }
            else if i % 5 == 0 {
                list.append("Buzz")
            }
            else {
                list.append(String(i))
            }
        }
        return list
    }
}
