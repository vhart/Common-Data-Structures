//: Playground - noun: a place where people can play

import UIKit

protocol SetProtocol {
    typealias ItemType
    mutating func add(item: ItemType)
    mutating func remove(item: ItemType)
    func contains(item: ItemType) -> Bool
}

struct ArraySet<T: Equatable> : SetProtocol, CustomStringConvertible {

    var elements = [T]()

    mutating func add(item: T) {
        if !contains(item){
            elements.append(item)
        }
    }
    
    mutating func remove(item: T){
        if let idx = elements.indexOf(item) {
            elements.removeAtIndex(idx)
        }
    }

    func contains(item: T) -> Bool {
        return elements.contains(item)
    }

    var description: String {
        return "\(elements)"
    }
}