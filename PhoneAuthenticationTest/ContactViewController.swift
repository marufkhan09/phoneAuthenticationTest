//
//  ContactViewController.swift
//  PhoneAuthenticationTest
//
//  Created by Maruf Khan on 5/4/21.
//

import UIKit
import Contacts
class ContactViewController: UIViewController {
    //+8801722088068
    
    var contacts = [FetchedContact]()
    @IBOutlet var contactTableView: UITableView!
    
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contactTableView.delegate = self
        contactTableView.dataSource = self
        fetchContacts()

        NotificationCenter.default.addObserver(self, selector: #selector(white(notification:)), name: .white, object: nil)
        
        //green
        NotificationCenter.default.addObserver(self, selector: #selector(green(notification:)), name: .green, object: nil)
        //pink
        NotificationCenter.default.addObserver(self, selector: #selector(pink(notification:)), name: .pink, object: nil)
        //orange
        NotificationCenter.default.addObserver(self, selector: #selector(orange(notification:)), name: .orange, object: nil)
        //blue
        NotificationCenter.default.addObserver(self, selector: #selector(blue(notification:)), name: .blue, object: nil)
        //violet
        NotificationCenter.default.addObserver(self, selector: #selector(violet(notification:)), name: .violet, object: nil)
        }
    
    
    private func fetchContacts() {
        // 1. requesting access
        let store = CNContactStore()
        store.requestAccess(for: .contacts) { (granted, error) in
            if let error = error {
                print("failed to request access", error)
                return
            }
            if granted {
                // 2. fetching
                let keys = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey] as [CNKeyDescriptor]
                let request = CNContactFetchRequest(keysToFetch: keys)
                do {
                    // 3.
                    try store.enumerateContacts(with: request, usingBlock: { (contact, stopPointer) in
                        self.contacts.append(FetchedContact(firstName: contact.givenName, lastName: contact.familyName, telephone: contact.phoneNumbers.first?.value.stringValue ?? ""))
                    })
                } catch let error {
                    print("Failed to enumerate contact", error)
                }
            } else {
                print("access denied")
            }
        }
    }
    
    
    @objc func white(notification: NSNotification){
            print("white block working")
            view.backgroundColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 0.25)
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            contactTableView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    @objc func green(notification: NSNotification) {
            view.backgroundColor = #colorLiteral(red: 0.3669196069, green: 0.7710189223, blue: 0.6353020072, alpha: 0.5075606795)
            contactTableView.backgroundColor = #colorLiteral(red: 0.3669196069, green: 0.7710189223, blue: 0.6353020072, alpha: 1)
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3669196069, green: 0.7710189223, blue: 0.6353020072, alpha: 1)
        }
    @objc func pink(notification: NSNotification) {
            view.backgroundColor = #colorLiteral(red: 1, green: 0.5976218581, blue: 0.6312592626, alpha: 0.25)
            contactTableView.backgroundColor = #colorLiteral(red: 1, green: 0.5976218581, blue: 0.6312592626, alpha: 1)
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 0.5976218581, blue: 0.6312592626, alpha: 1)
        }
    @objc func orange(notification: NSNotification) {
            view.backgroundColor = #colorLiteral(red: 1, green: 0.5965796113, blue: 0.1587926447, alpha: 0.25)
            contactTableView.backgroundColor = #colorLiteral(red: 1, green: 0.5965796113, blue: 0.1587926447, alpha: 1)
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 0.5965796113, blue: 0.1587926447, alpha: 1)
        }
    @objc func blue(notification: NSNotification) {
            view.backgroundColor = #colorLiteral(red: 0, green: 0.5461315513, blue: 0.8974441886, alpha: 0.25)
            contactTableView.backgroundColor = #colorLiteral(red: 0, green: 0.5461315513, blue: 0.8974441886, alpha: 1)
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.5461315513, blue: 0.8974441886, alpha: 1)
        }
    @objc func violet(notification: NSNotification) {
            view.backgroundColor = #colorLiteral(red: 0.3570207357, green: 0.296844393, blue: 0.694029212, alpha: 0.25)
            contactTableView.backgroundColor = #colorLiteral(red: 0.3570207357, green: 0.296844393, blue: 0.694029212, alpha: 1)
            navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.3570207357, green: 0.296844393, blue: 0.694029212, alpha: 1)
        }
    
    

        
}


extension ContactViewController: UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("you tapped me")
    }
}


extension ContactViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactTableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        
        cell.fullName.text = contacts[indexPath.row].firstName + " " + contacts[indexPath.row].lastName
        cell.messeges.text = contacts[indexPath.row].telephone
        
        return cell
    }
}



