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
    
    func lookForIndex(_ n: node) -> Int?{
        for i in 0..<nodeList.count{
            if nodeList[i].identifier == n.identifier{
                return i
            }
        }
        return nil
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
    init(_ nl: [node]){
        self.nodeList = nl
    }
    func removeEdge(_ edge: (Int, Int)){
        lookFor(edge.0)?.connections.removeAll(where: {$0.identifier == edge.1})
        lookFor(edge.1)?.connections.removeAll(where: {$0.identifier == edge.0})
    }
    func addEdge(_ edge: (Int, Int), _ positionA: Int, _ positionB: Int){
        lookFor(edge.0)?.connections.insert(lookFor(edge.1)!, at: positionB)
        lookFor(edge.1)?.connections.insert(lookFor(edge.0)!, at: positionA)
    }
    func isEulerian() -> Bool{
        return nodeList.filter({$0.connections.count % 2 != 0}).isEmpty
    }
    func dfsCount(_ a: node, _ isVisited: inout [Bool]) -> Int{
        if isVisited.isEmpty{
            isVisited = nodeList.map({_ in false})
        }
        isVisited[lookForIndex(a)!] = true
        //print("IVList for \(a.identifier) is: \(isVisited)")
        var count = 1
        for i in a.connections{
            //print("The connections for \(a.identifier) are: \(a.connections.map({$0.identifier}))")
            if !isVisited[lookForIndex(i)!]{
                count = count + dfsCount(i, &isVisited)
            }
        }
        return count
    }
    func isValidNextEdge(_ a: node, _ b: node) -> Bool{
        if a.connections.count == 1{
            return true
        }
        var isVisited : [Bool] = []
        let count1 = dfsCount(a, &isVisited)
        //print("Count1 for \(a.identifier) (with b being \(b.identifier)) is: \(count1)")
        let aPositionInB = graph(b.connections).lookForIndex(a)
        let bPositionInA = graph(a.connections).lookForIndex(b)
        removeEdge((a.identifier, b.identifier))
        isVisited = []
        let count2 = dfsCount(a, &isVisited)
        //print("Count2 for \(a.identifier) (with b being \(b.identifier)) is: \(count2)")
        addEdge((a.identifier, b.identifier), aPositionInB!, bPositionInA!)
        return (count1 > count2) ? false : true
        
    }
    func EulerianTour(_ initial: node) -> [node]{
        var tour: [node] = []
        for i in 0..<initial.connections.count{
            if isValidNextEdge(initial, initial.connections[i]){
                tour.append(initial)
                tour.append(initial.connections[i])
                //print("Appended \(initial.identifier) and \(initial.connections[i].identifier)")
                let b = initial.connections[i]
                removeEdge((initial.identifier, initial.connections[i].identifier))
                return tour + EulerianTour(b)
            }
        }
        return tour
    }
    func EulerianTour() -> [node]?{
        if !isEulerian(){
            return nil
        }
        return EulerianTour(nodeList[0])
    }
    func isConnected() -> Bool{
        var iv: [Bool] = []
        for node in nodeList{
            if dfsCount(node, &iv) == nodeList.count{
                return true
            }
        }
        return false
    }
}

func test(){
    let myGraph1 = graph([(1, 2), (1, 3), (2, 4), (3, 4), (4, 5), (5, 6)])
    let myGraph2 = graph([(1, 2), (1, 3), (4, 5), (5, 6)])
    XCTAssertEqual(myGraph1.isConnected(), true)
    XCTAssertEqual(myGraph2.isConnected(), false)
}

test()
