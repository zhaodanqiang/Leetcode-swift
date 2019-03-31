/*
Given an array nums of n integers, are there elements a, b, c in nums such that a + b + c = 0? Find all unique triplets in the array which gives the sum of zero.

Note:

The solution set must not contain duplicate triplets.

Example:

Given array nums = [-1, 0, 1, 2, -1, -4],

A solution set is:
[
  [-1, 0, 1],
  [-1, -1, 2]
]
*/

class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        var nums = nums
        quickSort(&nums, 0, nums.count - 1)

        var result = [[Int]]()
        for (index, num) in nums.enumerated() {
            if nums[index] > 0 { break }
            if (index > 0 && nums[index-1] == nums[index]) { continue }
            let sum = 0 - num
            var i = index + 1
            var j = nums.count - 1
            while(i<j) {

               if (nums[i] + nums[j]) == sum {
                   let object = [num, nums[i], nums[j]]
                   while(i<j && nums[i] == nums[i+1]) { i += 1 }
                   while(i<j && nums[j] == nums[j-1]) { j -= 1 }
                   // if !result.contains(object) {
                     result.append(object)
                   // }
                   i += 1
                   j -= 1
               } else if (nums[i] + nums[j]) > sum {
                   j -= 1
               } else {
                   i += 1
               }
            }
        }

        return result

    }

    func quickSort(_ nums: inout [Int], _ m: Int, _ n: Int) {
        if m > n {
            return
        }
        var i = m
        var j = n
        let temp = nums[i]
        while(i < j) {
            if (i<j && nums[j] >= temp) {
                j -= 1
            }
            nums[i] = nums[j]
            if (i<j && nums[i] <= temp ) {
                i += 1
            }
            nums[j] = nums[i]
        }

        nums[i] = temp

        guickSort(&nums, m, i - 1)
        quickSort(&nums, i + 1, n)
    }
}
