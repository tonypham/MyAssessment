//
//  ThirdTableViewController.swift
//  MyAssessment
//
//  Created by Tony Pham on 4/14/15.
//  Copyright (c) 2015 Tony Pham. All rights reserved.
//

import UIKit

class ThirdTableViewController: UITableViewController {

    let dateFormatter = NSDateFormatter()
    
    override func viewDidLoad() {
        dateFormatter.dateFormat = "dd MMMM yyyy"
    }
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("DateCell", forIndexPath: indexPath) as! UITableViewCell

        // Configure the cell...
        let dateAtCurrentIndex = NSDate(timeIntervalSinceNow: Double(indexPath.row * 24 * 60 * 60))
        cell.textLabel?.text = dateFormatter.stringFromDate(dateAtCurrentIndex)

        return cell
    }
}
