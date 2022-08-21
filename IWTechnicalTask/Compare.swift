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
    
    let set: Set = ["0","1","2","3","4","5","6","7","8","9","."]
    
    guard let firstString = firstVersion, !firstString.isEmpty else {
        throw VersionError.emptyFirstVersion
    }
    for char in firstString {
        guard set.contains(String(char)) else {
            throw VersionError.invalidFirstCharacters
        }
    }
    guard let secondString = secondVersion, !secondString.isEmpty else {
        throw VersionError.emptySecondVersion
    }
    for char in secondString {
        guard set.contains(String(char)) else {
            throw VersionError.invalidSecondCharacters
        }
    }
    
    var i = 0, j = 0
    repeat {
        if i >= firstString.count { return j >= secondString.count ? .orderedSame : .orderedAscending }
        if j >= secondString.count { return .orderedDescending }
        
        if firstString[firstString.index(firstString.startIndex, offsetBy: i)] == "0" {
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
            i += 1
            j += 1
            continue
        }
    } while true
}
