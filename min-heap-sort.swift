#!/usr/bin/env swift
/**
* 堆排序（最大堆）
*/

/**
* 交换数组元素
*/
//#!/usr/bin/env swift
/**
* 堆排序（最大堆）
*/

/**
* 交换数组元素
*/
func swap(_ A: inout [Int], _ i:Int, _ j:Int) {
    var tmp = A[i]
    A[i] = A[j]
    A[j] = tmp
}

/**
* 维护最大堆的性质
*/
func heapify(_ A: inout [Int], _ i:Int, _ size:Int) {
    let l = 2 * i
    let r = l + 1
    var smallest = i

    if l < size && A[l] < A[i] {
        smallest = l
    }
    if r < size && A[r] < A[smallest] {
        smallest = r
    }
    if smallest != i {
        swap(&A, i, smallest)
        heapify(&A, smallest, size)
    }
    
}

/**
* 构建最大堆
*/
func buildHeap(_ A: inout [Int]) {
    for i in stride(from:  A.count/2, to: -1, by: -1) {
        heapify(&A, i, A.count)
    }
    print("build heap:\(A)")
}

/**
*堆排序
*/
func heapSort(_ A: inout [Int]) {
    buildHeap(&A)
    var size = A.count
    for i in stride(from: A.count - 1, to: 0, by: -1) {
        swap(&A, i, 0)
        size -= 1
        heapify(&A, 0, size)
    }
    print("sorted heap:\(A)")
}

var A = [4, 1, 3, 2, 16, 9,9, 10, 14, 8, 7]
heapSort(&A)

