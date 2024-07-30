//
//  AnimalCollectionViewCell.swift
//  UIKitMVVM
//
//  Created by Swayam Rustagi on 29/07/24.
//

import UIKit

class AnimalCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var animalName: UILabel!
    @IBOutlet weak var animalImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        animalImage.contentMode = .scaleToFill
        animalImage.layer.cornerRadius = animalImage.frame.size.width / 2
        animalImage.clipsToBounds = true
        animalImage.layer.borderColor = UIColor.clear.cgColor
        animalImage.layer.borderWidth = 2
    }
    
    func configure(with animal: AnimalModel, isSelected: Bool) {
        animalName.text = animal.name
        animalImage.image = UIImage(named: animal.name)
        animalImage.layer.borderColor = isSelected ? UIColor.blue.cgColor : UIColor.clear.cgColor
    }
}
