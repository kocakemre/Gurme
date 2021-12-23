//
//  SepetSayfaTableViewCell.swift
//  MyFoodApp
//
//  Created by Emre Koçak on 8.12.2021.
//

import UIKit

class SepetSayfaTableViewCell: UITableViewCell {
    
    @IBOutlet weak var adetLabel: UILabel!
    @IBOutlet weak var hucreArkaPlan: UIView!
    @IBOutlet weak var sepetsayfaYemekImageView: UIImageView!
    @IBOutlet weak var sepetsayfaLabelYemekAdi: UILabel!
    @IBOutlet weak var sepetsayfaLabelYemekFiyat: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
