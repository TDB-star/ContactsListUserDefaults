//
//  DetailViewController.swift
//  ContactsListUserDefaults
//
//  Created by Tatiana Dmitrieva on 31/08/2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var delegate: NewContactViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        doneButton.isEnabled = false
        
        firstNameTextField.addTarget(self, action: #selector(textDidChanged), for: .editingChanged)
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        saveNewContact()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @objc private func textDidChanged() {
        
        guard let firstName = firstNameTextField.text else {return}
        doneButton.isEnabled = !firstName.isEmpty ? true : false
    }
    
    private func saveNewContact() {
        guard let firstName = firstNameTextField.text else { return }
        guard let lastName = lastNameTextField.text else { return }
        delegate.saveContact("\(firstName) \(lastName)")
        dismiss(animated: true)
        
    }
}
