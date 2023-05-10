//
//  OptionScheduleTableViewController.swift
//  TimetableForStudy
//
//  Created by Артем Орлов on 10.05.2023.
//

import UIKit

final class OptionScheduleTableViewController: UITableViewController {
    
    let idOptionsScheduleCell = "idOptionsScheduleCell"
    let idOptionScheduleHeader = "idOptionScheduleHeader"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Option Schedule"
        tableView.register(OptionScheduleTableViewCell.self, forCellReuseIdentifier: idOptionsScheduleCell)
        tableView.register(HeaderOptionScheduleTableViewCell.self, forHeaderFooterViewReuseIdentifier: idOptionScheduleHeader)
        tableView.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
        tableView.separatorStyle = .none
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 2
        case 1: return 4
        case 2: return 1
        case 3: return 1
        default: return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idOptionsScheduleCell, for: indexPath) as? OptionScheduleTableViewCell else { return UITableViewCell()}
        cell.cellConfigure(indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idOptionScheduleHeader) as? HeaderOptionScheduleTableViewCell else { return UITableViewHeaderFooterView()}
        header.headerConfigure(section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? OptionScheduleTableViewCell else { return }
        switch indexPath {
        case [0,0]: alertDate(label: cell.nameCellLabel) { numberWeekday, date in
            print(numberWeekday, date)
        }
        case [0,1]: alertTime(label: cell.nameCellLabel) { date in
            print(date)
        }
        case [1,0]: alertForCellName(label: cell.nameCellLabel, name: "Name Lesson", placeholder: "Enter name lesson")
        case [1,1]: alertForCellName(label: cell.nameCellLabel, name: "Type lesson", placeholder: "Enter type lesson")
        case [1,2]: alertForCellName(label: cell.nameCellLabel, name: "Building number", placeholder: "Enter number of  building ")
        case [1,3]: alertForCellName(label: cell.nameCellLabel, name: "Audience number", placeholder: "Enter number of audience")
        case [2,0]:
            let teachers = TeachersViewController()
            navigationController?.pushViewController(teachers, animated: true)
        case [3,0]: let colors = ScheduleColorViewController()
            navigationController?.pushViewController(colors, animated: true)
        default: print("Tap Option table view")
        }
    }
}
