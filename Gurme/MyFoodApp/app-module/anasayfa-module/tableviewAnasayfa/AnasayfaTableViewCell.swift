//
//  AnasayfaTableViewCell.swift
//  MyFoodApp
//
//  Created by Emre Koçak on 8.12.2021.
//

import UIKit
import Kingfisher

class AnasayfaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var hucreArkaplan: UIView!
    @IBOutlet weak var anasayfaYemekImageView: UIImageView!
    @IBOutlet weak var anasayfaLabelYemekAdi: UILabel!
    @IBOutlet weak var anasayfaLabelYemekFiyat: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func resimGoster(resimAdi:String){
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)"){
            
            DispatchQueue.main.async { //kingfisher kullanımı
                
                self.anasayfaYemekImageView.kf.setImage(with: url)
                
            }
        }
    }
}
