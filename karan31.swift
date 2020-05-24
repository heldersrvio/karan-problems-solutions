import Foundation
import XCTest

class Node: Equatable{
    var identifier: Int
    
    init(_ identifier: Int){
        self.identifier = identifier
    }
    static func ==(_ oneNode: Node, _ otherNode: Node) -> Bool{
        return oneNode.identifier == otherNode.identifier
    }
}

class Edge{
    var n1: Node
    var n2: Node
    var weight: Int
    
    init(_ n1: Node, _ n2: Node, _ weight: Int){
        self.n1 = n1
        self.n2 = n2
        self.weight = weight
    }
}

class Graph{
    var nodeList: [Node]
    var edgeList: [Edge]
    
    func lookFor(_ index: Int) -> Int?{
        for n in 0..<nodeList.count{
            if nodeList[n].identifier == index{
                return n
            }
        }
        return nil
    }
    
    init(_ nodeList: [Node], _ edgeList: [Edge]){
        self.nodeList = nodeList
        self.edgeList = edgeList
    }
    
    init(_ sequence: [(Int, Int, Int)]){
        nodeList = []
        edgeList = []
        for e in sequence{
            if lookFor(e.0) == nil{
                nodeList.append(Node(e.0))
            }
            if lookFor(e.1) == nil{
                nodeList.append(Node(e.1))
            }
            edgeList.append(Edge(nodeList[lookFor(e.0)!], nodeList[lookFor(e.1)!], e.2))
        }
    }
    func bridgeEdges(_ nodesIn: [Node]) -> [Edge]{
        let nodesOut = nodeList.filter({!nodesIn.contains($0)})
        return edgeList.filter({nodesOut.contains($0.n1) && !nodesOut.contains($0.n2) || nodesOut.contains($0.n2) && !nodesOut.contains($0.n1)})
    }
    func minimumSpanningTree() -> Graph{
        var nList: [Node] = []
        var eList: [Edge] = []
        var nextEdgeInLine: Edge
        var nextNode: Node
        var currentNode = nodeList.randomElement()
        nList.append(currentNode!)
        repeat{
            let bridges  = bridgeEdges(nList)
            let nextEdge = bridges.filter({ b in
                for element in bridges{
                    if element.weight < b.weight{
                        return false
                    }
                }
                return true
            })
            nextEdgeInLine = nextEdge.randomElement()!
            nextNode = (!nList.contains(nextEdgeInLine.n1)) ? nextEdgeInLine.n1 : nextEdgeInLine.n2
            eList.append(nextEdgeInLine)
            nList.append(nextNode)
            currentNode = nextNode
        }while nList.count < nodeList.count
        
        return Graph(nList, eList)
    }
}

func test(){
    let myGraph = Graph([(1, 2, 1), (1, 4, 3), (2, 5, 1), (2, 3, 6), (2, 4, 5), (3, 5, 5), (3, 6, 2), (4, 5, 1), (5, 6, 4)])
    print(myGraph.minimumSpanningTree().edgeList.map({($0.n1.identifier, $0.n2.identifier, $0.weight)}))
}

test()
