//
//  RepoViewController.swift
//  passpie-ios
//
//  Created by Harjas Monga on 2/24/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import UIKit

class RepoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var paths: [String]? = [""]
    var currentPath: String = ""
    var items: [RepoItem]?
    var selectedItem: RepoItem?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        ApiManager.sharedInstance.loadRepos(path: "") { (items, error) in
            if let items = items {
                self.items = items
                self.tableView.reloadData()
            } else if let error = error {
                print(error)
            }
        }
    }
    @IBAction func logOutButtonPressed(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("didLogout"), object: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let items = items {
            return items.count
        }
        return 0
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell") as! ItemCell
        cell.itemNameLabel.text = items![indexPath.row].fileName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items![indexPath.row]
        if(item.type == "dir") {
            currentPath = item.path
            paths?.append(currentPath)
            ApiManager.sharedInstance.loadRepos(path: "/\(currentPath)") { (items, error) in
                if let items = items {
                    self.items = items
                    self.tableView.reloadData()
                } else if let error = error {
                    print(error)
                }
            }
        } else {
            selectedItem = item
            performSegue(withIdentifier: "showFileSegue", sender: nil)
        }
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        var index = paths!.index(of: currentPath) ?? 0
        print("index is \(index)")
        if index > 0 {
            index -= 1;
            let oldPath = paths![index]
            paths!.remove(at: index + 1)
            print("old path: \(oldPath)")
            ApiManager.sharedInstance.loadRepos(path: "/\(oldPath)") { (items, error) in
                if let items = items {
                    self.items = items
                    self.tableView.reloadData()
                } else if let error = error {
                    print(error)
                }
            }
        } else {
            paths = [""]
            ApiManager.sharedInstance.loadRepos(path: "") { (items, error) in
                if let items = items {
                    self.items = items
                    self.tableView.reloadData()
                } else if let error = error {
                    print(error)
                }
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let fileViewController = segue.destination as! FileViewController
        fileViewController.file = selectedItem
    }
}
