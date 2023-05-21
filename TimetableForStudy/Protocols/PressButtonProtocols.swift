//
//  PressButtonProtocols.swift
//  TimetableForStudy
//
//  Created by Артем Орлов on 10.05.2023.
//

import Foundation

protocol PressReadyTaskButtonProtocol: AnyObject {
    func readyButtonTapped(indexPath: IndexPath)
}

protocol SwitchRepeatProtocol: AnyObject {
    func switchRepeat(value: Bool)
}
