//
//  ViewController.swift
//  ElevenNote
//
//  Created by ChaCha on 9/8/14.
//  Copyright (c) 2014 ChaCha_gmo. All rights reserved.
//

import UIKit

class NotesViewController: UITableViewController {
    
    var editRow : NSIndexPath?
    var notes = [Note]() //["Gene", "Joe", "Mark", "Don"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DO any Additiona
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notes.count
    
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Something")
        var row = indexPath.row
        var note = notes[row]
        
        cell.textLabel?.text = note.title
        cell.detailTextLabel?.text = note.text
        
        return cell
    
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        editRow = indexPath
        performSegueWithIdentifier("NotesDetailViewControllerSegue", sender: self)
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "NotesDetailViewControllerSegue" {
        
            let noteDetailViewController = segue.destinationViewController as
                NotesDetailViewController
        
        if let editingRow = editRow {
            noteDetailViewController.note = notes[editingRow.row]
            
            noteDetailViewController.completion = {
                (note) -> () in
               
                // Update the array
                self.notes[editingRow.row] =  note
                
                //
                self.tableView.reloadRowsAtIndexPaths([self.editRow!], withRowAnimation: UITableViewRowAnimation.Automatic)
                
                //Reset State
                self.editRow = nil
                
            }
            
            noteDetailViewController.cancel = {
                self.editRow = nil
            }
        }
        
    } else if segue.identifier == "AddSegue" {
        
            let noteDetailViewController = segue.destinationViewController as NotesDetailViewController
            
            noteDetailViewController.completion = {
                (note) -> () in
                    
               // self.rows.append(newTitleText)
                self.notes.append(note)
            
                //Update the table
                    
                var appendPath = NSIndexPath(forRow: self.notes.count - 1, inSection: 0)
                self.tableView.insertRowsAtIndexPaths([appendPath], withRowAnimation: UITableViewRowAnimation.Automatic)
                    
            }
            
        }
    }
}
