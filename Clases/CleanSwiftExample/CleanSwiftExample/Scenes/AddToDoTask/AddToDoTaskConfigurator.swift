//
//  AddToDoTaskConfigurator.swift
//  CleanSwiftExample
//
//  Created by Local User on 6/6/17.
//  Copyright (c) 2017 Local User. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension AddToDoTaskViewController: AddToDoTaskPresenterOutput{
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        router.passDataToNextScene(segue: segue)
    }
}

extension AddToDoTaskInteractor: AddToDoTaskViewControllerOutput{
}

extension AddToDoTaskPresenter: AddToDoTaskInteractorOutput{
}

class AddToDoTaskConfigurator{
    // MARK: Object lifecycle
    
    class var sharedInstance: AddToDoTaskConfigurator{
        struct Static {
            static let instance =  AddToDoTaskConfigurator()
        }
        return Static.instance
    }
    
    // MARK: Configuration
    
    func configure(viewController: AddToDoTaskViewController){
        let router = AddToDoTaskRouter()
        router.viewController = viewController
        
        let presenter = AddToDoTaskPresenter()
        presenter.output = viewController
        
        let interactor = AddToDoTaskInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
    }
}
