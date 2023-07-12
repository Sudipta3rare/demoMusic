//
//  SplashView.swift
//  demo
//
//  Created by 32 Technologies on 04/07/23.
//

import SwiftUI

struct SplashView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        NavigationView{ZStack(alignment: .bottom)  {
            if self.isActive {
                LoginView()
            } else {
                Image("bg1")
//                ZStack{
//                    NavigationLink(destination: LoginView(), label:{
//                        Button(action: {
//
//                        }, label: {
//                            Text("User Login")
//                                .font(.custom("Poppins", size: 22))
//                                .padding(.top, 10)
//                                .padding(.bottom, 10)
//                                .padding(.leading, 40)
//                                .padding(.trailing, 40)
//                        })
//                        .foregroundColor(.white)
//                        .background(
//                            LinearGradient(
//                                gradient: .init(colors: [Color(
//                                    hex: 0xff4749),
//                                                         Color(hex: 0x11232c)]),
//                                startPoint: .init(x: 0, y: -0.24),
//                                endPoint: .init(x: 0, y: 0.98)
//                            ))
//                        .clipShape(RoundedRectangle(cornerRadius: 15))
//                        .buttonStyle(DefaultButtonStyle())
//                    })
//
//                }
//                .frame(height: 350)
            }
        }
            
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                withAnimation {
                    print("value changed")
                    self.isActive = true
                }
            }
        }
        }
        
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
