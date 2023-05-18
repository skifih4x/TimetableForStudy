//
//  ContactsTableViewController.swift
//  TimetableForStudy
//
//  Created by Артем Орлов on 18.05.2023.
//

import UIKit

final class ContactsTableViewController: UITableViewController {
    
    let searchController = UISearchController()
    
    let idContactCell = "idContactCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        title = "Contacts"
        tableView.register(ContactsTableViewCell.self, forCellReuseIdentifier: idContactCell)
        tableView.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
        tableView.separatorStyle = .singleLine
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        
    }
    
    @objc func addButtonTapped() {
        let concatcOption = ContactOptionTableViewController()
        navigationController?.pushViewController(concatcOption, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: idContactCell, for: indexPath) as? ContactsTableViewCell else { return UITableViewCell()}
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapcell")
    }
}

