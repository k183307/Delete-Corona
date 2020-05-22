//
//  PhotoListViewController.swift
//  item_view
//
//  Created by 伊藤魁一 on 2020/05/02.
//  Copyright © 2020 kaichi. All rights reserved.
//

import UIKit

class PhotoListViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //前画面からのデータ引き継ぎ
    var shop_class : shop!
    
    //コレクションボックス選択行格納変数
    var serchIndex = Int()
    
    //引き継ぎ先Segue名
    let  nextView : String = "toResult3"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // レイアウトを調整
        let layout = UICollectionViewFlowLayout()
        let size = self.view.frame.size.width
        layout.itemSize = CGSize(width: size, height: size)
        collectionView.collectionViewLayout = layout
        
        //タイトル
        self.title = "Matching Shop"
        
        
        for i in 0 ..< shop_class.shop_information.count{
            let r = Int(arc4random_uniform(UInt32(shop_class.shop_information.count)))
            shop_class.shop_information.swapAt(i, r)
            
        }
    }
    
    
    //遷移先への準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //遷移先がtoResultの場合
        if segue.identifier == nextView{
            let viewController = segue.destination as! ResultViewController
            //次画面にデータ引き継ぎ
            viewController.shop_in = shop_class.shop_information[serchIndex]
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    
    //セクション内のセル数
    func collectionView(_ collectionView:UICollectionView,numberOfItemsInSection section : Int) -> Int{
        return shop_class.shop_information.count
    }
    
    
    //セルが選択された際の関数
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        serchIndex = indexPath.row
        performSegue(withIdentifier: nextView, sender: self)
    }
    
    //セル表示関数
    func collectionView(_ collectionView:UICollectionView,cellForItemAt indexPath:IndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoListItem", for : indexPath) as! PhotoListItemCollectionViewCell
        
        cell.photo.image = UIImage(named : shop_class.shop_information[indexPath.row].matching_image)
        cell.shop_name.text = shop_class.shop_information[indexPath.row].name
        
        return cell
                
    }
    
    
    
    

}
