//
//  Counter.swift
//  Counter
//
//  Created by Вадим Суханов on 27.12.2024.
//

import Foundation

protocol Counter {
    mutating func increment()
    mutating func decrement()
    mutating func reset()
    func getCurrentValue() -> Int
}
