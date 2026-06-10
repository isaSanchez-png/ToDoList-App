//
//  ItemRowView.swift
//  ToDoList
//
//  Created by Isa on 13/05/26.
//
import SwiftUI

struct ItemRowView: View {
    @Binding var item: ListItem
    
    var body: some View {
        HStack{
            Button(action: {
                withAnimation{item.isCompleted.toggle()
                }
            }){
                Image(systemName: item.isCompleted ? "checkmark.square.fill" : "checkmark.square")
                    .font(.title2)
                    .foregroundColor(item.isCompleted ? .green: .gray)
            }
            Text(item.title)
                .strikethrough(item.isCompleted)
                .foregroundColor(item.isCompleted ? .secondary: .primary)
            
            Spacer()
        }
        .contentShape(Rectangle())
        .padding(.vertical, 8)
    }
}
