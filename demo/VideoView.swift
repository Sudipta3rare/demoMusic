//
//  VideoView.swift
//  demo
//
//  Created by 32 Technologies on 13/07/23.
//

import SwiftUI

struct VideoView: View {
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
    
    var videoScreen : some View
    {
        VStack(alignment: .leading){
            Text("Video").padding(.horizontal).font(.custom("Righteous", size: 20)).fontWeight(.bold)
            Image("m06").resizable().aspectRatio(contentMode: .fill).frame(width: UIScreen.main.bounds.size.width/1.1, height: 250 ).cornerRadius(30).padding(.bottom)
            
            Text("WATCH").font(.custom("Poppins-Regular", size: 12))
                .padding(.bottom)
            
            Text("Video Title").font(.custom("Righteous", size: 20))
            Text("Lorem ipsum dolor sit amet, sadipscing elitr, sed diam nonumy eirmod.").font(.custom("Poppins-Regular", size: 12))
        }.foregroundColor(.white).padding(.horizontal)
}
    
    
    var body: some View {
//        headingBack
        videoScreen.padding(.bottom)
//
//        songVideoList(title: "Geo Melody Originals", lists: popularList)
//        songVideoList(title: "Album Experiences", lists: albumList)
//        songVideoList(title: "New Video Palylist", lists: songList)
//        songVideoList(title: "Classic Video Palylist", lists: songList)
//        songVideoList(title: "Hit Video Palylist", lists: songList)
    }
}


struct songVideoList: View {
    var title : String
    var lists : [SongListModelElement]
    var body: some View{
        VStack {
            titleWithButton(title: title)
            ScrollView(.horizontal,showsIndicators: false ) {
                
                LazyHStack(spacing: 20){
                    ForEach(lists, id: \.id) {
                        list in
                        SongListTile(song: list)
                    }
                }
                
            }.padding(.leading) .padding(.vertical,10)
        }
    }
}
struct titleWithButton: View{
    var title: String
    var body: some View{
        VStack(alignment: .leading){
            HStack(alignment: .bottom){
                Text(title).font(.custom("Righteous", size: 20))
                Spacer()
                Text("View  All").padding(.horizontal,10).padding(.vertical,5).background(Color(hex: 0x363636)).font(.custom("Poppins-Regular", size: 10)).cornerRadius(8)
            }
        }.foregroundColor(.white).padding(.horizontal)
    }
}
struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
