//
//  Compare.swift
//  IWTechnicalTask
//
//  Created by admin on 15.08.2022.
//
import Foundation

enum VersionError: Error {
    case emptyFirstVersion
    case invalidFirstCharacters
    case emptySecondVersion
    case invalidSecondCharacters
}

func compareVersions(compare firstVersion: String?, and secondVersion: String?) throws ->  ComparisonResult {
    
    var digits = NSCharacterSet.decimalDigits
    digits.insert(charactersIn: ".")
    
    guard var firstString = firstVersion, !firstString.isEmpty else {
        throw VersionError.emptyFirstVersion
    }
    guard CharacterSet(charactersIn: firstString).isSubset(of: digits) else {
        throw VersionError.invalidFirstCharacters
    }
    guard var secondString = secondVersion, !secondString.isEmpty else {
        throw VersionError.emptySecondVersion
    }
    guard CharacterSet(charactersIn: secondString).isSubset(of: digits) else {
        throw VersionError.invalidSecondCharacters
    }
    if firstString.last == "0" { firstString.removeLast() }
    if secondString.last == "0" { secondString.removeLast() }
    if firstString.filter({ $0 == "."}).count > secondString.filter({ $0 == "."}).count {
        for _ in 0..<(firstString.filter({ $0 == "."}).count - secondString.filter({ $0 == "."}).count) {
            secondString += "." }
    } else {
        for _ in 0..<(secondString.filter({ $0 == "."}).count - firstString.filter({ $0 == "."}).count) {
            firstString += "." } }
    
    var i = 0, j = 0
    repeat {
        if i >= firstString.count { return j >= secondString.count ? .orderedSame : .orderedAscending }
        if j >= secondString.count { return .orderedDescending }
        if firstString[firstString.index(firstString.startIndex, offsetBy: i)] == "0" && secondString[secondString.index(secondString.startIndex, offsetBy: j)] == "0" {
            i += 1; j += 1
            continue
        } else if firstString[firstString.index(firstString.startIndex, offsetBy: i)] == "0" {
            i += 1
            continue
        } else if secondString[secondString.index(secondString.startIndex, offsetBy: j)] == "0" {
            j += 1
            continue
        }
        if firstString[firstString.index(firstString.startIndex, offsetBy: i)] < secondString[secondString.index(secondString.startIndex, offsetBy: j)] {
            return .orderedAscending
        } else if firstString[firstString.index(firstString.startIndex, offsetBy: i)] > secondString[secondString.index(secondString.startIndex, offsetBy: j)] {
            return .orderedDescending
        } else {
            i += 1; j += 1
            continue
        }
    } while true
}
