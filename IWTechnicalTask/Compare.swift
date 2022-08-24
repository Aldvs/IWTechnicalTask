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
    var digits = NSCharacterSet.decimalDigits
    digits.insert(charactersIn: ".")
    
    guard CharacterSet(charactersIn: first).isSubset(of: digits) else {
        throw VersionError.invalidFirstVersion
    }
    guard CharacterSet(charactersIn: second).isSubset(of: digits) else {
        throw VersionError.invalidSecondVersion
    }
    
    if first.suffix(2) == ".0" { first.removeLast() }
    if second.suffix(2) == ".0" { second.removeLast() }
    if first.filter({ $0 == "."}).count > second.filter({ $0 == "."}).count {
        for _ in 0..<(first.filter({ $0 == "."}).count - second.filter({ $0 == "."}).count) {
            second += "." }
    } else {
        for _ in 0..<(second.filter({ $0 == "."}).count - first.filter({ $0 == "."}).count) {
            first += "." } }
    
    var i = 0, j = 0
    repeat {
        if i >= first.count { return j >= second.count ? .orderedSame : .orderedAscending }
        if j >= second.count { return .orderedDescending }
        if first[first.index(first.startIndex, offsetBy: i)] == "0" && second[second.index(second.startIndex, offsetBy: j)] == "0" {
            i += 1; j += 1
            continue
        } else if first[first.index(first.startIndex, offsetBy: i)] == "0" {
            i += 1
            continue
        } else if second[second.index(second.startIndex, offsetBy: j)] == "0" {
            j += 1
            continue
        }
        if first[first.index(first.startIndex, offsetBy: i)] < second[second.index(second.startIndex, offsetBy: j)] {
            return .orderedAscending
        } else if first[first.index(first.startIndex, offsetBy: i)] > second[second.index(second.startIndex, offsetBy: j)] {
            return .orderedDescending
        } else {
            i += 1; j += 1
            continue
        }
    } while true
}
