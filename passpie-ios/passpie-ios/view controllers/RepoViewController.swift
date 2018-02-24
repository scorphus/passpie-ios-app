//
//  RepoViewController.swift
//  passpie-ios
//
//  Created by Harjas Monga on 2/24/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import UIKit

class RepoViewController: UIViewController, UITableViewDataSource {
    
    var items: [RepoItem]?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items!.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        cell.itemNameLabel.text = items![indexPath.row].fileName
        return cell
    }

}
