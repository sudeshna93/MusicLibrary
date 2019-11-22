//
//  MusicFeed+CoreDataProperties.swift
//  MusicLibrary
//
//  Created by Consultant on 11/21/19.
//  Copyright © 2019 Consultant. All rights reserved.
//
//

import Foundation
import CoreData


extension MusicFeed {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MusicFeed> {
        return NSFetchRequest<MusicFeed>(entityName: "MusicFeed")
    }

    @NSManaged public var response: MusicResponse?
    @NSManaged public var results: Results?

}
