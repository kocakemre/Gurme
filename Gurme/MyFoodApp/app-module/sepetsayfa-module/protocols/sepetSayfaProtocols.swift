//
//  sepetSayfaProtocols.swift
//  MyFoodApp
//
//  Created by Emre Koçak on 9.12.2021.
//

import Foundation

protocol ViewToPresenterSepetSayfaProtocol {
    
    var sepetSayfaInteractor:PresenterToInteractorSepetSayfaProtocol? {get set}
    var sepetSayfaView:PresenterToViewSepetSayfaProtocol? {get set}
    
    func yemekleriAl(kullanici_adi:String)
    func sil(sepet_yemek_id:String,kullanici_adi:String)
}

protocol PresenterToInteractorSepetSayfaProtocol {
    var sepetSayfaPresenter:InteractorToPresenterSepetSayfaProtocol? {get set}
    
    func sepettekiYemekleriAl(kullanici_adi:String)
    func yemekSil(sepet_yemek_id:String,kullanici_adi:String)
}

protocol InteractorToPresenterSepetSayfaProtocol {
    func presenteraVeriGonder(sepetYemeklerListe:Array<SepetYemekler>)
}
protocol PresenterToViewSepetSayfaProtocol {
    func vieweVeriGonder(sepetYemeklerListe:Array<SepetYemekler>)
}

protocol PresenterToRouterSepetSayfaProtocol {
    static func createModule(ref:SepetSayfaVC)
}
