//
//  result_class.swift
//  item_view
//
//  Created by 伊藤魁一 on 2020/04/25.
//  Copyright © 2020 kaichi. All rights reserved.
//

import Foundation

class ItemData{
    //商品ID
    var i_ID : String
    //商品名
    var name : String
    //値段
    var value : String
    //写真
    var picture : String
    //インスタンスが生成されたときの処理
    init(item_array : [String]){
        i_ID = item_array[0]
        name = item_array[1]
        value = item_array[2]
        picture = item_array[3]
    }
}

class item{
    //static let sharedInstance = item()
    
    //1行ずつ格納する配列
    var csvLines = [String]()
    
    //商品情報を格納するための配列
    var item_list = [ItemData]()
    
    
    func load_csv(load_path : String){
        
        //csvファイルパスを取得
        guard let path = Bundle.main.path(forResource:load_path, ofType:"csv") else {
            print("csvファイルが存在しません")
            return
        }
        
        //csvファイルの読み込み
        do {
            let csvString = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            
            //csvデータを1行ずつ読みこむ
            csvLines = csvString.components(separatedBy: .newlines)
            csvLines.removeLast()
            csvLines.removeFirst()
            
        } catch let error as NSError {
            print("エラー: \(error)")
            return
        }
        
        //カンマ区切りで分割
        for item_datas in csvLines{
            let item_l = ItemData(item_array: item_datas.components(separatedBy: ","))
            self.item_list.append(item_l)
        }
        return
        
    }
    
}

