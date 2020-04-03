//
//  File.swift
//  
//
//  Created by KT--stc08 on 2020/4/3.
//
//给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
//
//如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
//
//您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
//
//示例：
//
//输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
//输出：7 -> 0 -> 8
//原因：342 + 465 = 807
//
//来源：力扣（LeetCode）
//链接：https://leetcode-cn.com/problems/add-two-numbers
//著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
       
        var ls1Count = self.getListNodeArray(l1);
        var ls2Count = self.getListNodeArray(l2);
        var maxCount = max(ls1Count.count, ls2Count.count)
        var carry = 0
        var startNode : ListNode?
        var nextNode : ListNode?
        for i in 0..<maxCount{
            
            if(i >= ls1Count.count || i >= ls2Count.count)
            {
                var val : Int = carry
                if(i >= ls1Count.count)
                {
                    val  += ls2Count[i]
                }
                else
                {
                    val  += ls1Count[i]
                }
                if(val >= 10 )
                {
                    val = val % 10
                    carry = 1
                }
                else {
                    carry = 0
                }
                let node = ListNode.init(val)
                nextNode?.next = node
                nextNode = node;
            }
            else
            {
                var val = ls2Count[i] + ls1Count[i] + carry
                if(val >= 10 )
                {
                    val = val % 10
                    carry = 1
                }
                else {
                    carry = 0
                }
                let node = ListNode.init(val);
                if(startNode  == nil)
                {
                    startNode = node;
                }
                else
                {
                    nextNode!.next = node;
                }
                nextNode = node;
                
            }
            
            
        }
        if(carry == 1)
        {
            let node = ListNode.init(1);
            nextNode?.next = node;
        }
        return startNode;
        
    }
    
    
    func getListNodeArray(_ ls : ListNode?) -> [Int] {
        var lsCount :[Int] = []
        var nls = ls;
        while( nls != nil  )
        {
            lsCount.append(nls?.val as! Int)
            nls = nls?.next
        }
        return lsCount
    }
    
}
