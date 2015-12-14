//
//  ItemStore.swift
//  HomePwner
//
//  Created by Dominic's Macbook Pro on 1/12/2015.
//  Copyright © 2015 Big Nerd Ranch. All rights reserved.
//

import UIKit

class ItemStore: NSObject {

    // MARK: Shared Store

    static let sharedStore = ItemStore()


    // MARK: Instance Variables

    private(set) var items: [Item]

    private override init() {
        items = [Item]()

        super.init()
    }

    func createItem() {
        let item = Item.randomItem()
        items.append(item)
    }
}

/*
 * Model Object for ItemStore
 */
struct Item {

    static func randomItem() -> Item {
        let randomAdjectives = ["Fluffy", "Rusty", "Shiny"]
        let randomNouns = ["Bear", "Spork", "Mac"]

        // Select index of random adjective and noun
        let adjectiveIdx = Int(arc4random()) % randomAdjectives.count
        let nounIdx = Int(arc4random()) % randomNouns.count

        let randomName = "\(randomAdjectives[adjectiveIdx]) \(randomNouns[nounIdx])"
        let randomValue = Int(arc4random()) % 100
        let randomSerial = "0" + String(arc4random() % 10) + "A" + String(arc4random() % 26) + "0" + String(arc4random() % 10) + "A" + String(arc4random() % 26) + "0" + String(arc4random() % 10)

        return Item(name: randomName, value: randomValue, serialNumber: randomSerial)
    }

    let name: String
    let value: Int
    let serialNumber: String
    let date: NSDate
    var description: String {
        return "\(name) (\(serialNumber)): Worth $\(value), recorded on \(date)"
    }

    init(name: String, value: Int = 0, serialNumber: String = "") {
        self.name = name
        self.value = value
        self.serialNumber = serialNumber
        self.date = NSDate()
    }
}