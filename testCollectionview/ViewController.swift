//
//  ViewController.swift
//  testCollectionview
//
//  Created by wangk on 2017/12/28.
//  Copyright © 2017年 wangk. All rights reserved.
//

import UIKit

let itemPerRow:Int = 33

class TestCell:UICollectionViewCell {
    var label:UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 5)
        label.clipsToBounds = true
        self.addSubview(label)
        let length = UIScreen.main.bounds.size.width/CGFloat(itemPerRow)
        label.frame = CGRect(origin: .zero, size: CGSize(width: length, height: length))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class ViewController: UIViewController {
    var collection:UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = .white
        
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .vertical
        let length = UIScreen.main.bounds.size.width/CGFloat(itemPerRow)
        layout.itemSize = CGSize(width: length, height: length)
        collection = UICollectionView(frame: self.view.bounds,
                                      collectionViewLayout: layout)
        collection.register(TestCell.self, forCellWithReuseIdentifier: "cell")
        collection.delegate = self
        collection.dataSource = self
        self.view.addSubview(collection)
        collection.backgroundColor = .white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 200
    }
}

extension ViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemPerRow
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! TestCell
//        cell.label.text = String(indexPath.section) + String(indexPath.row)
        cell.label.text = "2"
        return cell
    }
}
