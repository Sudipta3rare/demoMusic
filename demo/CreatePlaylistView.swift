//
//  CreatePlaylistView.swift
//  demo
//
//  Created by 32 Technologies on 11/07/23.
//

import SwiftUI

struct CreatePlaylistView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var playlistName : String = ""
    @State var goToPlaylist : Bool = false
    
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
                }.frame(maxHeight: .infinity, alignment: .top).padding(.vertical)
                headerLogo
               Spacer()
            }.padding(.horizontal)
        }.padding(.horizontal)
    }
    
    var body: some View {
        ZStack(alignment: .center){
            Image("bg07").resizable().ignoresSafeArea(.all)
           
                headingBack
                
                VStack {
                    Spacer()
                    Text("Give your playlist a name").font(.custom("Righteous", size: 36)).foregroundColor(.white).multilineTextAlignment(.center)
                    TextField("Playlist Name", text: $playlistName,axis: .vertical).lineLimit(4).multilineTextAlignment(.center).font(.custom("Poppins-Regular", size: 20)).foregroundColor(.white).padding(.horizontal)
                    Divider().frame(minHeight: 2).background(.white).padding(.horizontal,20)
                    HStack{
                        Button("Cancel"){
                            self.presentationMode.wrappedValue.dismiss()
                        }
                            .frame(width: UIScreen.main.bounds.size.width/2.5)
                            .padding(.vertical,15)
                            .background(Color(hex: 0xa8222b))
                            .foregroundColor(.white)
                            .font(.custom("Poppins-Regular", size: 20)).cornerRadius(26)
                        
                        NavigationLink(destination: SongsToPlaylistView() ,isActive: $goToPlaylist, label:{
                            Button("Create"){
                                if !playlistName.isEmpty{
                                    goToPlaylist = true
                                }
                            }
                                .padding(.vertical,15)
                                .frame(width: UIScreen.main.bounds.size.width/2.5)
                                
                                .background(Color(hex: 0x2c90b5))
                                .foregroundColor(.white)
                                .font(.custom("Poppins-Regular", size: 20)).cornerRadius(26)
                        })
                    }.padding()
                Spacer()
                }
            
        }.navigationBarHidden(true)
    }
    }

struct CreatePlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePlaylistView()
    }
}
