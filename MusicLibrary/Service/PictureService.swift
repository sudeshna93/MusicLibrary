//
//  PictureService.swift
//  MusicLibrary
//
//  Created by Consultant on 11/18/19.
//  Copyright © 2019 Consultant. All rights reserved.
//

import Foundation

class PictureService{
    //MARK: Properties
    
    let cache: NSCache<NSURL,NSData>
    let networker: DecodableNetwork
    
    //MARK:Initializer
    
    init(_ networker: DecodableNetwork) {
        cache = NSCache()
        self.networker = networker
        
    }
    
    //MARK:Picture access method
    func get (_ url:URL, _ completion: @escaping(Data?)-> Void){
        //if I have it in cache return this value
        
        if let nsURL = NSURL(string: url.absoluteString),
            let val = cache.object(forKey: nsURL) {
            let data = Data(referencing: val)
            completion(data)
            return
        }
        
        //
       // fetch it from networker
        
        networker.getData(url) { (data) in
            //save it in the cache for use later
            
            if let data = data,
                let nsURL = NSURL(string: url.absoluteString){
                let nsData = NSData(data: data)
                self.cache.setObject(nsData, forKey: nsURL)
            }
            completion(data)
        }
        
    }
    
    
}




