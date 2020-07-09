//
//  24. 两两交换链表中的节点.swift
//  
//
//  Created by KT--stc08 on 2020/7/9.
//

import Foundation

/*
 24. 两两交换链表中的节点
 难度
 中等

 543

 收藏

 分享
 切换为英文
 关注
 反馈
 给定一个链表，两两交换其中相邻的节点，并返回交换后的链表。

 你不能只是单纯的改变节点内部的值，而是需要实际的进行节点交换。

  

 示例:

 给定 1->2->3->4, 你应该返回 2->1->4->3.
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
    
    
    func swapPairs(_ head: ListNode?) -> ListNode? {
        var allVal = [Int]()
        var next = head
        while next != nil {
            allVal.append(next!.val)
            next = next?.next
        }
        if allVal.count < 2 {
            return head
        }
        else
        {
            let count = allVal.count / 2
            var allNode : ListNode?
            for i in 0..<count {
                allVal.swapAt(i*2, i*2+1)
            }
            var nextNode : ListNode?
            for val in allVal {
                let node = ListNode(val)
                if nextNode == nil {
                    nextNode = node
                }
                else{
                    nextNode?.next = node
                    nextNode = node
                }
                if allNode == nil {
                    allNode = nextNode
                }
            }
            return allNode
            
        }
        return head
    }

}

