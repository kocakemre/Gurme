//
//  DetaySayfaPresenter.swift
//  MyFoodApp
//
//  Created by Emre Koçak on 10.12.2021.
//

import Foundation

class DetaySayfaPresenter : ViewToPresenterDetaySayfaProtocol {
    
    var detaySayfaInteractor:PresenterToInteractorDetaySayfaProtocol? 
    
    func adet(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:String, yemek_siparis_adet:String, kullanici_adi:String) {
        detaySayfaInteractor?.yemekAdet(yemek_adi:yemek_adi,yemek_resim_adi:yemek_resim_adi,yemek_fiyat:yemek_fiyat,yemek_siparis_adet:yemek_siparis_adet,kullanici_adi:kullanici_adi)
    }
}

