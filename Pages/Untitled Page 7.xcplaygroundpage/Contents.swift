//: [Previous](@previous)

import Foundation

func mysteryFunc(values: [Int]) -> [Int] {
    let n = values.count
    if n < 2 {
        return values
    }
    var left = Array(values[0..<n / 2])
    var right = Array(values[n / 2..<n])
    left = mysteryFunc(left)
    right = mysteryFunc(right)

    return helperFunc(left, right)
}

func helperFunc(var left: [Int], var _ right: [Int]) -> [Int] {
    var result: [Int] = []
    while !left.isEmpty && !right.isEmpty {
        if left[0] < right[0] {
            result.append(left[0])
            left.removeAtIndex(0)
        } else {
            result.append(right[0])
            right.removeAtIndex(0)
        }
    }
    return result + left + right
}

mysteryFunc([2,5,2,6])


func recursiveFunction(characterArray: [String]) -> Int {

    if characterArray.count == 0 {
        return 0
    }

    let n = characterArray.count

    if characterArray[0] == " " {
        return 1 + recursiveFunction(Array(characterArray[1..<n]))
    }
    else if characterArray[0] == "a" {
        return -5 + recursiveFunction(Array(characterArray[1..<n]))
    }
    else{
        return recursiveFunction(Array(characterArray[1..<n]))
    }

}


func iterativeFunc(characterArray: [String])->Int {
    var counter = 0
    for x in 0..<characterArray.count {
        if characterArray[x] == " " {
            counter += 1
        } else if characterArray[x] == "a" {
            counter -= 5
        }
    }
    return counter
}


recursiveFunction(["a"," ","B"," "])
iterativeFunc(["a"," ","B", " "])

func rotateArray(values: [[Int]]) -> [[Int]] {

    var rotatedArray = [[Int]]()

    for i in 0..<values[0].count {
        rotatedArray.append(getRow(values, row: values[0].count - 1 - i))
    }

    return rotatedArray
}

func getRow(array: [[Int]], row: Int) -> [Int] {

    var rowArray = [Int]()

    for col in 0..<array.count {
        rowArray.append(array[col][row])
    }

    return rowArray
}

//func rotateArray(values: [[Int]]) -> [[Int]] {
//
//    var rotatedArray = [[Int]]()
//
//    for i in 0..<values[0].count {
//        rotatedArray.append(getColumn(values, column: i))
//    }
//
//    return rotatedArray
//}
//
//func getColumn(array: [[Int]], column: Int) -> [Int] {
//
//    var columnArray = [Int]()
//
//    for row in 0..<array.count {
//        columnArray.append(array[array.count - 1 - row][column])
//    }
//
//    return columnArray
//}

let array = [[1, 2, 3],
             [5, 6, 8]]
rotateArray([[1,2],
             [3,4],
             [5,6],
             [7,8]])

let date = NSDate()
let formatter = NSDateFormatter()
formatter.dateFormat = "EEEEEE"
//formatter.timeStyle = .ShortStyle

let dateString = formatter.stringFromDate(date)







//: [Next](@next)
