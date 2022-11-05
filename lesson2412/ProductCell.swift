//
//  ProductCell.swift
//  lesson2412
//
//  Created by ake11a on 2022-11-02.
//

import UIKit
import SnapKit

var cellColor = UIColor.cyan

class ProductCell: UICollectionViewCell {
    
    private lazy var productLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var productInfoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override func layoutSubviews() {
        
        addSubview(productLabel)
        productLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        addSubview(productInfoLabel)
        productInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(productLabel).offset(40)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    func getLabel() -> UILabel {
        return productLabel
    }
    
    func getInfoLabel() -> UILabel {
        return productInfoLabel
    }
    
    func setColor() {
        backgroundColor = cellColor
    }
}
