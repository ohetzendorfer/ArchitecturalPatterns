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
    
    private let personsPresenter = PersonsPresenter()
    fileprivate var personsToDisplay = [PersonViewData]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        personsPresenter.add(view: self)
        personsPresenter.updateView()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        personsPresenter.removeView()
    }
    
    @IBAction func removePersonsBarButtonTouched(_ sender: Any) {
        personsPresenter.removePersons()
    }
}

extension PersonsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personsToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let personViewData = personsToDisplay[indexPath.row]
        cell.textLabel?.text = personViewData.name
        if let date = personViewData.isCreated {
            cell.detailTextLabel?.text = date
        }
        return cell
    }
}

extension PersonsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension PersonsViewController: PersonsView {
    func updateView(personsViewData: [PersonViewData]) {
        personsToDisplay = personsViewData
        tableView.reloadData()
    }
    
    func personsRemoved() {
        personsToDisplay.removeAll()
        tableView.reloadData()
    }
}
