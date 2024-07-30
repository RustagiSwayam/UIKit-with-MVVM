//
//  AnimalTableViewCell.swift
//  UIKitMVVM
//
//  Created by Swayam Rustagi on 29/07/24.
//

import UIKit

protocol AnimalTableViewCellDelegate: AnyObject {
    func playSoundButtonTapped(with name: String)
}

class AnimalTableViewCell: UITableViewCell {
    
    
    static let identifier = "AnimalTableViewCell"

    static func Nib()-> UINib{
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var existenceLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var containerV: UIView!
    @IBOutlet weak var playButton: UIButton!
    
    weak var delegate: AnimalTableViewCellDelegate?
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
        }

        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
        }
    
    
        func configure(with item: AnimalModel) {
            containerV.layer.cornerRadius = 10
            imageV.layer.cornerRadius = 10
            imageV.layer.shadowColor = UIColor.white.cgColor
            imageV.layer.shadowRadius = 5
            
            imageV.contentMode = .scaleToFill
            containerV.backgroundColor = item.bgColor
            imageV.image = UIImage(named: item.name)
            nameLabel.text = item.name
            existenceLabel.text = item.inExistence
            infoLabel.text = item.info
            
            setupButtonTarget()
        }
    
    private func setupButtonTarget(){
        playButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
        
        @objc private func buttonTapped() {
            if let name = nameLabel.text {
                delegate?.playSoundButtonTapped(with: name)
            }
        }
    }
