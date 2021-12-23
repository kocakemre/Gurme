//
//  AnasayfaRouter.swift
//  MyFoodApp
//
//  Created by Emre Koçak on 10.12.2021.
//

import Foundation

class AnasayfaRouter : PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaVC) {
        
        let presenter : ViewToPresenterAnasayfaProtocol & InteractorToPresenterAnasayfaProtocol = AnasayfaPresenter()
        
        //View controller için
        ref.anasayfaPresenterNesnesi = presenter
        
        //Presenter için
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor = AnasayfaInteractor()
        ref.anasayfaPresenterNesnesi?.anasayfaView = ref
        
        //Interactor için
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor?.anasayfaPresenter = presenter
        
    }
}
