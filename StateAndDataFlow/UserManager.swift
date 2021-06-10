//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Kalabishka Ivan on 08.06.2021.
//

import Combine

class UserManager: ObservableObject { // реализация синглтона аналог objectWillChange в TimeCounter
    @Published var isRegister = false // но так как нам необходимо отслеживать всего одно логическое свойство мы используем @Published
    var name = ""
}
