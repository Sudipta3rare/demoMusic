//
//  AudioManager.swift
//  demo
//
//  Created by 32 Technologies on 30/08/23.
//

import Foundation
import AVKit


final class AudioManager : ObservableObject{
    var player : AVPlayer?
    var playerItem : AVPlayerItem?
    var playerAudio : AVAudioPlayer?
    @Published var speed = 0.0{            willSet{
        ObjectWillChangePublisher().send()
    }
}
    

    
 
    func playSound(sound: String){
            if let url = URL(string: sound) {
                print(url)
                self.player = AVPlayer(url: url)
                self.playerItem = AVPlayerItem(url: url)
                print(player?.currentItem?.duration)
            }
        else{
            print("Problem in url \(sound)")
        }
        }
    
    
    func playAudioSound(sound: String){
        guard let url = URL(string: sound) else {return}
        print()

        do {
             // Configure and activate the AVAudioSession
             try AVAudioSession.sharedInstance().setCategory(
                 AVAudioSession.Category.playback
             )

             try AVAudioSession.sharedInstance().setActive(true)

             // Play a sound
             let player = try AVAudioPlayer(
                 contentsOf: url
             )
            
             player.play()
         }
          catch let error as NSError {
             print(error.description)
        }
    }
    
    func updatePlayerCurrentTime(sliderValue : Double) {
        player?.seek(to: CMTime(seconds: sliderValue, preferredTimescale: 1))
      }
    
    func convertDurationToMinutes(duration: CMTime) -> String {
       let minutes = Int(floor(duration.seconds)) / 60
       let seconds = Int(duration.seconds) % 60
       return String(format: "%d:%02d", minutes, seconds)
     }
    
    func convertDoubleToMinutes(seconds: Double) -> String {
      let minutes = Int(floor(seconds)) / 60
      let seconds = Int(seconds) % 60
      return String(format: "%d:%02d", minutes, seconds)
    }
}
