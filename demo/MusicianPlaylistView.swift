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
    var musicianId : Int?
    @StateObject var mpm = MusicianPlaylistViewModel()
    
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
                        VStack(alignment: .leading){
                            Text("\(mpm.artistPlaylist?.name ?? "Aritst")").font(.custom("Righteous", size: 30))
                            Text("\(mpm.artistPlaylist?.listeners ?? 0) monthly listeners").font(.custom("Poppins-Regular", size: 12))
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
                                    if let plList = mpm.artistPlaylist?.popularSongs
                                    {
                                        ForEach(Array(plList.enumerated()), id: \.element ){
                                            index,pl in songsListPopular(popularSong: pl, index: index)
                                        }
                                    }
                                    
                                }.padding(.bottom)
                            }
                            Section(header:Text("Popular Release").font(.custom("Poppins-Regular", size: 18))){
                                VStack {
                                    LazyVStack{
                                        if let plList = mpm.artistPlaylist?.popularReleasesAlbums
                                        {
                                            ForEach(Array(plList.enumerated()), id: \.element ){
                                                index,pli in NavigationLink(destination: TopSongsView(albumId: pli.id,albumCover: "\(baseUrl)\(pli.imgUrl)")){albumListPopular(popularAlbumList: pli)}
                                            }
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
                                ScrollView(showsIndicators: false) {
                                    LazyVStack{
                                        if let plList = mpm.artistPlaylist?.popularSongs
                                        {
                                            ForEach(Array(plList.enumerated()), id: \.element ){
                                                index,pl in songsListPopular(popularSong: pl, index: index)
                                            }
                                        }
                                        
                                    }.padding(.bottom)
                                }
                            }
                            
                            Section(header: Text("About").font(.custom("Poppins-Regular", size: 18))){
                                ZStack(alignment: .bottomLeading) {
                                    Image("header01").resizable().frame(height: 200)
                                    HStack(alignment: .lastTextBaseline){Text("\(mpm.artistPlaylist?.listeners ?? 0)").font(.custom("Poppins-Regular", size: 20))
                                        Text("Monthly Listeners").font(.custom("Poppins-Regular", size: 12))
                                        Spacer()
                                        Image(systemName: "arrow.right.circle.fill").font(.system(size: 25))
                                    }.padding()
                                }.padding(.bottom)
                            }
                           
//                            Section(header: Text("Fans Also Like").font(.custom("Poppins-Regular", size: 18))){
//                                ScrollView(.horizontal, showsIndicators: false) {
//                                    HStack(spacing:20) {
////                                        ForEach(songList, id: \.id){
////                                            list in SongListTileCircle(song: list)
////                                        }
//                                    }
//                                }
//                            }.padding(.bottom)
                            
                        }
                        Spacer()
                    }
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    
                    
                    

        
            }
        }.navigationBarBackButtonHidden().onAppear{
            mpm.getMusicanPlaylist(id: 	musicianId ?? 16)
        }
    }
}

struct albumListPopular : View{
    var popularAlbumList : AlbumListModelElement
    var body: some View
    
    {
        HStack{
            
            AsyncImage(
                url: URL(string: "\(baseUrl)\(popularAlbumList.imgUrl)"),
                content: { image in
                    image.resizable().aspectRatio(contentMode: .fill).frame(width:90,height: 90).cornerRadius(10).overlay(RoundedRectangle(cornerRadius: 10).stroke(.white, lineWidth: 0.5)
                    )
                },
                placeholder: {
                    ProgressView()
                        .progressViewStyle(.circular).tint(.white).padding()
                }
            )
            
            VStack(alignment: .leading){
                Text("\(popularAlbumList.name) ")
//                Text(popularAlbum.artistPlaylist?.popularReleasesAlbums[index])
            }
            .font(.custom("Poppins-Regular", size: 13))
            .padding(.horizontal,10)
        Spacer()
        }
        
    }
}

struct songsListPopular : View{
    var popularSong: SongListModelElement
    var index : Int
    var body : some View{
        HStack{
            
            Text("\(index+1)").padding(.horizontal,10)
            circularImageSmlAsync(imgName: "\(baseUrl)\(popularSong.imgURL)")
            VStack(alignment: .leading){
                Text(popularSong.name)
                Text(popularSong.artistName)
            }.padding(.horizontal,10)
            Spacer()
            optionButton
        }.font(.custom("Poppins-Regular", size: 12))
    }
}



struct MusicianPlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        MusicianPlaylistView( mpm: MusicianPlaylistViewModel())
    }
}
