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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        filterTitleLabel.font = UIFont.systemFont(ofSize: 16)
        filterTitleLabel.textColor = .white
    }

}
