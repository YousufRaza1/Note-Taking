//
//  NoteEntity+CoreDataProperties.swift
//  Note-Taking
//
//  Created by Yousuf on 12/21/23.
//
//

import Foundation
import CoreData


extension NoteEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteEntity> {
        return NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
    }

    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var text: String?
    @NSManaged public var title: String?
    @NSManaged public var attachment: NSSet?
    
    public var attachments: [ImageModelEntity] {
        let set = attachment as? Set<ImageModelEntity> ?? []
        
        return Array(set)
    }

}

// MARK: Generated accessors for attachment
extension NoteEntity {

    @objc(addAttachmentObject:)
    @NSManaged public func addToAttachment(_ value: ImageModelEntity)

    @objc(removeAttachmentObject:)
    @NSManaged public func removeFromAttachment(_ value: ImageModelEntity)

    @objc(addAttachment:)
    @NSManaged public func addToAttachment(_ values: NSSet)

    @objc(removeAttachment:)
    @NSManaged public func removeFromAttachment(_ values: NSSet)

}

extension NoteEntity : Identifiable {

}
