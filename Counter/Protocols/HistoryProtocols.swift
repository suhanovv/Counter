//
//  HistoryProtocols.swift
//  Counter
//
//  Created by Вадим Суханов on 27.12.2024.
//

import Foundation

protocol HistoryWriter {
    mutating func writeHistoryRow(history: HistoryRow)
}

protocol HistoryReader {
    func readAllHistory() -> [HistoryRow]
}

protocol HistoryReaderWriter: HistoryReader, HistoryWriter {
    
}
