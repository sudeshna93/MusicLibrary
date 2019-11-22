//
//  Results+CoreDataClass.swift
//  MusicLibrary
//
//  Created by Consultant on 11/21/19.
//  Copyright © 2019 Consultant. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Results)
public class Results: NSManagedObject, Decodable {
    enum CodingKeys: String, CodingKey {
        case artistName = "artistName"
        case albumName = "name"
        case thumbnailImage = "artworkUrl100"
        case url = "url"
        case releaseDate = "releaseDate"
        case copyRight = "copyright"
        
    }
    
    public override init (entity: NSEntityDescription, insertInto context: NSManagedObjectContext?){
        super.init(entity: entity, insertInto: context)
    }
    
    //called when we create the data from network
    public required init(from decoder: Decoder) throws {
        //context
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else{
            fatalError("context not found ")
        }
        //entity description
        let entity = NSEntityDescription.entity(forEntityName: "Results", in: context)!
        super.init(entity: entity, insertInto: context)
        
        // rest of Decodable's implicit implementation
        let container = try decoder.container(keyedBy: CodingKeys.self)
        artistName = try container.decode(String.self,
                                          forKey: .artistName)
        
        albumName = try container.decode(String.self,
        forKey: .artistName)
        thumbnailImage = try container.decode(String.self,
        forKey: .thumbnailImage)
        
        url = try container.decode(String.self,
        forKey: .url)
        releaseDate = try container.decode(String.self,
        forKey: .releaseDate)
        copyRight = try container.decode(String.self,
        forKey: .copyRight)
    }
}
