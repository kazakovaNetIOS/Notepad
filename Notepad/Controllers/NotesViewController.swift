//
//  ViewController.swift
//  Notepad
//
//  Created by Natalia Kazakova on 07/06/2019.
//  Copyright © 2019 Natalia Kazakova. All rights reserved.
//

import UIKit
import CoreData

class NotesViewController: UITableViewController {

    var noteArray = [NoteItem]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadNotes()
    }
    
    // MARK: - Table view data source methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "noteCell", for: indexPath)
        cell.textLabel?.text = noteArray[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noteArray.count
    }
    
    // MARK: - Table view delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToNote", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNote" {
            let destinationVC = segue.destination as! NoteViewController
            
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.selectedNote = self.noteArray[indexPath.row]
            }
        }        
    }

    // MARK: - Data manipulation methods
    
    func loadNotes() {
        do {
            noteArray = try context.fetch(NoteItem.fetchRequest())
        } catch {
            print("Error fetching notes from context \(error)")
        }
        
        tableView.reloadData()
    }
    
    // MARK: - Add new note
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "goToAddNote", sender: self)
    }
}

