//
//  UIImageTransformer.swift
//  Note-Taking
//
//  Created by Md. Masud Rana on 12/20/23.
//

import Foundation
import UIKit

class UIImageTransformer: ValueTransformer {
    override func transformedValue(_ value: Any?) -> Any? {
        guard let images = value as? [UIImage] else { return nil }

        var encodedImages: [Data] = []

        for image in images {
            do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: image, requiringSecureCoding: false)
                encodedImages.append(data)
            } catch {
                return nil
            }
        }

        return encodedImages
    }

    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let dataArray = value as? [Data] else { return nil }

        var decodedImages: [UIImage] = []

        for imageData in dataArray {
            do {
                if let image = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(imageData) as? UIImage {
                    decodedImages.append(image)
                }
            } catch {
                return nil
            }
        }

        return decodedImages
    }
}
