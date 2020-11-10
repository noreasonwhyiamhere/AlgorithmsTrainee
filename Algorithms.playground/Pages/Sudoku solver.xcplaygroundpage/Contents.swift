//: [Previous](@previous)

import Foundation

/*
 Write a program to solve a Sudoku puzzle by filling the empty cells.

 A sudoku solution must satisfy all of the following rules:

 Each of the digits 1-9 must occur exactly once in each row.
 Each of the digits 1-9 must occur exactly once in each column.
 Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
 The '.' character indicates empty cells.
 */

class Solution {
    
    func isValid(_ board: [[Character]], row: Int, column: Int, num: Character) -> Bool {
        for i in 0...board.count - 1 {
            // num is exist in row and column
            if board[row][i] == num || board[i][column] == num {
                return false
            }
        }
        let startBoundRow = row - (row % 3)
        let startBoundColumn = column - (column % 3)

        for i in 0...2 {
            for j in 0...2 {
                // num is exist in box
                if board[i + startBoundRow][j + startBoundColumn] == num {
                    return false
                }
            }
        }
        return true
    }
    func hasUnsightValue(board: [[Character]]) -> (row: Int, col: Int)? {
        for i in 0...board.count - 1 {
            for j in 0...board[i].count - 1 {
                if board[i][j] == "." {
                    return (row: i, col: j)
                }
            }
        }
        return nil
    }
    
    func solveSudoku(_ board: inout [[Character]]) -> Bool {
        guard let ind = self.hasUnsightValue(board: board) else {
            return true
        }
        for n in 1...9 {
            let char = Character(String(n))
            if self.isValid(board, row: ind.row, column: ind.col, num: char) {
                board[ind.row][ind.col] = char
                if self.solveSudoku(&board) {
                    return true
                }
                board[ind.row][ind.col] = "."
            }
        }
        return false
    }
}
    
var board: [[Character]] = [["5","3",".",".","7",".",".",".","."],
                            ["6",".",".","1","9","5",".",".","."],
                            [".","9","8",".",".",".",".","6","."],
                            ["8",".",".",".","6",".",".",".","3"],
                            ["4",".",".","8",".","3",".",".","1"],
                            ["7",".",".",".","2",".",".",".","6"],
                            [".","6",".",".",".",".","2","8","."],
                            [".",".",".","4","1","9",".",".","5"],
                            [".",".",".",".","8",".",".","7","9"]]

let solution = Solution()
print(solution.solveSudoku(&board))
print(board)

