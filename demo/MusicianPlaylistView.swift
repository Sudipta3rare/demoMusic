//
//  MusicianPlaylistView.swift
//  demo
//
//  Created by 32 Technologies on 10/07/23.
//

import SwiftUI

struct MusicianPlaylistView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isFollowed = false
//    @StateObject var mpm: MusicianPlaylistModel
    
    var headerLogo: some View{
        Image("logo01").resizable().aspectRatio(contentMode: .fit).frame(height: 50).padding(.horizontal).frame(maxHeight: .infinity, alignment: .top)
    }
    var subButttons: some View{
        HStack{
            
            Button {
                // Toggle Your isFollowed with true and false
                isFollowed.toggle()
            } label: {
                Text(isFollowed ? "Following" : "Follow")
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                
                    .font(.custom("Poppins-Regular", size: 13)).foregroundColor(isFollowed ? .black : .white)
                    .background(
                        ZStack {
                            RoundedRectangle(
                                cornerRadius: 20,
                                style: .continuous
                            )
                            
                            .fill(isFollowed ? .white : .clear)
                            RoundedRectangle(
                                cornerRadius: 20,
                                style: .continuous
                            )
                            .stroke(.white, lineWidth: 2)
                        }
                    )
            }
            optionButton.padding(.horizontal)
            Spacer()
            Image(systemName: "shuffle").foregroundColor(.white)
            Button{}label: {
                
                Image(systemName: "play.circle.fill").font(.system(size: 40)).foregroundColor(.red)
                
            }
            
        }.padding(.horizontal)
    }

    var body: some View {
        ZStack(alignment: .leading){
            Image("bg04").resizable().ignoresSafeArea(.all)
           
            ScrollView(showsIndicators: false){
                ZStack(alignment: .bottomLeading){
                    Image("header01").resizable().aspectRatio(contentMode: .fill).frame(height: 200)
                        .frame(maxWidth:UIScreen.main.bounds.size.width )
                    NavigationLink(destination: MusicianInfoView() , label: {
                        VStack{
                        Text("Jimi Hendrix").font(.custom("Righteous", size: 30))
                        Text("30,100,000 monthly listeners").font(.custom("Poppins-Regular", size: 12))
                    }})
                    .foregroundColor(.white)
                    //
                    .padding(.horizontal)
                    Button{
                        self.presentationMode.wrappedValue.dismiss()
                    }label:{ Image(systemName: "arrow.left.circle.fill").font(.system(size: 30)).foregroundStyle(.white,Color(hex: 0xa8222b)).frame(maxHeight: .infinity, alignment: .top).padding()}
                }
                subButttons
     
                    HStack {
                        VStack(alignment: .leading) {
                            Section(header: Text("Popular").font(.custom("Poppins-Regular", size: 18))) {
                                LazyVStack{
                                    ForEach(popularSongsPlaylist, id: \.id ){
                                        pl in songsListPopular(popularSong: pl)
                                    }
                                }.padding(.bottom)
                            }
                            Section(header:Text("Popular Release").font(.custom("Poppins-Regular", size: 18))){
                                VStack {
                                    LazyVStack{
                                        ForEach(popularAlbumsPlaylist, id: \.id ){
                                            pli in albumListPopular(popularAlbum: pli)
                                        }
                                    }
                                    Button{
                                        print("see discovery")
                                    }label: {
                                        Text("See Discovery").padding(.horizontal,40).padding(.vertical,10).font(.custom("Poppins-Regular", size: 12)).overlay(
                                            RoundedRectangle(cornerRadius: 17)
                                                .inset(by: 1) // inset value should be same as lineWidth in .stroke
                                                .stroke(.white, lineWidth: 1)
                                        )
                                    }.frame(alignment: .center).padding(.bottom)
                                }
                            }
                        
                            
                            Section(header: Text("Artist Songs").font(.custom("Poppins-Regular", size: 18))){
                                ScrollView(.horizontal,showsIndicators: false) {
                                    LazyHStack(spacing: 20){
                                        ForEach(albumList, id: \.id){
                                            lis in SongListTile(song: lis)
                                        }
                                    }
                                }.padding(.bottom)
                            }
                            
                            Section(header: Text("About").font(.custom("Poppins-Regular", size: 18))){
                                ZStack(alignment: .bottomLeading) {
                                    Image("header01").resizable().frame(height: 200)
                                    HStack(alignment: .lastTextBaseline){Text("3,71,70,493").font(.custom("Poppins-Regular", size: 20))
                                        Text("Monthly Listeners").font(.custom("Poppins-Regular", size: 12))
                                        Spacer()
                                        Image(systemName: "arrow.right.circle.fill").font(.system(size: 25))
                                    }.padding()
                                }.padding(.bottom)
                            }
                           
                            Section(header: Text("Fans Also Like").font(.custom("Poppins-Regular", size: 18))){
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing:20) {
                                        ForEach(songList, id: \.id){
                                            list in SongListTileCircle(song: list)
                                        }
                                    }
                                }
                            }.padding(.bottom)
                            
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    
                    
                    

        
            }
        }.navigationBarBackButtonHidden()
    }
}

struct albumListPopular : View{
    var popularAlbum : MusicianPlaylistModel
    var body: some View
    {
        HStack{
            Image(popularAlbum.imgName).resizable()
                .aspectRatio(contentMode: .fill).frame(width:90,height: 90).cornerRadius(10).overlay(
                    RoundedRectangle(cornerRadius: 10)
                     
                        .stroke(.white, lineWidth: 0.5)
                )
            VStack(alignment: .leading){
                Text(popularAlbum.name)
                Text(popularAlbum.descrption)
            }
            .font(.custom("Poppins-Regular", size: 13))
            .padding(.horizontal,10)
        Spacer()
        }
        
    }
}

struct songsListPopular : View{
    var popularSong: MusicianPlaylistModel
    var body : some View{
        HStack{
            Text("\(popularSong.id)").padding(.horizontal,10)
            circularImageSml(imgName: popularSong.imgName)
            VStack(alignment: .leading){
                Text(popularSong.name)
                Text(popularSong.descrption)
            }.padding(.horizontal,10)
            Spacer()
            optionButton
        }.font(.custom("Poppins-Regular", size: 12))
    }
}



struct MusicianPlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        MusicianPlaylistView()
    }
}
