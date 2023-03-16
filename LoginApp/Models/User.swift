//
//  user.swift
//  LoginApp
//
//  Created by Юрий Белов on 11.03.2023.
//

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUserData() -> User {
        User(
            login: "Kotya",
            password: "Kotya",
            person: Person.getPerson()
        )
    }
}

struct Person {
    let firstName: String
    let lastName: String
    let photo: String
    let userInfo: String
    
    var fullName: String {
        "\(firstName) \(lastName)"
    }
    
    
    static func getPerson() -> Person {
        Person(firstName: "Yuri",
               lastName: "Belov",
               photo: "Image",
               userInfo: "iOS Kotya Development"
        )
    }
}
