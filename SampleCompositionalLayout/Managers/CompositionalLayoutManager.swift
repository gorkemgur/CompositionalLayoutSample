//
//  CompositionalLayoutManager.swift
//  SampleCompositionalLayout
//
//  Created by Görkem Gür on 10.02.2024.
//

import UIKit

enum LayoutType {
    case horizontal(isSlider: Bool)
    case normal(headerIdentifier: String?)
}

final class CompositionalLayoutManager {
    private init() {}
    
    static let sharedInstance = CompositionalLayoutManager()

    func createLayoutSection(layoutType: LayoutType) -> NSCollectionLayoutSection {
        switch layoutType {
        case .horizontal(let isSlider):
            return createHorizontalSection(isSlider: isSlider)
        case .normal(let headerIdentifier):
            return createNormalSection(headerIdentifier: headerIdentifier)
        }
    }
    
    private func createHorizontalSection(isSlider: Bool) -> NSCollectionLayoutSection {
        var itemSize: NSCollectionLayoutSize? = nil
        var groupSize: NSCollectionLayoutSize? = nil
        if (isSlider) {
            groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85) , heightDimension: .absolute(360))
            itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        } else {
            groupSize = NSCollectionLayoutSize(widthDimension: .estimated(120), heightDimension: .estimated(50))
            itemSize = NSCollectionLayoutSize(widthDimension: .estimated(120),
                                              heightDimension: .fractionalHeight(1.0))
        }
        let item = NSCollectionLayoutItem(layoutSize: itemSize!)
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize!, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPaging
        
        return section
    }
    
    private func createNormalSection(headerIdentifier: String?) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(90))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1) , heightDimension: .absolute(270))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
        
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 15)

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        
        if let headerIdentifier = headerIdentifier, headerIdentifier != "" {
            section.boundarySupplementaryItems = [
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
            ]
        }
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 15, bottom: 40, trailing: 15)
        
        return section
    }
}
