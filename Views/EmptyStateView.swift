//
//  EmptyStateView.swift
//  ToDoList
//
//  Created by Isa on 13/05/26.
//
import SwiftUI

struct EmptyStateView: View {
    @Binding var showingNewListAlert: Bool
    
    var body: some View {
        VStack {
            Image("list.bullet.clipboard")
                .font(.system(size: 70))
                .foregroundColor(.blue)
                .padding()
            Text("No Lists Yet")
                .font(.title)
                .fontWeight(.semibold)
            
            Text("Create your first list to get started")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Button(action: { showingNewListAlert = true}){
                HStack{
                    Image(systemName: "plus.circle.fill")
                    Text("Create New List")
                }
                .font(.headline)
                .foregroundColor(.white)
                .padding()
                .background(Color.blue)
                .cornerRadius(10)
            }
            .padding(.top)
        }
    }
}
