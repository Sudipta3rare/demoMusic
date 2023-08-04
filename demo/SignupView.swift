//
//  SignupView.swift
//  demo
//
//  Created by 32 Technologies on 04/07/23.
//

import SwiftUI

struct SignupView: View {
    @StateObject var lvm  = LoginViewModel()
    @State  var email = ""
    @State var pass = ""
    @State var mobile = ""
    @State var name = ""

    @State var showSheet : Bool = false
    @State var invalid : Bool = false
    var body: some View {
        
  
        if !lvm.isLoginViewActive {
            ZStack(alignment:.bottom){
                Image("06").frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                VStack(alignment: HorizontalAlignment.leading){
                    Text("Register").foregroundColor(.white).fontWeight(.bold)
                        .font(.custom("Righteous-Regular", size: 25))
                    VStack
                    {
                        TextField("Name", text: self.$name)
                            .padding(.horizontal)
                            .padding(.vertical , 5)
                            .font(.custom("Poppins-Regular", size: 15))
                        
                        TextField("Email", text: self.$email)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .padding(.horizontal)
                            .padding(.vertical , 5)
                            .font(.custom("Poppins-Regular", size: 15))
                        TextField("Phone", text: self.$mobile)
                            .font(.custom("Poppins-Regular", size: 15))
                            .padding(.horizontal)
                            .padding(.vertical , 5)
                        SecureField("Password", text: self.$pass)
                            .font(.custom("Poppins-Regular", size: 15))
                            .padding(.horizontal)
                            .padding(.vertical , 5)
                        HStack{
                            self.invalid ? Text("*Enter valid details") : Text("")
                        Spacer()
                        }.frame(alignment: .leading).foregroundColor(.red).padding(.horizontal)
                        Spacer().frame(height: 65)
                        Button {
                            
                            if(name != "" && pass.count>=6 && lvm.isValidPhoneNumber(mobile) && lvm.isValidEmail(email)){
                                self.invalid = false
                                lvm.signUpPost(emailAddress: self.email, fullName: self.name, phoneNumber: self.mobile, pass: self.pass)
                                print(lvm.userResponse)
                                showSheet.toggle()
                            }
                            
                           
                            else {
                                self.invalid = true
                            }
                            
                            
                            
                        } label: {
                            Text("Sign Up").font(.custom("Poppins-Regular", size: 18))
                                .padding(.horizontal, 100)
                            
                                .padding(.vertical, 20)
                            
                                .foregroundColor(.white)
                            
                            
                        }.background(Color(hex: 0xa8222b))
                            .cornerRadius(26)
                        
                        HStack {
                            Text("Already A Memeber ?").italic()
                                .font(.custom("Poppins-Italic", size: 15))
                                .foregroundColor(Color(hex: 0x848484))
                            Button("Sign in") {
                                // perform login
                                lvm.isLoginViewActive = true
                                print(lvm.isLoginViewActive)
                            }
                            .font(.custom("Poppins-Bold", size: 15))
                            .fontWeight(.bold)
                            .foregroundColor(Color(hex: 0xa8222b))
                        }
                        
                    }
                    .sheet(isPresented: $showSheet) {
                        lvm.checkUserCreated(statusCode: lvm.userResponse) ? Text("User Already Present").presentationDetents([.height(40)]).font(.custom("Poppins-Bold", size: 15)) : Text("User Created Successfully.").presentationDetents([.height(40)]).font(.custom("Poppins-Bold", size: 15))
                    }
                        
                    
                    .frame(
                        height: 550)
                    .background()
                    .cornerRadius(30)
                    
                    
                }
                
                .padding(.trailing)
                .padding(.leading)
                .padding(.bottom , 130).frame(height: 550).textFieldStyle(OvalTextFieldStyle())
            }
            } else {
                LoginView()
                
            }
        
      
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
