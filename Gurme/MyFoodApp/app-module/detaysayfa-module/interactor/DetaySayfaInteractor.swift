//
//  DetaySayfaInteractor.swift
//  MyFoodApp
//
//  Created by Emre Koçak on 9.12.2021.
//

import Foundation
import Alamofire

class DetaySayfaInteractor : PresenterToInteractorDetaySayfaProtocol {
    
    func yemekAdet(yemek_adi:String, yemek_resim_adi:String, yemek_fiyat:String, yemek_siparis_adet:String, kullanici_adi:String) {
        
        let params:Parameters = ["yemek_adi":yemek_adi,
                                 "yemek_resim_adi":yemek_resim_adi,
                                 "yemek_fiyat":yemek_fiyat,
                                 "yemek_siparis_adet":yemek_siparis_adet,
                                 "kullanici_adi":kullanici_adi]
        
        Alamofire.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",method: .post,parameters: params).responseJSON{ response in
            
            if let data = response.data {
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                        //print("\(yemek_adi) \(yemek_siparis_adet) adet sepete eklendi.")
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}

