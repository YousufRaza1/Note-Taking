//
//  NoteEntity+CoreDataProperties.swift
//
//
//  Created by Md. Masud Rana on 12/20/23.
//
//  This file was automatically generated and should not be edited.
//

import CoreData
import Foundation
import UIKit

@objc(NoteEntity)
class NoteEntity: NSManagedObject {
    @nonobjc class func fetchRequest() -> NSFetchRequest<NoteEntity> {
        return NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
    }

    @NSManaged var attachment: [UIImage]?
    @NSManaged var date: Date?
    @NSManaged var id: UUID?
    @NSManaged var link: String?
    @NSManaged var text: String?
    @NSManaged var title: String?
}

extension NoteEntity: Identifiable {}
