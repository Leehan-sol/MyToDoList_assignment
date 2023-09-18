//
//  CollectionViewCell.swift
//  ToDoList
//
//  Created by t2023-m0048 on 2023/09/18.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
 
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        setupCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell() {
        contentView.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
              imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
              imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
              imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
              imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
          ])
      }

}
