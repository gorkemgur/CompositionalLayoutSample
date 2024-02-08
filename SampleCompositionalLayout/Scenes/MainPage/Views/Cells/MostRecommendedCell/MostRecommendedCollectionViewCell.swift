//
//  MostRecommendedCollectionViewCell.swift
//  SampleCompositionalLayout
//
//  Created by Görkem Gür on 8.02.2024.
//

import UIKit

final class MostRecommendedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var downloadAppContainerView: UIView!
    @IBOutlet private weak var downloadAppbutton: UIButton!
    @IBOutlet private weak var dividerView: UIView!
    @IBOutlet private weak var appImageView: UIImageView!
    @IBOutlet private weak var appTitleLabel: UILabel!
    @IBOutlet private weak var appDescriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        appTitleLabel.textColor = .white
        appTitleLabel.font = .systemFont(ofSize: 16)
        
        dividerView.backgroundColor = .darkGray.withAlphaComponent(0.45)
        
        appDescriptionLabel.textColor = .lightGray.withAlphaComponent(0.7)
        appDescriptionLabel.font = .systemFont(ofSize: 14)
        
        downloadAppContainerView.backgroundColor = .black.withAlphaComponent(0.55)
        downloadAppContainerView.clipsToBounds = true
        downloadAppContainerView.layer.cornerRadius = 8
        
        appImageView.layer.cornerRadius = 12
    }
    
    func setup(model: MostRecommendedCellModel) {
        appTitleLabel.text = model.title
        appDescriptionLabel.text = model.description
        appImageView.image = UIImage(named: model.imageName)
        downloadAppbutton.setTitle(model.isAppInstalled ? "Aç" : "Indir", for: .normal)
        downloadAppbutton.setTitleColor(model.isAppInstalled ? .blue : .white, for: .normal)
    }

}
