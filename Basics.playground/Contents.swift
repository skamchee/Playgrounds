//: Playground - noun: a place where people can play

import UIKit

//CONSTANTS
//=======================================
//Constants should be used as much as possible to avoid unnecessary mutation (no mutation == safety)
//The colon ':' can be interpreted as 'is of type'
let prevYear: Int = 2015
let year = 2015 //Can leave the type off because Swift can infer the input as Int
let conference = "WWDC"
print("Hello, \(conference)" + " \(year + 1)") //string interpolation

//VARIABLES
//=======================================
var names: [String] = ["Abby","Bob"]
var namesInferred = ["Abby","Bob"] //inferred as an array of string Int values
print(names)
names.append("Cory")
names[2] = "David"
print(names)
print(names[2])

//STRINGS
//=======================================
var stringA = "abc"
print(stringA)
stringA += "d"
print(stringA)

print("\(stringA.characters.count)")

//LOOPS
//=======================================
//Closed range (includes both numbers). Prints 1,2,3,4
for number in 1...4 {
    print(number)
}

//A range that excludes the last index. Prints 1,2,3
for index in 1..<4{
    print(index)
}

//Iterate on a dictionary
let ages = ["Bob":1, "Abby":20] //inferred as String keys and Int values
for(name,age) in ages{
    print("\(name) is \(age) years old")
}

//Looping with filter and map
//Filter takes a closure (similar to a block in objc) and runs the closure on every element in the collection.
//Map also takes a closure
let allNames = ["Abby","Benjamin"]
let shortNames = allNames.filter(){name in name.characters.count < 5 }.map{name in name.uppercaseString}
print(shortNames)


//SWITCH STATEMENTS
//=======================================
let age = 10
switch age {
case 1:
    print("Happy first birthday")
case 12...19:   //pattern matching over a range
    print("Happy birthday teenager")
case let decade where age % 10 == 0: //pattern matching with a predicate
    print("Happy significant \(decade)th birthday")
default:
    print("default")
}

let username = "admin"
let isValid = true
switch(username,isValid){
case("admin",true):
    print("admin")
case(_, let isValid): //
    print(isValid ? "Welcome" : "Denied")
}


//OPTIONALS
//=======================================
//Use the if let structure to handle the possibility the indexOf func will return nil
var moreNames: [String] = ["Abby","Bob"]
if let i = moreNames.indexOf("Carl"){
    print("Carl is at index \(i)")
}else{
    print ("Carl isn't in the array")
}



//Usage of optional ? in a function
func getLetter(string:String, at index:Int) -> Character?{
    if index < string.characters.count{
        let actualIndex = string.startIndex.advancedBy(index)
        return string[actualIndex]
    }
    return nil
}
var myColor: String = "RED"

//Uncommment, compiler will error because you did not address possibility the value could be nil
//print(getLetter(myColor, at:4).hashValue)

//Here, we addressed the posibility that the value could be nil
//Flip the at: value to a number larger than the size of the string
if let char = getLetter(myColor, at:1){ //use the if let structure to unwrap the value and use it if valid
    print(char.hashValue)
}else{
    print("There is no letter at the given index")
}






