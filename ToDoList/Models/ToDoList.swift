//
//  ToDoList.swift
//  ToDoList
//
//  Created by Isa on 13/05/26.
//

import SwiftUI

struct ToDoList: Identifiable, Codable {
    var id = UUID()
    var title: String
    var items: [ListItem]
    
}
