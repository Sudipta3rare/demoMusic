//
//  MusicianPlaylistModel.swift
//  demo
//
//  Created by 32 Technologies on 10/07/23.
//

import Foundation

struct MusicianPlaylistModel : Hashable,Codable,Identifiable{
    var id: Int
    var name: String
    var imgName: String
    var descrption: String
    
}


struct MusicianPlaylistModelElement : Hashable, Codable, Identifiable{
    var id: Int?
    var name: String?
    var imgUrl: String
    var listeners : Int?
    var popularSongs : [SongListModelElement]?
    var popularReleasesAlbums : [AlbumListModelElement]?
    var artistSongs : [SongListModelElement]?
}

final class MusicianPlaylistViewModel : ObservableObject{
    @Published  var artistPlaylist : MusicianPlaylistModelElement?
    var userToken : String = UserDefaults.standard.value(forKey: "USER_KEY") as! String

    
    func getMusicanPlaylist (id :Int) {
        guard let url = URL(string: "\(baseUrl)/api/user/getArtist/\(id)") else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Authorization":"Bearer \(userToken)"
        ]
       
        URLSession.shared.dataTask(with: request) { data, response, error in
                    if let data = data {
                        if let decodedData = try? JSONDecoder().decode(MusicianPlaylistModelElement.self, from: data) {
                            print(decodedData)
                            DispatchQueue.main.async {
                                self.artistPlaylist = decodedData
                        
                            }
                        }
                        
                    }
                }.resume()
    }
    
    
}

var popularSongsPlaylist: [MusicianPlaylistModel] = [
    MusicianPlaylistModel(
            id: 1, name: "Lore Ipsum", imgName: "m01", descrption: "200,100"),
    MusicianPlaylistModel(
            id: 2, name: "LoreIpp", imgName: "m02", descrption: "200,100"),
    MusicianPlaylistModel(
            id: 3, name: "Ipsum Lore", imgName: "m03", descrption: "200,100"),
    MusicianPlaylistModel(
            id: 4, name: "Ipsum ", imgName: "m", descrption: "200,100"),
    MusicianPlaylistModel(
            id: 5, name: "Lore", imgName: "n", descrption: "200,100"),
]

var popularAlbumsPlaylist: [MusicianPlaylistModel] = [
    MusicianPlaylistModel(
            id: 1, name: "Lore Ipsum", imgName: "m", descrption: "200,100"),
    MusicianPlaylistModel(
            id: 2, name: "LoreIpp", imgName: "n", descrption: "200,100"),
    MusicianPlaylistModel(
            id: 3, name: "Ipsum Lore", imgName: "o", descrption: "200,100"),
   
]
