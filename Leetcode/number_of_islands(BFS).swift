/*
Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

Example 1:

Input:
11110
11010
11000
00000

Output: 1
Example 2:

Input:
11000
11000
00100
00011

Output: 3
*/

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        if grid.count == 0 {
            return 0
        }
        if grid[0].count == 0 { return 0 }
        var grid = grid
        let n = grid.count
        let m = grid[0].count
        var count: Int = 0
        for i in 0...n-1 {
            for j in 0...m-1 {
                if grid[i][j] == "1" {
                    findIsland(&grid, i, j)
                    count += 1
                }
            }
        }
        return count
    }

    func findIsland(_ grid: inout [[Character]], _ n: Int, _ m: Int) {
        if n < 0 || n >= grid.count { return }
        if m < 0 || m >= grid[0].count { return }
        var q = [[n, m]]
        while q.count > 0 {
            let i: Int = q.first![0]
            let j: Int = q.first![1]
            q.removeFirst()
            islandNumber(&grid, i, j + 1, &q)
            islandNumber(&grid, i, j - 1, &q)
            islandNumber(&grid, i + 1, j, &q)
            islandNumber(&grid, i - 1, j, &q)
        }
    }

    func islandNumber(_ grid: inout [[Character]], _ n: Int, _ m: Int, _ q: inout [[Int]]) {
          if n < 0 || n >= grid.count { return }
        if m < 0 || m >= grid[0].count { return }
        if grid[n][m] == "1" {
            grid[n][m] = "0"
            q.append([n, m])
        }
    }
}
