//
//  NewEntryViewController.swift
//  ModernStoic
//
//  Created by Maaz M on 4/21/24.
//

import UIKit

class NewEntryViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var entryField: UITextView!
    
    let placeholderText = "Start Writing..."
    
    var entrytoEdit: Journal?
    var onComposeEntry: ((Journal) -> Void)? = nil
    override func viewDidLoad() {
        
        super.viewDidLoad()

        setupTextView()
        
        if let entry = entrytoEdit {
            titleField.text = entry.title
            entryField.text = entry.entry
            entryField.textColor = .black
            
            self.title = "Edit Journal"
        } else {
            entryField.text = placeholderText
            entryField.textColor = .lightGray // Placeholder text color
        }

        // Do any additional setup after loading the view.
    }
    
    private func setupTextView() {
        
            entryField.delegate = self
            
            // Customize UITextView appearance
            entryField.font = UIFont.systemFont(ofSize: 16)
            entryField.layer.borderColor = UIColor.gray.cgColor
            entryField.layer.borderWidth = 0.5
            entryField.layer.cornerRadius = 5
            entryField.textContainerInset = UIEdgeInsets(top: 12, left: 10, bottom: 12, right: 10) // Adjust the insets as needed
            
            // Set up toolbar with Done button for keyboard
            let toolbar = UIToolbar()
            toolbar.sizeToFit()
            let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissKeyboard))
            toolbar.setItems([flexibleSpace, doneButton], animated: false)
            
            titleField.inputAccessoryView = toolbar
            entryField.inputAccessoryView = toolbar
        }
    
    @objc private func dismissKeyboard() {
            view.endEditing(true)
        }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
           if textView.text == placeholderText {
               textView.text = nil
               textView.textColor = .black
           }
       }
    
    func textViewDidEndEditing(_ textView: UITextView) {
           if textView.text.isEmpty {
               textView.text = placeholderText
               textView.textColor = .lightGray
           }
       }
    
    
    @IBAction func didTapDoneButton(_ sender: Any) {
        guard let title = titleField.text,
              !title.isEmpty
        else {
            // i.
            presentAlert(title: "Remember...", message: "Give your journal entry a title")
            // ii.
            return
        }
        var entry: Journal
        if let editEntry = entrytoEdit {
            entry = editEntry
            
            entry.title = title
            entry.entry = entryField.text
        } else {
            entry = Journal(title: title, entry: entryField.text)
        }
        
        onComposeEntry?(entry)
        dismiss(animated: true)
    }
    
    
    
    @IBAction func didTapCancelButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    private func presentAlert(title: String, message: String) {
        // 1.
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        // 2.
        let okAction = UIAlertAction(title: "OK", style: .default)
        // 3.
        alertController.addAction(okAction)
        // 4.
        present(alertController, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
