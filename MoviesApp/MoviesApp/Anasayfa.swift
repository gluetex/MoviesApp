//
//  ViewController.swift
//  MoviesApp
//
//  Created by Emre Ertuğ on 9.05.2024.
//


//COLLECTION VIEW
import UIKit

class Anasayfa: UIViewController {
    
    @IBOutlet weak var filmlerCollectionView: UICollectionView!
    
    var filmlerListesi = [Filmler]() //Veriler
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let f1 = Filmler(id: 1, ad: "Django", resim: "django", fiyat: 24)
        let f2 = Filmler(id: 2, ad: "Interstellar", resim: "interstellar", fiyat: 32)
        let f3 = Filmler(id: 3, ad: "Inception", resim: "inception", fiyat: 16)
        let f4 = Filmler(id: 4, ad: "The Hateful Eight", resim: "thehatefuleight", fiyat: 28)
        let f5 = Filmler(id: 5, ad: "The Pianist", resim: "thepianist", fiyat: 18)
        let f6 = Filmler(id: 6, ad: "Anadoluda", resim: "anadoluda", fiyat: 10)
        filmlerListesi.append(f1)
        filmlerListesi.append(f2)
        filmlerListesi.append(f3)
        filmlerListesi.append(f4)
        filmlerListesi.append(f5)
        filmlerListesi.append(f6)
        
        
        filmlerCollectionView.delegate = self
        filmlerCollectionView.dataSource = self
        
        
        let tasarim = UICollectionViewFlowLayout()
        
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        tasarim.minimumInteritemSpacing = 10
        tasarim.minimumLineSpacing = 10
        //10 X 10 X 10 : 30
        
        let ekranGenislik = UIScreen.main.bounds.width //ekranın genişliğini öğrenme
        
        let itemSayisi = 2
        
        let itemGenislik = (Int(ekranGenislik)-30) / itemSayisi
        
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*2)
        
        filmlerCollectionView.collectionViewLayout = tasarim //tasarımı CW'a aktarma
        
    }
//Örnek çalışma
    
//Kenar boşlukları : 5
//yatay boşluk: 9
//dikey boşluk: 10
//Yataydaki item sayısı: 4

//X itemleri temsil ediyor
// 5 X 9 X 9 X 9 X 5: 37
//(ekranGenislik-37)/4
}



extension Anasayfa : UICollectionViewDelegate, UICollectionViewDataSource, HucreProtocol{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmlerListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let hucre = collectionView.dequeueReusableCell(withReuseIdentifier: "filmlerHucre", for: indexPath) as! FilmlerHucre
        
        let film = filmlerListesi[indexPath.row]
        
        hucre.imageViewFilm.image = UIImage(named: film.resim!)
        hucre.labelFiyat.text = "\(film.fiyat!) ₺"
        
        hucre.layer.borderColor = UIColor.lightGray.cgColor
        hucre.layer.borderWidth = 0.3
        hucre.layer.cornerRadius = 10.0
        
        hucre.hucreProtocol = self
        hucre.indexPath = indexPath
        
        
        
        
        return hucre
        
    }
    
    func sepeteEkleTiklandi(indexPath: IndexPath) {
        let film = filmlerListesi[indexPath.row]
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) { //Seçilen item işlemleri
        
        let film = filmlerListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: film)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetay"{
            if let film = sender as? Filmler{
                let vc = segue.destination as! DetaySayfa
                vc.film = film
            }
            
        }
    }
    
}

