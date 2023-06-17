//
//  StoreViewController.swift
//  BrainRushZap
//
//  Created by Вадим on 03.05.2023.
//

import UIKit

class StoreViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var language: String
    var soundPlaing: Bool
    var value: String
    var mainBG: String
    
    let defaults = UserDefaults.standard
    
    let storeData = [
        StoreData(backGround: "Main BG", nameButtonKey: "GREEN"),
        StoreData(backGround: "BG_Blue theme", nameButtonKey: "BLUE"),
        StoreData(backGround: "BG_Yellow theme", nameButtonKey: "YELLOW"),
        StoreData(backGround: "BG_Red theme", nameButtonKey: "RED"),
        StoreData(backGround: "BG_Blue-green theme", nameButtonKey: "GREEN-BLUE"),
        StoreData(backGround: "BG_Yellow-red theme", nameButtonKey: "YELLOW-RED")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.register(StoreCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView.isPagingEnabled = true
        defaults.set(value, forKey: "value")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! StoreCell
        let storeData = storeData[indexPath.item]
        cell.storeData = storeData
        cell.value = defaults.object(forKey: "value") as? String
        cell.soundPlaing = soundPlaing
        cell.language = language
        cell.mainBG = mainBG
        navigationController?.setNavigationBarHidden(true, animated: false)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    init(collectionViewLayout layout: UICollectionViewLayout, language: String, soundPlaing: Bool, value: String, mainBG: String) {
        self.language = language
        self.soundPlaing = soundPlaing
        self.value = value
        self.mainBG = mainBG
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
