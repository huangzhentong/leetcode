//
//  445. 两数相加 II.swift
//  
//
//  Created by KT--stc08 on 2020/4/3.
//

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 * 给定两个非空链表来代表两个非负整数。数字最高位位于链表开始位置。它们的每个节点只存储单个数字。将这两数相加会返回一个新的链表。

  

 你可以假设除了数字 0 之外，这两个数字都不会以零开头。

 进阶:

 如果输入链表不能修改该如何处理？换句话说，你不能对列表中的节点进行翻转。

 示例:

 输入: (7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出: 7 -> 8 -> 0 -> 7

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/add-two-numbers-ii
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

// 解法1
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
                print(val);
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
                print(val);
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
        let des  = self.getListNodeArray(startNode);
        var next2Node : ListNode?
        var start2Node : ListNode?
        for val in des{
                
            let node = ListNode.init(val);
            if(start2Node  == nil)
            {
                start2Node = node;
            }
            else
            {
                next2Node!.next = node;
            }
            next2Node = node;
            
        }
        
        return start2Node;
        
    }
    
    
    func getListNodeArray(_ ls : ListNode?) -> [Int] {
        var lsCount :[Int] = []
        var nls = ls;
        while( nls != nil  )
        {
            lsCount.append(nls?.val as! Int)
            nls = nls?.next
        }
        
        var desCount : [Int] = []
        for (index,value) in lsCount.enumerated().reversed() {
            
            desCount.append(value)
         
        }
        
        return desCount
    }
}
//解法二
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        

        let  list1 = ListNodeToArray(list: l1)
        let  list2 = ListNodeToArray(list: l2)
        var intArray = [Int]()
        var maxList = list1
        var minList = list2
        if list1.count < list2.count {
            maxList = list2
            minList = list1
        }
        
       
        var exceed = 0
        
        for (index,value) in maxList.enumerated() {
            
            var value2 = 0
            if index < minList.count  {
                value2 = minList[index];
            }
            let num = (value2 + value) + exceed
            if num >= 10 {
                exceed = 1
            }
            else {
                exceed = 0
            }
            intArray.append(num % 10)
        }
        if exceed == 1{
            intArray.append(exceed)
        }

        return arrayToListNode(intArray.reversed());
    }
    //转成数组 自己计算
    func ListNodeToArray(list : ListNode?) -> [Int] {
        var array  = [Int]()
        var  next = list
        while next != nil {
            array.append(next!.val )
            next = next?.next
        }
        return array.reversed()

    }
  
    // 数组转成链表
    func arrayToListNode(_ array : [Int]?) -> ListNode? {
        
        var headNode : ListNode?
        var nextNode : ListNode?
        for (index , value) in array!.enumerated() {
            
            let item = ListNode(value)
            if index == 0 {
                headNode = item
                nextNode = item
                
            }
            else {
                nextNode?.next = item
                nextNode = item
            }
            
        }
        return headNode
    }
    
    
}
