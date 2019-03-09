/*
Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Note that an empty string is also considered valid.

Example 1:

Input: "()"
Output: true
Example 2:

Input: "()[]{}"
Output: true
Example 3:

Input: "(]"
Output: false
Example 4:

Input: "([)]"
Output: false
Example 5:

Input: "{[]}"
Output: true
*/
class Solution {
    func isValid(_ s: String) -> Bool {
        let chars = Array(s)
        if s.count == 0 { return true } 
        if s.count % 2 == 1 {
            return false
        }
        
        var n = 1
        var m = 0
        var newString = [chars[m]]
        
        while(n < chars.count) {
            if m < 0 {
                newString.append(chars[n])
                m += 1
            } else {
                 if (newString[m] == "(" && chars[n] == ")" )
                    || (newString[m] == "{" && chars[n] == "}")
                    || (newString[m] == "[" && chars[n] == "]") {
                        newString.removeLast()
                        m -= 1
                } else {
                    newString.append(chars[n])
                    m += 1
                }
            }
            n += 1
        }
        
       return ( m > 0 ) ? false: true
    }
}
