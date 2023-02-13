//
//  ViewController.swift
//  CollectionViewBeginnerProject
//
//  Created by Hande Nur Yavaş on 10.02.2023.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
   
    // Ürün resmi, Başlığı, Kısa Açıklaması ve fiyatı bulunan ürünlerin iki sütun halinde listelenmesi

    @IBOutlet weak var cvProduct: UICollectionView!
    var listOfProduct : [product] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       var p = product()
        p.title = "Product 1"
        p.price = 15
        p.briefDescription = "Product 1 brief description"
        p.imageName = "product1"
        
        listOfProduct.append(p)
        
        p = product()
         p.title = "Product 2"
         p.price = 13
         p.briefDescription = "Product 2 brief description"
         p.imageName = "product2"
         
         listOfProduct.append(p)
        
        p = product()
         p.title = "Product 3"
         p.price = 16
         p.briefDescription = "Product 3 brief description"
         p.imageName = "product1"
         
         listOfProduct.append(p)
        
        p = product()
         p.title = "Product 4"
         p.price = 18
         p.briefDescription = "Product 4 brief description"
         p.imageName = "product2"
         
         listOfProduct.append(p)
        cvProduct.delegate = self
        cvProduct.dataSource = self
        cvProduct.register(UINib(nibName: "CVC_Product", bundle: nil),  forCellWithReuseIdentifier: "CVC_Product")
        cvProduct.collectionViewLayout = ColumnFlowLayout(numberOfColumns: 2, minnumberOfClomuns: 10, minlineSpacing: 20)
        
       
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return listOfProduct.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CVC_Product", for: indexPath) as! CVC_Product
        
        let p = listOfProduct[indexPath.row]
    
        cell.lblTitle.text = p.title
        cell.lblBriefDescription.text = p.briefDescription
        cell.lblPrice.text = "\(p.price!) TL"
        cell.ivImage.image = UIImage(named: p.imageName!)
        
        return cell
        
    }
}

