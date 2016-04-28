//: [Previous](@previous)

import Foundation



protocol MapProtocol {
    typealias KeyType
    typealias ValueType
    subscript(k: KeyType) -> ValueType? {get set}
    mutating func remove(k: KeyType)
}

struct HashMap<K: Hashable, V>: MapProtocol, CustomStringConvertible {

    var table : [[(K,V)]]

    init(capacity: Int = 8) {
        table = [[(K,V)]](count: capacity, repeatedValue: [])
    }

    typealias KeyType = K

    typealias ValueType = V

    subscript(k: K) -> V? {
        get{
            return nil
        }
        set(v){
            let hashValue = abs(k.hashValue % table.count)
            table[hashValue].append((k,v!))
        }
    }

    mutating func remove(k: KeyType) {
        let hashValue = abs(k.hashValue % table.count)
        if let idx = table[hashValue].indexOf({$0.0 == k}){
            table[hashValue].removeAtIndex(idx)
        }
    }

    var description: String {
        var str = ""
        for entry in table {
            str += "\(entry)"
            str += "\n"
        }
        return str
    }
}

var hashTable = HashMap<String, String>()
hashTable["Michael"] = "Mike"
hashTable["Spaghettie"] = "Spagz"
hashTable["Totally"] = "Totez"
hashTable["My Goats"] = "Muhgotez"

print(hashTable)


//: [Next](@next)
