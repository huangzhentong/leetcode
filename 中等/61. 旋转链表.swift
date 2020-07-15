//
//  61. 旋转链表.swift
//  
//
//  Created by KT--stc08 on 2020/7/10.
//

import Foundation
//61. 旋转链表
/*
 给定一个链表，旋转链表，将链表每个节点向右移动 k 个位置，其中 k 是非负数。

 示例 1:

 输入: 1->2->3->4->5->NULL, k = 2
 输出: 4->5->1->2->3->NULL
 解释:
 向右旋转 1 步: 5->1->2->3->4->NULL
 向右旋转 2 步: 4->5->1->2->3->NULL
 示例 2:

 输入: 0->1->2->NULL, k = 4
 输出: 2->0->1->NULL
 解释:
 向右旋转 1 步: 2->0->1->NULL
 向右旋转 2 步: 1->2->0->NULL
 向右旋转 3 步: 0->1->2->NULL
 向右旋转 4 步: 2->0->1->NULL


 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/rotate-list
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        
        if k == 0 {
            return head
        }
        if k == 1 && head?.next == nil {
            return head
        }
        
        var list = [Int]()
        var node = head
        
        while node != nil {
            list.append(node!.val)
            node = node?.next
        }
        let move =  k % list.count
        if move ==  0 {
            return head
        }

        for _ in 0 ..< move {
            let lastValue = list.last
            list.removeLast()
            list.insert(lastValue!, at: 0)
            print("list = \(list)")
        }
         
        var topNode : ListNode?
        var nextNode : ListNode?
        for item in list {
            let itemNode = ListNode(item)
            if nextNode == nil {
                nextNode = itemNode
                topNode = nextNode
            }
            else{
                nextNode?.next = itemNode;
                nextNode = itemNode
            }
            
        }
        return topNode
    }
}
