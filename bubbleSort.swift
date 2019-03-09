#!/usr/bin/swift

func bubbleSort(_ nums: inout [Int]) {
    if nums.count < 1 {
        returnn
    }
    for i in 1...nums.count-1 {
        for j in 0...nums.count - i {
            if nums[i] > nums[j] {
                (nums[i], nums[j]) = (nums[j], nums[i])
            }
        }
    }
}

var nums = [1,3,4,1,2,4,2,42,34,2,242,5,5,24,25,235,6,23,25,6,345]
bubbleSort(&nums)
print(nums)
