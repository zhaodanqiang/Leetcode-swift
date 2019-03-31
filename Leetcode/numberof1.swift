func numberof1(_ num: Int) -> Int {
  var num: Int = num
  var count = 0
    while(num != 0) {
      count += 1
      num = (num - 1) & num
    }
    return count
}
print(numberof1(3))
print(numberof1(6))
