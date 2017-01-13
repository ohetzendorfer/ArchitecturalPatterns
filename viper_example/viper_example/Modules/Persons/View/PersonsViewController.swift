//
// Created by VIPER
// Copyright (c) 2016 VIPER. All rights reserved.
//

import UIKit

class PersonsViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var input: PersonsPresenterInputProtocol!
    var persons = [Person]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        input.updateView()
    }
    
    @IBAction func addPersonBarButtonTouched(_ sender: Any) {
        input.showPersonAdd()
    }
    
    @IBAction func removePersonsBarButtonTouched(_ sender: Any) {
        input.removePersons()
    }
}

extension PersonsViewController: PersonsViewControllerOutputProtocol {
    func show(persons: [Person]) {
        self.persons = persons
        tableView.reloadData()
    }
    func removePersons() {
        self.persons.removeAll()
        tableView.reloadData()
    }
}

extension PersonsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
