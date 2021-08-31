//
//  ViewController.swift
//  ContactsListUserDefaults
//
//  Created by Tatiana Dmitrieva on 31/08/2021.
//

import UIKit

protocol NewContactViewControllerDelegate {
    func saveContact(_ contact: String)
}

class ContactsViewController: UIViewController {
    
    private var contacts: [String] = []

    @IBOutlet weak var contactsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let newContactVC = segue.destination as! DetailViewController
        newContactVC.delegate = self
    }
}

extension ContactsViewController: UITableViewDataSource, UITableViewDelegate, NewContactViewControllerDelegate {
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactsTableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)
        
        let contact = contacts[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = contact
        cell.contentConfiguration = content
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            contacts.remove(at: indexPath.row)
            contactsTableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func saveContact(_ contact: String) {
        contacts.append(contact)
        contactsTableView.reloadData()
    }
}
