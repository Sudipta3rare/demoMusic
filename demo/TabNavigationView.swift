//
//  TabNavigationView.swift
//  demo
//
//  Created by 32 Technologies on 05/07/23.
//

import SwiftUI
import UIKit

struct TabNavigationView: View {

    @StateObject var lvm = LoginViewModel()
    @StateObject var libraryModel = LibraryViewModel()
    @StateObject var songViewModel = SongListViewModel()
    
    init() {
        UITabBar.appearance().isHidden = false
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Poppins-Regular", size: 12)!], for: .normal)
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().backgroundColor = UIColor(hexString: "#2e2e2e")
//        songViewModel.getSongListTop5()
       }
    var body: some View {
        
        if(lvm.authenticated ){
            
            NavigationView {
                TabView {
                        Group {
                            NavigationStack{
                                ZStack(alignment: .leading){
                                    Image("bg02").resizable().ignoresSafeArea(.all)
                                    ScrollView{
                                        HeaderBar(lvm: lvm)
                                        
                                        
                                                                                songHList(title: "Song", lists: songViewModel.songListTop5 )                                    .onAppear
                                                                                {
                                                                                    songViewModel.getSongListTop5()
                                                                                    songViewModel.getTop5Album()
                                                                                    songViewModel.getTop5Artist()
                                                                                }
                                        
                                                                                songHAlbumList(title: "Latest Album", lists: songViewModel.top5albums)
                                                                                songHListCircle(title: "Popular Artists", lists:songViewModel.top5artist)
                                                                                songHListCircle(title: "Favorite  Artists", lists: songViewModel.top5artist)
                                                                                songHList(title: "Recommended Songs", lists: songViewModel.reccSongs)
                                                                                    .onAppear{
                                                                                        songViewModel.getReccomendedSongs()
                                                                                    }
                                        
                                        
                                    }
                                    
                                }
                                
                            }
                            .tabItem {
                                Image(systemName: "house.fill")
                                Text("Home").tag(0)
                                
                            }
                            NavigationStack{
                                ZStack(alignment: .leading){
                                    Image("bg02").resizable().ignoresSafeArea()
                                    ScrollView{
                                        VideoView()
                                    }
                                }
                            }
                                .tabItem {
                                    Image(systemName: "video.fill")
                                    Text("Videos").tag(1)
                                }
    //                        Text("Nearby Screen")
    //                            .tabItem {
    //                                Image(systemName: "magnifyingglass")
    //                                Text("Search").tag(2)
    //                            }
                            NavigationStack{
                                ZStack(alignment: .leading){
                                    Image("bg06").resizable().ignoresSafeArea(.all)
                                    ScrollView{
                                        LibraryView(lvm: libraryModel)
                                    }
//                                    currentPlayingBottom(lvm: libraryModel)
                                }
                            }
                                .tabItem {
                                    Image(systemName: "play.square.stack.fill")
                                    Text("Library").tag(3)
                                }
                            NavigationStack{
                                ZStack(alignment: .leading){
                                    Image("bg09").resizable().opacity(0.7).ignoresSafeArea(.all).background(.black)
                                    ScrollView{
                                        ProfileView()
                                    }
                                    
                                }
                            }
                                .tabItem {
                                    Image(systemName: "person.fill")
                                    Text("Profile").tag(4)
                                }
                            
                        
                    }
                    
                    .toolbar(.visible, for: .tabBar)
                    .toolbarBackground(Color(hex: 0x2e2e2e), for: .tabBar)
                   
                    
                }
            }
        }
        
        else{
            LoginView().transition(.offset(x:0, y:850))
        }
    }
    
}


struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
