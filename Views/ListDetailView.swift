//
//  ListDetailView.swift
//  ToDoList
//
//  Created by Isa on 13/05/26.
//
import SwiftUI

struct ListDetailView: View {
    @Binding var list: ToDoList
    @State private var newItemTitle: String = ""
    @State private var showingNewItemAlert = false
    @State private var searchText: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var filteredItems: [ListItem]{
        if searchText.isEmpty{
            return list.items
        }
        return list.items.filter { $0.title.contains(searchText) }
    }
    
    var body: some View {
        ZStack{
            Color(.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 0){
                VStack{
                    VStack(spacing: 8){
                        ProgressView(value: Double(completedItems), total: Double(list.items.count))
                            .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                            .frame(height: 8)
                        
                        Text("\(completedItems) of \(list.items.count)completed")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    
                    List{
                        ForEach(filteredItems) { item in
                            ItemRowView(item: binding(for: item))
                                .swipeActions(edge: .trailing){
                                    Button(role: .destructive){
                                        withAnimation{
                                            if let index = list.items.firstIndex(where: {$0.id == item.id}) {
                                                list.items.remove(at: index)
                                            }
                                        }
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationTitle(list.title)
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Search Items")
        .toolbar{
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action: {showingNewItemAlert = true}) {
                    Image(systemName: "plus.circle.fill")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
            }
        }
        .alert("New Item", isPresented: $showingNewItemAlert){
            TextField("Item Title", text: $newItemTitle)
            Button("Cancel", role: .cancel){
                newItemTitle = ""
            }
            Button("Add"){
                if !newItemTitle.isEmpty{
                    withAnimation{
                        list.items.append(ListItem(title: newItemTitle, isCompleted: false))
                        newItemTitle = ""
                    }
                }
            }
        } message: {
            Text("Enter a title for your new item")
        }
    }
    private var completedItems: Int{
        list.items.filter {$0.isCompleted}.count
    }
        private func binding(for item: ListItem) -> Binding<ListItem>{
            guard let index = list.items.firstIndex(where: {$0.id == item.id})
            else{
                fatalError("Item not found")
            }
            return $list.items[index]
    }
}
