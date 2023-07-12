//
//  SettingsView.swift
//  demo
//
//  Created by 32 Technologies on 12/07/23.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Image("bg10").resizable().ignoresSafeArea(.all)
            ScrollView{
                HStack {
                    Button{
                        self.presentationMode.wrappedValue.dismiss()
                    }
                label:{Image(systemName: "arrow.backward.circle.fill").foregroundStyle(.white,Color(hex: 0xbd3c40)).font(.system(size: 35)).padding(.trailing)
                }
                    Text("Settings").font(.custom("Righteous", size: 20))
                    Spacer()
                }
                Section(header: Text("Free Account").font(.custom("Poppins-Regular", size: 18)))
                {
                    HStack{
                        Text("Y")
                            .font(.custom("Poppins-Regular", size: 20))
                            .padding()
                            .background(Color(hex: 0xbd3c40))
                            .clipShape(Circle())
                            .foregroundColor(.white)
                        VStack (alignment: .leading){
                            Text("Profile name").font(.custom("Poppins-Regular", size: 18))
                            Text("View Profile").font(.custom("Poppins-Regular", size: 12)).opacity(0.8)
                        }
                    
                        Spacer()
                    }
                    HStack{
                        VStack{
                            Text("Account").padding(.vertical)
                            Text("Account")
                            
                        }
                        Spacer()
                    }
                }.padding()
                
                
            }.foregroundColor(.white).padding(.horizontal)
                
        }.navigationBarBackButtonHidden(true)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
