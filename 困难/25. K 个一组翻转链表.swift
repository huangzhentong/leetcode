//
//  File.swift
//  
//
//  Created by KT--stc08 on 2020/7/9.
//

import Foundation

/*
 25. K 个一组翻转链表
 难度
 困难

 625

 收藏

 分享
 切换为英文
 关注
 反馈
 给你一个链表，每 k 个节点一组进行翻转，请你返回翻转后的链表。

 k 是一个正整数，它的值小于或等于链表的长度。

 如果节点总数不是 k 的整数倍，那么请将最后剩余的节点保持原有顺序。

  

 示例：

 给你这个链表：1->2->3->4->5

 当 k = 2 时，应当返回: 2->1->4->3->5

 当 k = 3 时，应当返回: 3->2->1->4->5

  

 说明：

 你的算法只能使用常数的额外空间。
 你不能只是单纯的改变节点内部的值，而是需要实际进行节点交换。

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
    func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
        var allVal = [Int]()
        var next = head
        while next != nil {
            allVal.append(next!.val)
            next = next?.next
        }
        if allVal.count < 2 {
            return head
        }
        else{
            let reverseList = reverseKGroupArray(allVal, k: k)
            var allNode : ListNode?
            var nextNode : ListNode?
            for val in reverseList {
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
      
        
    }
    //数据反转
    func reverseKGroupArray(_ list : [Int] ,k : Int) ->[Int]{
        
        var newList = list
        if newList.count == k || k == 1 || k == 0  && k != 2{
            return newList
        }
        //外层需要反转的个数
        let count = newList.count / k
        for i in 0..<count {
            //k需要返转的次数如 k=6 需要反转3次（0，5)(1,4)(2,3)
            for j in 0..<(k / 2) {
                newList.swapAt((i*k)+j, (i+1)*k-j-1)
            }
        }
        return newList
    }
}


