//
//  StateAndDataFlowApp.swift
//  StateAndDataFlow
//
//  Created by Kalabishka Ivan on 08.06.2021.
//

import SwiftUI

@main
struct StateAndDataFlowApp: App {
    @StateObject private var user = UserManager() // первичный источник данных который мы используем во всем проекте 
    var body: some Scene {
        WindowGroup {
            StarterView() // отображаем стартовую страницу
                .environmentObject(user)
        }
    }
}
