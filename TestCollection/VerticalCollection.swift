//
//  VerticalCollection.swift
//  TestCollection
//
//  Created by Ибрахим on 09.03.2024.
//

import UIKit

final class VerticalCollection: UICollectionView {
    // MARK: - Initializers
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let customLayout = UICollectionViewFlowLayout()
        customLayout.scrollDirection = .vertical
        super.init(frame: frame, collectionViewLayout: customLayout)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods

    private func setupView() {
        delegate = self
        dataSource = self
        register(VerticalCollectionCell.self, forCellWithReuseIdentifier: "horizontalCell")
    }
}


extension VerticalCollection: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (100...1000).randomElement() ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "horizontalCell", for: indexPath) as! VerticalCollectionCell
        let data = (0..<Int.random(in: 10...40)).map { _ in Int.random(in: 1...100) }
        cell.configure(with: data)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.width / 5
        return CGSize(width: collectionView.frame.width, height: height)
    }
}
