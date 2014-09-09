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
    var noteStore = NoteStore.sharedNoteStore
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //DO any Additiona
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return noteStore.allNotes.count
    
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("NoteTableViewCell") as
            NoteTableViewCell!
        
        // Dequeue from the View Controller Stack
        
        if cell == nil {
            //creating a new cell
            cell = NoteTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "NoteTableViewCell")
        }
        
        //this creates a resuable cell
        
        var row = indexPath.row
        var note = noteStore.allNotes[row]
        
        cell.setupCell(note)
        
//      cell.setupCell(notes[IndexPath])
        
        return cell
    
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        editRow = indexPath
        performSegueWithIdentifier("NoteDetailPush", sender: self)
    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "NoteDetailPush" {
            
            //1: Grab the new view controller we are about to show
            
            let noteDetailViewController = segue.destinationViewController as NotesDetailViewController
            
            // 2: If we are in editing mode, pass along the note
            if let row = editRow {
                noteDetailViewController.note = self.noteStore.allNotes[row.row]
            }
            
            // 3: Setup our completion block
            noteDetailViewController.completion = {
                (note) -> () in
                    
                //3a: if coming back from edit mode ...
                    if let editingRow = self.editRow {
                // Don't need to do anythign with the note, we aleady passed it by ref
            
                // 3a1; Update the table
                    self.tableView.reloadRowsAtIndexPaths([self.editRow!], withRowAnimation: UITableViewRowAnimation.Automatic)
                        
                // 3a2: Reset State
                    self.editRow = nil
                        
                    } else {// 3b: if coming back in edit mode (else)
                    
                    // 3b1: Update our array
                    self.noteStore.allNotes.append(note)
                        
                    // 3b2: Update the table
                        
                    var appendPath = NSIndexPath(forRow: self.noteStore.allNotes.count - 1, inSection: 0)
                    self.tableView.insertRowsAtIndexPaths([appendPath], withRowAnimation: UITableViewRowAnimation.Automatic)
                }
            }
        }
    }
}
