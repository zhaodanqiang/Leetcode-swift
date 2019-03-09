#!/usr/bin/swift

func selectionSort(_ nums: inout [Int]) {
    if nums.count < 2 {
        return
    }
    for i in 0...nums.count-2 {
        for j in i+1...nums.count - 1 {
            if nums[i] > nums[j] {
                (nums[i], nums[j]) = (nums[j], nums[i])
            }
        }
    }
}

var nums = [1,3,4,1,2,4,2,42,34,2,242,5,5,24,25,235,6,23,25,6,345]
selectionSort(&nums)
print(nums)
