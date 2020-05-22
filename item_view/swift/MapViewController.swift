//
//  MapViewController.swift
//  item_view
//
//  Created by 伊藤魁一 on 2020/05/04.
//  Copyright © 2020 kaichi. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*
        // 緯度・軽度を設定
        let location:CLLocationCoordinate2D
           = CLLocationCoordinate2DMake(35.68154,139.752498)

        mapView.setCenter(location,animated:true)

        // 縮尺を設定
        var region:MKCoordinateRegion = mapView.region
        region.center = location
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02

        mapView.setRegion(region,animated:true)

        //表示タイプを航空写真と地図のハイブリッドに設定
        //mapView.mapType = MKMapType.hybrid
        mapView.mapType = MKMapType.standard
        // mapView.mapType = MKMapType.satellite
 
 */
        initMap()
    }
    func initMap() {
        // 縮尺を設定
        var region:MKCoordinateRegion = mapView.region
        region.span.latitudeDelta = 0.02
        region.span.longitudeDelta = 0.02
        mapView.setRegion(region,animated:true)

        // 現在位置表示の有効化
        mapView.showsUserLocation = true
        // 現在位置設定（デバイスの動きとしてこの時の一回だけ中心位置が現在位置で更新される）
        mapView.userTrackingMode = .follow
    }
    
    func updateCurrentPos(_ coordinate:CLLocationCoordinate2D) {
        var region:MKCoordinateRegion = mapView.region
        region.center = coordinate
        mapView.setRegion(region,animated:true)
    }
    
    // CLLocationManagerのdelegate：現在位置取得
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        updateCurrentPos((locations.last?.coordinate)!)
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
