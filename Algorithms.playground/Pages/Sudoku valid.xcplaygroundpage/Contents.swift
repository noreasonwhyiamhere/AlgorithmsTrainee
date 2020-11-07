//: [Previous](@previous)

import Foundation
/*
Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

Each row must contain the digits 1-9 without repetition.
Each column must contain the digits 1-9 without repetition.
Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
Note:

A Sudoku board (partially filled) could be valid but is not necessarily solvable.
Only the filled cells need to be validated according to the mentioned rules.
 
 Constraints:

 board.length == 9
 board[i].length == 9
 board[i][j] is a digit or '.'.

 */

class Solution
{
    func isValidSudoku(_ board: [[Character]]) -> Bool {
      guard board.count == 9 else { return false }

        var hSet = Set<Character>()
        var vSet = Set<Character>()
        var subSet = Set<Character>()

        var hResult: Bool = true
        var vResult: Bool = true
        var subResult: Bool = true
        var hNumCount = 0
        var vNumCount = 0
        var subNumCount = 0
        
        for i in 0...board.count - 1 {
           guard board[i].count == 9 else { return false }
            for j in 0...board[i].count - 1 {
                if board[i][j] != "." {
                    hNumCount += 1
                    hSet.insert(board[i][j])
                }
                if board[j][i] != "." {
                    vNumCount += 1
                    vSet.insert(board[j][i])
                }
                if i < board.count - 2, j < board[i].count - 2, i % 3 == 0, j % 3 == 0 {
                    for h in i...i+2 {
                        for n in j...j+2 {
                            if board[h][n] != "." {
                                subNumCount += 1
                                subSet.insert(board[h][n])
                            }
                        }
                    }
                    subResult = (subSet.count == subNumCount && subResult)
                    subSet.removeAll()
                    subNumCount = 0
                }
            }
            
            
                    
            hResult = (hSet.count == hNumCount && hResult)
            hSet.removeAll()
            hNumCount = 0
            vResult = (vSet.count == vNumCount && vResult)
            vSet.removeAll()
            vNumCount = 0
        }
        return hResult && vResult && subResult
    }
}
let board: [[Character]] =
    [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]

let solution = Solution()
print(solution.isValidSudoku(board))
