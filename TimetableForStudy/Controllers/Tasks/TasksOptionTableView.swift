//
//  TasksOptionTableView.swift
//  TimetableForStudy
//
//  Created by Артем Орлов on 10.05.2023.
//

import UIKit

final class TasksOptionTableView: UITableViewController {
    
    let idOptionsTaskCell = "idOptionsTaskCell"
    let idOptionTasksHeader = "idOptionScheduleHeader"
    
    let headerNameArray = ["DATE", "LESSON", "TASK", "COLOR" ]
    
    let cellNameArray = ["Date", "Lesson", "Task", ""]
    
    var hexColorCell = "1A4766"
    
    private var taskModel = TaskModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Option Tasks"
        tableView.register(OptionTableViewCell.self, forCellReuseIdentifier: idOptionsTaskCell)
        tableView.register(HeaderOptionTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionTasksHeader)
        tableView.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
        tableView.separatorStyle = .none
        tableView.bounces = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonTapped))
    }
    
    @objc private func saveButtonTapped() {
        if taskModel.taskDate == nil || taskModel.taskName == "Unknown" {
            alertOk(title: "Error", mesage: "Requered fileds: DATE, LESSON")
        } else {
            taskModel.taskColor = hexColorCell
            RealmManager.shared.saveTaskModel(model: taskModel)
            taskModel = TaskModel()
            alertOk(title: "Succes", mesage: nil)
            hexColorCell = "1A4766"
            tableView.reloadData()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsTaskCell, for: indexPath) as? OptionTableViewCell else { return UITableViewCell()}
        cell.cellTasksConfigure(nameArray: cellNameArray, indexPath: indexPath, hexColor: hexColorCell)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionTasksHeader) as? HeaderOptionTableViewCell else { return UITableViewHeaderFooterView()}
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? OptionTableViewCell else { return }
        switch indexPath.section {
        case 0: alertDate(label: cell.nameCellLabel) { numberWeekday, date in
            self.taskModel.taskDate = date
        }
        case 1: alertForCellName(label: cell.nameCellLabel, name: "Name Lesson", placeholder: "Enter name lesson") { text in
            self.taskModel.taskName = text
        }
        case 2: alertForCellName(label: cell.nameCellLabel, name: "Name Tesk", placeholder: "Enter name task") { text in
            self.taskModel.taskDescription = text
        }
        case 3:
            pushControllers(vc: TaskColorTableViewController())
        default:
            print("Tap Option table view")
        }
    }
    
    func pushControllers(vc: UIViewController) {
        let viewController = vc
        navigationController?.navigationBar.topItem?.title = "Options"
        navigationController?.pushViewController(viewController, animated: true)
    }
}

