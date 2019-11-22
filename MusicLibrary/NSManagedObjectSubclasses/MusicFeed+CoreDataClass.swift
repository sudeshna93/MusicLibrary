//
//  MusicFeed+CoreDataClass.swift
//  MusicLibrary
//
//  Created by Consultant on 11/21/19.
//  Copyright © 2019 Consultant. All rights reserved.
//
//

import Foundation
import CoreData

@objc(MusicFeed)
public class MusicFeed: NSManagedObject ,Decodable {

    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    public override init(entity: NSEntityDescription,insertInto context : NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
        
    }
    
    public required init(from decoder: Decoder) throws {
        //called when we create data from network
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else{
            fatalError("context not found")
        }
        //entity description
        let entity = NSEntityDescription.entity(forEntityName: "", in: context)!
        super.init(entity: entity, insertInto: context)
        
        //rest of decodable's implicit implementation
        let container = try decoder.container(keyedBy: CodingKeys.self)
        results = try container.decode(Results.self, forKey: .results)
        
    }
}
