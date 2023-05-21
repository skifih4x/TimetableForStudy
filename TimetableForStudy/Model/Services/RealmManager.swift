//
//  RealmManager.swift
//  TimetableForStudy
//
//  Created by Артем Орлов on 19.05.2023.
//

import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    
    private init() {}
    
    let localRealm = try! Realm()
    
    func saveScheduleModel(model: ScheduleModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
}
