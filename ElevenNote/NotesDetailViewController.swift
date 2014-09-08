//
//  ViewController.swift
//  ElevenNote
//
//  Created by ChaCha on 9/8/14.
//  Copyright (c) 2014 ChaCha_gmo. All rights reserved.
//

import UIKit

class NotesDetailViewController: UIViewController {
   
    var titleText: String = ""
    
    var completion : (    (String) -> () )?
    var cancel : (() -> ())?
    
    @IBOutlet weak var titleField: UITextField!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.text = titleText
    }

//    @IBOutlet weak var titleLabel: UILabel!
    

    
    @IBAction func SaveTapped(sender: AnyObject) {
        if let doSave = completion {
            doSave(titleField!.text!)
        }
        if self.navigationController != nil {
            self.navigationController!.popViewControllerAnimated(true)
        }
    
    }
    @IBAction func CancelTapped(sender: AnyObject) {
    
        if let doCancel = cancel {
            doCancel()
        }
        if self.navigationController != nil {
            self.navigationController!.popViewControllerAnimated(true)
        }
    }
}

