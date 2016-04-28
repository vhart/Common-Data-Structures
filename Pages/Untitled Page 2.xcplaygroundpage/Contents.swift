//: [Previous](@previous)

import Foundation
//: ## Quicksort

func quickSort(inout arr: [Int], first: Int, last: Int) {
    // base case
    if first >= last {
        return
    }
    // partition
    let split = partition(&arr, first: first, last: last)

    // quickSort on leftHalf
    quickSort(&arr, first: first, last: split-1)

    // quickSort on rightHalf
    quickSort(&arr, first: split+1, last: last)
}


func quickSort(inout arr: [Int]) {
    quickSort(&arr, first: 0, last: arr.count-1)
}

func partition(inout arr: [Int], first: Int, last: Int) -> Int {
    // set pivotValue to firstElement
    var pivotValue = arr[first]
    // set leftMark
    var leftMark = first
    // set rightMark
    var rightMark = last
    var isLeft = true

    // as leftMark and rightMark close in on each other, swap the items 
    // that are greater than the pivot value on the left side with the 
    // items that are less than the pivot value on the right side.
    // Stop when rightMark crosses leftMark

    while leftMark != rightMark{
        if isLeft{
            if pivotValue > arr[rightMark]{
                swap(&arr[leftMark], &arr[rightMark])
                pivotValue = arr[rightMark]
                isLeft = false
                continue
            }
            else{
                rightMark--
            }
        }
        else{
            if pivotValue < arr[leftMark]{
                swap(&arr[leftMark], &arr[rightMark])
                pivotValue = arr[leftMark]
                isLeft = true
            }
            else{
                leftMark++
            }

        }

    }
    // set the correct value at the splitPoint

    return leftMark // return the splitPoint
}

var unsorted = [8,100,6,14,7,8,33,4,29]
quickSort(&unsorted)
//: [Next](@next)
