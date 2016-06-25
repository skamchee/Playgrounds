//: Playground - noun: a place where people can play

import UIKit

//FUNCTIONS
//=======================================
//Declaring and calling a simple function that takes two Int values and returns an Int
func add(x:Int, y:Int) -> Int{
    return x+y
}
print(add(1, y: 2))


//Passing a value which can be mutated within the scope of the function, but will be visible outside of the scope of the function
//Try omitting the inout keyword. The compiler will error to clarify that your intent was not to allow mutation of the passed in value
func changeValue(inout x:Int){
    x += 2
}
var j = 10
changeValue(&j)
print(j)

//Another function
func ascend(s1: String, s2: String) -> Bool {
    return s1 > s2
}
let stringcmp = ascend("swift", s2: "great")
print(stringcmp)

//The return type of this func is '-> Void' which can be left off
//'to' is the external parameter name. 'recipient' is the internal parameter name
//External and internal parameter names were chosen to make the function more readable in different contexts
//_ denotes the parameter name can be omitted when calling the function
func sendMessage(message: String, to recipient:String, shouting: Bool = true){
    let message = "\(message) \(recipient)"
    if shouting{
        print(message)
    }
}
sendMessage("Hey There", to: "Morgan")

//The parameters + return type together are called the function type. Functions are first class types in Swift.
//(String, [String]) -> String? is the function type
func firstString(havingPrefix prefix: String, in strings:[String]) -> String?{
    for string in strings{
        if string.hasPrefix(prefix){
            return string
        }
    }
    return nil
}
firstString(havingPrefix: "desc", in: ["ascend","descend"])

//Filtering numbers + passing in a function divisibleByTwo as a parameter. divisibleByTwo has a function type (Int)->Bool
func filterInts(numbers: [Int], _includeNumber: (Int)->Bool) -> [Int]{
    var result: [Int] = []
    for number in numbers {
        if _includeNumber(number){
            result.append(number)
        }
    }
    return result
}
func divisibleByTwo(number:Int) -> Bool {
    return number % 2 == 0
}
let numbers = [4,17]
let evenNumbers = filterInts(numbers, _includeNumber: divisibleByTwo)
print(evenNumbers)

//CLOSURES
//=======================================
//Functions are actually a special case of closures. We can define the divisibleByTwo function as a closure instead
//full closure syntax
//{ (parameters) -> returnType in
//    statements
//}
let evenNumbers2 = filterInts(numbers, _includeNumber: { (number:Int) -> Bool in return number % 2 == 0 })
print(evenNumbers2)

//implicit arguments in closures
let evenNumbers3 = filterInts(numbers, _includeNumber: { $0 % 2 == 0 })
print(evenNumbers3)

//trailing closures
let evenNumbers4 = filterInts(numbers) { $0 % 2 == 0 }
print(evenNumbers4)

//Saving closure to a variable
let sum = { (a:Int, b:Int) -> Int in return a+b }
var theSum = sum(3,4);
print(theSum)

//What if we also want to filter strings? We don't want to copy filterInts. Instead, write a generalized function
//Generic filter function where Type can be any type.
func filter<Type>(source: [Type], _includeType: (Type)->Bool) -> [Type]{
    var result: [Type] = []
    for type in source {
        if _includeType(type){
            result.append(type)
        }
    }
    return result
}

//Using the generic filter function defined above on two different types: [Int] and [String]
let evenNumbers5 = filter(numbers) { $0 % 2 == 0 }
print(evenNumbers5)

let myNames = ["Abby","Benjamin"]
let shortNames2 = filter(myNames) { $0.characters.count < 5 }
print(shortNames2)
