//
//  InfiniteTableViewDelegate.swift
//  characters
//
//  Created by Alexandr on 22.01.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import Foundation
import UIKit

class InfiniteViewDelegate: NSObject {
    enum Direction {
        case horisontal
        case vertical
    }
    typealias EndReachedClosureType = () -> Void
    typealias RowSelectedClosureType = (IndexPath) -> Void
    let direction: Direction
    var EndReachedClosure: EndReachedClosureType?
    var rowSelectedClosure : RowSelectedClosureType?
    let sensivity: CGFloat
    
    init(direction: Direction, sensivity: CGFloat = 1) {
        self.direction = direction
        self.sensivity = sensivity
    }
    
    func configure(tableView: UITableView) {
        tableView.delegate = self
    }
}

extension InfiniteViewDelegate: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        rowSelectedClosure?(indexPath)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        switch direction {
        case .horisontal:
            let offsetX = scrollView.contentOffset.x
            let contentWidth = scrollView.contentSize.width
            if offsetX >= contentWidth - scrollView.frame.width * sensivity {
                EndReachedClosure?()
            }
        case .vertical:
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            if offsetY > contentHeight - scrollView.frame.height * sensivity {
                EndReachedClosure?()
            }
        }
    }
}
