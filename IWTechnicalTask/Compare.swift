//
//  Compare.swift
//  IWTechnicalTask
//
//  Created by admin on 15.08.2022.
//

import Foundation

func compareVersions(compare firstVersion: String?, with secondVersion: String?) -> Int {
    
    var result = 0
    
    var firstVersionArr:[String] = []
    var secondVersionArr:[String] = []
    
    //обработка введенных данных
    guard let firstString = firstVersion, !firstString.isEmpty else {
        print("Вы не ввели первую версию")
        exit(1)
    }
    
    for char in firstString {
        guard char.isNumber || (char == ".") else {
            print("Вы использовали некорректные символы в первой версии")
            exit(2)
        }
    }
    
    guard let secondString = secondVersion, !secondString.isEmpty else {
        print("Вы не ввели вторую версию")
        exit(3)
    }
    
    for char in secondString {
        guard char.isNumber || (char == ".") else {
            print("Вы использовали некорректные символы во второй версии")
            exit(4)
        }
    }
    
    func getArrayForCompare(_ str: String) {
        var index = 0
        if str == "." {
            switch str {
            case firstVersion:
                firstVersionArr.append("0")
                firstVersionArr.append("0")
            default:
                secondVersionArr.append("0")
                secondVersionArr.append("0")
            }
            
        } else {
            while !str[str.index(str.startIndex, offsetBy: index)].isNumber && (index < str.count) {
                switch str {
                case firstVersion:
                    firstVersionArr.append("0")
                default:
                    secondVersionArr.append("0")
                }
                index += 1
            }
            
            let nums = str.split(separator: ".")
            for substr in nums {
                switch str {
                case firstVersion:
                    firstVersionArr.append(String(substr))
                default:
                    secondVersionArr.append(String(substr))
                }
            }
        }

    }

    func removeZero() {
        if !firstVersionArr.isEmpty {
            while firstVersionArr.last == "0" {
                firstVersionArr.removeLast()
            }
        }
        if !secondVersionArr.isEmpty {
            while secondVersionArr.last == "0" {
                secondVersionArr.removeLast()
            }
        }
    }
    
    getArrayForCompare(firstString)
    getArrayForCompare(secondString)
    removeZero()
    
    for i in 0..<min(firstVersionArr.count, secondVersionArr.count) {
        if firstVersionArr[i] > secondVersionArr[i] {
            result -= 1
            break
        } else if firstVersionArr[i] < secondVersionArr[i] {
            result += 1
            break
        } else {
            continue
        }
    }
    
    if result == 0 && firstVersionArr.count > secondVersionArr.count {
        result -= 1
    } else if result == 0 && firstVersionArr.count < secondVersionArr.count {
        result += 1
    }
    return result
}
