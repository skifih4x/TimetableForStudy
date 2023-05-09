//
//  TabBarController.swift
//  TimetableForStudy
//
//  Created by Артем Орлов on 09.05.2023.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    func setupTabBar() {
        let scheduleViewController = createNavController(vc: ScheduleViewController(), itemName: "Schedule", itemImage: "calendar.badge.clock")
        let tasksViewController = createNavController(vc: TasksViewController(), itemName: "Tasks", itemImage: "text.badge.checkmark")
        let contactsViewController = createNavController(vc: ContactsViewController(), itemName: "Contacts", itemImage: "rectangle.stack.person.crop")
        
        viewControllers = [scheduleViewController, tasksViewController, contactsViewController]
    }
    
    func createNavController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 10, left: 0, bottom: 0, right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 10)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        return navController
    }
}
