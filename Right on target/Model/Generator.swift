//
//  Generator.swift
//  Right on target
//
//  Created by Sayat on 31.05.2025.
//

protocol GeneratorProtocol {
    func getRandomValue() -> Int
}

class Generator: GeneratorProtocol {
    private let minRangeValue: Int
    private let maxRangeValue: Int
    init?(startValue: Int, endValue: Int) {
        guard startValue <= endValue else {
            return nil
        }
        minRangeValue = startValue
        maxRangeValue = endValue
    }
    func getRandomValue() -> Int {
        (minRangeValue...maxRangeValue).randomElement()!
    }
}
