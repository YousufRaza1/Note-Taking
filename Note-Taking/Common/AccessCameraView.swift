//
//  AccessCameraView.swift
//  Note-Taking
//
//  Created by Yousuf on 12/21/23.
//

import SwiftUI
import UIKit
import PhotosUI

struct ImageVideoCapturer: UIViewControllerRepresentable {
    private let defaultCaptureMode: UIImagePickerController.CameraCaptureMode // .video or .photo
    private let allowedMediaType: [String]
    private let onSuccess: (UIImage, URL?) -> Void

    init(
        defaultCaptureMode: UIImagePickerController.CameraCaptureMode,
        allowedMediaType: [UTType] = [UTType.movie, UTType.image],
        onSuccess: @escaping (UIImage, URL?) -> Void
    ) {
        self.defaultCaptureMode = defaultCaptureMode
        self.allowedMediaType = allowedMediaType.map { $0.identifier }
        self.onSuccess = onSuccess
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = .camera
        picker.mediaTypes = allowedMediaType
        picker.cameraCaptureMode = defaultCaptureMode
        picker.videoMaximumDuration = 60 * 10 // Seconds

        print("picker.videoMaximumDuration: \(picker.videoMaximumDuration) seconds")
        print("picker.videoQuality: \(picker.videoQuality)")

        picker.delegate = context.coordinator

        return picker
    }

    func updateUIViewController(_: UIImagePickerController, context _: Context) {
        // no-op
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        private let parent: ImageVideoCapturer

        init(_ parent: ImageVideoCapturer) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            // Check for the media type
            let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! String

            switch mediaType {
            case UTType.image.identifier:
                // Handle image selection result
                print("Selected media is image")

                if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
                    parent.onSuccess(editedImage, nil)
                } else if let originalImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                    parent.onSuccess(originalImage, nil)
                }

            case UTType.movie.identifier:
                // Handle video selection result
                print("Selected media is video")

                let videoUrl = info[UIImagePickerController.InfoKey.mediaURL] as! URL

                // Help: https://www.swiftdevcenter.com/get-thumbnail-from-video-url-in-background-swift/
                DispatchQueue.global().async {
                    let asset = AVAsset(url: videoUrl)
                    let avAssetImageGenerator = AVAssetImageGenerator(asset: asset)
                    avAssetImageGenerator.appliesPreferredTrackTransform = true

                    let thumbnailTime = CMTimeMake(value: 2, timescale: 1)
                    let cgImage = try? avAssetImageGenerator.copyCGImage(at: thumbnailTime, actualTime: nil)
                    if let cgImage = cgImage {
                        let thumbnailImage = UIImage(cgImage: cgImage)

                        self.parent.onSuccess(thumbnailImage, videoUrl)
                    }
                }

            default:
                print("Mismatched type: \(mediaType)")
            }

            picker.dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
