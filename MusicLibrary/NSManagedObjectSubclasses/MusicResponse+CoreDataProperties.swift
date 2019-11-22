//
//  MusicResponse+CoreDataProperties.swift
//  MusicLibrary
//
//  Created by Consultant on 11/21/19.
//  Copyright © 2019 Consultant. All rights reserved.
//
//

import Foundation
import CoreData


extension MusicResponse {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MusicResponse> {
        return NSFetchRequest<MusicResponse>(entityName: "MusicResponse")
    }

    @NSManaged public var musicfeed: MusicFeed?

}
