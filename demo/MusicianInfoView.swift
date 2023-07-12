//
//  MusicianInfoView.swift
//  demo
//
//  Created by 32 Technologies on 10/07/23.
//

import SwiftUI


var imageList = ["m","n","r","o"]

struct MusicianInfoView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var headerLogo: some View{
        Image("logo01").resizable().aspectRatio(contentMode: .fit).frame(height: 50).frame(maxHeight: .infinity, alignment: .top)
    }
    
    var headingBack: some View{
        ScrollView(.horizontal) {
            HStack {
                Button{
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left.circle.fill").font(.system(size: 20)).foregroundColor(.white).transition(.offset(x:0, y:850))
                }
                headerLogo
               Spacer()
            }.padding(.horizontal)
        }.padding(.horizontal)
    }
    
    
    var artistInfo : some View{
        HStack(alignment: .lastTextBaseline){
            VStack(alignment: .leading, spacing: 5){
                HStack{
                    Text("Name :")
                    Text("Jimi Hendrix").font(.custom("Righteous", size: 17))
                    
                }
                Text("Pop Songs")
                HStack{
                    Image(systemName: "mappin")
                    Text("Boston, USA")
                }
            }.padding(.horizontal)
                .font(.custom("Poppins-Regular", size: 17))
           Spacer()
            Text("Tips For Artist")
                .padding(.horizontal)
                .padding(.vertical,5)
                .font(.custom("Poppins-Regular", size: 12))
                .foregroundColor(.white)
                .background(LinearGradient(gradient: .init(colors: [Color(hex: 0x80343a),Color(hex: 0x810f0f)]),startPoint: .init(x: 0, y: -0.24),endPoint: .init(x: 0, y: 0.98)))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.horizontal)
        }.padding(.horizontal)
            .foregroundColor(.white)
    }
    
    var body: some View {
        
        ZStack(alignment: .leading){
            Image("bg05").resizable().ignoresSafeArea(.all)
            ScrollView{
                headingBack
                Image("header01")
                artistInfo.padding(.bottom)
               
               
                VStack (alignment: .leading){
                    
               
       
                    //Top Songs
              
                Section(header: Text("Top Songs").font(.custom("Righteous", size: 20)).foregroundColor(.white).padding(.horizontal)){
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack(spacing:20){
                            Image("m").resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100).cornerRadius(15)
                            Image("n").resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100).cornerRadius(15)
                            Image("o").resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100).cornerRadius(15)
                            Image("m").resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100).cornerRadius(15)
                        }.padding(.horizontal)
                    }
                }
                    //Top Albums
                    Section(header: Text("Top Albums").font(.custom("Righteous", size: 20)).foregroundColor(.white).padding(.horizontal)){
                    ScrollView(.horizontal,showsIndicators: false) {
                        HStack(spacing:20){
                            Image("o").resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100).cornerRadius(15)
                            Image("r").resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100).cornerRadius(15)
                            Image("s").resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100).cornerRadius(15)
                            Image("m").resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 100).cornerRadius(15)
                        }.padding(.horizontal).padding(.bottom)
                    }
                }
                    
                    Section(header: Text("Connect").font(.custom("Righteous", size: 20)).foregroundColor(.white).padding(.horizontal)){
                        
                            HStack(spacing: 10){
                                Image("fb")
                                Image("tw")
                                Image("yt")
                                Image("ins")
                                Spacer()
                                Text("Chat with me").font(.custom("Poppins-Regular", size: 17))
                                
                                Image(systemName: "ellipsis.message.fill")
                            }.padding(.horizontal).foregroundColor(.white).padding(.bottom)
                        
                    }
                    HStack(alignment: .lastTextBaseline){
                                Text("Live Concerts").font(.custom("Righteous", size: 20)).foregroundColor(.white).padding(.horizontal)
                            Spacer()
                                Text("Watch Now")
                                    .padding(.horizontal)
                                    .padding(.vertical,5)
                                    .font(.custom("Poppins-Regular", size: 12))
                                    .foregroundColor(.white)
                                    .background(Color(hex: 0xa8222b))
                                    .clipShape(RoundedRectangle(cornerRadius: 15))
                                    .padding(.horizontal).padding(.bottom)
                            }
                        

                    Section(header: Text("Upcoming Events").font(.custom("Righteous", size: 20)).foregroundColor(.white).padding(.horizontal)){
                        VStack {
                            ForEach(songListEvent, id: \.id){
                               list in eventListTile(event: list)
                            }
                        }
                    }.padding(.bottom)
                    
                    Section(header: Text("Buy Items").font(.custom("Righteous", size: 20)).foregroundColor(.white).padding(.horizontal)){
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack(spacing:20){
                                Image("shop01")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 120, height: 120)
                                    .clipShape(Circle())
                                Image("shop02")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 120, height: 120)
                                    .clipShape(Circle())
                                Image("shop03")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 120, height: 120)
                                    .clipShape(Circle())
                            }.padding(.horizontal)
                        }
                    }
                    
                }.padding(.horizontal).padding(.bottom)
                
            }
           
          
            
        }.padding(.horizontal).navigationBarBackButtonHidden()
    }
}

struct eventListTile : View{
    var event : SongListModel
    var body: some View{
        HStack(spacing:10){
            Text("\(event.id) )").font(.custom("Poppins-Regular", size: 12))
            VStack(alignment: .leading){
                Text(event.descrption).font(.custom("Poppins-Regular", size: 17))
                Text(event.name).font(.custom("Poppins-Regular", size: 12))
            }
            Spacer()
            Text("Book Tickets")
                .padding(.horizontal)
                .padding(.vertical,5)
                .font(.custom("Poppins-Regular", size: 12))
                .foregroundColor(.white)
                .background(Color(hex: 0xa8222b))
                .clipShape(RoundedRectangle(cornerRadius: 15))
                .padding(.horizontal)
        }.foregroundColor(.white).padding(.horizontal)
    }
}

struct MusicianInfoView_Previews: PreviewProvider {
    static var previews: some View {
        MusicianInfoView()
    }
}
