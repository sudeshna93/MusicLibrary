//
//  Results+CoreDataProperties.swift
//  MusicLibrary
//
//  Created by Consultant on 11/21/19.
//  Copyright © 2019 Consultant. All rights reserved.
//
//

import Foundation
import CoreData


extension Results {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Results> {
        return NSFetchRequest<Results>(entityName: "Results")
    }

    @NSManaged public var albumName: String?
    @NSManaged public var artistName: String?
    @NSManaged public var copyRight: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var thumbnailImage: String?
    @NSManaged public var url: String?
    @NSManaged public var musicfeed: MusicFeed?

}
