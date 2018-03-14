//
//  Friend.swift
//  HelloWorldPackageDescription
//
//  Created by Manish Kumar on 05/03/18.
//

import Foundation
import Vapor
import FluentProvider
import HTTP

final class Friend : Model, RowRepresentable {
    
    var exists: Bool = false
    var id: Node?
    
    var name: String?
    var age: Int?
    var email: String?

    var storage = Storage()

    
    
    required init(row: Row) throws {
        name = try row.get("name")
        age = try row.get("age")
        email = try row.get("email")
    }


    init(name: String, age: Int, email: String) {
        self.name = name
        self.age = age
        self.email = email
    }

    
    func makeRow() throws -> Row {
        var row = Row()
        try row.set("name", name)
        try row.set("age", age)
        try row.set("email", email)
        
        return row
    }
}


extension Friend : Preparation{
    
    // Preparation
    static func prepare(_ database: Database) throws {
        try database.create(self) { friends in
            friends.id()
            friends.string("name")
            friends.int("age")
            friends.string("email")
        }
    }
    
    static func revert(_ database: Database) throws {
        try database.delete(self)
    }

}

extension Friend: JSONConvertible {
    convenience init(json: JSON) throws {
        try self.init(
            name: json.get("name"),
            age: json.get("age"),
            email: json.get("email")
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set(Friend.idKey, id)
        try json.set("name", name)
        try json.set("email", email)
        try json.set("age", age)
        return json
    }
    
}


extension Friend: NodeRepresentable {
    func makeNode(in context: Context) throws -> Node {
        var node = Node(context)
        try node.set("name", name)
        try node.set("age", age)
        try node.set("email", email)

        return node
    }
}


