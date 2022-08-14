//
//  main.swift
//  IWTechnicalTask
//
//  Created by admin on 08.08.2022.
//

import Foundation

//MARK: - Задание 3. Консоль

func run() -> [String] {
    var pairOfVersions: [String] = []
        
    print("Введите первую версию:")
    guard let firstString = readLine(), !firstString.isEmpty else {
        print("Вы не ввели первую версию")
        return []
    }
    
    for char in firstString {
        guard char.isNumber || (char == ".") else {
            print("Вы использовали некорректные символы в первой версии")
            return []
        }
    }
    pairOfVersions.append(firstString)
    
    print("Введите вторую версию:")
    guard let secondString = readLine(), !secondString.isEmpty else {
        print("Вы не ввели вторую версию")
        return []
    }
    
    for char in secondString {
        guard char.isNumber || (char == ".") else {
            print("Вы использовали некорректные символы во второй версии")
            return []
        }
    }
    pairOfVersions.append(secondString)
    
    return pairOfVersions
}

var versionStrings = run()

//MARK: - Метод

func compareVersions(compare firstVersion: String, with secondVersion: String) -> Int {
    
    var result = 0
    
    var firstVersionArr:[String] = []
    var secondVersionArr:[String] = []
    
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
    
    getArrayForCompare(firstVersion)
    getArrayForCompare(secondVersion)
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
    
    switch result {
    case -1:
        print("Первая версия больше.")
    case 1:
        print("Вторая версия больше.")
    default:
        print("Версии равны.")
    }
    print("Результат: \(result)")
    
    return result
}

let compareResult = compareVersions(compare: versionStrings[0], with: versionStrings[1])
print(compareResult)

