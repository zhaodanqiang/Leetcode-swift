func insertSort(_ nums: inout [Int]) {
    if nums.count < 1 {
        return
    }
    for i in 1...nums.count-1 {
        var j  = i
        let target = nums[j]
        while(j > 0 && target < nums[j - 1]) {
            nums[j] = nums[j - 1]
            j -= 1
        }
        nums[j] = target 
    }
}
var nums = [1,3,4,1,2,4,2,42,34,2,242,5,5,24,25,235,6,23,25,6,345]
insertSort(&nums)
print(nums)
