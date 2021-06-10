//
//  TimeCounter.swift
//  StateAndDataFlow
//
//  Created by Kalabishka Ivan on 08.06.2021.
//

import Foundation
import Combine

class TimeCounter: ObservableObject { // каждую секунду отправляем обновленное состояние объекта в то окружение где оно нам понадобится
    let objectWillChange = PassthroughSubject<TimeCounter, Never>() // свойство протокола Combine. Это универсальный паблишер фреймворка Combine
//     Данный паблишер определяет какие-то данные и мы определяем какие. Используем его так как нам необходимо использовать несколько публичных свойств сразу 
//    <Нам нужно отправить сам класс TimeCounter, Never (здесь мы можем определять протокол error для обработки ошибок если работаем с сетью)> так как ошибок не будет, мы говорим Never
    
//    objectWillChange это паблишер (Издатель) благодаря этому свойству класс может уведомлять своих подписчиков (Экземпляры класса с оберткой StateObject об изменения о своем состоянии)
//    благодаря этому свойству весь класс может уведомлять своих подписчиков об изменении состояния
    
    var counter = 3
    var timer: Timer?
    var buttonTitle = "Start"
    
    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1, // интервал
                target: self, // тип в котором будет реализован метод который вызовем из параметра #selector (self - в этом же классе)
                selector: #selector(updateCounter), // сам метод обновляет наш счетчик каждую секунду
                userInfo: nil,
                repeats: true // повторять ли сам таймер?
            )
        }
        buttonDidTapped()

    }
    
    @objc private func updateCounter() { // пометка @objc так вызывается через селектор
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            buttonTitle = "Reset"
        }
        
        objectWillChange.send(self) // уведомляем подписчиков класса о том что состояние было изменено (Отправляем метод самого класса)
//        self так как в  PassthroughSubject<TimeCounter, Never>() оправляем сам класс TimeCounter
        
    }
    
    private func killTimer(){
        timer?.invalidate() // данный метод Останавливает таймер от повторного запуска и запрашивает его удаление из цикла запуска.
        timer = nil // обрываем связь таймера с памятью
    }
    
    private func buttonDidTapped(){
        if buttonTitle == "Reset" {
            counter = 3
            buttonTitle = "Start"
        } else {
            buttonTitle = "Wait..."
        }
        objectWillChange.send(self)
    }
}
