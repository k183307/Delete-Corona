//
//  ResultViewController.swift
//  item_view
//
//  Created by 伊藤魁一 on 2020/04/24.
//  Copyright © 2020 kaichi. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    //店名
    @IBOutlet weak var shop_name: UILabel!
    
    //写真
    @IBOutlet weak var picture_1: UIImageView!
    
    @IBOutlet weak var picture_2: UIImageView!
    
    @IBOutlet weak var picture_3: UIImageView!
    
    //ベスト3の商品名
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var name3: UILabel!
    
    
    //ベスト3の値段
    @IBOutlet weak var value1: UILabel!
    @IBOutlet weak var value2: UILabel!
    @IBOutlet weak var value3: UILabel!
    
    //ベスト３ラベル
    @IBOutlet weak var best3_label: UILabel!
    
    //リスト
    @IBOutlet weak var table_view: UITableView!
    
    //電話番号ラベル
    @IBOutlet weak var phone_label: UILabel!
    
    //ホームページラベル
    @IBOutlet weak var homepage_label: UILabel!
    
    //営業時間
    @IBOutlet weak var time: UILabel!
    //定休日
    @IBOutlet weak var day_label: UILabel!
    
    //所在地
    @IBOutlet weak var location_label: UILabel!
    //インスタンス
    //let item_class = item.sharedInstance
    let item_class = item()
    
    //前画面からのデータ引き継ぎ
    //検索するShopDataインスタンス
    var shop_in : ShopData!

    
  
    
    
    var targetURL = "https://www.youtube.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table_view.delegate = self
        table_view.dataSource = self
        
        
        //前画面で検索した店のデータベースから情報をロード
        item_class.load_csv(load_path: shop_in.DB_No)
        
        var flag = 0
        var best1_index = -1
        var best2_index = -1
        var best3_index = -1
        
        //ベスト3に該当するi_IDのインデックスを検索
        for i in 0..<item_class.item_list.count{
            if shop_in.best1 == item_class.item_list[i].i_ID{
                best1_index = i
                flag += 1
            }else if shop_in.best2 == item_class.item_list[i].i_ID{
                best2_index = i
                flag += 1
            }else if shop_in.best3 == item_class.item_list[i].i_ID{
                best3_index = i
                flag += 1
            }
            if flag == 3 {
                break
            }
        }
        if best1_index < 0 || best2_index < 0 || best3_index < 0{
            print("おすすめのIDが一致しません")
            return
        }
        //ベスト３の名前描画
        name1.text = item_class.item_list[best1_index].name
        name2.text = item_class.item_list[best2_index].name
        name3.text = item_class.item_list[best3_index].name
        
        //ベスト３の値段描画
        value1.text = item_class.item_list[best1_index].value + "円"
        value2.text = item_class.item_list[best2_index].value + "円"
        value3.text = item_class.item_list[best3_index].value + "円"
        
        //ベスト３の写真描画
        picture_1.image = UIImage(named : item_class.item_list[best1_index].picture)
        picture_2.image = UIImage(named : item_class.item_list[best2_index].picture)
        picture_3.image = UIImage(named : item_class.item_list[best3_index].picture)
        
        
        //店名とタイトル表示
        //shop_name.text = shop_in.name
        self.title = shop_in.name
        
        //電話番号とホームページ
        //phone_label.text = "電話番号："+shop_in.phone
        
        //所在地
        location_label.text = "所在地　："+shop_in.location
        
        //営業時間
        time.text = "営業時間："+shop_in.time
        
        //定休日
        day_label.text = "定休日　：" + shop_in.day
        
        //
        
        if item_class.item_list.isEmpty{
            print("loadできません")
        }else{
            
            print(item_class.item_list[1].name)
        }
        
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func viewButton(_ sender: Any) {
        let url = URL(string: shop_in.home_page)
        UIApplication.shared.open(url!)
    }
    
    @IBAction func phone_button(_ sender: Any) {
        
        let url = NSURL(string: "tel://"+shop_in.phone)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url as URL)
        } else {
            UIApplication.shared.openURL(url as URL)
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item_class.item_list.count
    }
        
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        print(item_class.item_list.count)
        // セルを取得する
        let cell: UITableViewCell = UITableViewCell(style: .value1, reuseIdentifier: "item_cell")
        
        
        // セルに表示する値を設定する
        cell.textLabel?.text = item_class.item_list[indexPath.row].name
        cell.detailTextLabel?.text = item_class.item_list[indexPath.row].value+"円"
        
        return cell
        
    }
    
    

    

}
