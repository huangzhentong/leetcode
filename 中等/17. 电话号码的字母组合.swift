//
//  17. 电话号码的字母组合.swift
//  
//
//  Created by KT--stc08 on 2020/4/7.
//
/*
 17. 电话号码的字母组合
 难度
 中等

 648

 收藏

 分享
 切换为英文
 关注
 反馈
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。

 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。



 示例:

 输入："23"
 输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 说明:
 尽管上面的答案是按字典序排列的，但是你可以任意选择答案输出的顺序。
 */


class Solution {
   func letterCombinations(_ digits: String) -> [String] {
        
        var lastArray : Array<String> = Array<String>.init()
        let dic = ["2": ["a","b","c"],
             "3":["d","e","f"],
             "4":["g","h","i"],
             "5":["j","k","l"],
             "6":["m","n","o"],
             "7":["p","q","r","s"],
             "8":["t","u","v"],
             "9":["w","x","y","z"]]
        
        for num in digits{
            
           lastArray =  appendArray(lastArray, dic[String(num)]!)
            
        }
        return lastArray;
        
    }
    
    
    func appendArray(_ firstArray : Array<String> ,_ otherArray : Array<String>) -> Array<String> {
        if firstArray.count == 0{
            return otherArray
        }
        
        var lastArray =  Array<String>.init()
        
        for firstString in firstArray{
            for otherString in otherArray{
                lastArray.append(firstString+otherString)
            }
        }
        return lastArray
    }
}
