//
//  keyword_class.swift
//  item_view
//
//  Created by 伊藤魁一 on 2020/04/26.
//  Copyright © 2020 kaichi. All rights reserved.
//

import Foundation

class KeywordData{
    
    //キーワードID
    var K_ID : String
    
    //キーワード名
    var name : String
    
    //キーワード該当する店ID配列
    var shop_array : [String]
    
    //クラスが生成されたときの処理
    init(k_id : String,n : String,shop_a : [String]){
        K_ID = k_id
        name = n
        shop_array = shop_a
    }
}

class keyword{
    //1行ずつ格納する配列
    var csvLines = [String]()
    
    
    //店情報を格納するための配列
    var keyword_list = [KeywordData]()
    
    //店名配列
    var keyword_array : [String] = []
    
    
    
    //店情報を読み込むための処理
    func load_csv(){
        //csvファイルパスを取得
        guard let path = Bundle.main.path(forResource:"keyword_list",ofType:"csv") else {
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
        for keyword_datas in csvLines{
            //let keyword_l = KeywordData(keyword_array: keyword_datas.components(separatedBy: ","))
            
            let k = keyword_datas.components(separatedBy: ",")
            let shop_a = k[2].components(separatedBy: "-")
            
            
            let keyword_l = KeywordData(k_id:k[0],n:k[1],shop_a: shop_a)
            
            
            
            self.keyword_list.append(keyword_l)
        }
        
        return
    }
    
    
    

}
