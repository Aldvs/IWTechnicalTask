//
//  main.swift
//  IWTechnicalTask
//
//  Created by admin on 08.08.2022.
//

import Foundation

//MARK: - Задание 1

var arrayOfNums = [1,2,3,4,5,6,7]

func getReverseArr(from incomingArray: inout [Int]) -> [Int] {
    
    var temp: Int
    
    for i in 0...incomingArray.count / 2 {
        temp = incomingArray[i]
        incomingArray[i] = incomingArray[incomingArray.count - i - 1]
        incomingArray[incomingArray.count - i - 1] = temp
    }
    return incomingArray
}

print("Задание #1\n")
print("Исходный массив: \(arrayOfNums)")
var testArray = getReverseArr(from: &arrayOfNums)
print("Результирующий массив: \(testArray) \n")
print("Задание #2\n")
//MARK: - Задание 2

let n = 4 // rows
let m = 7 // columns

var matrix: [[Int]] = Array(repeating: Array(repeating: 0, count: m), count: n)

for row in 0..<matrix.count {
    for elemInRow in 0..<matrix[row].count {
        matrix[row][elemInRow] = Int.random(in: 0...9)
    }
}

print("Исходный массив:")
for row in matrix {
    print(row)
}

for row in 0..<matrix.count {
    if row % 2 != 0 {
        for elem in 0..<matrix[row].count {
            let temp = matrix[row][elem]
            matrix[row][elem] = matrix[row-1][elem]
            matrix[row-1][elem] = temp
        }
    }
}

print("Результирующий массив:")
for row in matrix {
    print(row)
}



