//
//  ValueTransformer.swift
//  CloudCore
//
//  Created by Dima Virych on 05.07.2018.
//  Copyright © 2018 Vasily Ulianov. All rights reserved.
//

import Foundation

public class ValuesTransformerInterface {
    
    static func register(_ transformer: ObjectTransformer<NSObject>, for name: String) {
        
        ValueTransformer.setValueTransformer(transformer, forName: NSValueTransformerName(rawValue: name))
    }
}

class ObjectTransformer<T: NSObject>: ValueTransformer {
    
    override class func transformedValueClass() -> AnyClass {
        return T.self
    }
    
    override class func allowsReverseTransformation() -> Bool {
        return true
    }
    
    override func transformedValue(_ value: Any?) -> Any? {
        guard let value = value else {
            return nil
        }
        return NSKeyedArchiver.archivedData(withRootObject: value)
    }
    
    override func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let value = value as? NSData else {
            return nil
        }
        return NSKeyedUnarchiver.unarchiveObject(with: value as Data)
    }
}
