//
//  TodosController.swift
//  SwiftUITodoWalkthrough
//
//  Created by Ethan Archibald on 1/23/24.
//

import Foundation

class TodosController: ObservableObject {
    @Published var sections: [TodoSection]
    
    init() {
        sections = TodoSection.dummySections
    }
}
