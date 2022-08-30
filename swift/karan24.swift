import Foundation
import XCTest

func merge(_ arr1: [Int], _ arr2: [Int]) -> [Int]{
    var buffer1 = arr1
    var buffer2 = arr2
    var resultArray: [Int] = []
    while !(buffer1.isEmpty || buffer2.isEmpty){
        if buffer1[0] > buffer2[0]{
            resultArray.append(buffer2[0])
            buffer2.remove(at: 0)
        }else{
            resultArray.append(buffer1[0])
            buffer1.remove(at: 0)
        }
    }
    if !buffer1.isEmpty{
        return resultArray + buffer1
    }else if !buffer2.isEmpty{
        return resultArray + buffer2
    }else{
        return resultArray
    }
}

func mergeSort(_ arr: [Int]) -> [Int]{
    if arr.count == 2{
        if arr[0] <= arr[1]{
            return arr
        }else{
            return [arr[1], arr[0]]
        }
    }
    let firstHalf = mergeSort(Array(arr[0...arr.count / 2 - 1]))
    let secondHalf = mergeSort(Array(arr[arr.count / 2...arr.count - 1]))
    return merge(firstHalf, secondHalf)
    
}

func bubbleSort(_ arr: [Int]) -> [Int]{
    if arr.count == 1{
        return arr
    }
    var bufferArray = arr
    for index in 0..<bufferArray.count{
        if index < bufferArray.count - 1 && bufferArray[index] > bufferArray[index + 1]{
            let bufferVar = bufferArray[index + 1]
            bufferArray[index + 1] = bufferArray[index]
            bufferArray[index] = bufferVar
        }
    }
    return bubbleSort(Array(bufferArray[0..<bufferArray.count - 1])) + [bufferArray[bufferArray.count - 1]]
}

func test(){
    XCTAssertEqual(mergeSort([6, 5, 3, 1, 8, 7, 2, 4]), [1, 2, 3, 4, 5, 6, 7, 8])
    XCTAssertEqual(bubbleSort([6, 5, 3, 1, 8, 7, 2, 4]), [1, 2, 3, 4, 5, 6, 7, 8])
}

test()
