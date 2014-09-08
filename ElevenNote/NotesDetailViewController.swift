//
//  ViewController.swift
//  ElevenNote
//
//  Created by ChaCha on 9/8/14.
//  Copyright (c) 2014 ChaCha_gmo. All rights reserved.
//

import UIKit

class NotesDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = titleText
    }

    @IBOutlet weak var titleLabel: UILabel!
    
    var titleText: String = ""
    
}

