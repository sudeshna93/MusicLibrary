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

    @NSManaged public var musicfeed: NSOrderedSet?

}

// MARK: Generated accessors for musicfeed
extension MusicResponse {

    @objc(insertObject:inMusicfeedAtIndex:)
    @NSManaged public func insertIntoMusicfeed(_ value: MusicFeed, at idx: Int)

    @objc(removeObjectFromMusicfeedAtIndex:)
    @NSManaged public func removeFromMusicfeed(at idx: Int)

    @objc(insertMusicfeed:atIndexes:)
    @NSManaged public func insertIntoMusicfeed(_ values: [MusicFeed], at indexes: NSIndexSet)

    @objc(removeMusicfeedAtIndexes:)
    @NSManaged public func removeFromMusicfeed(at indexes: NSIndexSet)

    @objc(replaceObjectInMusicfeedAtIndex:withObject:)
    @NSManaged public func replaceMusicfeed(at idx: Int, with value: MusicFeed)

    @objc(replaceMusicfeedAtIndexes:withMusicfeed:)
    @NSManaged public func replaceMusicfeed(at indexes: NSIndexSet, with values: [MusicFeed])

    @objc(addMusicfeedObject:)
    @NSManaged public func addToMusicfeed(_ value: MusicFeed)

    @objc(removeMusicfeedObject:)
    @NSManaged public func removeFromMusicfeed(_ value: MusicFeed)

    @objc(addMusicfeed:)
    @NSManaged public func addToMusicfeed(_ values: NSOrderedSet)

    @objc(removeMusicfeed:)
    @NSManaged public func removeFromMusicfeed(_ values: NSOrderedSet)

}
