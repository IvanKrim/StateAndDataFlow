//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Kalabishka Ivan on 08.06.2021.
//

import Combine

class UserManager: ObservableObject { // реализация синглтона аналог objectWillChange в TimeCounter
    
    @Published var user = User() // так как нам необходимо следить за свойством isRegistered мы оборачиваем user в обертку Published
    
    var nameIsValid: Bool {
        user.name.count >= 3
    }
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}

struct User: Codable {
    var name = ""
    var isRegistered = false
}
