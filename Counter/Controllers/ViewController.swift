//
//  ViewController.swift
//  Counter
//
//  Created by Вадим Суханов on 26.12.2024.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var counterValue: UILabel!
    @IBOutlet weak var historyView: UITextView!
    
    
    private var counter: Counter = CounterWithHistory(withInitial: 0)
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func increment(_ sender: Any) {
        counter.increment()
        updateView()
    }

    @IBAction func decrement(_ sender: Any) {
        counter.decrement()
        updateView()
        
    }
    
    @IBAction func reset(_ sender: Any) {
        counter.reset()
        updateView()

    }
    
    private func updateView() {
        counterValue.text = "Значение счётчика: \(counter.getCurrentValue())"
        if let historyReader = counter as? HistoryReader {
            
            historyView.text = "История изменений:\n\n" + historyReader.readAllHistory().sorted {
                $0.operationDateTime > $1.operationDateTime
            }.map { row in
                "[\(dateFormatter.string(from: row.operationDateTime))]: \(row.operationType.rawValue)\n"
            }.joined()
        }
    }
}
