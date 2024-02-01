//
//  CreateToDoView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Ethan Archibald on 1/23/24.
//

import SwiftUI

struct CreateToDoView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var todosController: TodosController
    
    @State var newTodoText = ""
    @State var selectedSection: TodoSection
    
    init(todosController: TodosController) {
        _todosController = ObservedObject(wrappedValue: todosController)
        _selectedSection = State(initialValue: todosController.sections[0])
    }
    
    var body: some View {
        VStack {
            Text("Create New Todo")
                .font(.largeTitle.weight(.thin))
                .padding(.top)
            
            Spacer()
            
            HStack {
                TextField("Todo", text: $newTodoText)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.gray, style: StrokeStyle(lineWidth: 0.2))
                    )
                    .padding()
                
                Picker("For Section", selection: $selectedSection) {
                    ForEach(todosController.sections, id: \.self) { section in
                        Text(section.sectionTitle)
                    }
                }
                .padding()
            }
            
            Spacer()
            
            VStack {
                Button {
                    if !newTodoText.isEmpty {
                        addNewTodo(newTodoText, for: selectedSection)
                        dismiss()
                    }
                } label: {
                    Text("Create")
                        .foregroundStyle(Color.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background(
                            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                        )
                }
                
                Button {
                    dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundStyle(Color.red)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .background(
                            RoundedRectangle(cornerSize: CGSize(width: 15, height: 15))
                                .stroke(.red)
                        )
                }
            }
            .padding()
            
        }
        .toolbar(.hidden)
    }
    
    func addNewTodo(_ todoTitle: String, for section: TodoSection) {
        let newTodo = Todo(markedComplete: false, title: todoTitle)
        
        if let sectionIndex = todosController.sections.firstIndex(where: { $0 == section }) {
            todosController.sections[sectionIndex].todos.append(newTodo)
        }
    }
}

#Preview {
    CreateToDoView(todosController: TodosController())
}
