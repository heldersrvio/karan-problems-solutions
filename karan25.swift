import Foundation
import XCTest

struct point: Equatable{
    var x: Double
    var y: Double
    
    init(_ x: Double, _ y: Double){
        self.x = x
        self.y = y
    }
    func distance(_ secondPoint: point) -> Double{
        return pow(pow(self.x - secondPoint.x, 2) + pow(self.y - secondPoint.y, 2), 0.5)
    }
}

func closestPair(_ points: [point]) -> (point, point){
    let pairs: [(point, point)] = points.enumerated().map({ n, p in
        var myPoints = (point(0, 0), point(0, 0))
        if n == points.count - 1{
            return (p, points[n - 1])
        }
        var x: Double = p.distance(points[n + 1])
        myPoints = (p, points[n + 1])
        if n + 2 <= points.count - 1{
            for i in n + 2...points.count - 1{
                if p.distance(points[i]) < x{
                    myPoints = (p, points[i])
                    x = p.distance(points[i])
                }
            }
        }
        return myPoints
    })
    return pairs.filter({ $0.0.distance($0.1) == pairs.map({ $0.0.distance($0.1) }).min()}).randomElement()!
}

func test(){
    XCTAssertEqual(closestPair([point(1.0, 2.0), point(10.0, 12.5), point(23.4, 50.0), point(94.0, 2.3), point(1.1, 2.1)]).0, (point(1.0, 2.0), point(1.1, 2.1)).0)
    XCTAssertEqual(closestPair([point(1.0, 2.0), point(10.0, 12.5), point(23.4, 50.0), point(94.0, 2.3), point(1.1, 2.1)]).1, (point(1.0, 2.0), point(1.1, 2.1)).1)
}
test()
