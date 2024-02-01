//
//  SwiftUITodoWalkthroughTests.swift
//  SwiftUITodoWalkthroughTests
//
//  Created by Ethan Archibald on 2/1/24.
//

import XCTest
import SwiftUI
@testable import SwiftUITodoWalkthrough

final class SwiftUITodoWalkthroughTests: XCTestCase {
    
    let exampleTodo = Todo(markedComplete: false, title: "example")
    let exampleSections = TodoSection(sectionTitle: "ExampleSections", todos: [Todo(markedComplete: false, title: "example1"), Todo(markedComplete: true, title: "example2")])

    let controller = TodosController()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testTodo() {
        XCTAssertEqual(exampleTodo.markedComplete, false)
    }
    
    func testTodoSections() {
        XCTAssertEqual(exampleSections.sectionTitle, "ExampleSections")
        XCTAssertNotNil(exampleSections.todos)
        XCTAssertEqual(exampleSections.todos.count, 2)
    }
    
    func testDummySections() {
        XCTAssertNotNil(TodoSection.dummySections)
    }
    
    func testDummyTodo() {
        XCTAssertNotNil(Todo.dummyTodos)
    }
    
    func testControllerCreated() {
        XCTAssertNotNil(TodosController())
    }
    
    func testTodoView() {
        let TodoView = TodoView()
        XCTAssertNotNil(TodoView.todosController.sections)
        XCTAssertEqual(TodoView.todosController.sections.count, 2)
    }
    
    func testCreateTodoSections() {
        let createTodoSections = CreateTodoSectionView(todosController: TodosController())
        let body = createTodoSections.body
        XCTAssertNotNil(body)
    }
    
    func testAddNewTodo() {
        let view = CreateToDoView(todosController: controller)
        let hostingController = UIHostingController(rootView: view)
        _ = hostingController.view
        
        view.newTodoText = "Test"
        view.selectedSection = controller.sections[0]
        view.addNewTodo("Test", for: controller.sections[0])
        
        XCTAssertTrue(controller.sections[0].todos.contains { $0.title == "Test"})
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
