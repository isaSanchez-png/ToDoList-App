//
//  ListItem.swift
//  ToDoList
//
//  Created by Isa on 13/05/26.
//

import SwiftUI

struct ListItem: Identifiable, Codable {
    var id = UUID()
    var title : String
    var isCompleted : Bool
}
