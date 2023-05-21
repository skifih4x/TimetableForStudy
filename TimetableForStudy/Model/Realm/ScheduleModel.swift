//
//  ScheduleModel.swift
//  TimetableForStudy
//
//  Created by Артем Орлов on 19.05.2023.
//

import RealmSwift
import Foundation

class ScheduleModel: Object {
    
    @Persisted var scheduleDate = Date()
    @Persisted var scheduleTime = Date()
    @Persisted var scheduleName = ""
    @Persisted var scheduleType = ""
    @Persisted var scheduleBuilding = ""
    @Persisted var scheduleAudience = ""
    @Persisted var scheduleTeacher = "Name Lastname"
    @Persisted var scheduleColor = "FFFFFF"
    @Persisted var scheduleRepeat = true
    @Persisted var scheduleWeekday = 1    
}
