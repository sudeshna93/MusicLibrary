//
//  MusicResponse+CoreDataClass.swift
//  MusicLibrary
//
//  Created by Consultant on 11/21/19.
//  Copyright © 2019 Consultant. All rights reserved.
//
//

import Foundation
import CoreData

@objc(MusicResponse)
public class MusicResponse: NSManagedObject ,Decodable {
    enum CodingKeys: String, CodingKey {
        case musicfeed = "feed"
    }
    
    //called when we load in data from disk
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?){
        super.init(entity: entity, insertInto: context)
    }
    
    //called when we create the data from the network
    public required init(from decoder: Decoder) throws {
        //context
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else {
            fatalError("context not found")
        }
        
        //entity description
        
        let entity = NSEntityDescription.entity(forEntityName: "feed", in: context)!
        super.init(entity: entity, insertInto: context)
        
        //Rest of Decodable's implicit implementation
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let musicArr = try container.decode([MusicFeed], forKey: .musicfeed)
        musicfeed = NSOrderedSet(array: musicArr)
        
    }
    
    
}
