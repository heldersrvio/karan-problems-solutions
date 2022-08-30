import Foundation

func totalCost(_ w: Double, _ h: Double, _ c: Double) -> Double{
    return c * w * h
}

let costTile = 12.0
let width = 60.0
let height = 13.5

print(totalCost(width, height, costTile))
