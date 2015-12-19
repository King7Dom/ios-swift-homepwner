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

        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")

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
        let (sortedOverArray, sortedUnderArray) = ItemStore.sharedStore.itemOver(50)
        let sortedArrays = [sortedOverArray, sortedUnderArray]
        return sortedArrays.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let (sortedOverArray, sortedUnderArray) = ItemStore.sharedStore.itemOver(50)
        let sortedArrays = [sortedOverArray, sortedUnderArray]
        return sortedArrays[section].count + 1  // To present "No more items"
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("UITableViewCell", forIndexPath: indexPath)

        let (sortedOverArray, sortedUnderArray) = ItemStore.sharedStore.itemOver(50)
        let sortedArrays = [sortedOverArray, sortedUnderArray]
        let section = sortedArrays[indexPath.section]
        if indexPath.row < section.count {
            let item = section[indexPath.row]
            cell.textLabel?.text = item.description
        } else {
            cell.textLabel?.text = "No more items"
        }
        return cell
    }

    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        var height: CGFloat = 44.0;
        let (sortedOverArray, sortedUnderArray) = ItemStore.sharedStore.itemOver(50)
        let sortedArrays = [sortedOverArray, sortedUnderArray]
        let section = sortedArrays[indexPath.section]

        if indexPath.row < section.count {
            height = 60.0
        }
        return height
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let (sortedOverArray, sortedUnderArray) = ItemStore.sharedStore.itemOver(50)
        let sortedArrays = [sortedOverArray, sortedUnderArray]

        guard let item = sortedArrays[section].first else {
            return nil
        }

        if item.value > 50 {
            return "Over 50"
        } else {
            return "Under 50"
        }
    }
}
