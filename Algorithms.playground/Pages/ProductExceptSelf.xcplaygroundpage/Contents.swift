//: [Previous](@previous)

import Foundation

/*
 Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

 The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.
 */

class Solution {
    func productExceptSelf(_ nums: [Int]) -> [Int] {
        var result = nums
        var forward = 1
        for ind in 0...nums.count - 1 {
            result[ind] = forward
            forward *= nums[ind]
        }
        
        var backward = 1
        for ind in (0...nums.count - 1).reversed() {
            result[ind] *= backward
            backward *= nums[ind]
        }
       
        return result
    }
}
print(Solution().productExceptSelf([1,2,3,4]))
