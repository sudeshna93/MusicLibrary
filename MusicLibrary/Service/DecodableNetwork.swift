//
//  DecodableNetwork.swift
//  MusicLibrary
//
//  Created by Consultant on 11/18/19.
//  Copyright © 2019 Consultant. All rights reserved.
//

import Foundation

class DecodableNetwork{
    //MARK: Properties
    
    var decoder = JSONDecoder()
    var session : URLSession
    var coreData = CoreDataManager()
    
    //keep track of exixting task
    
    var currentTask : [URL: URLSessionTask] = [:]
    
    //MARK: Initializer
    
    init(_ session: URLSession) {
        decoder.userInfo[.context] = coreData.mainMOC
        self.session = session
    }
    
    //MARK: Networking Methods
    func getData(_ url: URL, _ completion: @escaping (Data?) -> Void){
        //if I already enqueued a task, cancel an exiting task
        cancelTask(url)
        //mask a new task
        let task = session.dataTask(with: url){(data,_,_) in
            completion(data)
            
        }
        //keep tack of new task
        currentTask[url] = task
        
        //artificial delay
        let delay = Double.random(in: 0.5...2.0)
        let dispatchTask: ()-> Void = {
            task.resume()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: dispatchTask)
    }
    
    //cancel the task
    func cancelTask(_ url: URL){
        if let current = currentTask[url]{
            current.cancel()
        }
    }
    //
    func get <T: Decodable>(type: T.Type, url: URL, _ completion: @escaping (T?)->Void) {
        session.dataTask(with: url) { (data, resp, _) in
            guard let data = data else{
                return
            }
            do{
                let result = try self.decoder.decode(type, from: data)
                completion(result)
                
            }
            catch{
                print(error)
                completion(nil)
            }
        }.resume()
    }
    
    
}

extension DecodableNetwork {
    
    convenience init() {
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        self.init(session)
    }
    
    convenience init(_ config: URLSessionConfiguration) {
        let session = URLSession(configuration: config)
        // self.session = session
        self.init(session)
    }
}
