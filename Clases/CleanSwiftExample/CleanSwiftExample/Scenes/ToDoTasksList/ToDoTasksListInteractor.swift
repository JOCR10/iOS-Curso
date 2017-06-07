//
//  ToDoTasksListInteractor.swift
//  CleanSwiftExample
//
//  Created by Local User on 6/6/17.
//  Copyright (c) 2017 Local User. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol ToDoTasksListInteractorInput{
    func requestTestInformation(request: ToDoTasksList.TestInformation.Request)
    func requestDataSource(request: ToDoTasksList.DataSource.Request)
}

protocol ToDoTasksListInteractorOutput{
    func responseTestInformation(response: ToDoTasksList.TestInformation.Response)
    func responseDataSource(response: ToDoTasksList.DataSource.Response)
}

class ToDoTasksListInteractor: ToDoTasksListInteractorInput{
    var output: ToDoTasksListInteractorOutput!
    var worker = ToDoTasksListWorker()
    
    // MARK: Business logic
    
    func requestTestInformation(request: ToDoTasksList.TestInformation.Request)
    {
        let response = ToDoTasksList.TestInformation.Response(number: worker.multiply(number: request.numberText))
        output.responseTestInformation(response: response)
    }
    
    func requestDataSource(request: ToDoTasksList.DataSource.Request)
    {
        let response = ToDoTasksList.DataSource.Response(arrayTask: worker.getArrayTasks())
        output.responseDataSource(response: response)
    }


}
