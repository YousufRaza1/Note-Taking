//
//  UIImageTransformer.swift
//  Note-Taking
//
//  Created by Yousuf on 11/28/23.
//

import Foundation
import UIKit

class UIImageTransformer: ValueTransformer {
    override func transformedValue(_ value: Any?) -> Any? {
        guard let image = value as? UIImage else { return nil }

        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: image, requiringSecureCoding: false)
            return data
        } catch {
            return nil
        }
    }

    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let data = value as? Data else { return nil }

        do {
            if let image = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? UIImage {
                return image
            }
        } catch {
            return nil
        }
        return nil
    }
}

//class UIImageTransformer: ValueTransformer {
//    override class func transformedValueClass() -> AnyClass {
//        return NSData.self
//    }
//
//    override class func allowsReverseTransformation() -> Bool {
//        return true
//    }
//
//    override func transformedValue(_ value: Any?) -> Any? {
//        guard let imageModels = value as? [ImageModel] else { return nil }
//
//        var encodedImages: [Data] = []
//
//        for imageModel in imageModels {
//            do {
//                let data = try NSKeyedArchiver.archivedData(withRootObject: imageModel.image, requiringSecureCoding: false)
//                encodedImages.append(data)
//            } catch {
//                return nil
//            }
//        }
//
//        return encodedImages
//    }
//
//    override func reverseTransformedValue(_ value: Any?) -> Any? {
//        guard let dataArray = value as? [Data] else { return nil }
//
//        var decodedImageModels: [ImageModel] = []
//
//        for imageData in dataArray {
//            do {
//                if let image = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(imageData) as? UIImage {
//                    let imageModel = ImageModel(image: image) // Generate ID or use your own ID logic
//                    decodedImageModels.append(imageModel)
//                }
//            } catch {
//                return nil
//            }
//        }
//
//        return decodedImageModels
//    }
//}

//
//class UIImageTransformer: ValueTransformer {
//    override func transformedValue(_ value: Any?) -> Any? {
//        guard let images = value as? [ImageModel] else { return nil }
//
//        var encodedImages: [Data] = []
//
//        for image in images {
//            do {
//                let data = try NSKeyedArchiver.archivedData(withRootObject: image, requiringSecureCoding: false)
//                encodedImages.append(data)
//            } catch {
//                return nil
//            }
//        }
//
//        return encodedImages
//    }
//
//    override func reverseTransformedValue(_ value: Any?) -> Any? {
//        guard let dataArray = value as? [Data] else { return nil }
//
//        var decodedImages: [ImageModel] = []
//
//        for imageData in dataArray {
//            do {
//                if let image = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(imageData) as? ImageModel {
//                    decodedImages.append(image)
//                }
//            } catch {
//                return nil
//            }
//        }
//
//        return decodedImages
//    }
//}
