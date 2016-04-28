//: [Previous](@previous)

import Foundation

enum State {
    case Undiscovered
    case Discovered
    case Finished
}

class Vertex<T: Equatable>: CustomStringConvertible{
    var symbol: T
    var state: State
    var prevVertex: Vertex<T>?
    var currentDistance: Int

    init(value: T) {
        self.symbol = value
        self.state = .Undiscovered
        currentDistance = 0
    }

    var description: String {
        return "\(self.symbol)"
    }
}


func ==<T>(lhs: Vertex<T>, rhs: Vertex<T>) -> Bool{
    return lhs.symbol == rhs.symbol
}


class Edge<T: Equatable> {
    var pair: (Vertex<T>, Vertex<T>)
    init(v1: Vertex<T>, v2: Vertex<T>){
        pair = (v1, v2)
    }
    func getFirstVertex() -> Vertex<T> {
        return pair.0
    }
    func getSecondVertex() -> Vertex<T>{
        return pair.1
    }
}

extension Edge {
    func contains(v1: Vertex<T>) -> Bool {
        return self.pair.0 == v1 || self.pair.1 == v1
    }

    func otherVertex(v1: Vertex<T>) -> Vertex<T>? {
        if v1 == self.pair.0{
            return self.pair.1
        }
        else if v1 == self.pair.1{
            return self.pair.0
        }
        return nil
    }

}

class Graph<T: Equatable> {
    var vertices : [Vertex<T>]
    var edges: [Edge<T>]

    init(vert: [Vertex<T>], edges: [Edge<T>]){
        self.vertices = vert
        self.edges = edges
    }

}

func BFS_print_nodes<T>(g: Graph<T>, startingVertex:Vertex<T>){
    var queue = [Vertex<T>]()
    startingVertex.state = .Discovered
    queue.append(startingVertex)

    while !queue.isEmpty {
        for edge in g.edges{

            if edge.contains(queue.first!){

                let other = edge.otherVertex(queue.first!)!

                    if other.state == .Undiscovered {
                        queue.append(other)
                        other.state = .Discovered
                    }
            }

        }

        queue.first!.state = .Finished
        print(queue.removeFirst())
    }
}

func BFS_print_nodes_with_Distance<T>(g: Graph<T>, startingVertex:Vertex<T>){
    var queue = [Vertex<T>]()
    startingVertex.state = .Discovered
    queue.append(startingVertex)

    while !queue.isEmpty {
        for edge in g.edges{

            if edge.contains(queue.first!){

                let other = edge.otherVertex(queue.first!)!

                if other.state == .Undiscovered {
                    queue.append(other)
                    other.state = .Discovered
                    other.currentDistance = queue.first!.currentDistance + 1
                }
            }

        }

        queue.first!.state = .Finished
        let vert = queue.removeFirst()
        print("\(vert),\(vert.currentDistance)")

    }
}

func BFS_print_nodes_with_pathTo<T>(g: Graph<T>, startingVertex:Vertex<T>, endingVertex: Vertex<T>){
    var queue = [Vertex<T>]()
    startingVertex.state = .Discovered
    queue.append(startingVertex)

    while !queue.isEmpty {
        if queue.first! == endingVertex{
            break
        }
        for edge in g.edges{

            if edge.contains(queue.first!){

                let other = edge.otherVertex(queue.first!)!

                if other.state == .Undiscovered {
                    queue.append(other)
                    other.state = .Discovered
                    other.prevVertex = queue.first!
                }
            }

        }

        queue.first!.state = .Finished
        queue.removeFirst()
    }

    printPathFor(endingVertex)
}

func printPathFor<T>(v: Vertex<T>) {

    if v.prevVertex == nil{
        print(v)
        return
    }

    printPathFor(v.prevVertex!)
    print(v)

}

let a = Vertex(value: "A")
let b = Vertex(value: "B")
let c = Vertex(value: "C")
let d = Vertex(value: "D")
let e = Vertex(value: "E")

var A_B = Edge(v1: a, v2: b)
var A_D = Edge(v1: a, v2: d)
var A_E = Edge(v1: a, v2: e)
var E_C = Edge(v1: e, v2: c)
var D_C = Edge(v1: d, v2: c)

let graph = Graph.init(vert: [a,b,c,d,e], edges: [A_B,A_D,A_E,E_C,D_C])

//BFS_print_nodes(graph, startingVertex: a)
BFS_print_nodes_with_pathTo(graph, startingVertex: b, endingVertex: c)

//: [Next](@next)
