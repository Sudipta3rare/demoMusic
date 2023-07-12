//
//  Login-Signup ViewModel.swift
//  demo
//
//  Created by 32 Technologies on 07/07/23.
//

import Foundation

import SwiftUI

 let signInUrl = "http://localhost:8080/auth/signin"

    class LoginViewModel: ObservableObject{
        @AppStorage("LoginActive") var isLoginViewActive : Bool = true
        @Published var validMessage : Bool = true
    @AppStorage("AUTH_KEY")  var authenticated = false{
            willSet{ objectWillChange.send()}}
        @AppStorage("USER_KEY") var accessToken = "user"
        @Published var password : String = ""
        @Published var user: String = ""
        @Published var invalid: Bool = false
        
        
        
    
        
        func loginPost(){
            guard let url = URL(string: signInUrl) else {return }
            let body : [String: Any] = ["email": user , "password" : password]
            let finalData = try! JSONSerialization.data(withJSONObject: body )
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = finalData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         
            URLSession.shared.dataTask(with: request){(data, res, err)in
                do{
                    if let data = data{
                        let result = try JSONDecoder().decode(LoginResponse.self, from: data)
                        print(result.accessToken)
                        self.authenticate(token : result.accessToken)
                    }
                    else{
                        self.authenticated = false
                        self.validMessage = false
                        print("No data")
                    }
                }
                catch(let error){
                    self.validMessage = false
                    print(error.localizedDescription)
                }
            }.resume()
            
        }
        
        func toggleAuth() {
            self.password = ""
            withAnimation{
                validMessage = true
                authenticated.toggle()
                }
        }
        
        func authenticate(token : String){
            if (token != ""){
                toggleAuth()
            }
//            guard self.password.lowercased() == samplePass else{
//                self.invalid = true
//                    return
//            }
          
        }
        func logout(){
           password = ""
            validMessage = true
            authenticated = false
        }
        func logPressed(){
            print("Button pressed")
        }
    }
    



struct LoginResponse: Decodable {
    let email: String
    let accessToken: String
}
