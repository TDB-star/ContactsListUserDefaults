//
//  StorageManager.swift
//  ContactsListUserDefaults
//
//  Created by Tatiana Dmitrieva on 31/08/2021.
//

import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let key = "Contact"
    
    private init() {}
    
    func save(contact: String) {
       var contacts = fetchContact()
        contacts.append(contact)
        userDefaults.set(contacts, forKey: key)
    }
    
    // этим методом я восстанавливаю данные, которые уже записаны в usersDefaults, если usersDefaults пуст, возвращаю пустой массив
    
    func fetchContact() -> [String] {
        if let contacts = userDefaults.value(forKey: key) as? [String] {
            return contacts
        }
        return []
    }
    
    func deleteContact(at index: Int) {
        var contacts = fetchContact()
        contacts.remove(at: index)
        userDefaults.set(contacts, forKey: key)
    }
    
    
}
