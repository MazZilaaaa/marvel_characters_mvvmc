//
//  BaseVMP.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 21.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation

protocol BaseVMP {
    var viewDelegate: ViewDelegate? { get set }
    var coordinatorDelegate: CoordinatorDelegate? { get set }
    
    var title: String { get }
    var errorMessage: String? { get }
}
