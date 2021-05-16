//: [Previous](@previous)

import Foundation


/*
 Given a string s, find the length of the longest substring without repeating characters.

 Input: s = "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.

*/

class Solution
{
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var currentMaxLength = 0
        var currentSubstring = [Character]()
        for char in s {
            if let index = currentSubstring.firstIndex(of: char) {
                currentSubstring.removeFirst(index + 1)
            }
            currentSubstring.append(char)
            currentMaxLength = max(currentMaxLength, currentSubstring.count)
        }
        return currentMaxLength
    }
}

print(Solution().lengthOfLongestSubstring("dvdf"))

print((1<<20) - 1)


