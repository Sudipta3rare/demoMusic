//
//  Login-Signup ViewModel.swift
//  demo
//
//  Created by 32 Technologies on 07/07/23.
//

import Foundation

import SwiftUI

 let signInUrl = "http://localhost:8080/auth/signin"
let signUpUrl = "http://localhost:8080/auth/signup"

    class LoginViewModel: ObservableObject{
        @AppStorage("LoginActive") var isLoginViewActive : Bool = true
        @Published var validMessage : Bool = true{
            willSet{
                ObjectWillChangePublisher().send()
            }
        }
    @AppStorage("AUTH_KEY")  var authenticated = false{
            willSet{ objectWillChange.send()}}
        @AppStorage("USER_KEY",  store: .standard) var accessToken = ""
        @Published var password : String = ""
        @Published var user: String = ""
        @Published var invalid: Bool = false{
            willSet{
                ObjectWillChangePublisher().send()
            }
        }
        
        @Published var userResponse : Int = 400{
            willSet{
                ObjectWillChangePublisher().send()
            }
        }
        
        func loginPost(){
            guard let url = URL(string: signInUrl) else {return }
            let body : [String: Any] = ["email": user , "password" : password]
            print(user)
            print(password)
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
                        DispatchQueue.main.async {
                            // Call UIKit methods here
                            self.authenticate(token : result.accessToken)
                        }
                       
                    }
                    else{
                        DispatchQueue.main.async {
                            // Call UIKit methods here
                            self.authenticated = false
                            self.validMessage = false
                        }
                        
                        print("No data")
                    }
                }
                catch(let error){
                    self.validMessage = false
                    print(error.localizedDescription)
                }
            }.resume()
            
        }
        
        
        
        func signUpPost(emailAddress: String, fullName: String, phoneNumber: String, pass: String){
            guard let url = URL(string: signUpUrl) else {return }
            
            let body : [String: Any] = ["email": emailAddress , "password" : pass, "name": fullName, "mobileNumber" : phoneNumber]
            
            print(body)
            
            let finalData = try! JSONSerialization.data(withJSONObject: body )
            print(finalData)
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.httpBody = finalData
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            print("request made")
            URLSession.shared.dataTask(with: request){ ( data , res , err) in
                do{
                    if let data = data, let response = res as? HTTPURLResponse {
                        print(response.statusCode)
//                        let result = try JSONDecoder().decode(SignUpResponse.self, from: data)
                        
//                        print(result.signUp)
                        self.userResponse = (response.statusCode)
                        
                        
                    }
                    else{
                        print("No data")
                    }
                }
//                catch(let error){
//
//                    print(error.localizedDescription)
//                }
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
            accessToken = token
            if (accessToken != ""){
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
        
        func checkUserCreated(statusCode: Int) -> Bool{
            
            if(statusCode == 403){
                return true
            }
            else if(statusCode == 200){
                return false
            }
            return false
        }
        
        func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
            let phoneNumberRegex = "^[0-9]{10}$"
            let phoneNumberTest = NSPredicate(format: "SELF MATCHES %@", phoneNumberRegex)
            return phoneNumberTest.evaluate(with: phoneNumber)
        }

        func isValidEmail(_ email: String) -> Bool {
            let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
            return emailTest.evaluate(with: email)
        }
        
    }
    





struct LoginResponse: Decodable {
    let email: String
    let accessToken: String
}
