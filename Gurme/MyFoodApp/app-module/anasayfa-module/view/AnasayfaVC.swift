//
//  ViewController.swift
//  MyFoodApp
//
//  Created by Emre Koçak on 8.12.2021.
//

import UIKit
import Kingfisher

class AnasayfaVC : UIViewController {
    
    @IBOutlet weak var anasayfaTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var yemekListe = [TumYemekler]()
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    var filterFoodList = [TumYemekler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        anasayfaTableView.delegate = self
        anasayfaTableView.dataSource = self
        
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor.systemOrange
        //başlık rengi
        appearance.titleTextAttributes = [.foregroundColor:UIColor(named: "yaziRenk1")!,NSAttributedString.Key.font : UIFont(name: "Pacifico-Regular", size: 30)!]
        //status bar tarzı
        navigationController?.navigationBar.barStyle = .black
        //RGB renk paletini doğru kullanma
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        let a = UITabBarAppearance()
        a.backgroundColor = UIColor.white
        
        tabBarController?.tabBar.standardAppearance = a
        tabBarController?.tabBar.scrollEdgeAppearance = a
        navigationItem.title = "Gurme"
        
        anasayfaTableView.separatorColor = UIColor(white: 0.95, alpha: 1)//separatör rengini arkaplan rengi yaptık ve gözükmemesini sağladık
        AnasayfaRouter.createModule(ref: self)
    }
    
    //Anasayfaya geri döndüğümüzde çalışır
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.yemekleriYukle()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let yemek = sender as? TumYemekler
            let gidilecekVC = segue.destination as! DetaySayfaVC
            gidilecekVC.yemek = yemek
        }
    }
}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemekListesi: Array<TumYemekler>) {
        self.yemekListe = yemekListesi
        self.filterFoodList = yemekListesi
        DispatchQueue.main.async {
            self.anasayfaTableView.reloadData()
        }
    }
}

extension AnasayfaVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        self.filterFoodList = self.yemekListe.filter{yemek in
            if yemek.yemek_adi!.lowercased().contains(searchText.lowercased()){
                return true
            }
            if searchText == ""{
                return true
            }
            return false
        }
        self.anasayfaTableView.reloadData()
        
        anasayfaPresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
}

extension AnasayfaVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filterFoodList.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = filterFoodList[indexPath.row]
        
        performSegue(withIdentifier: "toDetay", sender: yemek)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = filterFoodList[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "anasayfaHucreAdi", for: indexPath) as! AnasayfaTableViewCell
        
        hucre.anasayfaYemekImageView.image = UIImage(named: yemek.yemek_resim_adi!)
        hucre.anasayfaLabelYemekAdi.text = yemek.yemek_adi
        hucre.anasayfaLabelYemekFiyat.text = "\(yemek.yemek_fiyat!) TL"
        
        
        hucre.resimGoster(resimAdi: "\(yemek.yemek_resim_adi!)")
        //hücremizin arkaplan rengi
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.hucreArkaplan.layer.cornerRadius = 15.0 //hücre köşelerini kıvrımlaştırdık
        
        hucre.selectionStyle = .none
        return hucre
    }
}


