//
//  ProfileView.swift
//  demo
//
//  Created by 32 Technologies on 12/07/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View{   VStack(spacing: 20){
        HStack(spacing: 20){
            Text("Y")
                .font(.custom("Poppins-Regular", size: 20))
                .padding()
                .background(Color(hex: 0xbd3c40))
                .clipShape(Circle())
                .foregroundColor(.white)
            Text("My Profile").font(.custom("Poppins-Regular", size: 20))
            Spacer()
            Image(systemName: "magnifyingglass").fontWeight(.bold)
            Image(systemName: "gearshape.fill")
        }
        HStack {
            Button("Profile"){}.padding(.horizontal,20)
                .padding(.vertical,5).background(Color(hex: 0xa8222b))
                .foregroundColor(.white)
                .font(.custom("Poppins-Regular", size: 12)).cornerRadius(16)
        Spacer()
        }
        HStack {
            Image(systemName: "arrow.up.arrow.down").font(.system(size: 12))
            Text("Recent").font(.custom("Poppins-Regular", size: 12))
            Spacer()
        }
        
        HStack{
            circularImageSml(imgName: "s")
            VStack(alignment: .leading){
                Text("Playlist #1").font(.custom("Poppins-Regular", size: 17))
                Text("Lore ipsum").font(.custom("Poppins-Regular", size: 12)).opacity(0.6)
            }.padding(.horizontal)
            Spacer()
        }
        HStack{
            circularImageSml(imgName: "m")
            VStack(alignment: .leading){
                Text("Playlist #2").font(.custom("Poppins-Regular", size: 17))
                Text("Loreium Ipsum").font(.custom("Poppins-Regular", size: 12)).opacity(0.6)
            }.padding(.horizontal)
            Spacer()
        }
        HStack{
            Image(systemName: "plus.circle.fill").font(.system(size: 30)).foregroundStyle(.white,Color(hex: 0x363636))
            VStack(alignment: .leading){
                Text("Add album").font(.custom("Poppins-Regular", size: 17))
                
            }.padding(.horizontal)
            Spacer()
        }
        HStack{
            Image(systemName: "plus.circle.fill").font(.system(size: 30)).foregroundStyle(.white,Color(hex: 0x363636))
            
            VStack(alignment: .leading){
                Text("Add playlist").font(.custom("Poppins-Regular", size: 17))
                
            }.padding(.horizontal)
        Spacer()
        }
    }.foregroundColor(.white).padding(.horizontal)
    }
}
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
