//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Kalabishka Ivan on 08.06.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var user: UserManager
    @StateObject private var timer = TimeCounter() // экземпляр класса
    //  обернуто в обертку stateObject
    
    var body: some View {
        VStack {
            Text("Hi, \(user.name)!") // берем данные с именем из окружения
                .font(.largeTitle)
                .offset(x: 0, y: 100)
            
            Text("\(timer.counter)")
                .font(.largeTitle)
                .offset(x: 0, y: 200)
            Spacer()
            ButtonView(timer: timer) // инициализируем таймер (Структура ButtonView)
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserManager()) // обязательный вызов модификатора   
    }
}


struct ButtonView: View {
    @ObservedObject var timer: TimeCounter // дочернее представление 
    
    var body: some View {
        Button(action: timer.startTimer) { // запускаем таймер при нажатии на кнопку Start 
            Text(timer.buttonTitle)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(Color.red)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 4)
        )
    }
}
