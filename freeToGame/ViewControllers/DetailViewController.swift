//
//  DetailViewController.swift
//  freeToGame
//
//  Created by Tardes on 20/1/26.
//

import UIKit

class DetailViewController: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var platformImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var collectionView: UICollectionView!

    var game: game!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        navigationItem.title = game.title

        collectionView.dataSource = self

        titleLabel.text = game.title
        thumbnailImageView.loadFrom(url: game.thumbnail)
        genreLabel.text = game.genre
        descriptionLabel.text = game.description
        platformImageView.image =
            if game.platform == "PC (Windows)" {
                UIImage(systemName: "desktopcomputer")
            } else {
                UIImage(systemName: "safari")
            }

        Task {
            game = await GameProvider().getGamebyId(id: game.id)

            DispatchQueue.main.async {
                self.loaddata()

            }
        }
    }

    func loaddata() {
        titleLabel.text = game.title
        thumbnailImageView.loadFrom(url: game.thumbnail)
        genreLabel.text = game.genre
        descriptionLabel.text = game.description
        platformImageView.image =
            if game.platform == "PC (Windows)" {
                UIImage(systemName: "desktopcomputer")
            } else {
                UIImage(systemName: "safari")
            }
        
        collectionView.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return game.screenshots?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Screenshot Cell", for: indexPath) as! ScreenshotViewCell
        let screenshot = game.screenshots![indexPath.row]
        cell.configure(with: screenshot)
        return cell
    }

    @IBAction func toogleDescription(_ sender: Any) {
        descriptionLabel.numberOfLines = descriptionLabel.numberOfLines == 0 ? 5 : 0
    }

}
