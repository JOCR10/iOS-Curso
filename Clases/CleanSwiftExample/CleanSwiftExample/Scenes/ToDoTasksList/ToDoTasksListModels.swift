//
//  ToDoTasksListModels.swift
//  CleanSwiftExample
//
//  Created by Local User on 6/6/17.
//  Copyright (c) 2017 Local User. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

struct ToDoTasksList{
    
    struct TestInformation {
        struct Request{
            var numberText: String
        }
        
        struct Response{
            var number: Int
        }
        
        struct ViewModel{
            var numberText: String
        }
    }
    
    struct DataSource {
        struct Request{
        }
        
        struct Response{
            var arrayTask: [ToDoTasksList.Task]
        }
        
        struct ViewModel{
            var arrayTask: [ToDoTasksList.TaskModelCell]
        }
    }
    
    struct Task {
        var text: String
        var counter: Int
    }
    
    struct TaskModelCell {
        var text: String
        var counter: String
    }
}
