import App

/// We have isolated all of our App's logic into
/// the App module because it makes our app
/// more testable.
///
/// In general, the executable portion of our App
/// shouldn't include much more code than is presented
/// here.
///
/// We simply initialize our Droplet, optionally
/// passing in values if necessary
/// Then, we pass it to our App's setup function
/// this should setup all the routes and special
/// features of our app
///
/// .run() runs the Droplet's commands, 
/// if no command is given, it will default to "serve"
//let config = try Config()
//try config.setup()
//
//let drop = try Droplet(config)
//try drop.setup()
//
//try drop.run()

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
drop.get("/view") { request in
    return try drop.view.make("view.html")
}
try drop.run()
