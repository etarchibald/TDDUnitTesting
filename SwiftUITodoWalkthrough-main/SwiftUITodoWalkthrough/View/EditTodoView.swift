//
//  EditTodoView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Ethan Archibald on 1/23/24.
//

import SwiftUI

struct EditTodoView: View {
    @Environment(\.dismiss) var dismiss
    
    @Binding var todo: Todo
    
    var body: some View {
        Text("Edit Todo")
            .font(.title.weight(.thin))
        
        Spacer()
        
        TextField(todo.title, text: $todo.title)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(.gray, style: StrokeStyle(lineWidth: 0.2))
            )
            .padding()
        
        Spacer()
        
        VStack {
            Button {
                dismiss()
            } label: {
                Text("Create")
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 15)
                    .background(
                        RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                    )
            }
        }
        .padding()
    }
    
}

#Preview {
    EditTodoView(todo: .constant(Todo(markedComplete: false, title: "Example")))
}
