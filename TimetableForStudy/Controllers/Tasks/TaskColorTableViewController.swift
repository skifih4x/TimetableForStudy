//
//  TaskColorTableViewController.swift
//  TimetableForStudy
//
//  Created by Артем Орлов on 10.05.2023.
//

import UIKit

final class TaskColorTableViewController: UITableViewController {
    
    let idTasksColorCell = "idTasksColorCell"
    let idTaskScheduleHeader = "idTaskScheduleHeader"
    
    let headerNameArray = ["RED", "ORANGE", "YELLOW", "GREEN", "BLUE", "DEEP BLUE", "PURPLE"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Color Tasks"
        tableView.register(ColorыTableViewCell.self, forCellReuseIdentifier: idTasksColorCell)
        tableView.register(HeaderOptionTableViewCell.self, forHeaderFooterViewReuseIdentifier: idTaskScheduleHeader)
        tableView.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
        tableView.separatorStyle = .none
        tableView.bounces = false
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func setColors(color: String) {
        let taskOption = self.navigationController?.viewControllers[1] as? TasksOptionTableView
        taskOption?.hexColorCell = color
        taskOption?.tableView.reloadRows(at: [[3,0]], with: .none)
        self.navigationController?.popViewController(animated: true)
     }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        7
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idTasksColorCell, for: indexPath) as? ColorыTableViewCell else { return UITableViewCell()}
        cell.cellConfigure(indexPath: indexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: idTaskScheduleHeader) as? HeaderOptionTableViewCell else { return UITableViewHeaderFooterView()}
        header.headerConfigure(nameArray: headerNameArray, section: section)
        return header
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        30
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0: setColors(color: "BE2813")
        case 1: setColors(color: "F07F5A")//F07F5A
        case 2: setColors(color: "F3AF22")//F3AF22
        case 3: setColors(color: "467C24")//467C24
        case 4: setColors(color: "2D7FC1")//2D7FC1
        case 5: setColors(color: "1A4766")//1A4766
        case 6: setColors(color: "2D038F")//2D038F
        default: setColors(color: "FFFFFF")
        }
    }
}
