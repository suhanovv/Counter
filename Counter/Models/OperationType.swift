//
//  OperationType.swift
//  Counter
//
//  Created by Вадим Суханов on 26.12.2024.
//

import Foundation

enum OperationType: String {
    case increment = "значение изменено на 1"
    case decrement = "значение изменено на -1"
    case reset = "значение сброшено"
    case decrementBelowZero = "попытка уменьшить значение счётчика ниже 0"
}
