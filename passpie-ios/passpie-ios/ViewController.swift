//
//  ViewController.swift
//  passpie-ios
//
//  Created by Harjas Monga on 2/24/18.
//  Copyright © 2018 Harjas Monga. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userField: UITextField!
    @IBOutlet weak var repoField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func getRepo(_ sender: Any) {
        ApiManager.sharedInstance.downloadRepo(userName: userField.text!, repoName: repoField.text!)
    }
    

}

