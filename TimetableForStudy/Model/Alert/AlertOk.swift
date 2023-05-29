//
//  AlertOk.swift
//  TimetableForStudy
//
//  Created by Артем Орлов on 21.05.2023.
//

import UIKit

extension UIViewController {
    
    func alertOk(title: String, mesage: String? ) {
        
        let alert = UIAlertController(title: title, message: mesage, preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default)
        alert.addAction(ok)
        
        present(alert, animated: true)
    }
}

