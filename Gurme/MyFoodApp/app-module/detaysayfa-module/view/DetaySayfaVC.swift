//
//  DetaySayfaVC.swift
//  MyFoodApp
//
//  Created by Emre Koçak on 8.12.2021.
//

import UIKit
import Kingfisher

class DetaySayfaVC: UIViewController {
    
    @IBOutlet weak var detayFiyatLabel: UILabel!
    @IBOutlet weak var imageViewDetaySayfasi: UIImageView!
    @IBOutlet weak var textFieldDetayUrunAdi: UITextField!
    @IBOutlet weak var stepperLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    let userDefault = UserDefaults.standard
    var yemek:TumYemekler?
    var detaySayfaPresenterNesnesi:ViewToPresenterDetaySayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Gurme"
        
        
        if let y = yemek {
            imageViewDetaySayfasi.image = UIImage(named: y.yemek_resim_adi!)
            textFieldDetayUrunAdi.text = "\(y.yemek_adi!)"
            if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(y.yemek_resim_adi!)") {
                DispatchQueue.main.async {
                    self.imageViewDetaySayfasi.kf.setImage(with: url)
                }
            }
            detayFiyatLabel.text = "\(y.yemek_fiyat!) TL"
        }
        DetaySayfaRouter.createModule(ref: self)
    }
    
    @IBAction func sepeteEkleButton(_ sender: Any) {
        if let k = stepperLabel.text,let y = yemek,let user = userDefault.object(forKey: "username") {
            detaySayfaPresenterNesnesi?.adet(yemek_adi: y.yemek_adi!, yemek_resim_adi: y.yemek_resim_adi!, yemek_fiyat: y.yemek_fiyat!, yemek_siparis_adet: k, kullanici_adi: user as! String)
            
        }
        if let y = yemek {
            print("\(y.yemek_adi!) - \(stepperLabel.text!) adet \(detayFiyatLabel.text!) fiyatla sepete eklendi.")
        }
        
    }
    
    @IBAction func stepperKontrol(_ sender: UIStepper) {
        
        let d = Int(sender.value)
        
        if let b = yemek?.yemek_fiyat! {
            if let a = Int(b){
                let toplam = a * d
                detayFiyatLabel.text = "\(toplam) TL"
            }
            
        }
        stepperLabel.text = String(Int(sender.value))
        
    }
}
