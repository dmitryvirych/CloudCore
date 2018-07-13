//
//  NSManagmentObject+CKRecord.swift
//  CloudCore
//
//  Created by Dima Virych on 13.07.2018.
//  Copyright © 2018 Vasily Ulianov. All rights reserved.
//

import CoreData
import CloudKit

public protocol Syncable: class {
    
    init?(_ record: CKRecord)
    
    func record() -> CKRecord?
}

extension Syncable {
    
    public init?(_ record: CKRecord) {
        
        return nil
    }
    
    public func record() -> CKRecord? {
        
        return nil
    }
}

extension NSManagedObject: Syncable {
    
}
