//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Kalabishka Ivan on 08.06.2021.
//

import SwiftUI

struct TimerView: View {
    
    @EnvironmentObject var userManager: UserManager
    @StateObject private var timer = TimeCounter() // экземпляр класса
    //  обернуто в обертку stateObject
    
    var body: some View {
        VStack {
            Text("Hi, \(userManager.user.name)!") // берем данные с именем из окружения
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            
            Spacer()
            
            VStack {
                Spacer()
                
                ButtonView(title: timer.buttonTitle, color: .red) {
                    timer.startTimer()
                }
                
                Spacer()
                
                ButtonView(title: "LogOut", color: .blue) {
                    DataManager.shared.clear(userManager: userManager)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(UserManager()) // обязательный вызов модификатора   
    }
}



