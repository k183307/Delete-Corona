//
//  MyUINavigationViewController.swift
//  item_view
//
//  Created by 伊藤魁一 on 2020/05/15.
//  Copyright © 2020 kaichi. All rights reserved.
//

import UIKit

class MyUINavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //バー背景色
        self.navigationController?.navigationBar.barTintColor = UIColor.yellow
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
