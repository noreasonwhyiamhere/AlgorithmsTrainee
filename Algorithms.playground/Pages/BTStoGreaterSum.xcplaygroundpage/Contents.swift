//: [Previous](@previous)

import Foundation

/*
 Given the root of a Binary Search Tree (BST), convert it to a Greater Tree such that every key of the original BST is changed to the original key plus sum of all keys greater than the original key in BST.

 As a reminder, a binary search tree is a tree that satisfies these constraints:

 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
 
 Input: root = [4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]
 Output: [30,36,21,36,35,26,15,null,null,null,33,null,null,null,8]
 
*/

final class BtsToGstAlgorithm
{
    func bstToGst(_ root: BinarySearchTree<Int>?) -> BinarySearchTree<Int>? {
        guard var strongRoot = root else {
            return root
        }
        self.bstToGst(root: &strongRoot, sum: 0)
        return strongRoot
    }
        
    func bstToGst(root: inout BinarySearchTree<Int>, sum: Int) -> Int {
        var value = sum
        if var right = root.right {
            value = self.bstToGst(root: &right, sum: sum)
        }
        value += root.value
        root.value = value
        if var left = root.left {
            value = self.bstToGst(root: &left, sum: value)
        }
        return value
    }
}


final class BinarySearchTree<T: Comparable>
{
    var value: T
    private(set) var parent: BinarySearchTree?
    private(set) var left: BinarySearchTree?
    private(set) var right: BinarySearchTree?
    
    init(value: T) {
        self.value = value
    }
    
    convenience init(array: [T]) {
        precondition(array.isEmpty == false)
        self.init(value: array[0])
        array.dropFirst().forEach { self.insert(value: $0) }
    }
    
    func insert(value: T) {
        guard value != self.value else {
            self.value = value
            return
        }
        if value > self.value {
            if let right = self.right {
                right.insert(value: value)
            }
            else {
                self.right = BinarySearchTree(value: value)
                self.right?.parent = self
            }
        }
        else if value < self.value {
            if let left = self.left {
                left.insert(value: value)
            }
            else {
                self.left = BinarySearchTree(value: value)
                self.left?.parent = self
            }
        }
    }
    
    func search(value: T) -> BinarySearchTree? {
        if value == self.value { return self }
        else if value > self.value {
            return self.right?.search(value: value)
        }
        else {
            return self.left?.search(value: value)
        }
    }
}

extension BinarySearchTree
{
    var isRoot: Bool { self.parent == nil }
    var isLeaf: Bool { self.left == nil && self.right == nil }
}

extension BinarySearchTree where T == Int
{
    func sumOfElementsGreaterThen(value: Int) -> Int {
        var sum = 0
        if value < self.value {
            sum += self.value
        }
        if let left = self.left {
            sum += left.sumOfElementsGreaterThen(value: value)
        }
        if let right = self.right {
            sum += right.sumOfElementsGreaterThen(value: value)
        }
        return sum
    }
}

extension BinarySearchTree: CustomStringConvertible
{
  public var description: String {
    var s = ""
    if let left = self.left {
      s += "(\(left.description)) <- "
    }
    s += "\(self.value)"
    if let right = self.right {
      s += " -> (\(right.description))"
    }
    return s
  }
}

let tree = BinarySearchTree(array: [4,1,6,0,2,5,7,nil,nil,nil,3,nil,nil,nil,8].compactMap { $0 })
print(tree)
let alg = BtsToGstAlgorithm()
alg.bstToGst(tree)
print(tree)


