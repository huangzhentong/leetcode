//
//  848. 字母移位.swift
//  
//
//  Created by KT--stc08 on 2020/4/3.
//
//有一个由小写字母组成的字符串 S，和一个整数数组 shifts。
//
//我们将字母表中的下一个字母称为原字母的 移位（由于字母表是环绕的， 'z' 将会变成 'a'）。
//
//例如·，shift('a') = 'b'， shift('t') = 'u',， 以及 shift('z') = 'a'。
//
//对于每个 shifts[i] = x ， 我们会将 S 中的前 i+1 个字母移位 x 次。
//
//返回将所有这些移位都应用到 S 后最终得到的字符串。
//
//示例：
//
//输入：S = "abc", shifts = [3,5,9]
//输出："rpl"
//解释：
//我们以 "abc" 开始。
//将 S 中的第 1 个字母移位 3 次后，我们得到 "dbc"。
//再将 S 中的前 2 个字母移位 5 次后，我们得到 "igc"。
//最后将 S 中的这 3 个字母移位 9 次后，我们得到答案 "rpl"。
//提示：
//
//1 <= S.length = shifts.length <= 20000
//0 <= shifts[i] <= 10 ^ 9
//
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/shifting-letters
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

class Solution {
    func shiftingLetters(_ S: String, _ shifts: [Int]) -> String {
    var number:UInt32 = 0
        var i = 0;
        var count = 0 ;
        var string : String = ""
        let startCount :UInt32 = 97
        
        var newShifts :[Int] = []               //换算出一个新的数组
        var allCount = 0;                       //算出总数
        for val in shifts{
            let newval = val%26
            newShifts .append(newval)
            allCount += newval
        }
        for code in S.unicodeScalars {
            number = code.value - startCount
            
            number = (number +  UInt32(allCount))%26
            var ch:Character = Character(UnicodeScalar(number+startCount)!)
            string.append(ch);
            
            if(i < newShifts.count)
            {
                allCount -= newShifts[i]
            }
            else{
                allCount = 0
            }
            i += 1
        }
        return string
    }
}
