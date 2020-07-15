//
//  92. 反转链表 II.swift
//  
//
//  Created by KT--stc08 on 2020/7/14.
//

import Foundation

/*
 92. 反转链表 II
 
 反转从位置 m 到 n 的链表。请使用一趟扫描完成反转。

 说明:
 1 ≤ m ≤ n ≤ 链表长度。

 示例:

 输入: 1->2->3->4->5->NULL, m = 2, n = 4
 输出: 1->4->3->2->5->NULL

 */
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init(_ val: Int) {
          self.val = val
          self.next = nil
      }
  }




class Solution {
    
    func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
        
        if head == nil {
            return nil
        }
        else if (m == n )
        {
            return head
        }
        var list = [Int]()
        var next = head
        while next != nil {
            list.append(next!.val )
            next = next?.next
        }
        
        if list.count == 1 {
            return head
        }
        swapList(&list, start: m, end: n)
        
        
        var  topNode : ListNode?
        var nextNode : ListNode?
        for (index , val) in list.enumerated() {
            
            let node = ListNode(val);
            if index == 0 {
                topNode = node
            }
            else if nextNode == nil {
                
                nextNode = node
                topNode?.next = node
            }
            else{
                nextNode?.next = node
                nextNode = node
            }
 
        }
        return topNode
    }
    // inout 相当于传入的是一个指针 可以在原的数据上做修改
    func swapList(_ list : inout [Int] ,start startIndex:Int ,end endIndex:Int)  {
       let count =  (endIndex - startIndex)/2
       for i in 0...count {
           list.swapAt(startIndex-1 + i, endIndex-1 - i)
        }
    }

}

