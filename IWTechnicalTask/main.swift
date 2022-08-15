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
let compareResult = compareVersions(compare: first, with: second)

//демонстрация результата
switch compareResult {
case -1:
    print("Первая версия больше.")
case 1:
    print("Вторая версия больше.")
default:
    print("Версии равны.")
}



