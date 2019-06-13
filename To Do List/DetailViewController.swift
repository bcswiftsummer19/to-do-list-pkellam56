//
//  DetailViewController.swift
//  To Do List
//
//  Created by Paul Kellam on 6/11/19.
//  Copyright © 2019 Paul Kellam. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
    @IBOutlet weak var toDoField: UITextField!
    
    @IBOutlet weak var toDoNoteView: UITextView!
    
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    var toDoItem: String?
    var toDoNoteItem: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let toDoItem = toDoItem {
            toDoField.text = toDoItem
        }
        if let toDoNoteItem = toDoNoteItem {
            toDoField.text = toDoNoteItem
        }
        enableDisableSaveButton()
        toDoField.becomeFirstResponder()
    }
    func enableDisableSaveButton() {
        if let toDoFieldCount = toDoField.text?.count, toDoFieldCount > 0 {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
    }
    
    // not allowing another closed squigly here^
    //not letting override happen...
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "UnwindFromSave" {
            toDoItem = toDoField.text
        }
    }
    
    @IBAction func toDoFieldChanged(_ sender: UITextField) {
        enableDisableSaveButton()
    }
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        let isPresentinginAddMode = presentingViewController is UINavigationController
        if isPresentinginAddMode {
            dismiss(animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
}

