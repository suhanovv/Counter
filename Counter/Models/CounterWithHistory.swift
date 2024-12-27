//
//  CC.swift
//  Counter
//
//  Created by Вадим Суханов on 27.12.2024.
//

import Foundation

struct CounterWithHistory {
    private var value: Int = 0
    private var history: [HistoryRow] = []
    
    init(withInitial value: Int) {
        self.value = value
    }
}


extension CounterWithHistory: Counter, HistoryWriter {
    mutating func increment() {
        value += 1
        writeHistoryRow(history: HistoryRow(operationDateTime: Date(), operationType: .increment))
    }
    
    mutating func decrement() {
        if value > 0 {
            value -= 1
            writeHistoryRow(history: HistoryRow(operationDateTime: Date(), operationType: .decrement))
        } else {
            writeHistoryRow(
                history: HistoryRow(
                    operationDateTime: Date(),
                    operationType: .decrementBelowZero
                )
            )
        }
        
    }
    
    mutating func reset() {
        value = 0
        writeHistoryRow(history: HistoryRow(operationDateTime: Date(), operationType: .reset))
    }
    func getCurrentValue() -> Int {
        value
    }
}


extension CounterWithHistory: HistoryReaderWriter {
    mutating func writeHistoryRow(history: HistoryRow) {
        self.history.append(history)
    }
    
    func readAllHistory() -> [HistoryRow] {
        history
    }
}
