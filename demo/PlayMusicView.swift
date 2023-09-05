//
//  PlayMusicView.swift
//  demo
//
//  Created by 32 Technologies on 14/07/23.
//

import AVFoundation

import SwiftUI

struct PlayMusicView: View {
    @State var songList : [SongListModelElement]
    @State  var songIndex : Int
    @State var song1 = false
    @State var speed = 0.0
    @State var totalDuration = 0.0
    @State var isEditing : Bool = false
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    @EnvironmentObject var audioManager : AudioManager
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var headingBack: some View{
       
            HStack {
                Button{
                    audioManager.player?.pause()
                    self.presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left.circle.fill").font(.system(size: 35)).foregroundStyle(.white, Color(hex: 0xbd3c40)).transition(.offset(x:0, y:850))
                }.frame(maxHeight: .infinity, alignment: .top).padding(.vertical)
               Spacer()
                VStack {
                    Text("Playing from Playlist")
                    Text("Playlist Hits").bold()
                }.foregroundColor(.white).font(.custom("Poppins-Regular", size: 12))
                Spacer()
                optionButton
            }.padding(.horizontal)
    }
    var body: some View {
        
        ZStack(alignment: .leading){
            Image("bg12").resizable().ignoresSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false){
               headingBack
                AsyncImage(
                    url: URL(string: baseUrl+"\(songList[songIndex].imgURL)"),
                    content: { image in
                        image.resizable().aspectRatio(contentMode: .fill).frame(width: UIScreen.main.bounds.size.width/1.1, height: 250 ).cornerRadius(30).padding(.bottom)
                    },
                    placeholder: {
                        Text("Loading").foregroundColor(.white)
                    }
                )

//                Image("m03").resizable().aspectRatio(contentMode: .fill).frame(width: UIScreen.main.bounds.size.width/1.1, height: 250 ).cornerRadius(30).padding(.bottom)
                HStack {
                    VStack(alignment: .leading){
                        Text("\(songList[songIndex].name)").font(.custom("Righteous", size: 20))
                        Text("\(songList[songIndex].artistName)").font(.custom("Poppins-Regular", size: 12))
                    }
                Spacer()
                    
                    Image(systemName: "heart.fill")
                }.padding(.horizontal)
//                ProgressView(value: 0.4)
                if let player = audioManager.player?.currentItem?.asset
                {
                    Slider(value: $speed, in: 0...420.0){
                        editing in if !editing{
                            audioManager.updatePlayerCurrentTime(sliderValue: speed)                    }
                    }.accentColor(.white)
                    
                    HStack{
                        Text(audioManager.convertDoubleToMinutes(seconds: speed))
                        Spacer()
//                        Text(audioManager.convertDurationToMinutes(duration: player.duration))
                    }.font(.custom("Poppins-Regular", size: 12))
                }
                HStack{
                    Image(systemName: "shuffle").font(.system(size: 25))
                    Spacer()
                    Image(systemName: "chevron.backward.to.line").onTapGesture {
                        
                        if(0 < songIndex){
                            songIndex = songIndex-1
                        }
                        else{
                            songIndex = 0
                        }
                       
                        let songUrl  = songList[songIndex].songFile
                        audioManager.playSound(sound: "\(baseUrl)\(songUrl)")
                        audioManager.player?.play()
                    }
                    Image(systemName: song1 ? "pause.circle.fill": "play.circle.fill")
                                .font(.system(size: 70))
                                .padding(.trailing)
                                .onTapGesture {
                                    
                                    song1.toggle()
                                    
                                    if song1{
                                        audioManager.player?.play()
                                        
                                
                                    } else {
                                        audioManager.player?.pause()
                                    }
                                }
                    Image(systemName: "chevron.right.to.line").onTapGesture {
                        
                        if(songList.count-1 > songIndex){
                            songIndex = songIndex+1
                        }
                        else{
                            songIndex = 0
                        }
         
                        let songUrl  = songList[songIndex].songFile
                        audioManager.playSound(sound: "\(baseUrl)\(songUrl)")
                        audioManager.player?.play()
                    }
                    Spacer()
                    Image("screeningIcon")
                }
                HStack{
                    Image(systemName: "airplayaudio")
                    Spacer()
                    Image(systemName: "info.circle")
                    Image("shareIcon").padding(.horizontal)
                    Image(systemName: "text.justify.left")
                    
                }.padding(.vertical,30)
                
//                VStack (alignment: .leading){
//                    Text("Lorem ipsum dolor, \nsed diam nonumy eirmod tempor nvidunt").padding(.bottom,-40).bold()
//                    Text(  "\nLabore et dolore magna aliquyam erat  \nSed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus ").foregroundColor(Color(hex: 0x0000))
//                }
//                .font(.custom("Poppins-Regular", size: 20)).padding(40).background(Color(hex: 0xa8222b)).cornerRadius(30).padding(.vertical,30)
//
                ZStack(alignment: .leading){
                    Image("m05").resizable().frame(width: UIScreen.main.bounds.size.width/1.1, height: 200).cornerRadius(20)
                    VStack(alignment: .leading){
                        Text("About the artist").bold()
                        Spacer()
                        HStack {
                            VStack {
                                Text("Artist Name")
                                Text("35,121,211 monthly listeners").italic()
                            }
                        Spacer()
                            Text("Follow").padding(.horizontal,40).padding(.vertical,10).font(.custom("Poppins-Regular", size: 12)).overlay(
                                RoundedRectangle(cornerRadius: 17)
                                    .inset(by: 1) // inset value should be same as lineWidth in .stroke
                                    .stroke(.white, lineWidth: 1)
                            )
                        }
                        
                    }.font(.custom("Poppins-Regular", size: 12)).padding()
                }
                
            }.foregroundColor(.white).padding(.horizontal)
            
            
        }
        .onAppear{
           let songUrl  = songList[songIndex].songFile
//            guard let url = URL(string: "\(baseUrl)\(songUrl)") else { return }
//            print(url)
//            guard let url = URL(string:  "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3") else { return }
//
            audioManager.playSound(sound: "\(baseUrl)\(songUrl)")
            
            print(audioManager.player)
            print(audioManager.player?.currentItem?.loadedTimeRanges)
            print(audioManager.player?.currentItem?.asset)
            print(audioManager.player?.currentItem?.asset.duration)
            
            if audioManager.player?.status == .readyToPlay {

                print(audioManager.player?.currentItem?.asset.duration.seconds) // it't not nan

            }
            else{
                print("not ready to play")
            }
            if let player = audioManager.player?.currentItem?.asset {
//                totalDuration = CMTimeConverter.convertCMTimeToDouble(cmTime: player.duration)
                print("here")
//                print(audioManager.player?.currentItem?.asset.duration)
                song1 = true
                audioManager.player?.play()
               
            }}
        .navigationBarBackButtonHidden()
            .onReceive(timer){
            _ in
            guard let player = audioManager.player, !isEditing else {return}
            speed = CMTimeConverter.convertCMTimeToDouble(cmTime: player.currentTime())
        }
    }
}
struct CMTimeConverter {
  static func convertCMTimeToDouble(cmTime: CMTime) -> Double {
    return Double(cmTime.value) / Double(cmTime.timescale)
  }
}


struct PlayMusicView_Previews: PreviewProvider {
    static var previews: some View {
        PlayMusicView(songList: [], songIndex: 2).environmentObject(AudioManager())
    }
}
