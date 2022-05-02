//
//  Generator.swift
//  Right on target
//
//  Created by Дмитрий Скок on 02.05.2022.
//

import Foundation

protocol GeneratorProtocol {
    func getRandomValue () -> Int
}

// Генератор случайных чисел
class Generator: GeneratorProtocol {
    private let startRangeValue: Int
    private let endRangeValue: Int
    init?(startValue: Int, endValue: Int) {
        guard startValue <= endValue else {
            return nil
        }
        startRangeValue = startValue
        endRangeValue = endValue
    }
    
    func getRandomValue() -> Int {
        (startRangeValue...endRangeValue).randomElement()!
    }
    
    
}
