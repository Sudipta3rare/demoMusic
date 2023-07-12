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
    var lists : [SongListModel]
    var body: some View{
        ScrollView(.horizontal,showsIndicators: false ) {
            Text(title).font(.custom("Righteous", size: 18)).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
            LazyHStack(spacing: 20){
                ForEach(lists, id: \.id) {
                    list in
                    SongListTile(song: list)
                }
            }
            
        }.padding(.leading) .padding(.vertical,10)
    }
}

struct songHListCircle: View {
    var title : String
    var lists : [SongListModel]
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
       @State var song: SongListModel
        var body: some View{
           
              
                    VStack{
                      
                        Image(song.imgName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 130, height: 130)
                            .clipShape(Circle()).overlay{
                                Circle().stroke(Color(hex: 0x1a1a1a), lineWidth: 8)
                            }
                        
                        Text(song.name ).font(.custom("Poppins-Regular", size: 12)).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .center)
                    }
                    
          
        }
    }



struct SongListTile: View{
    var song: SongListModel
    var body: some View{
        VStack(alignment: .center){
            Image(song.imgName).resizable()
                .aspectRatio(contentMode: .fill).frame(width:130,height: 130).cornerRadius(10)
            
            Text(song.name ).font(.custom("Poppins-Regular", size: 12)).foregroundColor(.white).frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

struct HeaderBar : View{
    @StateObject var lvm: LoginViewModel
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
                Image(systemName: "timer").padding(.horizontal,5)
                Image(systemName: "gearshape.fill").padding(.leading,5.0)
                    .padding(.trailing)
                
            }.foregroundColor(.white)
            TextField("Search Songs",
                      text:$search).padding(.all).font(.custom("Poppins-Regular", size: 12)).frame(height:45).background().cornerRadius(30).padding(.horizontal).padding(.vertical,5)
            ScrollView(.horizontal, showsIndicators: false) {HStack {
                Button("Music"){}.padding(.horizontal,20)
                    .padding(.vertical,5).background(Color(hex: 0xa8222b))
                    .foregroundColor(.white)
                    .font(.custom("Poppins-Regular", size: 12)).cornerRadius(16)
                
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
