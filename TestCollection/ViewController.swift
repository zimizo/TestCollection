//
//  ViewController.swift
//  TestCollection
//
//  Created by Ибрахим on 09.03.2024.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - Private Properties
    
    private lazy var collectionView: UICollectionView = {
        VerticalCollection(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
    }()
    private var timer: Timer?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupTimer()
    }
    
    // MARK: - Actions
    
    @objc private func updateRandomNumber() {
        collectionView.visibleCells.forEach({
            guard let cell = $0 as? VerticalCollectionCell else { return }
            cell.reloadRandomItem()
        })
    }
    
    // MARK: - Private Methods

    private func setupViews() {
        view.addSubview(collectionView)
    }

    private func setupTimer() {
        timer = Timer(timeInterval: 1.0, target: self, selector: #selector(updateRandomNumber), userInfo: nil, repeats: true)
        guard let timer else { return }
        RunLoop.main.add(timer, forMode: .common)
    }
}
