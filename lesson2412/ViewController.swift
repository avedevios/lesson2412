//
//  ViewController.swift
//  lesson2412
//
//  Created by ake11a on 2022-11-02.
//

import UIKit

class ViewController: UIViewController {
    
    private var backGroundColor = UIColor.systemCyan
    
    private var products: [Informative] =
    [Phone(model: "IPhone"),
    Car(mark: "KIA"),
    Shoes(brand: "ECCO"),
    Phone(model: "Samsung")]
    
    private lazy var productsCollectionView: UICollectionView = {
        let collectionViewFlowLayout = UICollectionViewFlowLayout()
        let CollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout)
        CollectionView.register(ProductCell.self, forCellWithReuseIdentifier: "product_cell")
        CollectionView.delegate = self
        CollectionView.dataSource = self
        
        return CollectionView
    }()
    
    private lazy var settingsBarButton: UIBarButtonItem = {
 
        let barButtonItem = UIBarButtonItem()
        barButtonItem.image = UIImage.init(systemName: "gearshape")
        barButtonItem.accessibilityRespondsToUserInteraction = true
        barButtonItem.action = #selector(settingsBarButtonAction)
        barButtonItem.target = self
        return barButtonItem
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupProducts()
  
        navigationItem.rightBarButtonItem = settingsBarButton
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        viewDidDisappear(animated)
        
        productsCollectionView.reloadData()
    }
    
    func setupProducts() {
        view.addSubview(productsCollectionView)
        productsCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    @objc func settingsBarButtonAction() {
        let settingsViewController = SettingsViewController()
        
        navigationController?.pushViewController(settingsViewController, animated: true)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "product_cell", for: indexPath) as! ProductCell
        cell.getLabel().text = products[indexPath.row].getTitle()
        cell.setColor()
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 200)
    }
}





