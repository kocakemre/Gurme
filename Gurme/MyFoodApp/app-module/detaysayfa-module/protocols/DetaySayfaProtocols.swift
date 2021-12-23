//
//  DetaySayfaProtocols.swift
//  MyFoodApp
//
//  Created by Emre Koçak on 9.12.2021.
//

import Foundation

protocol ViewToPresenterDetaySayfaProtocol {
    
    var detaySayfaInteractor:PresenterToInteractorDetaySayfaProtocol? {get set}
    
    func adet(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:String, yemek_siparis_adet:String, kullanici_adi:String)
    
}

protocol PresenterToInteractorDetaySayfaProtocol {
    
    func yemekAdet(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:String, yemek_siparis_adet:String, kullanici_adi:String)
}

protocol PresenterToRouterDetaySayfaProtocol {
    static func createModule(ref:DetaySayfaVC)
}

