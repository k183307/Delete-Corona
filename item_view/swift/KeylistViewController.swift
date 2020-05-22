//
//  KeylistViewController.swift
//  item_view
//
//  Created by 伊藤魁一 on 2020/04/27.
//  Copyright © 2020 kaichi. All rights reserved.
//

import UIKit

class KeylistViewController: UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource  {
    
    //キーワードリスト
    @IBOutlet weak var table_view: UITableView!
    
    //インスタンス生成
    let keyword_class = keyword()
    
    //遷移先segue名
    var segue_name : String = "toKeyresult"
    
    //検索Index格納変数
    var serchIndex = Int()
    
    //前画面からのデータ引き継ぎ
    //var shopdata : [ShopData]!
    
    //var name_array : [String]!
    
    var shop_class : shop!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table_view.delegate = self
        table_view.dataSource = self
        
        keyword_class.load_csv()
        
    }
    
    //遷移先への準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //遷移先がtoResultの場合
        if segue.identifier == segue_name{
            let viewController = segue.destination as! KeyReslutViewController
            
            //次画面にデータ引き継ぎ
            viewController.shop_class = shop_class
            //viewController.name_array = name_array
            viewController.keyword_data = keyword_class.keyword_list[serchIndex].name
            viewController.keyword_array = keyword_class.keyword_list[serchIndex].shop_array
        }
        
        
        
    }
 
    
    //表示するセルの数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keyword_class.keyword_list.count
    }
    
    //セルの表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        // セルを取得する
        let cell: UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "keyword_cell")
        
          //セルに表示する値を設定する
        cell.textLabel?.text = keyword_class.keyword_list[indexPath.row].name
          
        return cell
    }
    
    /// セル選択時（UITableViewDataSource optional）
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        serchIndex = indexPath.row
        // 次の画面へ移動
        performSegue(withIdentifier: segue_name, sender: nil)
        
        
    }

}
