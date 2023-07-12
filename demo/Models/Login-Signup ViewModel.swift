//
//  Login-Signup ViewModel.swift
//  demo
//
//  Created by 32 Technologies on 07/07/23.
//

import Foundation
import SwiftUI


    class LoginViewModel: ObservableObject{
        @AppStorage("LoginActive") var isLoginViewActive : Bool = true
    @AppStorage("AUTH_KEY")  var authenticated = false{
            willSet{ objectWillChange.send()}}
        @AppStorage("USER_KEY") var username = "user"
        @Published var password = "1234"
        @Published var invalid: Bool = false
        
        private var sampleUser = "user"
        private var samplePass = "1234"
        

        
        func toggleAuth() {
            self.password = ""
            withAnimation{
                authenticated.toggle()
                }
        }
        
        func authenticate(){
            guard   self.username.lowercased() == sampleUser else{
                self.invalid = true
                    return
            }
            guard self.password.lowercased() == samplePass else{
                self.invalid = true
                    return
            }
            toggleAuth()
        }
        func logout(){
           password = ""
            authenticated = false
        }
        func logPressed(){
            print("Button pressed")
        }
    }
    

