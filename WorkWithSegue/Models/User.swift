//
//  User.swift
//  WorkWithSegue
//
//  Created by Глеб Mr on 31.08.2021.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(login: "admin", password: "12345", person: Person.getPersonData())
    }
}

struct Person {
    let name: String
    let lastname: String
    let description: String
    let hobbies: [String]
    
    var fullName: String {
        "\(name) \(lastname)"
    }
    
    static func getPersonData() -> Person {
        Person(
            name: "Satoshi",
            lastname: "Nakamoto",
            description: """
                Nakamoto is important to the bitcoin ecosystem beyond his status as a founder.
                He is a philosophical figurehead of sorts and frequently invoked among
                cryptocurrency proponents debating the future of bitcoin's development.
            """,
            hobbies: ["Cryptocurrency" ,"Bitcoin"]
        )
    }
}
