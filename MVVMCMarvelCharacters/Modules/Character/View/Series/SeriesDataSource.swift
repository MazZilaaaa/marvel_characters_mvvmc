//
//  SeriesDataSource.swift
//  MVVMCMarvelCharacters
//
//  Created by Alexandr on 23.02.2020.
//  Copyright © 2020 Alexandr. All rights reserved.
//

import UIKit

class SeriesDataSource: NSObject {
    let viewModel: CharacterSeriesVMP
    
    init(viewModel: CharacterSeriesVMP) {
        self.viewModel = viewModel
    }
    
    func configure(_ collectionView: UICollectionView) {
        collectionView.dataSource = self
        collectionView.register(SeriesCollectionViewCell.nib, forCellWithReuseIdentifier: SeriesCollectionViewCell.identifier)
    }
}

extension SeriesDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let series = viewModel.items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeriesCollectionViewCell.identifier, for: indexPath) as! SeriesCollectionViewCell
        cell.configure(series: series)
        return cell
    }
    
    
}
