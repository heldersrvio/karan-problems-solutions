import Foundation

func taxedPrice(_ cost: Double, _ tax: Double){
    print("The tax is \(tax) and the total cost is \(cost * (1 + tax)).")
}

taxedPrice(20.0, 0.05)
