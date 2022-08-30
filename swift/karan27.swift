import Foundation
import XCTest

class node{
    var identifier: Int
    var connections: [node]
    
    init(_ identifier: Int, _ connections: [node]){
        self.identifier = identifier
        self.connections = connections
    }
    func newEdge(_ n: node){
        connections.append(n)
    }
}

class graph{
    var nodeList: [node] = []
    
    func lookFor(_ id: Int) -> node?{
        return nodeList.filter({$0.identifier == id}).randomElement()
    }
    
    init(_ edgeList: [(Int, Int)]){
        for edge in edgeList{
            if lookFor(edge.0) == nil{
                self.nodeList.append(node(edge.0, []))
            }
            if lookFor(edge.1) == nil{
                self.nodeList.append(node(edge.1, []))
            }
            lookFor(edge.0)!.newEdge(lookFor(edge.1)!)
            lookFor(edge.1)!.newEdge(lookFor(edge.0)!)
        }
    }
}

func test(){
    let myGraph = graph([(1, 0), (1, 2), (2, 0), (0, 3), (3, 4)])
    XCTAssertEqual(myGraph.lookFor(0)!.connections.map({ $0.identifier}), [1, 2, 3])
    XCTAssertEqual(myGraph.lookFor(3)!.connections.map({ $0.identifier}), [0, 4])
}

test()
