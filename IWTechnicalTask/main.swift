//
//  main.swift
//  IWTechnicalTask
//
//  Created by admin on 08.08.2022.
//

import Foundation

//MARK: - Ввод и проверка данных
print("Введите первую версию:")
let first = readLine()

print("Введите вторую версию:")
let second = readLine()

let compareResult = compareVersions(compare: first, with: second)

switch compareResult {
case -1:
    print("Первая версия больше.")
case 1:
    print("Вторая версия больше.")
default:
    print("Версии равны.")
}



