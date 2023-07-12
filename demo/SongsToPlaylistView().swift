//
//  SongsToPlaylistView().swift
//  demo
//
//  Created by 32 Technologies on 12/07/23.
//

import SwiftUI

struct SongsToPlaylistView: View {
    @StateObject var lvm = LibraryViewModel()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var addPlaylistInto: Bool = false
    
    
    var headerLogo: some View{
        Image("logo01").resizable().aspectRatio(contentMode: .fit).frame(height: 50).frame(maxHeight: .infinity, alignment: .top)
    }
    
    var headingBack: some View{
        ScrollView(.horizontal) {
            HStack {
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left.circle.fill").font(.system(size: 35)).foregroundStyle(.white, Color(hex: 0xbd3c40)).transition(.offset(x:0, y:850))
                }.frame(maxHeight: .infinity, alignment: .top).padding(.vertical)
                
               Spacer()
            }.padding(.horizontal)
        }.padding(.horizontal)
    }
    
    var showAddSongs:some View{
        VStack{if(!addPlaylistInto){
            VStack{
                Text("Lets start building your playlist").font(.custom("Righteous", size: 30)).multilineTextAlignment(.center)
                Button{
                    addPlaylistInto.toggle()
                }label:
                {
                    Text("Add to this playlist").padding(.horizontal,40)
                        .padding(.vertical,15).font(.custom("Poppins-Regular", size: 20)).background(Color(hex: 0xbd3c40)).cornerRadius(36)
                }
            }.foregroundColor(.white).padding()
        }
        
            else{
              
                    ForEach(lvm.libraryList, id: \.id){
                        l in
                        HStack{
                            circularImageSml(imgName: l.imgName)
                            VStack(alignment: .leading){
                                Text(l.name).font(.custom("Poppins-Regular", size: 17))
                                Text(l.description).font(.custom("Poppins-Regular", size: 12)).opacity(0.6)
                            }.padding(10)
                        Spacer()
                        }.foregroundColor(.white).padding(.horizontal)
                    }
                
            }
        }
    }
    
    var showRecomended: some View{
        HStack {
            VStack(alignment: .leading){
                Text(
                    "Recomended Songs")
                .font(.custom("Poppins-Regular", size: 30))
                Text("Based on the name of the playlist")
                
                ForEach(lvm.libraryList, id: \.id){
                    l in
                    HStack{
                        circularImageSml(imgName: l.imgName)
                        VStack(alignment: .leading){
                            Text(l.name).font(.custom("Poppins-Regular", size: 17))
                            Text(l.description).font(.custom("Poppins-Regular", size: 12)).opacity(0.6)
                        }.padding(10)
                    }
                }
                
            }.foregroundColor(.white)
        Spacer()
        }.padding(.horizontal)
    }
    
    var body: some View {
        ZStack(alignment: .leading){
            Image("bg08").resizable().ignoresSafeArea(.all)
            ScrollView{
                headingBack
                HStack(spacing: 20){
                    VStack (alignment: .leading){
                        Text("My Playlist #4").font(.custom("Righteous", size: 36)).foregroundColor(.white)
                        HStack{Text("Y")
                                .font(.custom("Poppins-Regular", size: 12))
                                .frame(width: 25, height: 25)
                                .background(Color(hex: 0xbd3c40))
                                .clipShape(Circle())
                            Text("My Library").font(.custom("Poppins-Regular", size: 16))
                            Spacer()}
                        HStack{
                            Image(systemName: "globe")
                            Text("Omin")
                        }.padding(.vertical,10)
                        HStack{
                            Image(systemName: "person.badge.plus.fill")
                            
                            optionButton
                        }
                    }
                    Spacer()
                    
                }.foregroundColor(.white).padding()
            
                showAddSongs
                showRecomended
            }
        }.navigationBarHidden(true)
    }
}



struct SongsToPlaylistView___Previews: PreviewProvider {
    static var previews: some View {
        SongsToPlaylistView()
        
    }
}
