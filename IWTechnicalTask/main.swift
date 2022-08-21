//
//  main.swift
//  IWTechnicalTask
//
//  Created by admin on 08.08.2022.
//

import Foundation

//MARK: - Ввод данных
print("Введите первую версию:")
let first = readLine()
print("Введите вторую версию:")
let second = readLine()

//вызов метода сравнения
do {
    let result = try compareVersions(compare: first, and: second)
    switch result {
    case .orderedAscending:
        print("Первая версия меньше.")
    case .orderedDescending:
        print("Первая версия больше.")
    default:
        print("Версии равны.")
    }
} catch VersionError.emptyFirstVersion {
    print("Вы не ввели первую версию")
} catch VersionError.emptySecondVersion {
    print("Вы не ввели вторую версию")
} catch VersionError.invalidFirstCharacters {
    print("Первая версия содержит недопустимые символы")
} catch VersionError.invalidSecondCharacters {
    print("Вторая версия содержит недопустимые символы")
}






