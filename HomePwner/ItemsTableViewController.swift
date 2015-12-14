//
//  ItemsTableViewController.swift
//  HomePwner
//
//  Created by Dominic's Macbook Pro on 26/11/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ItemsTableViewController: UITableViewController {

    convenience init() {
        self.init(style: .Plain)
    }
    
    override init(style: UITableViewStyle) {
        super.init(style: style)

        for _ in 0...4 {
            ItemStore.sharedStore.createItem()
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
