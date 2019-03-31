/*
Given a collection of intervals, merge all overlapping intervals.

Example 1:

Input: [[1,3],[2,6],[8,10],[15,18]]
Output: [[1,6],[8,10],[15,18]]
Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
Example 2:

Input: [[1,4],[4,5]]
Output: [[1,5]]
Explanation: Intervals [1,4] and [4,5] are considered overlapping.
*/

/**
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
    func merge(_ intervals: [Interval]) -> [Interval] {
        if intervals.count < 2 {
            return intervals
        }
        var intervals = intervals
        quickSort(&intervals, 0, intervals.count - 1)
        var result = [Interval]()
        var n = 0
        var index = 0
        result.append(intervals[0])
        n += 1
        while(n < intervals.count) {

            let interval = intervals[n]

            if result[index].end < interval.start {
                result.append(interval)
                index += 1
            }
            else {
                result[index].end = max(interval.end, result[index].end)
            }
            n += 1
        }

        return result
    }

    func quickSort(_ intervals: inout [Interval], _ start: Int, _ end: Int) {
        if start > end { return }
        let target = intervals[start]
        var tempStart = start
        var tempEnd = end
        while(tempStart < tempEnd) {
            while(tempStart < tempEnd && intervals[tempEnd].start > target.start) {
                tempEnd -= 1
            }
            if tempStart < tempEnd {
                intervals[tempStart] = intervals[tempEnd]
            tempStart += 1
            }

            while(tempStart < tempEnd && intervals[tempStart].start < target.start) {
                tempStart += 1
            }
            if tempStart < tempEnd {
                           intervals[tempEnd] = intervals[tempStart]

            }
        }
        intervals[tempStart] = target
        quickSort(&intervals, start, tempStart - 1)
        quickSort(&intervals, tempStart + 1, end)
    }

}
