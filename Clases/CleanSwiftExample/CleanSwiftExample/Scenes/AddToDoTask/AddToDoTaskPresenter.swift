//
//  AddToDoTaskPresenter.swift
//  CleanSwiftExample
//
//  Created by Local User on 6/6/17.
//  Copyright (c) 2017 Local User. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol AddToDoTaskPresenterInput{
    func presentSomething(response: AddToDoTask.Response)
}

protocol AddToDoTaskPresenterOutput: class{
    func displaySomething(viewModel: AddToDoTask.ViewModel)
}

class AddToDoTaskPresenter: AddToDoTaskPresenterInput{
    weak var output: AddToDoTaskPresenterOutput!
    
    // MARK: Presentation logic
    
    func presentSomething(response: AddToDoTask.Response){
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = AddToDoTask.ViewModel()
        output.displaySomething(viewModel: viewModel)
    }
}
