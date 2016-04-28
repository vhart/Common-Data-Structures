//: [Previous](@previous)

import Foundation

class Node<T: Comparable> {

    var left:  Node?
    var right: Node?
    var symbol: T

    init(sym: T) {
        symbol = sym
    }

}

extension Node: CustomStringConvertible{
    var description: String {
        return "\(symbol)"
    }
}

extension Node {
    func printPreOrder() {
        print(self)
        left?.printPreOrder()
        right?.printPreOrder()
    }

    func printPostOrder() {
        left?.printPostOrder()
        right?.printPostOrder()
        print(self)
    }

    func printInOrder() {
        left?.printInOrder()
        print(self)
        right?.printInOrder()
    }

}

//BST methods
extension Node {
    func find(symbol: T) -> Node? {
        if self.symbol == symbol {
            return self
        }
        if symbol < self.symbol {
            return left?.find(symbol)
        }
        else{
            return right?.find(symbol)
        }
    }

    func insert(symbol: T) {
        if symbol < self.symbol {
            if left == nil {
                left = Node(sym: symbol)
            } else{
                left?.insert(symbol)
            }
        }
        else {
            if right == nil {
                right = Node(sym: symbol)
            }else{
                right?.insert(symbol)
            }
        }
    }
}


let root = Node(sym: "7")
root.left = Node(sym: "4")
root.right = Node(sym: "9")
root.left?.left = Node(sym: "1")
root.left?.right = Node(sym: "5")
root.right?.right = Node(sym: "10")


root.printInOrder()

root.insert("8")
root.printInOrder()

//: [Next](@next)
