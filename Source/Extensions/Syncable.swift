//
//  NSManagmentObject+CKRecord.swift
//  CloudCore
//
//  Created by Dima Virych on 13.07.2018.
//  Copyright © 2018 Vasily Ulianov. All rights reserved.
//

import CoreData
import CloudKit

infix operator <~
infix operator ~>

public func <~<T> (_ l: inout T?, r: (String, CKRecord)) {
    
    if let data = r.1.value(forKey: r.0) as? Data,
        let obj = NSKeyedUnarchiver.unarchiveObject(with: data) as? T {
        
        print("---------Object: ", obj)
        
        l = obj
    }
}

public func <~<T> (_ l: inout T, r: (String, CKRecord)) {
    
    if let data = r.1.value(forKey: r.0) as? Data,
        let obj = NSKeyedUnarchiver.unarchiveObject(with: data) as? T {
        
        print("---------Object: ", obj)
        
        l = obj
    }
}

public func ~> (_ l: Any?, r: (String, CKRecord)) {
    
    let data = NSKeyedArchiver.archivedData(withRootObject: l)
    r.1.setValue(data, forKey: r.0)
}

public protocol Syncable: class {
    
    func initFrom(_ record: CKRecord) -> Bool
    
    func record(_ record: CKRecord)
}
