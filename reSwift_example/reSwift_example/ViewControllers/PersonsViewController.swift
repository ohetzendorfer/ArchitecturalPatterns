//
//  ViewController.swift
//  mvc_example
//
//  Created by Oliver Mastny on 31/12/2016.
//  Copyright © 2016 Oliver Mastny. All rights reserved.
//

import UIKit
import ReSwift

class PersonsViewController: UIViewController, StoreSubscriber {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mainStore.subscribe(self)
        mainStore.dispatch(UpdateView())
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        mainStore.unsubscribe(self)
    }
    
    func newState(state: AppState) {
        tableView.reloadData()
    }
    
    @IBAction func removePersonsBarButtonTouched(_ sender: Any) {
        mainStore.dispatch(RemovePersons())
    }
}

extension PersonsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainStore.state.persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let person = mainStore.state.persons[indexPath.row]
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
