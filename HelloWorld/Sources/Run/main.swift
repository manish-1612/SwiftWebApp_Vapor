import App
import Vapor

let drop = try Droplet()

//IMPLEMENTING FREE TEXT
//drop.get("/") { request in
//    return "Hello World!"
//}

//IMPLEMENTING THE ROUTING
//drop.get("/name", ":name", "/age", ":age"){ request in
//
//    if let name = request.parameters["name"]?.string {
//        if let age = request.parameters["age"]?.int{
//            return "Hello \(name)...!! Your age is \(String(describing: age)).. GOOOD BYEE :)"
//        }else{
//            return "Unexpected parameter type"
//        }
//    }else{
//        return "name not recived"
//    }
//    //return "Error retrieving parameters"
//}

//IMPLEMENTING VIEW DISPLAY
//drop.get("/view") { request in
//    return try drop.view.make("view.html")
//}

//IMPLEMENTING SENDING JSON TO DISPLAY
//drop.get("/friends") { req in
//    return try JSON(node: ["friends": [["name": "Sarah", "age": 33],
//                                       ["name": "Steve", "age": 31],
//                                       ["name": "Drew", "age": 35]]
//        ])
//}


//IMPLEMENTING MODEL CREATION USING JSON
drop.get("/friends") { req in
    
    let friends = [Friend(name: "Sarah", age: 33, email:"sarah@email.com"),
                   Friend(name: "Steve", age: 31, email:"steve@email.com"),
                   Friend(name: "Drew", age: 35, email:"drew@email.com")]
    
}

try drop.run()
