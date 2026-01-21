//
//  GameViewCell.swift
//  freeToGame
//
//  Created by Tardes on 20/1/26.
//

import UIKit

class GameViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var shortDescripcion: UILabel!
    @IBOutlet weak var platformImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with game: game) {
        titleLabel.text = game.title
        thumbnailImageView.loadFrom(url: game.thumbnail)
        genreLabel.text = game.genre
        shortDescripcion.text = game.shortDescription
        platformImageView.image = if game.platform == "PC (Windows)" {
            UIImage(systemName: "desktopcomputer")
        } else {
            UIImage(systemName: "safari")
        }
        
        cardView.layer.cornerRadius = 32
        cardView.layer.masksToBounds = true
        
    }
    
    
}
