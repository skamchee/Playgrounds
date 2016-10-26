//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

//In Swift, you don't need to chain initializers that all point to the designated initializer
//You can make a convenience initializer with the convenience keyword
struct Point
{
    var x = 0.0
    var y = 0.0
    
    let pointsPerPixel: Double
    
    init(x: Double, y: Double, pointsPerPixel: Double = 2.0, name: String)
    {
        self.x = x;
        self.y = y;
        self.pointsPerPixel = pointsPerPixel
    }
}

let p1 = Point.init(x:1, y:1, name:"myPoint")
let p2 = Point.init(x:1, y:1, pointsPerPixel:5.0, name:"myPoint")



struct Thing
{
    var x = 0.0
    var y = 0.0
    
    init(x: Double, y: Double)
    {
        self.x = x;
        self.y = y;
    }
}

//No default initializer since memberwise initializer is specified
//let t0 = Thing.init()




//a computed property. you can leave the get {} off
//var debugDescription: String {
//    return "\(firstName) \(lastName), +\(numberOfLikes)"
//}

//Use guard instead of if let to handle preconditions first
//public class Book
//{
//
//    public var author: Author?
//    public override var description: String{
//        guard let author = author else{
//            print("author is nil")
//            return ""
//        }
//
//        return "\(author.lastName)"
//    }
//}

//Use guard instead of if let to handle preconditions first
//public class Book
//{
//
//    public var author: Author?
//    public override var description: String{
//        guard let author = author where author.firstName != nil else{
//            print("author is nil")
//            return ""
//        }
//
//        return "\(author.lastName)"
//    }
//}


//Use guard instead of if let to handle preconditions first
//public class Book
//{
//
//    public var author: Author?
//    public override var description: String{
//        guard status = 0,
//            let author = author,
//            firstName = author.firstName else{
//            print("author is nil")
//            return ""
//        }
//
//        return "\(author.lastName)"
//    }
//}