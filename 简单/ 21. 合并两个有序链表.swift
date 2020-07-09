
/*
 21. 合并两个有序链表
 难度
 简单

 1142

 收藏

 分享
 切换为英文
 关注
 反馈
 将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。

  

 示例：

 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
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
 */
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        
        if(l1 == nil)
        {
            return l2
        }
        else if(l2 == nil)
        {
            return l1
        }
        
        var nextl1 =  l1
        var nextl2 =  l2
        var headNode : ListNode?
        var currentNode : ListNode?
        while nextl1 != nil && nextl2 != nil  {
            
            var nextNode : ListNode?
            if( nextl1!.val < nextl2!.val)
            {
                nextNode = ListNode(nextl1!.val)
                nextl1 = nextl1!.next
                if nextl1 == nil {
                    nextNode?.next = nextl2;
                }
            }
            else {
                nextNode = ListNode(nextl2!.val)
                nextl2 = nextl2!.next
                if nextl2 == nil {
                    nextNode?.next = nextl1;
                }
            }
            if currentNode == nil {
                currentNode = nextNode
            }
            else
            {
                currentNode?.next = nextNode;
                currentNode = nextNode
            }
            if headNode == nil {
                headNode = currentNode
            }
        }
        return headNode
        
    }
}
