//: Playground - noun: a place where people can play

import UIKit

//ENUMERATIONS
//=======================================
//Use an enumeration when you have a list of values you know ahead of time
enum Alignment{
    case left
    case right
}
//Unlike in C, the enumeration does not start with a default value of 0. The case is a value in itself. Enumerations are full fledged types in Swift. The enumeration here has the explicitly defined type of Alignment
//Use enums instead of string constants to improve type safety

let textAlignment = Alignment.left
switch(textAlignment){
case .left:     print("left")
case .right:    print("right")
//no default case - since there is a finite set of enums
}
//Switches must be exhaustive at compile time. The compiler will error, so as not to miss cases.

//Raw values
//Prepopulated values of all the same type
//Raw values can be strings, characters, booleans, or any of the integer or floating-point number types. Each raw value must be unique within its enumeration declaration.
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}
print(ASCIIControlCharacter.Tab.rawValue)

enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars
}
print(Planet.Earth.rawValue)

enum CompassPoint: String{
    case North, South, East, West
}
print(CompassPoint.West.rawValue);

//Associated values
//Allows you to associate values of any type along with the case
enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}
var productBarcode = Barcode.UPCA(8, 85909, 51226, 3)
productBarcode = .QRCode("ABCDEFGHIJKLMNOP")
switch productBarcode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("UPC-A: \(numberSystem), \(manufacturer), \(product), \(check).")
case .QRCode(let productCode):
    print("QR code: \(productCode).")
}


//STRUCTS
//=======================================
struct Rectangle{
    var width:Int   //width is a stored property
    var height:Int
    var area:Int{  //area is a computed property
        return width * height
    }
    
    //member-wise initializer (i.e. the default init, which you don't need. Shown here for learning purposes)
    init(width:Int, height:Int){
        self.width = width
        self.height = height
    }
}

//Adding a computed property to Rectangle via an extension
extension Rectangle{
    var perimeter: Int{
        return width*2 + height*2
    }
}

let rect = Rectangle(width:4, height:5) //calls member-wise initializer (see above)
print(rect.area)
print(rect.perimeter)


//GENERIC TYPES
//=======================================
struct NamedArray<Element>{
    var name: String
    var items: [Element]
}

let primes = NamedArray(name: "Primes",items: [3,5,7,11])
print(primes.name)
print(primes.items)

let cities = NamedArray(name: "Cities",items: ["Chicago","NYC","London"])
print(cities.name)
print(cities.items)