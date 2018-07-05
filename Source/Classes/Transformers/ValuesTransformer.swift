//
//  ValueTransformer.swift
//  CloudCore
//
//  Created by Dima Virych on 05.07.2018.
//  Copyright © 2018 Requestum. All rights reserved.
//

import Foundation

public class ValuesTransformerInterface {
    
    public static func register(_ transformer: ValueTransformer, for name: String) {
        
        ValueTransformer.setValueTransformer(transformer, forName: NSValueTransformerName(rawValue: name))
    }
}

public class ObjectTransformer<T: NSObject>: ValueTransformer {
    
    override public class func transformedValueClass() -> AnyClass {
        return T.self
    }
    
    override public class func allowsReverseTransformation() -> Bool {
        return true
    }
    
    override public func transformedValue(_ value: Any?) -> Any? {
        guard let value = value else {
            return nil
        }
        return NSKeyedArchiver.archivedData(withRootObject: value)
    }
    
    override public func reverseTransformedValue(_ value: Any?) -> Any? {
        guard let value = value as? NSData else {
            return nil
        }
        return NSKeyedUnarchiver.unarchiveObject(with: value as Data)
    }
}
