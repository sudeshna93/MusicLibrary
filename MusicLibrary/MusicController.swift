//
//  MusicController.swift
//  MusicLibrary
//
//  Created by Consultant on 11/18/19.
//  Copyright © 2019 Consultant. All rights reserved.
//

import Foundation


protocol MusicControllerProtocol {
    var musics :[Results] { get }
    var isSearching: Bool { get }
    func download(_ completion: @escaping ([Results])-> Void)
    
    func search(query: String) -> [Results]
    func getPicture(_ url: URL, _ completion: @escaping (Data?) -> Void)
    func cancelTask (_ oldUrl: URL)
    
}

class MusicController : MusicControllerProtocol{
    
    //MARK:Properties
    
    private var _musics: [Results] = []
    
    //filtered copy
    var musics: [Results] = []
    let networker = DecodableNetwork()
    var isSearching: Bool = false
    lazy var pictureservice : PictureService = {
        return PictureService(networker)
    }()
    
    init() { }
    
   
    //MARK:Methods
    func download(_ completion: @escaping ([Results]) -> Void) {
        if musics.isEmpty == false{
            completion(musics)
            return
        }
        
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/itunes-music/top-albums/all/100/explicit.json")!
        networker.get(type: MusicResponse.self, url: url) { (result) in
            print("finished download")
            self._musics = (result?.musicfeed.results)!
            self.musics = self._musics
            completion(self.musics)
            
        }
    }
    
   func search(query: String) -> [Results] {
    if query.isEmpty {
       isSearching = false
        musics = _musics
    }
    else{
        musics = _musics.filter {$0.albumName?.lowercased().prefix(query.count) == query.lowercased().prefix(query.count)}
        isSearching = true
    }
    return musics
}
      
      func getPicture(_ url: URL, _ completion: @escaping (Data?) -> Void) {
        pictureservice.get(url, completion)
      }
      
      func cancelTask(_ oldUrl: URL) {
        networker.cancelTask(oldUrl)
      }
      
    
}
