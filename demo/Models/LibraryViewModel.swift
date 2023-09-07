//
//  LibraryViewModel.swift
//  demo
//
//  Created by 32 Technologies on 11/07/23.
//

import Foundation

struct libraryListModel : Hashable,Codable,Identifiable{
    var id: Int
    var name: String
    var description: String
    var imgName: String
    var isPlaying : Bool
    var isFav: Bool

}

struct libraryListModelElement : Hashable,Sendable,Codable,Identifiable{
    let id: Int
    let albumName: String
    let artistList: [ArtistListModelElement]
    let songList: [SongListModelElement]
}

class LibraryViewModel: ObservableObject{
   @Published var top5list :libraryListModelElement?

    var userToken : String = UserDefaults.standard.value(forKey: "USER_KEY") as! String
    
    func getTopAlbumProfile(id: Int) {
        
        guard let url = URL(string: "\(baseUrl)/api/user/getAlbum/\(id)") else { return }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = [
            "Content-Type": "application/json",
            "Authorization":"Bearer \(userToken)"
        ]
       
        URLSession.shared.dataTask(with: request) { data, response, error in
            
                    if let data = data {
                        if let decodedData = try? JSONDecoder().decode(libraryListModelElement.self, from: data) {
                            DispatchQueue.main.async {
                                self.top5list = decodedData                                
                            }
                        }
                        
                    }
                }.resume()
        
    }

    var libraryList: [libraryListModel] = [
        libraryListModel(
            id: 1, name:  "My Escape", description: "Lore ipsum",imgName:"m01",isPlaying:  false, isFav:false),
        libraryListModel(
            id: 2, name:  "Lore", description: "Lore ipsum",imgName:"m02",isPlaying:  false, isFav:false),
        libraryListModel(
            id: 3, name:  "Ipsum", description: "Lore ipsum",imgName:"m03",isPlaying:  false, isFav:false),
        libraryListModel(
            id: 4, name:  "Lore doler", description: "Lore ipsum",imgName:"m04",isPlaying:  false, isFav:false),
        libraryListModel(
            id: 5, name:  "Quler drum", description: "Lore ipsum",imgName:"m05",isPlaying:  false, isFav:false),
        libraryListModel(
            id: 6, name:  "Fin lorem", description: "Lore ipsum",imgName:"m06",isPlaying:  false, isFav:false),
        libraryListModel(
            id: 7, name:  "Lorem", description: "Lore ipsum",imgName:"m",isPlaying:  false, isFav:false),
        libraryListModel(
            id: 8, name:  "Fiorem", description: "Lore ipsum",imgName:"n",isPlaying:  false, isFav:false),
    ]
    
    
     var top10List: [libraryListModel] = [
        libraryListModel(
            id: 1, name:  "My Escape", description: "Lore ipsum",imgName:"m01",isPlaying:  false, isFav:false),
        libraryListModel(
            id: 2, name:  "Lore", description: "Lore ipsum",imgName:"m02",isPlaying:  false, isFav:false),
        libraryListModel(
            id: 3, name:  "Ipsum", description: "Lore ipsum",imgName:"m03",isPlaying:  false, isFav:false),
        libraryListModel(
            id: 4, name:  "Lore doler", description: "Lore ipsum",imgName:"m04",isPlaying:  false, isFav:false),
        libraryListModel(
            id: 5, name:  "Quler drum", description: "Lore ipsum",imgName:"m05",isPlaying:  false, isFav:false),
        libraryListModel(
            id: 6, name:  "Fin lorem", description: "Lore ipsum",imgName:"m06",isPlaying:  false, isFav:false),
        libraryListModel(
            id: 7, name:  "Lorem", description: "Lore ipsum",imgName:"m",isPlaying:  false, isFav:false),
        libraryListModel(
            id: 8, name:  "Fiorem", description: "Lore ipsum",imgName:"n",isPlaying:  false, isFav:false),
        libraryListModel(
            id: 9, name:  "Fiom", description: "Lor ipsum",imgName:"r",isPlaying:  false, isFav:false),
        libraryListModel(
            id: 10, name:  "Fem", description: "Lore ",imgName:"o",isPlaying:  false, isFav:false),
    ]
    
    @Published var currentPlaying = libraryListModel(id: 0, name: "", description: "", imgName: "", isPlaying: false, isFav: false)
}

