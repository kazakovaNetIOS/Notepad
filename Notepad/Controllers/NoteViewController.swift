//
//  NoteViewController.swift
//  Notepad
//
//  Created by Natalia Kazakova on 09/06/2019.
//  Copyright © 2019 Natalia Kazakova. All rights reserved.
//

import UIKit
import CoreData

class NoteViewController: UIViewController {

    @IBOutlet weak var titleTextView: UITextView!
    @IBOutlet weak var textLabel: UITextView!
    
    var selectedNote: NoteItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextView.text = selectedNote?.title
        textLabel.text = selectedNote?.text
    }
}
