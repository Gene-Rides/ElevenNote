//
//  NoteTableViewCell.swift
//  ElevenNote
//
//  Created by ChaCha on 9/9/14.
//  Copyright (c) 2014 ChaCha_gmo. All rights reserved.
//

import UIKIt

class NoteTableViewCell : UITableViewCell {

    @IBOutlet weak var noteTitle: UILabel!
    @IBOutlet weak var noteDate: UILabel!
    @IBOutlet weak var noteContent: UILabel!

    
    func setupCell (theNote: Note) {
        
        noteTitle.text = theNote.title
        noteDate.text = theNote.shortDate
        noteContent.text = theNote.text
        
    }

}

