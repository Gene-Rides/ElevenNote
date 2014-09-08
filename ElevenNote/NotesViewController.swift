//
//  ViewController.swift
//  ElevenNote
//
//  Created by ChaCha on 9/8/14.
//  Copyright (c) 2014 ChaCha_gmo. All rights reserved.
//

import UIKit

class NotesViewController: UITableViewController {
    
    var rows = ["Gene", "Joe", "Mark"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DO any Additiona
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return rows.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        var row = indexPath.row
        var rowData = rows[row]
        
        cell.textLabel?.text = rowData
        
        return cell
    }
}

