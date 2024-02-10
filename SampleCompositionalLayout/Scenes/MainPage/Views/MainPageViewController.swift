//
//  MainPageViewController.swift
//  SampleCompositionalLayout
//
//  Created by Görkem Gür on 8.02.2024.
//

import UIKit

final class MainPageViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    private let viewModel = MainPageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildCollectionView()
        setCompositionalLayout()
        self.view.backgroundColor = .gray.withAlphaComponent(0.15)
    }

}

extension MainPageViewController {
    func buildCollectionView() {
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
        mainCollectionView.register(UINib(nibName: "MostRecommendedHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MostRecommendedHeaderView.headerIdentifier)
        mainCollectionView.register(cellClass: FilterCollectionViewCell.self)
        mainCollectionView.register(cellClass: SliderCollectionViewCell.self)
        mainCollectionView.register(cellClass: MostRecommendedCollectionViewCell.self)
    }
    
    func setCompositionalLayout() {
        let layout = UICollectionViewCompositionalLayout { [weak self] sectionIndex, env -> NSCollectionLayoutSection? in
            guard let self = self else { return nil }
            let sectionType = self.viewModel.getSection(at: sectionIndex).cellType
            
            return self.layoutSection(for: sectionType)
        }
        
        mainCollectionView.setCollectionViewLayout(layout, animated: true)
    }

    private func layoutSection(for cellType: MainPageCellType) -> NSCollectionLayoutSection {
        switch cellType {
        case .filterCell:
            return CompositionalLayoutManager.sharedInstance.createLayoutSection(layoutType: .horizontal(isSlider: false))
        case .mostRecommendedCell:
            return CompositionalLayoutManager.sharedInstance.createLayoutSection(layoutType: .normal(headerIdentifier: MostRecommendedHeaderView.headerIdentifier))
        case .sliderCell:
            return CompositionalLayoutManager.sharedInstance.createLayoutSection(layoutType: .horizontal(isSlider: true))
        }
    }
}

extension MainPageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.getSectionsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getSection(at: section).itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let section = viewModel.getSection(at: indexPath.section)
        let item = section.getItem(at: indexPath.row)
        switch section.cellType {
        case .filterCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCollectionViewCell.reuseIdentifier, for: indexPath) as! FilterCollectionViewCell
            if let filterModel = item as? FilterCellModel {
                cell.setup(model: filterModel)
            }
            return cell
        case .mostRecommendedCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MostRecommendedCollectionViewCell.reuseIdentifier, for: indexPath) as! MostRecommendedCollectionViewCell
            if let mostRecommendedModel = item as? MostRecommendedCellModel {
                cell.setup(model: mostRecommendedModel)
            }
            return cell
        case .sliderCell:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderCollectionViewCell.reuseIdentifier, for: indexPath) as! SliderCollectionViewCell
            if let sliderCellModel = item as? SliderCellModel {
                cell.setup(model: sliderCellModel)
            }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView: MostRecommendedHeaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MostRecommendedHeaderView.headerIdentifier, for: indexPath) as! MostRecommendedHeaderView
            return headerView
        }
        fatalError("Unexpected kind")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let section = viewModel.getSection(at: indexPath.section)
        let item = section.getItem(at: indexPath.row)
        switch section.cellType {
        case .filterCell:
            print("item : \(item as? FilterCellModel)")
        case .sliderCell:
            print("item : \(item as? SliderCellModel)")
        case .mostRecommendedCell:
            print("item : \(item as? MostRecommendedCellModel)")
        }
    }
}
