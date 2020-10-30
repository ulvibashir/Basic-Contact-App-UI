//
//  dummyData.swift
//  ContactApp
//
//  Created by Ulvi Bashirov on 10/2/20.
//

import UIKit

struct Contact {
    var name: String
    var surname: String
    var desc: String
}

struct Recent {
    var id: String
    var contact: Contact
    var time: String
    var isMissed: Bool
}


