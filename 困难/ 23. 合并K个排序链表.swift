//
//   23. 合并K个排序链表.swift
//  
//
//  Created by KT--stc08 on 2020/7/9.
//


/*
 23. 合并K个排序链表
 难度
 困难

 784

 收藏

 分享
 切换为英文
 关注
 反馈
 合并 k 个排序链表，返回合并后的排序链表。请分析和描述算法的复杂度。

 示例:

 输入:
 [
   1->4->5,
   1->3->4,
   2->6
 ]
 输出: 1->1->2->3->4->4->5->6
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
    
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var allNode : ListNode?
        var allVal = [Int]()
        for list in lists {
            if list != nil {
                var head = list
                while head != nil {
                    allVal.append(head!.val)
                    head = head?.next
                }
            }
        }
        allVal.sort()
        if allVal.count > 0 {
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
        }
        return allNode
    }
    
}

