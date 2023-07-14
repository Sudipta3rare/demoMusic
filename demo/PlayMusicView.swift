//
//  PlayMusicView.swift
//  demo
//
//  Created by 32 Technologies on 14/07/23.
//

import SwiftUI

struct PlayMusicView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var headingBack: some View{
       
            HStack {
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left.circle.fill").font(.system(size: 35)).foregroundStyle(.white, Color(hex: 0xbd3c40)).transition(.offset(x:0, y:850))
                }.frame(maxHeight: .infinity, alignment: .top).padding(.vertical)
               Spacer()
                VStack {
                    Text("Playing from Playlist")
                    Text("Playlist Hits").bold()
                }.foregroundColor(.white).font(.custom("Poppins-Regular", size: 12))
                Spacer()
                optionButton
            }.padding(.horizontal)
    }
    var body: some View {
        
        ZStack(alignment: .leading){
            Image("bg12").resizable().ignoresSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false){
               headingBack
                Image("m03").resizable().aspectRatio(contentMode: .fill).frame(width: UIScreen.main.bounds.size.width/1.1, height: 250 ).cornerRadius(30).padding(.bottom)
                HStack {
                    VStack(alignment: .leading){
                        Text("Song Title").font(.custom("Righteous", size: 20))
                        Text("Lorem ipsum dolor sit amet eirmod.").font(.custom("Poppins-Regular", size: 12))
                    }
                Spacer()
                    
                    Image(systemName: "heart.fill")
                }.padding(.horizontal)
                ProgressView(value: 0.4)
                HStack{
                    Text("1:01")
                    Spacer()
                    Text("3:03")
                }.font(.custom("Poppins-Regular", size: 12))
                
                HStack{
                    Image(systemName: "shuffle").font(.system(size: 25))
                    Spacer()
                    Image(systemName: "chevron.backward.to.line")
                    Image(systemName: "play.circle.fill").font(.system(size: 70))
                    Image(systemName: "chevron.right.to.line")
                   
                    
                    Spacer()
                    Image("screeningIcon")
                }
                
                HStack{
                    Image(systemName: "airplayaudio")
                    Spacer()
                    Image(systemName: "info.circle")
                    Image("shareIcon").padding(.horizontal)
                    Image(systemName: "text.justify.left")
                    
                }
                
                VStack (alignment: .leading){
                    Text("Lorem ipsum dolor, \nsed diam nonumy eirmod tempor nvidunt").padding(.bottom,-40).bold()
                    Text(  "\nLabore et dolore magna aliquyam erat  \nSed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus ").foregroundColor(Color(hex: 0x0000))
                }
                .font(.custom("Poppins-Regular", size: 20)).padding(40).background(Color(hex: 0xa8222b)).cornerRadius(30).padding(.vertical,30)
                
                ZStack(alignment: .leading){
                    Image("m05").resizable().frame(width: UIScreen.main.bounds.size.width/1.1, height: 200).cornerRadius(20)
                    VStack(alignment: .leading){
                        Text("About the artist").bold()
                        Spacer()
                        HStack {
                            VStack {
                                Text("Artist Name")
                                Text("35,121,211 monthly listeners").italic()
                            }
                        Spacer()
                            Text("Follow").padding(.horizontal,40).padding(.vertical,10).font(.custom("Poppins-Regular", size: 12)).overlay(
                                RoundedRectangle(cornerRadius: 17)
                                    .inset(by: 1) // inset value should be same as lineWidth in .stroke
                                    .stroke(.white, lineWidth: 1)
                            )
                        }
                        
                    }.font(.custom("Poppins-Regular", size: 12)).padding()
                }
                
            }.foregroundColor(.white).padding(.horizontal)
            
            
        }.navigationBarBackButtonHidden()
    }
}

struct PlayMusicView_Previews: PreviewProvider {
    static var previews: some View {
        PlayMusicView()
    }
}
