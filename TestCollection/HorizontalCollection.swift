//
//  HorizontalCollection.swift
//  TestCollection
//
//  Created by Ибрахим on 09.03.2024.
//

import UIKit

final class HorizontalCollection: UICollectionView {
    // MARK: - Initializers
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let customLayout = UICollectionViewFlowLayout()
        customLayout.scrollDirection = .horizontal
        customLayout.minimumLineSpacing = 10
        super.init(frame: frame, collectionViewLayout: customLayout)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods
    
    private func setupView() {
        register(HorizontalCollectionCell.self, forCellWithReuseIdentifier: HorizontalCollectionCell.identifier)
        backgroundColor = .clear
        showsHorizontalScrollIndicator = false
    }
}
