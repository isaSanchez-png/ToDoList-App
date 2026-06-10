//
//  ContentView.swift
//  ToDoList
//
//  Created by Isa on 13/05/26.
//

import SwiftUI

struct ContentView: View {
    @State private var showingMessage: Bool = false
    
    var body: some View {
        VStack {
            ListView()
        }
    }
}

#Preview {
    ContentView()
}
