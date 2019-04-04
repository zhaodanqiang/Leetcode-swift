/*
Given an array of strings, group anagrams together.

Example:

Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
Output:
[
  ["ate","eat","tea"],
  ["nat","tan"],
  ["bat"]
]
Note:

All inputs will be in lowercase.
The order of your output does not matter.
*/

class Solution {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var resDic = [String: [String]]()
        for str in strs {
            let tempStr = sortString(str)
            var arr = resDic[tempStr]
            if let _ = arr {
                arr!.append(str)
            } else {
                arr = [str]
            }
             resDic[tempStr] = arr!
        }
        return Array(resDic.values)
    }

    func sortString(_ str: String) -> String {
        var arr = Array(str)
        arr.sort()
        return String(arr)
    }
}
