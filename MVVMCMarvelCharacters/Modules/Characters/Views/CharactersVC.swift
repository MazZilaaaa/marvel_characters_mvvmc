//
//  CharactersVC.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 20.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class CharactersVC: ControllerVC, Storyboarded {
    static var storyboard = AppStoryboard.characters
    
    @IBOutlet weak var tableView: UITableView!
    
    override func initByViewModel(with vm: BaseVMP?) {
        super.initByViewModel(with: vm)
        guard let vm = vm as? CharactersVM else { return }
        vm.reloadCharacters()
    }
}

extension CharactersVC: PaginableViewDelegate {
    func loadingFinished() {
        tableView?.reloadData()
    }
}
