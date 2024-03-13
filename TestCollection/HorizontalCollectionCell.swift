//
//  HorizontalCollectionCell.swift
//  TestCollection
//
//  Created by Ибрахим on 09.03.2024.
//

import UIKit

class HorizontalCollectionCell: UICollectionViewCell {
    
    // MARK: - Public Properties
    
    override var isHighlighted: Bool {
        didSet {
            UIView.animate(
                withDuration: 0.15,
                delay: 0,
                options: [.beginFromCurrentState, .allowUserInteraction]
            ) {
                self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.8, y: 0.8) : .identity
            }
        }
    }
    
    // MARK: - Private Properties
    
    private var label: UILabel!

    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    
    func configure(with number: Int) {
        label.text = "\(number)"
    }
    
    // MARK: - Private Methods
    
    private func setupLabel() {
        label = UILabel(frame: bounds)
        label.textAlignment = .center
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 10
        contentView.clipsToBounds = true
    }
}
