//
//  VcMenu.swift
//  FormPaging
//
//  Created by Tushar on 30/05/24.
//

import UIKit

class VcMenu: UIViewController {
    
    @IBOutlet weak var tvMenu: UITableView!
    let menuItems = ["Basic Details", "Address Details", "Other Details", "LogOut"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ConfigUI()
    }
    
    func ConfigUI()  {
        tvMenu.delegate = self
        tvMenu.dataSource = self
    }
}

extension VcMenu: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CvCellMenu", for: indexPath)
        cell.textLabel?.text = menuItems[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMenuItem = menuItems[indexPath.row]
        NotificationCenter.default.post(name: NSNotification.Name("MenuSelectionNotification"), object: selectedMenuItem)
        dismiss(animated: true, completion: nil)
    }
}
