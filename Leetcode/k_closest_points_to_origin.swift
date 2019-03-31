/*
We have a list of points on the plane.  Find the K closest points to the origin (0, 0).

(Here, the distance between two points on a plane is the Euclidean distance.)

You may return the answer in any order.  The answer is guaranteed to be unique (except for the order that it is in.)



Example 1:

Input: points = [[1,3],[-2,2]], K = 1
Output: [[-2,2]]
Explanation:
The distance between (1, 3) and the origin is sqrt(10).
The distance between (-2, 2) and the origin is sqrt(8).
Since sqrt(8) < sqrt(10), (-2, 2) is closer to the origin.
We only want the closest K = 1 points from the origin, so the answer is just [[-2,2]].
Example 2:

Input: points = [[3,3],[5,-1],[-2,4]], K = 2
Output: [[3,3],[-2,4]]
(The answer [[-2,4],[3,3]] would also be accepted.)


Note:

1 <= K <= points.length <= 10000
-10000 < points[i][0] < 10000
-10000 < points[i][1] < 10000

*/

class Solution {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        var pointsDic = [Double: [[Int]]]()
        for point in points {
            let distance = sqrt(Double(point[0] * point[0]) + Double(point[1] * point[1]))
            if pointsDic[distance] == nil {
                pointsDic[distance] = [[Int]]()
            }
            var subPoints = pointsDic[distance] as! [[Int]]
            subPoints.append(point)
            pointsDic[distance] = subPoints
        }

        var keys = Array(pointsDic.keys)

      quickSort(&keys, 0, keys.count-1)
        var res = [[Int]]()
        for key in keys {
            for value in pointsDic[key]! {
                res.append(value)
                if res.count >= K {
                     break
                }
            }
            if res.count >= K {
                    break
                }
        }

        return res

    }

    func quickSort(_ nums: inout[Double], _ m: Int, _ n: Int) {
        if m > n { return }
        var i = m
        var j = n
        var target = nums[i]
        while(i < j) {
            while(i < j && target < nums[j]) {
                j -= 1
            }
            if i < j {
                nums[i] = nums[j]
                i += 1
            }
            while(i<j && target > nums[i]) {
                i += 1
            }
            if i < j {
                nums[j] = nums[i]
            }
        }
        nums[i] = target
        quickSort(&nums, m, i - 1)
        quickSort(&nums, i + 1, n)
    }
}
