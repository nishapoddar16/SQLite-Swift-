//
//  ViewController.swift
//  SQLite(Test)
//
//  Created by nishapoddar on 29/07/19.
//  Copyright © 2019 Nisha Poddar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("abc")
        DBManager.shared.createDatabase()
        DBManager.shared.createTable()
        DBManager.shared.insertInTable()
        DBManager.shared.getTable()
        DBManager.shared.updateTable()
        DBManager.shared.getTable()
        DBManager.shared.deleteData()
        DBManager.shared.getTable()
    }


}

