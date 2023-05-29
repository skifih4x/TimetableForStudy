//
//  ContactModel.swift
//  TimetableForStudy
//
//  Created by Артем Орлов on 29.05.2023.
//

import Foundation
import RealmSwift

class ContactModel: Object {
    
    @Persisted var contactName = "Unknown"
    @Persisted var contactPhone = "Unknown"
    @Persisted var contactMain = "Unknown"
    @Persisted var contactType = "Unknown"
    @Persisted var contactImage: Date?
}
