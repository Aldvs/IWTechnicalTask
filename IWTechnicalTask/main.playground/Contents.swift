import Cocoa

//MARK: - Задание 1

var arrayOfNums = [1,2,3,4,5]

func getReverseArr(from incomingArray: [Int]) -> [Int] {
    var resultArray = incomingArray
    let count = resultArray.count
    
    var temp: Int
    var i = 0
    
    repeat {
        temp = resultArray[i]
        resultArray[i] = resultArray[count - i - 1]
        resultArray[count - i - 1] = temp
        
        i += 1
        
    } while i < (count / 2)
    
    return resultArray
}

var testArray = getReverseArr(from: arrayOfNums)
print(testArray)



