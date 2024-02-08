//
//  MockDataGenerator.swift
//  SampleCompositionalLayout
//
//  Created by Görkem Gür on 6.02.2024.
//

import Foundation

final class MockDataGenerator {
    private init() {}
    
    static let sharedInstance = MockDataGenerator()
    
    private(set) var filterCellModelList: [FilterCellModel]?
    private(set) var sliderCellModelList: [SliderCellModel]?
    private(set) var mostRecommendedModelList: [MostRecommendedCellModel]?
    
    private var mainPageModelList: [MainPageModel]?
    
    
    func generateFilterCellModel() {
        
    }
    
    func generateSliderCellModel() {
        
    }
    
    func generateMostRecommendedCellModel() {
        
    }
    
}
