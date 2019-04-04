/*
Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.

Example 1:

Input: [3,2,1,5,6,4] and k = 2
Output: 5
Example 2:

Input: [3,2,3,1,2,4,5,5,6] and k = 4
Output: 4
Note:
You may assume k is always valid, 1 ≤ k ≤ array's length.
*/

class Solution {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        var target = nums.count - k
        var l = 0
        var r = nums.count - 1
        while(true) {
            let i = partition(&nums, l, r)
            if i < target {
                l = i + 1
            } else if(i > target) {
                r = i - 1
            } else {
                return nums[i]
            }
        }
    }

    func partition(_ nums: inout [Int], _ m: Int, _ n: Int) -> Int {
        var i = m
        var j = n
        let target = nums[i]
        while(i<j) {
            while(i<j && nums[j] > target) {
                j -= 1
            }
            if i < j {
                nums[i] = nums[j]
                i += 1
            }
            while(i<j && nums[i] < target) {
                i += 1
            }
            if i < j {
                nums[j] = nums[i]
            }
        }
        nums[i] = target
        return i
    }
}
