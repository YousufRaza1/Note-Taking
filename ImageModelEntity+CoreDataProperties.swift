//
//  ImageModelEntity+CoreDataProperties.swift
//  Note-Taking
//
//  Created by Yousuf on 12/21/23.
//
//

import Foundation
import CoreData
import UIKit


extension ImageModelEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ImageModelEntity> {
        return NSFetchRequest<ImageModelEntity>(entityName: "ImageModelEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var attachment: UIImage?
    @NSManaged public var origin: NoteEntity?

}

extension ImageModelEntity : Identifiable {

}
