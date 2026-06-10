//
//  ListCardView.swift
//  ToDoList
//
//  Created by Isa on 13/05/26.
//
import SwiftUI

struct ListCardView: View {
    let list: ToDoList
    
    var completedItems: Int {
        
        list.items.filter{ $0.isCompleted}.count
    }
    var body: some View {
        HStack(spacing: 16){
            VStack(alignment: .leading, spacing: 8){
                Text(list.title)
                    .font(Font.headline)
                    .foregroundStyle(.primary)
                
                HStack{
                    Text("\(completedItems) of \(list.items.count) completed")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                    
                    ProgressView(value: Double(completedItems), total: Double(list.items.count))
                        .progressViewStyle(LinearProgressViewStyle(tint: .blue))
                        .frame(width: 100)
                }
            }
            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}
