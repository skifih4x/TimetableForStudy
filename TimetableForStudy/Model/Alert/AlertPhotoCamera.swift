//
//  PhotoCameraAlert.swift
//  TimetableForStudy
//
//  Created by Артем Орлов on 19.05.2023.
//

import UIKit

extension UIViewController {
    func alertPhotoCamera(completion: @escaping (UIImagePickerController.SourceType) -> Void ) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            let camera = UIImagePickerController.SourceType.camera
            completion(camera)
        }
        
        let photoLibrary = UIAlertAction(title: "Photo", style: .default) { _ in
            let photoLibrary = UIImagePickerController.SourceType.photoLibrary
            completion(photoLibrary)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(camera)
        alertController.addAction(photoLibrary)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
    }
}
