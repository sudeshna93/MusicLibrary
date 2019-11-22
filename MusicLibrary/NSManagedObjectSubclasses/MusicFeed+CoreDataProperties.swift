//
//  MusicFeed+CoreDataProperties.swift
//  MusicLibrary
//
//  Created by Consultant on 11/22/19.
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
    @NSManaged public var results: NSSet?

}

// MARK: Generated accessors for results
extension MusicFeed {

    @objc(addResultsObject:)
    @NSManaged public func addToResults(_ value: Results)

    @objc(removeResultsObject:)
    @NSManaged public func removeFromResults(_ value: Results)

    @objc(addResults:)
    @NSManaged public func addToResults(_ values: NSSet)

    @objc(removeResults:)
    @NSManaged public func removeFromResults(_ values: NSSet)

}

extension MusicFeed {
    var resultsArray: [Results] {
        if let results = results {
            return results.allObjects as! [Results]
        }
        return []
    }
}
