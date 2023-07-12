//
//  LibraryView.swift
//  demo
//
//  Created by 32 Technologies on 10/07/23.
//

import SwiftUI

struct LibraryView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @StateObject var lvm : LibraryViewModel
    @State private var showThirdView = false
    @State  var createPlaylist = false
    var body: some View{
    
     
         
                VStack (alignment: .leading){
                    HStack(spacing: 20){
                        Text("Y")
                            .font(.custom("Poppins-Regular", size: 20))
                            .padding()
                            .background(Color(hex: 0xbd3c40))
                            .clipShape(Circle())
                            .foregroundColor(.white)
                        Text("My Library").font(.custom("Poppins-Regular", size: 20))
                        Spacer()
                                Image(systemName: "magnifyingglass").fontWeight(.bold)
                        Button{
                            createPlaylist.toggle()
                            
                        }label: {
                            Image(systemName: "plus").fontWeight(.bold)
                        }.sheet(isPresented: $createPlaylist){
                            Capsule()
                                            .fill(Color(hex: 0xbcbcbc))
                                            .frame(width: 50, height: 5)
                            VStack(alignment: .leading){
                                HStack {
                                    Spacer()
                                    Text("Create")
                                        .font(.custom("Poppins-Regular", size: 20))
                                        .padding(.vertical)
                                    Spacer()
                                }
                                   
                            
                                    Button{
                                        self.presentationMode.wrappedValue.dismiss()
                                                    DispatchQueue.main.async {
                                                        self.createPlaylist=false
                                                        self.showThirdView = true
                                                    }
                                    }label:{
                                        HStack(alignment: .center){
                                            Image(systemName: "music.note.list").font(.system(size: 30))
                                            VStack(alignment: .leading){
                                                Text("Playlist").font(.custom("Poppins-Regular", size: 18))
                                                Text("Add song to a new playlist").font(.custom("Poppins-Regular", size: 12))
                                            }
                                            
                                        }
                                    }
                                    
                                
                                    
                                Divider().background(.white)
                                    .frame(minHeight: 2).padding(.horizontal)
                                HStack(alignment: .center){
                                    Image("iconBlend")
                                    VStack(alignment: .leading){
                                        Text("Blend").font(.custom("Poppins-Regular", size: 18))
                                        Text("Combine tastes in a shared playlist with friends").font(.custom("Poppins-Regular", size: 12))
                                    }
                                    
                                }
                                
                            }.padding()
                                .presentationCornerRadius(35)
                                .presentationBackground(Color(hex: 0x313030))
                                .presentationDetents([.fraction(0.35)])
                                                    .presentationDragIndicator(.visible)
                                                    .foregroundColor(.white)
                                                    .padding(.horizontal)
                                                    
                                            
                        }
                        
                    }.foregroundColor(.white)
                        .padding(.horizontal)
                    HStack{
                        Button("Playlist"){}.padding(.horizontal,20)
                            .padding(.vertical,5).background(Color(hex: 0xa8222b))
                            .foregroundColor(.white)
                            .font(.custom("Poppins-Regular", size: 12)).cornerRadius(16)
                        
                        Button("Favorite"){}
                            .padding(.vertical,5)
                            .padding(.horizontal,30)
                            .background(Color(hex: 0x2c90b5))
                            .foregroundColor(.white)
                            .font(.custom("Poppins-Regular", size: 12)).cornerRadius(16)
                    }.padding(.horizontal)
                    
                    Button{
                        
                    } label: {HStack {
                        Image(systemName: "arrow.up").font(.system(size: 12)).padding(.trailing,-10)
                        Image(systemName: "arrow.down").font(.system(size: 12))
                        Text("Recent").font(.custom("Poppins-Regular", size: 12))
                    }.foregroundColor(.white).padding()
                    }
                    VStack(alignment: .leading, spacing: 24) {
                        ForEach(lvm.libraryList, id: \.id){
                            l  in Button{
                                lvm.currentPlaying = l
                                lvm.currentPlaying.isPlaying = true
                                    
                            }label: {
                                HStack{
                                    circularImageSml(imgName: l.imgName)
                                    VStack(alignment: .leading){
                                        Text(l.name).font(.custom("Poppins-Regular", size: 17))
                                        Text(l.description).font(.custom("Poppins-Regular", size: 12)).opacity(0.6)
                                    }.padding(.horizontal)
                                }
                            }
                            
                        }.foregroundColor(.white)
                    }.padding(.horizontal).padding(.bottom,100)
                }
                .background(
                    NavigationLink(destination: CreatePlaylistView(), isActive: $showThirdView){})
           
            
        
    }
}

struct currentPlayingBottom : View{
    @StateObject var lvm : LibraryViewModel
    var body: some View{
        if(lvm.currentPlaying.id != 0){
            HStack{
                circularImageSml(imgName: lvm.currentPlaying.imgName).padding(.horizontal)
                    .padding(.vertical,10)
                VStack(alignment: .leading){
                    Text(lvm.currentPlaying.name).font(.custom("Poppins-Regular", size: 17))
                    Text(lvm.currentPlaying.description).font(.custom("Poppins-Regular", size: 12)).opacity(0.6)
                }.padding(.horizontal).foregroundColor(.white)
                Spacer()
                Button{
                    lvm.currentPlaying.isFav.toggle()
                }label: {
                    if(lvm.currentPlaying.isFav){
                        Image(systemName: "heart.fill")
                    }
                    else
                    {
                        Image(systemName: "heart")
                        
                    }
                }.font(.system(size: 20))
                Button{
                    lvm.currentPlaying.isPlaying.toggle()
                }label: {
                    if(lvm.currentPlaying.isPlaying){
                        Image(systemName: "pause.fill")
                    }
                    else
                    {
                        Image(systemName: "play.fill")
                        
                        
                    }
                }.font(.system(size: 20))
                
                .padding()
            }.background(Color(hex: 0xa8222b))
                
                .frame(maxHeight: .infinity, alignment: .bottom)
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
