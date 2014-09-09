//
//  Note.swift
//  ElevenNote
//
//  Created by ChaCha on 9/9/14.
//  Copyright (c) 2014 ChaCha_gmo. All rights reserved.
//

import Foundation

class Note
{
    var title = ""
    var text = ""
    var date = NSDate()
    
    var shortDate: NSString {
        let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "MM/dd/yy"
            return dateFormatter.stringFromDate(self.date)
    }
    
}
