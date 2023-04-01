//
//  Category.swift
//  Todoey
//
//  Created by Dinesh Sharma on 03/11/22..
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var colour: String = ""
    let items = List<Item>()
}
