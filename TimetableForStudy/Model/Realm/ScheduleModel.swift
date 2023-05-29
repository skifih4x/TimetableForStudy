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
    @Persisted var scheduleName = "Unknown"
    @Persisted var scheduleType = "Unknown"
    @Persisted var scheduleBuilding = "Unknown"
    @Persisted var scheduleAudience = "Unknown"
    @Persisted var scheduleTeacher = "Unknown"
    @Persisted var scheduleColor = "1A4766"
    @Persisted var scheduleRepeat = true
    @Persisted var scheduleWeekday = 1    
}
