//
//  AlbumDetailsView.swift
//  demo
//
//  Created by 32 Technologies on 14/07/23.
//

import SwiftUI

struct AlbumDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var headingBack: some View{
       
            HStack {
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left.circle.fill").font(.system(size: 35)).foregroundStyle(.white, Color(hex: 0xbd3c40)).transition(.offset(x:0, y:850))
                }.frame(maxHeight: .infinity, alignment: .top).padding(.vertical)
                Spacer()
                optionButton
            }.padding(.horizontal)
    }
    var body: some View {
        ZStack(alignment: .bottom){
            Image("bg12").resizable().ignoresSafeArea(.all)
            ScrollView(.vertical,showsIndicators: false) {
                headingBack
                VStack (alignment: .leading){
                    HStack{
                        Image("m01").resizable().frame(width: 120, height: 120).cornerRadius(20)
                        VStack (alignment: .leading){
                            Text("Sprinters").font(.custom("Poppins-Regular", size: 18))
                            Text("Dave,Central lee").font(.custom("Poppins-Italic", size: 12))
                        }
                        Spacer()
                    }
                    Text("Song Credits").fontWeight(.bold).font(.custom("Poppins-Regular", size: 17))
                    redTextButton(title: "Producer")
                    Text("Name 01")
                    Text("Name 02")
                    Text("Name 03")
                    Text("Name 04")
                    redTextButton(title: "Composer")
                    Text("Name 01")
                    Text("Name 02")
                    
                }.padding(.horizontal)
                
                HStack {
                    VStack(alignment: .leading) {
                        redTextButton(title: "Lyricist")
                        Text("Name 01")
                        Text("Name 02")
                        redTextButton(title: "Associated Performer")
                        Text("Name 01")
                        
                        redTextButton(title: "Studio Personnel")
                        Text("Name 01")
                        
                        redTextButton(title: "Vocals")
                        Text("Name 01")
                    }
                Spacer()
                }.padding(.horizontal)
              
               
                
                
                
            }.font(.custom("Poppins-Regular", size: 12)).foregroundColor(.white).padding(.horizontal)
        }.navigationBarBackButtonHidden()
    }
}

struct redTextButton: View{
    var title: String
    var body: some View{
        Text(title).padding(.horizontal).padding(.vertical,5).font(.custom("Poppins-Regular", size: 12)).foregroundColor(.white).background(Color(hex: 0xa8222b)).cornerRadius(10).padding(.top)
    }
}

struct AlbumDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailsView()
    }
}
