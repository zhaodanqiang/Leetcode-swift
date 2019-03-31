func quickSort (_ nums: inout [Int], _ m: Int, _ n: Int) {
    if m > n {
        return
    }    
    var i = m
    var j = n
    let temp = nums[i]
    while ( i < j ) {
        while (i < j && nums[j] >= temp) {
            j -= 1
        }
        if i < j {
          nums[i] = nums[j]
          i += 1 
        }
        while ( i < j && nums[i] <= temp) {
            i += 1
        }
        if i < j {
          nums[j] = nums[i]
        }
    }
    nums[i] = temp
    quickSort(&nums, m, i-1)
    quickSort(&nums, i+1, n)
}
var nums = [1,3,4,1,2,4,2,42,34,2,242,5,5,24,25,235,6,23,25,6,345]
quickSort(&nums, 0, nums.count - 1)
print(nums)
