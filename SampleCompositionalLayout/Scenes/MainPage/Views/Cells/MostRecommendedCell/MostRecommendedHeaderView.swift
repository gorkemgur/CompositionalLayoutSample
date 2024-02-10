//
//  MostRecommendedHeaderView.swift
//  SampleCompositionalLayout
//
//  Created by Görkem Gür on 12.02.2024.
//

import UIKit

final class MostRecommendedHeaderView: UICollectionReusableView {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var seeAllButton: UIButton!
    @IBOutlet private weak var dividerView: UIView!
    
    static let headerIdentifier = "MostRecommendedHeaderView"

    override func awakeFromNib() {
        super.awakeFromNib()
        dividerView.backgroundColor = .darkGray.withAlphaComponent(0.45)
        titleLabel.font = .systemFont(ofSize: 26)
        titleLabel.textColor = .white
        setupView()
    }
    
    func setupView() {
        seeAllButton.setTitle("Tümünü Gör", for: .normal)
        titleLabel.text = "Olmazsa Olmazlar"
    }
    
}
