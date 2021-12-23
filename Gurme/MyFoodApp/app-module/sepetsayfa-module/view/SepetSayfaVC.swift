//
//  SepetSayfaVC.swift
//  MyFoodApp
//
//  Created by Emre Koçak on 8.12.2021.
//

import UIKit

class SepetSayfaVC: UIViewController {
    
    var toplam : Int = 0
    
    @IBOutlet weak var toplamLabel: UILabel!
    @IBOutlet weak var sepatSayfaTableView: UITableView!
    
    var sepetSayfaPresenterNesnesi:ViewToPresenterSepetSayfaProtocol?
    var yemekler = [SepetYemekler]()
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor.systemOrange
        appearance.titleTextAttributes = [.foregroundColor:UIColor(named: "yaziRenk1")!]
        
        //status bar tarzı
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let a = UITabBarAppearance()
        a.backgroundColor = UIColor.white
        
        tabBarController?.tabBar.standardAppearance = a
        //tabBarController?.tabBar.compactAppearance = a
        tabBarController?.tabBar.scrollEdgeAppearance = a
        
        sepatSayfaTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        //self.navigationController?.title = "sepet"
        
        sepatSayfaTableView.delegate = self
        sepatSayfaTableView.dataSource = self
        
        self.navigationItem.title = "My Basket"
        
        SepetSayfaRouter.createModule(ref: self) 
        
    }
    override func viewWillAppear(_ animated: Bool) {
        let kullaniciAdi = userDefaults.object(forKey: "username")
        sepetSayfaPresenterNesnesi?.yemekleriAl(kullanici_adi:kullaniciAdi as! String)
        get_total()
        
    }
    
    
    @IBAction func silBarButtonItem(_ sender: Any) {
        silBarButton()
    }
    
    func silBarButton(){
        for yemek in yemekler {
            sepetSayfaPresenterNesnesi?.sil(sepet_yemek_id: yemek.sepet_yemek_id!, kullanici_adi: yemek.kullanici_adi!)
        }
    }
    
    func get_total(){
        var total = 0
        var textToplam : Int = 0
        
        for yemek in yemekler {
            total = Int(yemek.yemek_siparis_adet!)! * Int(yemek.yemek_fiyat!)!
            textToplam += total
            
        }
        toplamLabel.text = "TOTAL: \(String(textToplam)) TL"
        
    }
    
    @IBAction func sepetiOnaylaButton(_ sender: Any) {
        print("\(toplamLabel.text!) ile sepet onaylandı. ")
    }
    
    @IBAction func cikisYapButton(_ sender: Any) {
        exit(0)
    }
    
}
extension SepetSayfaVC : PresenterToViewSepetSayfaProtocol {
    func vieweVeriGonder(sepetYemeklerListe:Array<SepetYemekler>) {
        self.yemekler = sepetYemeklerListe
        
        DispatchQueue.main.async {
            self.sepatSayfaTableView.reloadData()
            self.get_total()
        }
    }
}

extension SepetSayfaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemekler.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemekler[indexPath.row]
        let hucre = sepatSayfaTableView.dequeueReusableCell(withIdentifier: "sepetHucreAdi", for: indexPath) as! SepetSayfaTableViewCell
        
        hucre.sepetsayfaLabelYemekAdi.text = yemek.yemek_adi!
        hucre.adetLabel.text = "\(yemek.yemek_siparis_adet!) units"
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)") {
            DispatchQueue.main.async {
                hucre.sepetsayfaYemekImageView.kf.setImage(with: url)
            }
        }
        
        toplam = Int(yemek.yemek_siparis_adet!)! * Int(yemek.yemek_fiyat!)!
        hucre.sepetsayfaLabelYemekFiyat.text = "\(toplam) TL"
        
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.hucreArkaPlan.layer.cornerRadius = 15.0 //hücre köşelerini kıvrımlaştırdık
        
        hucre.selectionStyle = .none
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Delete"){ (contextualAction,view,bool) in
            
            let yemek = self.yemekler[indexPath.row]
            
            let alert = UIAlertController(title: "\(yemek.yemek_adi!) delete from cart?", message: "", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "Cancel", style: .cancel){ action in
                
            }
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Yes", style: .destructive){ action in
                self.sepetSayfaPresenterNesnesi?.sil(sepet_yemek_id: yemek.sepet_yemek_id!, kullanici_adi: yemek.kullanici_adi!)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}


