//
//  NoteStore.swift
//  ElevenNote
//
//  Created by ChaCha on 9/9/14.
//  Copyright (c) 2014 ChaCha_gmo. All rights reserved.
//

import UIKit

class NoteStore {
    //MARK: Singleton pattern of the week
    class var sharedNoteStore : NoteStore {
    struct Static {
        static let instance : NoteStore = NoteStore()
        }
        return Static.instance
    }
    private init() {
        allNotes = [Note]()
    }
    
    // MARK: Properties
    var allNotes : [Note]
    
}
