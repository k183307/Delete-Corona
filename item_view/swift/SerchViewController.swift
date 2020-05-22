//
//  SerchViewController.swift
//  item_view
//
//  Created by 伊藤魁一 on 2020/04/23.
//  Copyright © 2020 kaichi. All rights reserved.
//

import UIKit

class SerchViewController: UIViewController, UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource {
    
    //検索TextField
    @IBOutlet weak var serch_textfield: UITextField!
    
    //検索label
    @IBOutlet weak var serch_label: UILabel!
    
    //shopリスト
    @IBOutlet weak var table_view: UITableView!
    
    //遷移先segue名
    var serch : String = "toResult"
    
    //検索Index格納変数
    var serchIndex = Int()
    
    //前画面からのデータ引き継ぎ
    var shop_class : shop!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        serch_label.text = "検索したいお店を入力してください"
        
        table_view.delegate = self
        table_view.dataSource = self
        
        for i in 0 ..< shop_class.shop_information.count{
            let r = Int(arc4random_uniform(UInt32(shop_class.shop_information.count)))
            shop_class.shop_information.swapAt(i, r)
            
        }
        
    }
    
    //遷移先への準備
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //遷移先がtoResultの場合
        if segue.identifier == serch{
            let viewController = segue.destination as! ResultViewController
            
            //次画面にデータ引き継ぎ
            viewController.shop_in = shop_class.shop_information[serchIndex]
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return shop_class.shop_information.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        // セルを取得する
        let cell: UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "shop_cell")
        
          //セルに表示する値を設定する
        cell.textLabel?.text = shop_class.shop_information[indexPath.row].name
          
        return cell
    }
    
    /// セル選択時（UITableViewDataSource optional）
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        serchIndex = indexPath.row
        // 次の画面へ移動
        performSegue(withIdentifier: serch, sender: shop_class.shop_information[indexPath.row])
        
        
    }
    
    //検索ボタンを押したとき
    @IBAction func serch_button(_ sender: Any) {
        
        if serch_textfield.text == ""{
            serch_label.text = "何も書かれていません"
        }else{
            //TextFieldの入力が完全一致する場合
            if let firstIndex = shop_class.name_array.index(of: serch_textfield.text!) {
                serchIndex = firstIndex
                
                print("インデックス番号: \(firstIndex)") // 3
                //次画面に遷移
                self.performSegue(withIdentifier: serch, sender: shop_class.shop_information[serchIndex])
            }
            //TextFieldの入力が完全一致しない場合
            else{
                serch_label.text = "一致するものがありません"
            }
        }
        
       
        
        
        
    }
    
    
    
    
    
    


}
