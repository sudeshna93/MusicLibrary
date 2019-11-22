//
//  MusicCollectionVC.swift
//  MusicLibrary
//
//  Created by Consultant on 11/21/19.
//  Copyright © 2019 Consultant. All rights reserved.
//

import UIKit

class MusicCollectionVC: UIViewController {
    
    @IBOutlet weak var collectionview: UICollectionView!
    var controller: MusicControllerProtocol! = MusicController()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionview.delegate = self
        collectionview.dataSource = self
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        controller.download { _ in
            DispatchQueue.main.async {
                self.collectionview.reloadData()
            }
        }
        
    }
}

extension MusicCollectionVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return controller.musics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionview.dequeueReusableCell(withReuseIdentifier: "MusicCollectionViewCell", for: indexPath) as! MusicCollectionViewCell
               let row = indexPath.row
               setupImage(for: cell, at: row)
               setupName(for: cell, at: row)
               return cell
    }
    
     func setupImage(for cell: MusicCollectionViewCell, at row: Int) {
            //cancel a previous task
            let music = controller.musics[row]
            
            if let prevTaskIndex = cell.prevTag,
                let urlstring = music.thumbnailImage {
                if let oldURL = URL(string: urlstring){
                    controller.cancelTask(oldURL)
                }
            }
            //set image
            cell.imgview.image = nil
            if let image = music.thumbnailImage,
                let url = URL(string: image){
                cell.prevTag = row
                controller.getPicture(url) { (data) in
                    guard let data = data else{
                        return
                    }
                    DispatchQueue.main.async {
                        cell.imgview.image = UIImage(data: data)
                    }
                }
            }
        }
    
    
    func setupName(for cell: MusicCollectionViewCell, at row: Int){
        if let name = controller.musics[row].artistName,
            let album = controller.musics[row].albumName{
            cell.artistlabel.text = name
            cell.albumlabel.text = album
            }
        
        else{
            cell.albumlabel.text = "loading names"
            cell.artistlabel.text = "loading names"
        }
    }
    
    
}
