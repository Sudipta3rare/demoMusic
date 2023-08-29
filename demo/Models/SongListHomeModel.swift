//
//  SongListHomeModel.swift
//  demo
//
//  Created by 32 Technologies on 06/07/23.
//

import Foundation
import SwiftUI

struct SongListModel : Hashable,Codable,Identifiable{
    var id: Int
    var name: String
    var imgName: String
    var descrption: String
    var img:Image{
        Image(imgName)
    }
}

struct SongListModelElement: Hashable,Decodable,Identifiable {
    let id: Int
    let name, artistName, imgURL, songFile: String
  
    typealias SongListModell = [SongListModelElement]
}

struct AlbumListModelElement: Hashable,Decodable,Identifiable {
    let id: Int
    let name, imgUrl: String
}

struct ArtistListModelElement: Hashable,Decodable,Identifiable {
    let id: Int
    let name, imgURL: String
}

class SongListViewModel : ObservableObject{
    @Published var isLoaded = false
    @Published var songListTop5 : [SongListModelElement] = []
    @Published var reccSongs: [SongListModelElement] = []
    @Published var top5albums : [AlbumListModelElement] = []
    @Published var top5artist : [ArtistListModelElement] = []
    
    
    var userToken : String = UserDefaults.standard.value(forKey: "USER_KEY") as! String
    
    
    func getSongListTop5() {
        guard let url = URL(string: "\(baseUrl)/api/user/getTopSongs") else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Authorization":"Bearer \(userToken)"
        ]
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                if let data = data{
                    let result = try! JSONDecoder().decode( [SongListModelElement].self, from: data)
                    
                    DispatchQueue.main.async { [self] in
                        self.songListTop5 = result
                        self.isLoaded = true
                    }
                    
                }
                else if let error = error {
                    print("HTTP Request Failed \(error)")
                }
            }
            
        }.resume()
        
    }
        
        func getReccomendedSongs() {
            guard let url = URL(string: "\(baseUrl)/api/user/recommendedSongs") else { return }
            var request = URLRequest(url: url)
            request.allHTTPHeaderFields = [
                "Content-Type": "application/json",
                "Authorization":"Bearer \(userToken)"
            ]
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    if let data = data{
                        let result = try! JSONDecoder().decode( [SongListModelElement].self, from: data)
                        
                        DispatchQueue.main.async { [self] in
                            self.reccSongs = result
                            self.isLoaded = true
                        }
                        
                    }
                    else if let error = error {
                        print("HTTP Request Failed \(error)")
                    }
                }
                
            }.resume()
            
        }
    
    
    
    func getTop5Album() {
            guard let url = URL(string: "\(baseUrl)/api/user/getTopAlbums") else { return }
            var request = URLRequest(url: url)
            request.allHTTPHeaderFields = [
                "Content-Type": "application/json",
                "Authorization":"Bearer \(userToken)"
            ]
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    if let data = data{
                        let result = try! JSONDecoder().decode( [AlbumListModelElement].self, from: data)
                        
                        DispatchQueue.main.async { [self] in
                            self.top5albums = result
                            self.isLoaded = true
                        }
                       
                    }
                 
                    else if let error = error {
                        print("HTTP Request Failed \(error)")
                    }
                  
                }
               
                
            }.resume()
            
        }
    func getTop5Artist() {
            guard let url = URL(string: "\(baseUrl)/api/user/getTopArtists") else { return }
            var request = URLRequest(url: url)
            request.allHTTPHeaderFields = [
                "Content-Type": "application/json",
                "Authorization":"Bearer \(userToken)"
            ]
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                do {
                    if let data = data{
                        let result = try! JSONDecoder().decode( [ArtistListModelElement].self, from: data)
                        
                        DispatchQueue.main.async { [self] in
                            self.top5artist = result
                        }
                       
                    }
                 
                    else if let error = error {
                        print("HTTP Request Failed \(error)")
                    }
                  
                }
               
                
            }.resume()
            
        }
    
}


//List for songs in home page
var songList: [SongListModel] = [
    SongListModel(
            id: 1, name: "My Escape", imgName: "m01", descrption: "Lore ipsum"),
    SongListModel(
            id: 2, name: "Burn it down", imgName: "m02", descrption: "Lore ipsum"),
    SongListModel(
            id: 3, name: "Rusted Soul", imgName: "m03", descrption: "Lore ipsum"),
]

var albumList: [SongListModel] = [
    SongListModel(
            id: 1, name: "Long way to fall", imgName: "m04", descrption: "Lore ipsum"),
    SongListModel(
            id: 2, name: "Do it again", imgName: "m05", descrption: "Lore ipsum"),
    SongListModel(
            id: 3, name: "Gretehen Melita", imgName: "m06", descrption: "Lore ipsum"),
]
var popularList: [SongListModel] = [
    SongListModel(
            id: 1, name: "Jimi Hendrix", imgName: "g", descrption: "Lore ipsum"),
    SongListModel(
            id: 2, name: "Brandon Davidson", imgName: "h", descrption: "Lore ipsum"),
    SongListModel(
            id: 3, name: "Mark Anthony", imgName: "i", descrption: "Lore ipsum"),
]
var favList: [SongListModel] = [
    SongListModel(
            id: 1, name: "Boo Redley", imgName: "j", descrption: "Lore ipsum"),
    SongListModel(
            id: 2, name: "Ash Cornonado", imgName: "k", descrption: "Lore ipsum"),
    SongListModel(
            id: 3, name: "Randy Atwood", imgName: "l", descrption: "Lore ipsum"),
]
var recommendedList : [SongListModel] = [
    SongListModel(
            id: 1, name: "Song 1", imgName: "m", descrption: "Lore ipsum"),
    SongListModel(
            id: 2, name: "Song 2", imgName: "n", descrption: "Lore ipsum"),
    SongListModel(
            id: 3, name: "Song 3", imgName: "o", descrption: "Lore ipsum"),
]
var songListEvent : [SongListModel] = [
    SongListModel(
            id: 1, name: "20-10-2023", imgName: "m", descrption: "Lore ipsum"),
    SongListModel(
            id: 2, name: "20-11-2023", imgName: "n", descrption: "Lore ipsum"),
    SongListModel(
            id: 3, name: "20-12-2023", imgName: "o", descrption: "Lore ipsum"),
]
