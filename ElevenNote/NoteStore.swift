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
        load()
    }
    
    // MARK: Properties
    var allNotes : [Note]!
    
    func deleteNote(noteToDelete:Note) {
        for (i, note) in enumerate(allNotes) {
            if note === noteToDelete {
                allNotes.removeAtIndex(i)
                return
            }
        }
    }
    
    //MARK: Persistence
    
    // 1: Find the file & directory we want to save to
    
    func archiveFilePath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
        let documentsDirectory = paths.objectAtIndex(0) as NSString
        let path = documentsDirectory.stringByAppendingPathComponent("NoteStore.plist")

        return path
    }
    
    //2: Do the save to disk
    func save() {
        NSKeyedArchiver.archiveRootObject(allNotes, toFile: archiveFilePath())
        
        
    }
    //3: Do the reload from
    
    func load() {
        let filePath = archiveFilePath()
        let fileManager = NSFileManager.defaultManager()
        
        if fileManager.fileExistsAtPath(filePath) {
            allNotes = NSKeyedUnarchiver.unarchiveObjectWithFile(filePath) as [Note]
        } else {
            allNotes = [Note]()
            
        }
    }
}



