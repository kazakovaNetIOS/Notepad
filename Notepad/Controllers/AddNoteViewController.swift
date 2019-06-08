//
//  AddNoteViewController.swift
//  Notepad
//
//  Created by Natalia Kazakova on 08/06/2019.
//  Copyright © 2019 Natalia Kazakova. All rights reserved.
//

import UIKit

class AddNoteViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var textTextView: UITextView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        let newNote = NoteItem(context: context)
        
        newNote.title = titleTextField.text
        newNote.text = textTextView.text
        
        self.saveNotes()
        
        navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: - Data manipulation methods
    
    func saveNotes() {
        do {
            try context.save()
        } catch {
            print("Error saving notes in context \(error)")
        }
        
        dismiss(animated: true, completion: nil)
    }
}
