//
//  ViewController.swift
//  mvc_example
//
//  Created by Oliver Mastny on 31/12/2016.
//  Copyright © 2016 Oliver Mastny. All rights reserved.
//

import UIKit

class PersonsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var persons = [Person]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateView()
    }
    
    private func updateView() {
        if let objects = RealmService.sharedInstance.get(objectType: Person.self), let persons = objects.toArray() as? [Person] {
            self.persons = persons
        }
        tableView.reloadData()
    }
    
    @IBAction func removePersonsBarButtonTouched(_ sender: Any) {
        RealmService.sharedInstance.removeAll(withObjectType: Person.self)
        persons.removeAll()
        tableView.reloadData()
    }
}

extension PersonsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let person = persons[indexPath.row]
        cell.textLabel?.text = "\(person.firstname) \(person.lastname)"
        if let date = person.isCreated {
            cell.detailTextLabel?.text = date.getString(withDateFormatType: .long)
        }
        return cell
    }
}

extension PersonsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
