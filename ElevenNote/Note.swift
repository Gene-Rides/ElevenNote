//
//  Note.swift
//  ElevenNote
//
//  Created by ChaCha on 9/9/14.
//  Copyright (c) 2014 ChaCha_gmo. All rights reserved.
//

import Foundation

class Note : NSObject, NSCoding{

    var title = ""
    var text = ""
    var date = NSDate()
    
    var shortDate: NSString {
        let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "MM/dd/yy"
            return dateFormatter.stringFromDate(self.date)
    }
    
    override init() {
        super.init()
    }
    
    // 1: Encode ourselves
    
    func encodeWithCoder(aCoder: NSCoder) {
        
        aCoder.encodeObject(title, forKey: "title")
        aCoder.encodeObject(text, forKey: "text")
        aCoder.encodeObject(date, forKey: "date")
    }
    
    // 2: Decode on init
    required init(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObjectForKey("title") as String
        self.text = aDecoder.decodeObjectForKey("text") as String
        self.date = aDecoder.decodeObjectForKey("date") as NSDate
    }
    
    
    
}
