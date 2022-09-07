//
//  Compare.swift
//  IWTechnicalTask
//
//  Created by admin on 15.08.2022.
//
import Foundation

enum VersionError: Error {
    case emptyFirstVersion
    case invalidFirstVersion
    case emptySecondVersion
    case invalidSecondVersion
}

func compareVersions(_ firstVersion: String,_ secondVersion: String) throws ->  ComparisonResult {
    var first = firstVersion
    var second = secondVersion
    var result: ComparisonResult = .orderedSame
    var digits = NSCharacterSet.decimalDigits
    digits.insert(charactersIn: ".")
    
    guard CharacterSet(charactersIn: first).isSubset(of: digits) else {
        throw VersionError.invalidFirstVersion
    }
    guard CharacterSet(charactersIn: second).isSubset(of: digits) else {
        throw VersionError.invalidSecondVersion
    }
    
    if first.filter({ $0 == "."}).count > second.filter({ $0 == "."}).count {
        second += String(repeating: ".", count: first.filter({ $0 == "."}).count - second.filter({ $0 == "."}).count)
    } else {
        first += String(repeating: ".", count: second.filter({ $0 == "."}).count - first.filter({ $0 == "."}).count)
    }
    if (first.last?.isNumber != nil) || (second.last?.isNumber != nil) {
        first.append(contentsOf: ".")
        second.append(contentsOf: ".")
    }
    var i = 0, j = 0
    for _ in 0...max(first.count, second.count) - 1  {
        if i >= first.count { j >= second.count ? (result = .orderedSame) : (result = .orderedAscending) }
        if j >= second.count { result = .orderedDescending }
        if first[first.index(first.startIndex, offsetBy: i)] == "0" && second[second.index(second.startIndex, offsetBy: j)] == "0" {
            i += 1; j += 1
            continue } else
        if first[first.index(first.startIndex, offsetBy: i)] == "0" {
            i += 1
            continue
        } else if second[second.index(second.startIndex, offsetBy: j)] == "0" {
            j += 1
            continue
        }
        if first[first.index(first.startIndex, offsetBy: i)] < second[second.index(second.startIndex, offsetBy: j)] {
            result = .orderedAscending
        } else if first[first.index(first.startIndex, offsetBy: i)] > second[second.index(second.startIndex, offsetBy: j)] {
            result = .orderedDescending
        } else {
            i += 1; j += 1
            continue
        }
    }
    return result
}
