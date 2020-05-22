//
//  KeyReslutViewController.swift
//  item_view
//
//  Created by 伊藤魁一 on 2020/04/27.
//  Copyright © 2020 kaichi. All rights reserved.
//

import UIKit

class KeyReslutViewController: UIViewController,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var table_view: UITableView!
    
    var segue_name : String = "toResult2"
    
    var serchIndex = Int()
    
    

    @IBOutlet weak var keyword_label: UILabel!
    
    var int_serch = [Int]()
    
    //前画面からのデータ引き継ぎ
    var shop_class : shop!
    var keyword_data : String!
    var keyword_array : [String]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table_view.delegate = self
        table_view.dataSource = self
        
        keyword_label.text = keyword_data
        
    }
    
    //遷移先への準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //遷移先がtoResultの場合
        if segue.identifier == segue_name{
            let viewController = segue.destination as! ResultViewController
            
            //次画面にデータ引き継ぎ
            viewController.shop_in = shop_class.shop_information[serchIndex]
        }
        
        
        
    }
    
    //表示するセルの数を返す
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keyword_array.count
    }
    
    //セルの表示
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // セルを取得する
        let cell: UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        if let find_index = shop_class.ID_array.index(of : keyword_array[indexPath.row]){
            cell.textLabel?.text = shop_class.shop_information[find_index].name
            int_serch.append(find_index)
            
        }else{
            //セルに表示する値を設定する
            cell.textLabel?.text = keyword_array[indexPath.row]
        }
        return cell
    }
    
    /// セル選択時（UITableViewDataSource optional）
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        serchIndex = int_serch[indexPath.row]
        // 次の画面へ移動
        performSegue(withIdentifier:segue_name , sender: nil)
        
        
    }
    
    
    
    

}
