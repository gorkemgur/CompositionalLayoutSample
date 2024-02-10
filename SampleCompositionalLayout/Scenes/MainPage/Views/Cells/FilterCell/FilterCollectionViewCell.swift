//
//  FilterCollectionViewCell.swift
//  SampleCompositionalLayout
//
//  Created by Görkem Gür on 8.02.2024.
//

import UIKit

final class FilterCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var filterImageView: UIImageView!
    @IBOutlet private weak var filterTitleLabel: UILabel!
    
    
    override var isSelected: Bool {
        didSet {
            if (containerView.backgroundColor == .brown) {
                containerView.backgroundColor = .gray.withAlphaComponent(0.65)
            } else {
                containerView.backgroundColor = isSelected ? .brown : .gray.withAlphaComponent(0.65)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        filterTitleLabel.font = UIFont.systemFont(ofSize: 16)
        filterTitleLabel.textColor = .white
        
        containerView.layer.cornerRadius = 8
        containerView.backgroundColor = .gray.withAlphaComponent(0.65)
        
        filterTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        filterTitleLabel.clipsToBounds = false
    }
    
    func setup(model: FilterCellModel) {
        filterImageView.image = UIImage(named: model.imageName)
        filterTitleLabel.text = model.title
    }

}
