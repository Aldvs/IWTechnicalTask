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

func compareVersions(_ firstString: String?,_ secondString: String?) throws ->  ComparisonResult {
    
    var digits = NSCharacterSet.decimalDigits
    digits.insert(charactersIn: ".")
    
    guard var firstVersion = firstString, !firstVersion.isEmpty else {
        throw VersionError.emptyFirstVersion
    }
    guard CharacterSet(charactersIn: firstVersion).isSubset(of: digits) else {
        throw VersionError.invalidFirstVersion
    }
    guard var secondVersion = secondString, !secondVersion.isEmpty else {
        throw VersionError.emptySecondVersion
    }
    guard CharacterSet(charactersIn: secondVersion).isSubset(of: digits) else {
        throw VersionError.invalidSecondVersion
    }
    
    if firstVersion.last == "0" { firstVersion.removeLast() }
    if secondVersion.last == "0" { secondVersion.removeLast() }
    if firstVersion.filter({ $0 == "."}).count > secondVersion.filter({ $0 == "."}).count {
        for _ in 0..<(firstVersion.filter({ $0 == "."}).count - secondVersion.filter({ $0 == "."}).count) {
            secondVersion += "." }
    } else {
        for _ in 0..<(secondVersion.filter({ $0 == "."}).count - firstVersion.filter({ $0 == "."}).count) {
            firstVersion += "." } }
    
    var i = 0, j = 0
    repeat {
        if i >= firstVersion.count { return j >= secondVersion.count ? .orderedSame : .orderedAscending }
        if j >= secondVersion.count { return .orderedDescending }
        if firstVersion[firstVersion.index(firstVersion.startIndex, offsetBy: i)] == "0" && secondVersion[secondVersion.index(secondVersion.startIndex, offsetBy: j)] == "0" {
            i += 1; j += 1
            continue
        } else if firstVersion[firstVersion.index(firstVersion.startIndex, offsetBy: i)] == "0" {
            i += 1
            continue
        } else if secondVersion[secondVersion.index(secondVersion.startIndex, offsetBy: j)] == "0" {
            j += 1
            continue
        }
        if firstVersion[firstVersion.index(firstVersion.startIndex, offsetBy: i)] < secondVersion[secondVersion.index(secondVersion.startIndex, offsetBy: j)] {
            return .orderedAscending
        } else if firstVersion[firstVersion.index(firstVersion.startIndex, offsetBy: i)] > secondVersion[secondVersion.index(secondVersion.startIndex, offsetBy: j)] {
            return .orderedDescending
        } else {
            i += 1; j += 1
            continue
        }
    } while true
}
