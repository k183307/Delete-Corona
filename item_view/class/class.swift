//
//  class.swift
//  item_view
//
//  Created by 伊藤魁一 on 2020/04/25.
//  Copyright © 2020 kaichi. All rights reserved.
//

import Foundation


class ShopData{
    //店名ID
    var s_ID : String
    //データベースID
    var DB_No : String
    //店名
    var name : String
    //ホームページ
    var home_page : String
    //電話番号
    var phone : String
    //ベスト1〜３
    var best1 : String
    var best2 : String
    var best3 : String
    
    //所在地
    var location : String
    
    //定休日
    var day:String
    
    //営業時間
    var time : String
    
    var matching_image : String
    //頭文字
    //var initial : String
    
    //キーワード
    //var keyword : String
    
    //クラスが生成されたときの処理
    init(shop_array : [String]){
        s_ID = shop_array[0]
        DB_No = shop_array[1]
        name = shop_array[2]
        home_page = shop_array[3]
        phone = shop_array[4]
        best1 = shop_array[5]
        best2 = shop_array[6]
        best3 = shop_array[7]
        location = shop_array[8]
        time = shop_array[9]
        day = shop_array[10]
        matching_image = shop_array[11]
        //initial = shop_array[8]
        //keyword = shop_array[9]
    }
}

class shop{
    //1行ずつ格納する配列
    var csvLines = [String]()
    
    
    //店情報を格納するための配列
    var shop_information = [ShopData]()
    
    //店名配列
    var name_array : [String] = []
    
    //ID配列
    var ID_array : [String] = []
    
    //店情報を読み込むための処理
    func load_csv() {
        
        
        
        //csvファイルパスを取得
        guard let path = Bundle.main.path(forResource:"shop_inf",ofType:"csv") else {
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
        for shop_datas in csvLines{
            let shop_inf = ShopData(shop_array: shop_datas.components(separatedBy: ","))
            print(shop_inf.name)
            self.name_array.append(shop_inf.name)
            self.ID_array.append(shop_inf.s_ID)
            self.shop_information.append(shop_inf)
            
        }
        
        
        return
    }
    
    
}
