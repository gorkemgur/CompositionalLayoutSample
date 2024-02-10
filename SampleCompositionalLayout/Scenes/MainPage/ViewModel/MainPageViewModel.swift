//
//  MainPageViewModel.swift
//  SampleCompositionalLayout
//
//  Created by Görkem Gür on 6.02.2024.
//

import Foundation

final class MainPageViewModel {
    private var sectionList: [SectionModel] = []
    
    init() {
        generateFilterSection()
        generateSliderSection()
        generateMostRecommendedSection()
    }
}

extension MainPageViewModel {
    func generateFilterSection() {
        var filterSectionList: [FilterCellModel] = [
        FilterCellModel(
            title: "Müzik",
            imageName: "music"
        ),
        FilterCellModel(
            title: "Eğitim",
            imageName: "education"
        ),
        FilterCellModel(
            title: "Finans",
            imageName: "wallet"
        ),
        FilterCellModel(
            title: "Apple Watch Uygulamaları",
            imageName: "watch"
        ),
        FilterCellModel(
            title: "Spor",
            imageName: "gym"
        ),
        FilterCellModel(
            title: "Çocuklar İçin",
            imageName: "balloons"
        )]
        sectionList.append(FilterSection(filterSectionList: filterSectionList))
    }
    
    func generateSliderSection() {
        var sliderList: [SliderCellModel] = [
        SliderCellModel(
            title: "OlMAZSA OLMAZLAR",
            subTitle: "Snapchat",
            description: "Yaşadığın Anı Paylaş",
            imageName: "snapchat",
            isAppInstalled: true
        ),
        SliderCellModel(
            title: "NE IZLEMELI",
            subTitle: "YouTube",
            description: "Tüm dünyada izlenenleri keşfet",
            imageName: "youtube",
            isAppInstalled: false
        ),
        SliderCellModel(
            title: "FORMA GIR",
            subTitle: "Adidas",
            description: "Antrenman Planını Seç",
            imageName: "adidas",
            isAppInstalled: true
        )]
        sectionList.append(SliderSection(sliderList: sliderList))
    }
    
    func generateMostRecommendedSection() {
        var mostRecommendedList: [MostRecommendedCellModel] = [
        MostRecommendedCellModel(
            imageName: "snapchat",
            title: "Snapchat",
            description: "Anı Paylaş",
            isAppInstalled: true
        ),
        MostRecommendedCellModel(
            imageName: "youtube",
            title: "YouTube",
            description: "Tüm Dünyada İzlenenleri Keşfet",
            isAppInstalled: false
        ),
        MostRecommendedCellModel(
            imageName: "adidas",
            title: "Adidas",
            description: "Antrenman Programını Ayarla",
            isAppInstalled: true
        ),
        MostRecommendedCellModel(
            imageName: "whatsapp",
            title: "WhatsApp",
            description: "WhatsApp Açıklaması",
            isAppInstalled: true
        ),
        MostRecommendedCellModel(
            imageName: "telegram",
            title: "Telegram",
            description: "Telegram Açıklaması",
            isAppInstalled: true
        ),
        MostRecommendedCellModel(
            imageName: "twitter",
            title: "Twitter",
            description: "Twitter Açıklaması",
            isAppInstalled: false
        )]
        sectionList.append(MostRecommendedSection(mostRecommendedList: mostRecommendedList))
    }
    
    func getSectionsCount() -> Int {
        return sectionList.count
    }
    
    func getSection(at section: Int) -> SectionModel {
        return sectionList[section]
    }
}
