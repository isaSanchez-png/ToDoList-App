//
//  ListView.swift
//  ToDoList
//
//  Created by Isa on 13/05/26.
//

import SwiftUI

struct ListView: View {
    @StateObject private var listManager = ListManager()
    @State private var newListName: String = ""
    @State private var showAddListAlert: Bool = false
    @State private var searchText: String = ""
    
    var filteredLists: [ToDoList] {
        if searchText.isEmpty {
            return listManager.lists
        }
        return listManager.lists.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(.systemGroupedBackground)
                    .ignoresSafeArea()
                
                
                if filteredLists.isEmpty {
                    EmptyStateView(showingNewListAlert: $showAddListAlert)
                } else {
                    ScrollView {
                        LazyVStack(spacing: 10) {
                            ForEach(filteredLists) { list in
                                NavigationLink(destination: ListDetailView(list: binding(for: list))) {
                                    ListCardView(list: list)
                                }
                                .buttonStyle(PlainButtonStyle())
                                .contextMenu {
                                    contextMenuContent(for: list)
                                }
                                .swipeActions(edge: .trailing) {
                                    swipeActions(for: list)
                                }
                            }
                        }
                        .padding()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                toolbarContent
            }
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Items")
            .alert("New List", isPresented: $showAddListAlert) {
                newListAlertContent
            } message: {
                Text("Enter a title for your new list")
            }
        }
    }
    
    private var toolbarContent: some ToolbarContent {
        Group {
            ToolbarItem(placement: .principal) {
                Text("My Lists")
                    .font(.title)
                    .fontWeight(.semibold)
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: { showAddListAlert = true }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundStyle(.blue)
                }
            }
        }
    }
    
    private func contextMenuContent(for list: ToDoList) -> some View {
        Group {
            Button(role: .destructive) {
                deleteList(list)
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
    
    private func swipeActions(for list: ToDoList) -> some View {
        Button(role: .destructive) {
            deleteList(list)
        } label: {
            Label("Delete", systemImage: "trash")
        }
    }
    
    private func deleteList(_ list: ToDoList) {
        if let index = listManager.lists.firstIndex(where: { $0.id == list.id }) {
            withAnimation {
                listManager.deleteList(at: IndexSet(integer: index))
            }
        }
    }
    
    private var newListAlertContent: some View {
        Group {
            TextField("List Title", text: $newListName)
            Button("Cancel", role: .cancel) {
                newListName = ""
            }
            Button("Create") {
                if !newListName.isEmpty {
                    withAnimation {
                        listManager.addList(ToDoList(title: newListName, items: []))  
                        newListName = ""
                    }
                }
            }
        }
    }
    
    private func binding(for list: ToDoList) -> Binding<ToDoList> {
        guard let index = listManager.lists.firstIndex(where: { $0.id == list.id }) else {
            fatalError("List not found")
        }
        return Binding(
            get: { listManager.lists[index] },
            set: { listManager.updateList($0) }
        )
    }
}
