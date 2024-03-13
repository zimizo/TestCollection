//
//  VerticalCollectionCell.swift
//  TestCollection
//
//  Created by Ибрахим on 09.03.2024.
//

import UIKit

class VerticalCollectionCell: UICollectionViewCell {
    // MARK: - Private Properties
    
    private lazy var collectionView: UICollectionView = {
        var view = HorizontalCollection(frame: contentView.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        view.delegate = self
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var data: [Int] = []
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func configure(with data: [Int]) {
        self.data = data
        collectionView.reloadData()
    }

    func reloadRandomItem() {
        guard let randomIndex = (0..<data.count).randomElement(),
              let randomNumber = (10...40).randomElement() else { return }
        data[randomIndex] = randomNumber
        collectionView.reloadItems(at: [IndexPath(row: randomIndex, section: 0)])
    }

    // MARK: - Private Methods
    
    private func setupViews() {
        contentView.addSubview(collectionView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

extension VerticalCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalCollectionCell.identifier, for: indexPath) as! HorizontalCollectionCell
        cell.configure(with: data[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let side = contentView.frame.height - 20 // Вычитаем отступы
        return CGSize(width: side, height: side)
    }
}
