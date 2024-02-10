//
//  MainPageModel.swift
//  SampleCompositionalLayout
//
//  Created by Görkem Gür on 6.02.2024.
//

import Foundation

protocol SectionModel {
    var sectionTitle: String? { get }
    var itemCount: Int { get }
    var cellType: MainPageCellType { get }
    func getItem(at index: Int) -> Any
}

struct FilterSection: SectionModel {
    var sectionTitle: String?
    
    var filterSectionList: [FilterCellModel]
    
    var itemCount: Int {
        return filterSectionList.count
    }
    
    var cellType: MainPageCellType {
        return .filterCell
    }
    
    func getItem(at index: Int) -> Any {
        filterSectionList[index]
    }
}

struct SliderSection: SectionModel {
    var sectionTitle: String?
    
    var sliderList: [SliderCellModel]
    
    var itemCount: Int {
        return sliderList.count
    }
    
    var cellType: MainPageCellType {
        return .sliderCell
    }
    
    func getItem(at index: Int) -> Any {
        sliderList[index]
    }
}


struct MostRecommendedSection: SectionModel {
    var sectionTitle: String?
    
    var mostRecommendedList: [MostRecommendedCellModel]
    
    var itemCount: Int {
        return mostRecommendedList.count
    }
    
    var cellType: MainPageCellType {
        return .mostRecommendedCell
    }
    
    func getItem(at index: Int) -> Any {
        mostRecommendedList[index]
    }
}
