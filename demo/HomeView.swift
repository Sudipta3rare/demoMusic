//
//  HomeView.swift
//  demo
//
//  Created by 32 Technologies on 05/07/23.
//

import SwiftUI
import Foundation


struct songHList: View {
    var title : String
    var lists : [SongListModelElement]
    var body: some View{
        ScrollView(.horizontal,showsIndicators: false){
            Text(title).font(.custom("Righteous", size: 18)).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
            LazyHStack(spacing: 20){

                ForEach(Array(lists.enumerated()), id: \.element) { index, list in
                    NavigationLink(destination:PlayMusicView(songList: lists, songIndex: index)){
                    
                    
                            VStack(alignment: .center){
                                AsyncImage(
                                    url: URL(string: baseUrl+"\(list.imgURL)"),
                                    content: { image in
                                        image.resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: 200, maxHeight: 100).cornerRadius(10)
                                    },
                                    placeholder: {
                                        Text("Loading").foregroundColor(.white)
                                    }
                                )
                               
                                
                                Text(list.name).font(.custom("Poppins-Regular", size: 12)).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
                            }
                        
                    }
                }
            }
        }.padding(.leading) .padding(.vertical,10)
    }
}
struct songHAlbumList: View {
    var title : String
    var lists : [AlbumListModelElement]
    var body: some View{
        ScrollView(.horizontal,showsIndicators: false){
            Text(title).font(.custom("Righteous", size: 18)).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
            HStack(spacing: 20){

                ForEach(lists) { list in
                    SongListAlbumTile(song: list)
                }
            }
        }.padding(.leading) .padding(.vertical,10)
    }
}


struct songHListCircle: View {
    var title : String
    var lists : [ArtistListModelElement]
    var body: some View{
        ScrollView(.horizontal,showsIndicators: false ) {
            Text(title).font(.custom("Righteous", size: 18)).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
            LazyHStack(spacing: 20){
                ForEach(lists, id: \.id) {
                    list in
                    SongListTileCircle(song: list)
                }
            }

        }.padding(.leading) .padding(.vertical,10)
    }
}


    struct SongListTileCircle: View{
       @State var song: ArtistListModelElement
        var body: some View{
           
              
                    VStack{
                        AsyncImage(
                            url: URL(string: baseUrl+"\(song.imgURL)"),
                            content: { image in
                                image.resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(maxWidth: 200, maxHeight: 100).clipShape(Circle()).overlay{
                                        Circle().stroke(Color(hex: 0x1a1a1a), lineWidth: 8)
                                    }
                            },
                            placeholder: {
                               
                            }
                        )
//                        Image(song.imgURL)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 130, height: 130)
//                            .clipShape(Circle()).overlay{
//                                Circle().stroke(Color(hex: 0x1a1a1a), lineWidth: 8)
//                            }
                        
                        Text(song.name ).font(.custom("Poppins-Regular", size: 12)).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center)
                    }
                    
          
        }
    }

struct SongListAlbumTile: View{
    var song: AlbumListModelElement
    var body: some View{
        NavigationLink(destination: TopSongsView(albumId: song.id)) {
            VStack(alignment: .center){
                AsyncImage(
                    url: URL(string: baseUrl+"\(song.imgUrl)"),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 200, maxHeight: 100).cornerRadius(10)
                    },
                    placeholder: {
                       Text("Loading")
                    }
                )
                Text(song.name).font(.custom("Poppins-Regular", size: 12)).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
}


struct HeaderBar : View{
    @StateObject var lvm: LoginViewModel
    @StateObject var songListModel = SongListViewModel()
    @State var search :String =  ""
    var body: some View{
        VStack(alignment: .leading) {
            HStack{
                Image("logo01").resizable().aspectRatio(contentMode: .fit).frame(height: 50).padding(.horizontal)
                
                Spacer()
                Button{
                    print("logout")
                    lvm.logout()
                    print(lvm.authenticated)
                } label:{
                    Image(systemName: "bell.fill").padding(.horizontal,5)
                }
                Button{
                    songListModel.getSongListTop5()
                }label:{
                    Image(systemName: "timer").padding(.horizontal,5)
                }
                Image(systemName: "gearshape.fill").padding(.leading,5.0)
                    .padding(.trailing)
                
            }.foregroundColor(.white)
            TextField("Search Songs",
                      text:$search).padding(.all).font(.custom("Poppins-Regular", size: 12)).frame(height:45).background().cornerRadius(30).padding(.horizontal).padding(.vertical,5)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
//            NavigationLink(
//                destination: PlayMusicView(),
//                label: {
                        Text("Music").padding(.horizontal,20)
                            .padding(.vertical,5).background(Color(hex: 0xa8222b))
                            .foregroundColor(.white)
                            .font(.custom("Poppins-Regular", size: 12)).cornerRadius(16)
//                    }
//            )
                
                Button("PodCast & Shows"){}
                    .padding(.vertical,5)
                    .padding(.horizontal,30)
                    .background(Color(hex: 0x2c90b5))
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Regular", size: 12)).cornerRadius(16)
                
                NavigationLink(destination: GeolocationView().transition(.offset(x:0, y:850))) {
                    Text("Geolocation").padding(.horizontal,20)
                        .padding(.vertical,5)
                        .font(.custom("Poppins-Regular", size: 12))
                        .background(Color(hex: 0x2c90b5))
                        .foregroundColor(.white).cornerRadius(16)
                }
            }.padding(.horizontal)
        }
        }.frame(maxHeight: .infinity, alignment: .top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
