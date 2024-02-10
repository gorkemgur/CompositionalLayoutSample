//
//  SliderCollectionViewCell.swift
//  SampleCompositionalLayout
//
//  Created by Görkem Gür on 8.02.2024.
//

import UIKit

final class SliderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private weak var sliderTitleLabel: UILabel!
    @IBOutlet private weak var sliderSubTitleLabel: UILabel!
    @IBOutlet private weak var sliderDescriptionLabel: UILabel!
    @IBOutlet private weak var sliderImageView: UIImageView!
    @IBOutlet private weak var downloadButtonContainerView: UIView!
    @IBOutlet private weak var downloadButton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        sliderTitleLabel.textColor = .blue
        sliderTitleLabel.font = .systemFont(ofSize: 14)
        
        sliderSubTitleLabel.textColor = .white
        sliderSubTitleLabel.font = .systemFont(ofSize: 16)
        
        sliderDescriptionLabel.textColor = .gray
        sliderDescriptionLabel.font = .systemFont(ofSize: 16)
        
        sliderImageView.layer.masksToBounds = true
        sliderImageView.layer.cornerRadius = 8
        
        downloadButtonContainerView.backgroundColor = .lightGray.withAlphaComponent(0.6)
        downloadButtonContainerView.layer.cornerRadius = 12
        
    }
    
    func setup(model: SliderCellModel) {
        sliderTitleLabel.text = model.title
        sliderSubTitleLabel.text = model.subTitle
        sliderDescriptionLabel.text = model.description
        sliderImageView.image = UIImage(named: model.imageName)
        downloadButton.setTitle(model.isAppInstalled ? "Aç" : "İndir", for: .normal)
        downloadButton.setTitleColor(model.isAppInstalled ? .blue : .white, for: .normal)
    }

}
