/*
Given an array of meeting time intervals consisting of start and end times [[s1,e1],[s2,e2],...] (si < ei), find the minimum number of conference rooms required.

Example 1:

Input: [[0, 30],[5, 10],[15, 20]]
Output: 2
Example 2:

Input: [[7,10],[2,4]]
Output: 1
*/

/*
 * Definition for an interval.
 * public class Interval {
 *   public var start: Int
 *   public var end: Int
 *   public init(_ start: Int, _ end: Int) {
 *     self.start = start
 *     self.end = end
 *   }
 * }
 */
class Solution {
    func minMeetingRooms(_ intervals: [Interval]) -> Int {
        if intervals.count <= 1 {
            return intervals.count
        }
        var starts = [Int]()
        var ends = [Int]()
        for interval in intervals {
            starts.append(interval.start)
            ends.append(interval.end)
        }

        quickSort(&starts, 0, starts.count - 1)
        quickSort(&ends, 0, ends.count - 1)

        var count = 0
        var endIndex = 0
        for i in 0...starts.count-1 {
            if starts[i] < ends[endIndex]{
                count += 1
            } else if (endIndex < i) {
                endIndex += 1
            }
        }
        return count
    }


    func quickSort(_ nums: inout [Int], _ start: Int, _ end: Int) {
        if start > end { return }
        let target = nums[start]
        var tempStart = start
        var tempEnd = end
        while(tempStart < tempEnd) {
            while(tempStart < tempEnd && nums[tempEnd] > target) {
                tempEnd -= 1
            }
            if tempStart < tempEnd {
                nums[tempStart] = nums[tempEnd]
            tempStart += 1
            }

            while(tempStart < tempEnd && nums[tempStart] < target) {
                tempStart += 1
            }
            if tempStart < tempEnd {
                nums[tempEnd] = nums[tempStart]
            }
        }
        nums[tempStart] = target
        quickSort(&nums, start, tempStart - 1)
        quickSort(&nums, tempStart + 1, end)
    }
}
