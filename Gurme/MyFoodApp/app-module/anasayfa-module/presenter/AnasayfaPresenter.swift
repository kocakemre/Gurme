//
//  AnasayfaPresenter.swift
//  MyFoodApp
//
//  Created by Emre Koçak on 10.12.2021.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol {
    
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func yemekleriYukle() {
        anasayfaInteractor?.tumYemekleriAl()
    }
    
    func ara(aramaKelimesi: String) {
        anasayfaInteractor?.yemekAra(aramaKelimesi: aramaKelimesi)
    }
    
    
}

extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yemekListesi: Array<TumYemekler>) {
        anasayfaView?.vieweVeriGonder(yemekListesi: yemekListesi)
    }
}
