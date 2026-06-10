//
//  ListManager.swift
//  ToDoList
//
//  Created by Isa on 13/05/26.
//

import SwiftUI
internal import Combine

class ListManager: ObservableObject {
    @Published var lists: [ToDoList] = []
    private let saveKey = "savedLists"
    
    init() {
        loadLists()
    }
    
    func loadLists() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode([ToDoList].self, from: data) {
                lists = decoded
                return
            }
        }
        lists = []
    }
    
    func saveLists() {
        if let encoded = try? JSONEncoder().encode(lists) {
            UserDefaults.standard.set(encoded, forKey: saveKey)
        }
    }
    func addList(_ list: ToDoList) {
        lists.append(list)
        saveLists()
    }
    
    func deleteList(at offsets: IndexSet){
        lists.remove(atOffsets: offsets)
        saveLists()
    }
    func updateList(_ list: ToDoList){
        if let index = lists.firstIndex(where: {$0.id == list.id}){
            lists[index] = list
            saveLists()
        }
    }
}
