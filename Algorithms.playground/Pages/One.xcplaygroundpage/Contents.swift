/*
 Task:
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 You can return the answer in any order.
 */
class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var sum: Int? = nil
        var output = [Int]()
        for index in 0...nums.count - 1 {
            let value = nums[index]
            guard sum != target else { break }
            if index == nums.count - 1 { break }
            else {
                for ind in index+1...nums.count-1 {
                    guard sum != target else { break }
                    sum = value + nums[ind]
                    if sum == target {
                        output = [index, ind]
                    }
                }
            }
        }
        return output
    }
}

let solution = Solution()
print(solution.twoSum([0,2,3,4,5,6,0], 0))


