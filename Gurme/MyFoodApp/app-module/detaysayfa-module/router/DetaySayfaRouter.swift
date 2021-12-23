//
//  DetaySayfaRouter.swift
//  MyFoodApp
//
//  Created by Emre Koçak on 10.12.2021.
//

import Foundation

class DetaySayfaRouter : PresenterToRouterDetaySayfaProtocol {
    static func createModule(ref: DetaySayfaVC) {
        ref.detaySayfaPresenterNesnesi = DetaySayfaPresenter()
        ref.detaySayfaPresenterNesnesi?.detaySayfaInteractor = DetaySayfaInteractor()
    }
}
