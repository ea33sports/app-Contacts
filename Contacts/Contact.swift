//
//  Contact.swift
//  Contacts
//
//  Created by Eric Andersen on 7/12/18.
//  Copyright © 2018 BigNerdRanch. All rights reserved.
//

import Foundation

class Contact: NSObject {
    let name: String
    init(name: String) {
        self.name = name
        super.init()
    }
    
    var firstName: String {
        get {
            var arr = name.characters.split(separator: " ").map(String.init)
            return arr[0]
        }
    }
    var lastName: String {
        get {
            var arr = name.characters.split(separator: " ").map(String.init)
            return arr[1]
        }
    }
}
