/*
Convert a non-negative integer to its english words representation. Given input is guaranteed to be less than 231 - 1.

Example 1:

Input: 123
Output: "One Hundred Twenty Three"
Example 2:

Input: 12345
Output: "Twelve Thousand Three Hundred Forty Five"
Example 3:

Input: 1234567
Output: "One Million Two Hundred Thirty Four Thousand Five Hundred Sixty Seven"
Example 4:

Input: 1234567891
Output: "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"
*/

enum Type: String {
    case digit = ""
    case thousand = "Thousand"
    case million = "Million"
    case billion = "Billion"
}

class Solution {
    func numberToWords(_ num: Int) -> String {
        if num == 0 { return "Zero" }
        var nums = [Int]()
        var bigNum = num
        let type: [Type] = [.digit, .thousand, .million, .billion]
        repeat {
            let smallNum = bigNum % 1000
            bigNum /= 1000
            nums.append(smallNum)
        } while(bigNum > 0)

        var index = nums.count - 1
        var result = ""
        while(index >= 0) {
            if nums[index] > 0 {
            if result.length > 0 { result += " " }
                result += numberToString(nums[index]) + " " + type[index].rawValue
            }

             index -= 1
        }

        return result.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    func numberToString(_ num: Int) -> String {
        let smallNumerStrings = ["One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven","Twelve", "Thirteen", "Fourteen","Fifteen","Sixteen","Seventeen","Eighteen","Nineteen"]
        let bigNumerStrings = ["Twenty", "Thirty", "Forty", "Fifty", "Sixty", "Seventy", "Eighty", "Ninety"]
        var num = num
        var res = ""
        if num >= 100 {
            let hundred = num / 100
            num -= hundred * 100
            res = smallNumerStrings[hundred - 1] + " Hundred"
        }

        if num-1 >= 0 && num - 1 < smallNumerStrings.count && smallNumerStrings[num-1] != nil {
            if res.length > 0 { res += " " }
           res += smallNumerStrings[num - 1]
        } else {
            if num > 10 {
                let ten = num / 10
                if res.length > 0 { res += " " }
                res += bigNumerStrings[ten - 2]
                num -= ten * 10
            }

            if num - 1 >= 0 {
                if res.length > 0 { res += " "}
                res += smallNumerStrings[num - 1]
            }
        }
        return res
    }
}
