//: [Previous](@previous)

import Foundation

//: Merge Sort

func mergeSort(arr: [Int]) -> [Int] {

    if arr.count == 1{
        return arr
    }

    var left = Array(arr[0..<arr.count/2])
    var right = Array(arr[arr.count/2..<arr.count])

    left = mergeSort(left)
    right = mergeSort(right)

    return merge(left, right)

}

func merge(left: [Int], _ right: [Int]) -> [Int] {

    var mergedArray = [Int]()
    var i = 0
    var j = 0

    while(i < left.count || j < right.count){

        if(i == left.count){
            mergedArray.append(right[j])
            j++
            continue
        }else if( j == right.count){
            mergedArray.append(left[i])
            i++
            continue
        }

        if(left[i] <= right[j]){
            mergedArray.append(left[i])
            i++
        }else{
            mergedArray.append(right[j])
            j++
        }

    }

    return mergedArray
}

var arr = [38,15,20,6,32,54,26]
mergeSort(arr)

func partition(xs: [Int], pivot: Int) -> ([Int], [Int]) {
    return (xs.filter{$0 < pivot}, xs.filter{$0 > pivot})
}

partition([1, 4, 2, 5], pivot: 3)

func qsort(xs: [Int]) -> [Int] {
    if (xs.isEmpty) {
        return []
    }
    let pivot = xs[0]
    let (ys, zs) = partition(xs, pivot: pivot)
    return qsort(ys) + [pivot] + qsort(zs)
}

qsort([8, 6, 7,3, 5, 3,3, 0, 9])


//: [Next](@next)
