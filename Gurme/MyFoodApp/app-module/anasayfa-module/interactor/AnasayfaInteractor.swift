//
//  AnasayfaInteractor.swift
//  MyFoodApp
//
//  Created by Emre Koçak on 10.12.2021.
//

import Foundation
import Alamofire

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumYemekleriAl() {
        Alamofire.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).responseJSON{ response in
            
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(TumYemeklerCevap.self, from: data)
                    var liste = [TumYemekler]()
                    if let gelenListe = cevap.yemekler {
                        liste = gelenListe
                    }
                    
                    self.anasayfaPresenter?.presenteraVeriGonder(yemekListesi: liste)
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
        
    }
    
    func yemekAra(aramaKelimesi: String) {
        print("Arama sonucu : \(aramaKelimesi)")
    }
    
}
