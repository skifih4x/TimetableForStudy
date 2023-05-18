//
//  AlertFrendOrTeacher.swift
//  TimetableForStudy
//
//  Created by Артем Орлов on 18.05.2023.
//

import UIKit

extension UIViewController {
    func alertFriendOrTeacher(lable: UILabel, completion: @escaping (String) -> Void ) {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let frend = UIAlertAction(title: "Friend", style: .default) { _ in
            lable.text = "Friend"
            let typeContact = "Friend"
            completion(typeContact)
        }
        
        let teacher = UIAlertAction(title: "Teacher", style: .default) { _ in
            lable.text = "Teacher"
            let typeContact = "Teacher"
            completion(typeContact)
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(frend)
        alertController.addAction(teacher)
        alertController.addAction(cancel)
        
        present(alertController, animated: true)
    }
}
