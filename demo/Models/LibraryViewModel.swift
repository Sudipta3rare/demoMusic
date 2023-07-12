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

class LibraryViewModel: ObservableObject{
    
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
    
    @Published var currentPlaying = libraryListModel(id: 0, name: "", description: "", imgName: "", isPlaying: false, isFav: false)
}

