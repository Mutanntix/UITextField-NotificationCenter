//
//  User.swift
//  Lesson13_2
//
//  Created by Мурад Чеерчиев on 30.06.2022.
//

import Foundation
import UIKit

class User {
    static func getBirdateString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yy"
        let str = dateFormatter.string(from: date)
        
        return str
    }
    
    let login: String
    let nickname: String
    private var password: String
    var birhdate: String
    
    init?(login: String, nickname: String,
         password: String, birhdate: String) {
        guard !login.isEmpty && !nickname.isEmpty
                && !password.isEmpty && !birhdate.isEmpty
        else { return nil }
        
        self.login = login
        self.password = password
        self.nickname = nickname
        self.birhdate = birhdate
    }
    
    func getPassword() -> String {
        let resultPass =  password.reduce(into: String()) {
            partialResult, _ in
            partialResult.append("*")
        }
        
        return resultPass
    }
}
