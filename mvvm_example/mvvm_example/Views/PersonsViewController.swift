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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        updateView()
    }
    
    private func updateView() {
        PersonsViewModel.sharedInstance.fetchPersons()
        tableView.reloadData()
    }
    
    @IBAction func removePersonsBarButtonTouched(_ sender: Any) {
        PersonsViewModel.sharedInstance.removePersons()
        tableView.reloadData()
    }
}

extension PersonsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PersonsViewModel.sharedInstance.getPersonsCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = PersonsViewModel.sharedInstance.getPersonFullName(withIndex: indexPath.row)
        cell.detailTextLabel?.text = PersonsViewModel.sharedInstance.getPersonCreationDate(withIndex: indexPath.row)
        return cell
    }
}

extension PersonsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
