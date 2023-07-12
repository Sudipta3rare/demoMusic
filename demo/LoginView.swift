//
//  LoginView.swift
//  demo
//
//  Created by 32 Technologies on 04/07/23.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var lvm = LoginViewModel()
    
    init() {
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Poppins-Regular", size: 12)!], for: .normal)
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().backgroundColor = UIColor(hexString: "#2e2e2e")
       }
    var body: some View {
        if (!lvm.authenticated && lvm.isLoginViewActive){
                
                    
                        ZStack(alignment:.bottom){
                        Image("06").frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        VStack(alignment: HorizontalAlignment.leading){
                            Text("Welcome!").foregroundColor(.white).fontWeight(.bold)
                                .font(.custom("Righteous", size: 25))
                            VStack
                            {
                                TextField("Email", text: $lvm.username)
                                    .padding()
                                    .textInputAutocapitalization(.never)
                                    .font(.custom("Poppins-Regular", size: 15))
                                
                                SecureField("Password", text: $lvm.password)
                                    .font(.custom("Poppins-Regular", size: 15))
                                    .padding(.leading)
                                    .padding(.trailing)
                                Button("Forgot Password?"){}
                                    .frame(alignment: .leading)
                                    .font(.custom("Poppins-Italic", size: 15))
                                    .foregroundColor(Color(hex: 0x848484))
                                Spacer().frame(height: 110)
                                Button {
                                    print("Button pressed")
                                    lvm.authenticate()
                                } label: {
                                    Text("Login").font(.custom("Poppins-Regular", size: 18))
                                        .padding(.horizontal, 100)
                                    
                                        .padding(.vertical, 20)
                                    
                                        .foregroundColor(.white)
                                    
                                    
                                }.background(Color(hex: 0xa8222b))
                                    .cornerRadius(26)
                               
                                    HStack {
                                        Text("Don't have an Account?")
                                            .font(.custom("Poppins-Italic",size: 15,relativeTo: .body))
                                            .italic()
                                            .foregroundColor(Color(hex: 0x848484))
                                       
                                        Button{
                                            lvm.isLoginViewActive = false
                                        }label:{
                                            Text("Register")
                                                
                                                .font(.custom("Poppins-Bold", size: 15))
                                               
                                                .foregroundColor(Color(hex:  0xa8222b))
                                        }
                                                
                                    
                                    }
                                
                                
                            }
                            .frame(
                            height: 430)
                            .background()
                                .cornerRadius(30)
                            
                            
                        }
                        
                        .padding(.trailing)
                        .padding(.leading)
                        .padding(.bottom , 100).frame(height: 550).textFieldStyle(OvalTextFieldStyle())
                        
                      
                        }
                    
                
            }
        else {
            if !lvm.isLoginViewActive {
                SignupView()
            }
               else {
                    TabNavigationView().transition(.offset(x:0, y:850))
                }
                
            }
        }
        
      
    
}
struct OvalTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(height: 40)
            .padding(10)
            .background(Color(hex: 0xeeeeee))
            .cornerRadius(26)
          
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
