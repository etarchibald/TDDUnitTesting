//
//  CreateTodoSectionView.swift
//  SwiftUITodoWalkthrough
//
//  Created by Ethan Archibald on 1/23/24.
//

import SwiftUI

struct CreateTodoSectionView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var todosController: TodosController
    
    @State private var sectionTitle = ""
    
    var body: some View {
        VStack {
            Text("Create New Section")
                .font(.largeTitle.weight(.thin))
                .padding(.top)
            
            Spacer()
            
            TextField("Title", text: $sectionTitle)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.gray, style: StrokeStyle(lineWidth: 0.2))
                )
                .padding()
            
            Spacer()
            
            VStack {
                Button {
                    if !sectionTitle.isEmpty {
                        addTodoSection(sectionTitle)
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
    }
    
    func addTodoSection(_ sectionTitle: String) {
        todosController.sections.append(TodoSection(sectionTitle: sectionTitle, todos: []))
    }
}

#Preview {
    CreateTodoSectionView(todosController: TodosController())
}
