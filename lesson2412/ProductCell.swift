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
        let view = UILabel()
        return view
    }()
    
    override func layoutSubviews() {
        
        addSubview(productLabel)
        productLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    func getLabel() -> UILabel {
        return productLabel
    }
    
    func setColor() {
        backgroundColor = cellColor
    }
}
