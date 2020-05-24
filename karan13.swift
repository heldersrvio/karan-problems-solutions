import Foundation
import CoreLocation
import XCTest

let geoC = CLGeocoder()

var latA: Double = 0
var latB: Double = 0
var longA: Double = 0
var longB: Double = 0

func firstCoords(_ cityA: String, _ cityB: String){
    geoC.geocodeAddressString(cityA, completionHandler: {
        (placemarks, errorA) -> Void in
        if (errorA) != nil{
            print("Error", errorA!)
        }
        guard let coordinatesA = placemarks?.first?.location?.coordinate else{
            print("Place A not identified")
            return
        }
        do{
            latA = coordinatesA.latitude
            longA = coordinatesA.longitude
            secondCoords(cityA, cityB)
        }
        //print(coordinatesA.latitude)
        //print(coordinatesA.longitude)
    })
}

func secondCoords(_ cityA: String, _ cityB: String){
    geoC.geocodeAddressString(cityB, completionHandler: {
        (placemarks, errorB) -> Void in
        if (errorB) != nil{
            print("Error", errorB!)
        }
        guard let coordinatesB = placemarks?.first?.location?.coordinate else{
            print("Place B not identified")
            return
        }
        do{
            latB = coordinatesB.latitude
            longB = coordinatesB.longitude
            distance(cityA, cityB)
        }
        //print(coordinatesB.latitude)
        //print(coordinatesB.longitude)
    })
}

func distance(_ cityA: String, _ cityB: String){
    
    let coordinateA = CLLocation(latitude: latA, longitude: longA)
    let coordinateB = CLLocation(latitude: latB, longitude: longB)
    
    print("The distance between \(cityA) and \(cityB) is \(round(coordinateA.distance(from: coordinateB)) / 1000) km")
    
}
firstCoords("San Francisco", "Paris")
