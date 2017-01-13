//
//  RealmService.swift
//  viper_example
//
//  Created by Oliver Mastny on 02/01/2017.
//  Copyright © 2017 Oliver Mastny. All rights reserved.
//

import RealmSwift

internal struct RealmService {
    
    internal static let sharedInstance = RealmService()
    private let realm = try! Realm()
    
    // MARK: - Setter
    internal func add(object: Object) {
        do {
            try realm.write({
                realm.add(object)
            })
        } catch {
            print("Realm Error")
        }
    }
    
    internal func add(array: [Object]) {
        do {
            try realm.write({
                realm.add(array)
            })
        } catch {
            print("Realm Error")
        }
    }
    
    // MARK: - Getter
    internal func get(objectType: Object.Type) -> Results<Object>? {
        let objects = realm.objects(objectType)
        if objects.isEmpty {
            return nil
        }
        return objects
    }
    
    // MARK: - Remove
    internal func removeAll(withObjectType objectType: Object.Type) {
        let objects = realm.objects(objectType)
        realm.beginWrite()
        realm.delete(objects)
        do {
            try realm.commitWrite()
        } catch {
            print("Realm Error")
        }
    }
    
    internal func remove(object: Object) {
        realm.beginWrite()
        realm.delete(object)
        do {
            try realm.commitWrite()
        } catch {
            print("Realm Error")
        }
    }
    
    // MARK: - Helpers
    internal func exists(objectType: Object.Type, withPredicate predicate: NSPredicate) -> Bool {
        if let objects = get(objectType: objectType) {
            let filteredObjects = objects.filter(predicate)
            if !filteredObjects.isEmpty {
                return true
            }
        }
        return false
    }
}
