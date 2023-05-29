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
    
    func deleteScheduleModel(model: ScheduleModel) {
        try! localRealm.write({
            localRealm.delete(model)
        })
    }
    
    func saveTaskModel(model: TaskModel) {
        try! localRealm.write({
            localRealm.add(model)
        })
    }
    
    func deleteTaskModel(model: TaskModel) {
        try! localRealm.write({
            localRealm.delete(model)
        })
    }
    
    func updateReadyButtonTaskModel(task: TaskModel, bool: Bool) {
        try! localRealm.write({
            task.taskReady = bool
        })
    }
    
    func saveContactModel(model: ContactModel) {
        try! localRealm.write({
            localRealm.add(model)
        })
    }
    
    func deleteContactModel(model: ContactModel) {
        try! localRealm.write({
            localRealm.delete(model)
        })
    }
}
