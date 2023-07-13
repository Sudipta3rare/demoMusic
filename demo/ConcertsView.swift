//
//  ConcertsView.swift
//  demo
//
//  Created by 32 Technologies on 13/07/23.
//

import SwiftUI

struct ConcertsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {

        ZStack{
            Image("bg11").resizable().ignoresSafeArea()
            ScrollView{
                HStack {
                    Button{
                        self.presentationMode.wrappedValue.dismiss()
                    }
                label:{Image(systemName: "arrow.backward.circle.fill").foregroundStyle(.white,Color(hex: 0xbd3c40)).font(.system(size: 35)).padding(.trailing)
                }
                    Text("Jimi Hendrix").font(.custom("Righteous", size: 20))
                    Spacer()
                }
                
                Text("Lorem ipsum").multilineTextAlignment(.center).font(.custom("Poppins-Regular", size: 20)).padding()
                Text("Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor").multilineTextAlignment(.center).font(.custom("Poppins-Regular", size: 12))
                
                Button{
                    print("Change Location")
                }label: {
                    Text("Change Location").padding(.horizontal,30).padding(.vertical,15).font(.custom("Poppins-Regular", size: 20)).overlay(
                        RoundedRectangle(cornerRadius: 25)
                            .inset(by: 1) // inset value should be same as lineWidth in .stroke
                            .stroke(.white, lineWidth: 1)
                    )
                }.frame(alignment: .center).padding(.vertical)
            
                Section(header: HStack {
                    Text("Other Locations").font(.custom("Poppins-Bold", size: 20))
                    Spacer()
                }.padding(.vertical))
                {
                    VStack {
                        HStack{
                            VStack{
                                Text("Jul")
                                Text("25")
                            }.frame(width: 60, height: 60).background(Color(hex: 0x363636))
                            Text("Jimi Hendrix")
                            Spacer()
                        }.font(.custom("Poppins-Regular", size: 20))
                    }
                    HStack{
                            VStack{
                                Text("Jul")
                                Text("25")
                            }.frame(width: 60, height: 60).background(Color(hex: 0x363636))
                            Text("Jimi Hendrix")
                            Spacer()
                    }.font(.custom("Poppins-Regular", size: 20)).padding(.vertical)
                    
                HStack{
                            VStack{
                                Text("Jul")
                                Text("25")
                            }.frame(width: 60, height: 60).background(Color(hex: 0x363636))
                            Text("Jimi Hendrix")
                            Spacer()
                        }.font(.custom("Poppins-Regular", size: 20))
                    }
                
            
            }.foregroundColor(.white).padding(.horizontal).padding(.horizontal)
        }.navigationBarBackButtonHidden()
    }
}

struct ConcertsView_Previews: PreviewProvider {
    static var previews: some View {
        ConcertsView()
    }
}
