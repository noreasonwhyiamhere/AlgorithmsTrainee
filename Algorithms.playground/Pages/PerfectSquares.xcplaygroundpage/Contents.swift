//: [Previous](@previous)

import Foundation

/*
 Given an integer n, return the least number of perfect square numbers that sum to n.

 A perfect square is an integer that is the square of an integer; in other words, it is the product of some integer with itself. For example, 1, 4, 9, and 16 are perfect squares while 3 and 11 are not.
 */

// very bad solution 🤡
class Solution {
    func numSquares(_ n: Int) -> Int {
        var numb = n
        let sqr = sqrt(Double(n))
        if n <= 3 { return 3 }
        if floor(sqr) == sqr { return 1 }
        
        for x in 1...n {
            let xx = (x * x)
            if xx > n {
                break
            }
            print(numb)
            numb = min(numb, 1 + numSquares(n - xx))
        }
        return numb
    }
}

let sol = Solution()
print(sol.numSquares(13))
