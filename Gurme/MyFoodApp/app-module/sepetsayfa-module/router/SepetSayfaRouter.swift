//
//  SepetSayfaRouter.swift
//  MyFoodApp
//
//  Created by Emre Koçak on 9.12.2021.
//

import Foundation

class SepetSayfaRouter : PresenterToRouterSepetSayfaProtocol {
    static func createModule(ref: SepetSayfaVC) {
        
        let presenter : ViewToPresenterSepetSayfaProtocol & InteractorToPresenterSepetSayfaProtocol = SepetSayfaPresenter()
        
        ref.sepetSayfaPresenterNesnesi = presenter
        
        ref.sepetSayfaPresenterNesnesi?.sepetSayfaInteractor = SepetSayfaInteractor()
        ref.sepetSayfaPresenterNesnesi?.sepetSayfaView = ref 
        
        ref.sepetSayfaPresenterNesnesi?.sepetSayfaInteractor?.sepetSayfaPresenter = presenter
        
    }
}
