//
//  TopSongsView.swift
//  demo
//
//  Created by 32 Technologies on 13/07/23.
//

import SwiftUI

struct TopSongsView: View {
  
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var lvm = LibraryViewModel()
    @State var albumId : Int?
    var headingBack: some View{
       
            HStack {
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left.circle.fill").font(.system(size: 35)).foregroundStyle(.white, Color(hex: 0xbd3c40)).transition(.offset(x:0, y:850))
                }.frame(maxHeight: .infinity, alignment: .top).padding(.vertical)
                Spacer()
               NavigationLink (
                destination: AlbumDetailsView(),
                label:{
                        Image(systemName: "info.circle")
                    }
                )
                
            }.padding(.horizontal)
    }
    
    var body: some View {
        ZStack(alignment: .leading){
            Image("bg12").resizable().ignoresSafeArea(.all)
            
            ScrollView{
                headingBack.padding(.bottom)
                Image("top10").resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100).padding(.bottom)
                Text(lvm.top5list?.albumName ?? "Song Album").font(.custom("Righteous", size: 17))
                if let noOfTracks = lvm.top5list?.songList.count{
                    Text("\(noOfTracks) Tracks").font(.custom("Poppins-Italic", size: 12))
                }
                
                HStack{
                    Spacer()
                    Button{}label:{
                        HStack{
                            Image(systemName: "play.fill")
                            Text("Play")
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width/3)
                    .padding(.vertical,15)
                    .background(Color(hex: 0xa8222b))
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Regular", size: 17)).cornerRadius(26)
                    Button{}label:{
                        HStack{
                            
                            Image(systemName: "shuffle")
                            Text("Play")
                        }
                    }
                    .frame(width: UIScreen.main.bounds.size.width/3)
                    .padding(.vertical,15)
                    .background(Color(hex: 0x2c90b5))
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Regular", size: 17)).cornerRadius(26)
                    Spacer()
                }.padding(.bottom)
                VStack(alignment: .leading, spacing: 24) {
                        if let songList = lvm.top5list?.songList{
                            ForEach(Array(songList.enumerated()), id: \.element){
                        index,l  in NavigationLink(
//                            lvm.currentPlaying = l
//                            lvm.currentPlaying.isPlaying = true
                            destination: PlayMusicView(songList: songList, songIndex: index)
                            
                        ){
                            HStack{
                                circularImageSmlAsync(imgName: "\(baseUrl)\(l.imgURL)")
//                                circularImageSml(imgName: l.imgName)
                                VStack(alignment: .leading){
                                    Text(l.name).font(.custom("Poppins-Regular", size: 17))
                                    Text(l.artistName).font(.custom("Poppins-Regular", size: 12)).opacity(0.6)
                                }.padding(.horizontal)
                                Spacer()
                                optionButton
                            }
                        }
                        
                    }.foregroundColor(.white)}
                }.padding(.horizontal).padding(.bottom,100)
                
            }.padding(.horizontal).foregroundColor(.white)
            
//            currentPlayingBottom(lvm: lvm)
        }.navigationBarBackButtonHidden(true)
            .onAppear{
                print("on appear")
            lvm.getTopAlbumProfile(id: albumId ?? 2)
        }

    }
}

struct TopSongsView_Previews: PreviewProvider {
    static var previews: some View {
        TopSongsView(albumId: 2)
    }
}
