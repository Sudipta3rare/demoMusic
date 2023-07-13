//
//  UserFavPlaylistView.swift
//  demo
//
//  Created by 32 Technologies on 13/07/23.
//

import SwiftUI

struct UserFavPlaylistView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
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
    
    var body: some View {
        ZStack{
            Image("bg08").resizable().ignoresSafeArea()
            ScrollView
            {
                headingBack
                HStack(spacing: 20){
                    VStack (alignment: .leading){
                        Text("Favorites").font(.custom("Righteous", size: 36)).foregroundColor(.white)
                        HStack{Text("Y")
                                .font(.custom("Poppins-Regular", size: 12))
                                .frame(width: 25, height: 25)
                                .background(Color(hex: 0xbd3c40))
                                .clipShape(Circle())
                            Text("User Name").font(.custom("Poppins-Regular", size: 16))
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
                addButtonList(list: songList,title:  "Playlist")
                addButtonList(list: albumList,title:  "Favorite Tracks")
                addButtonList(list: recommendedList,title:  "Album")
                addButtonCircle(list: favList, title: "Artist")
                addButtonCircle(list: songList, title: "My Mp3")
                addButtonList(list: recommendedList,title:  "Following")
                addButtonList(list: albumList,title:  "Followers")
            }
         
        }.navigationBarBackButtonHidden()
    }
}

struct addButtonList: View{
    var list : [SongListModel]
    var title: String
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false) {
            VStack (alignment: .leading){
                Text(title).font(.custom("Righteous", size: 20)).foregroundColor(.white)
                HStack (spacing: 15){
                    Button{}
                label: {
                    Image(systemName: "plus.app.fill").frame(width: 90, height: 90).foregroundStyle(.white, Color(hex: 0xbd3c40)).font(.system(size: 35)).background(Color(hex: 0xbd3c40)).cornerRadius(10)
            }
                    ForEach(list, id: \.id){
                        l in
                        Image(l.imgName).resizable().aspectRatio(contentMode: .fill).frame(width: 90, height: 90).cornerRadius(10)
                    }
                }
            }
        }.padding(.horizontal).padding(.bottom)
    }
}



struct addButtonCircle: View{
    var list : [SongListModel]
    var title: String
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false) {
            VStack (alignment: .leading){
                Text(title).font(.custom("Righteous", size: 20)).foregroundColor(.white)
                HStack(spacing:15) {
                    Button{}
                label: {
                    Image(systemName: "plus.app.fill").frame(width: 90, height: 90).foregroundStyle(.white, Color(hex: 0xbd3c40)).font(.system(size: 35)).background(Color(hex: 0xbd3c40)).cornerRadius(10).clipShape(Circle())
            }
                    
                    ForEach(list, id: \.id){
                        l in
                        Image(l.imgName).resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100).clipShape(Circle())
                    }
                }
            }
        }.padding(.horizontal).padding(.bottom)
    }
}

struct UserFavPlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        UserFavPlaylistView()
    }
}
