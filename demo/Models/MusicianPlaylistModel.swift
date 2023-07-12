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
