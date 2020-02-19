//
//  AppCoordinator.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 19.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    fileprivate let charactersC_KEY = "Characters"
    
    var window: UIWindow
    var coordinators = [String:Coordinator]()
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        showCharacters()
    }
}

extension AppCoordinator {
    func showCharacters() {
        let charactersC = CharactersCoordinator(window: window)
        coordinators[charactersC_KEY] = charactersC
        charactersC.start()
    }
}
