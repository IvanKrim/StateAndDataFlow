//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Kalabishka Ivan on 08.06.2021.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = "" // элемент интерфейса с которым взаимодействует пользователь
    @EnvironmentObject var user: UserManager // окружение из которого мы берем данные
    
    var body: some View {
        VStack {
            TextField("Enter your name", text: $name)
                .multilineTextAlignment(.center)
            Button(action: registerUser) { // кнопка по которой мы переходим на основной экран
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
            }
        }
    }
    private func registerUser(){ // действия для кнопки
        if !name.isEmpty {
            user.name = name //используем эти данные 
            user.isRegister.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
