//
//  ViewController.swift
//  MusicLibrary
//
//  Created by Consultant on 11/18/19.
//  Copyright © 2019 Consultant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK:Properties
    @IBOutlet weak var tableview: UITableView!
    var controller: MusicControllerProtocol! = MusicController()
    @IBOutlet weak var musicsearchBar: UISearchBar!
    
    //view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self as! UITableViewDelegate
        tableview.dataSource = self as! UITableViewDataSource
        musicsearchBar.delegate = self as! UISearchBarDelegate
        musicsearchBar.returnKeyType = UIReturnKeyType.done
        let nib = UINib(nibName: "MusicViewCell", bundle: nil)
        self.tableview.register(nib, forCellReuseIdentifier: "MusicViewCell")
       //progammatically load story board
       // let storyboard = UIStoryboard(name: "Main", bundle: nil)
       // storyboard.instantiateViewController(identifier: <#T##String#>)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        controller.download { _ in
            DispatchQueue.main.async {
                self.tableview.reloadData()
            }
        }
        
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "MusicViewCell") as! MusicViewCell
       // tableview.register(UITableViewCell.self, forCellReuseIdentifier: MusicViewCell)
        let row = indexPath.row
        setupName(for: cell , at: row)
        setupImage(for: cell, at: row)
        return cell
    }
    
    func setupName(for cell: MusicViewCell, at row: Int){
        if let name = controller.musics[row].artistName,
            let album = controller.musics[row].albumName{
            cell.artistLabel.text = name
            cell.albumLabel.text = album
            }
        
        else{
            cell.albumLabel.text = "loading names"
            cell.artistLabel.text = "loading names"
        }
    }
    
    
    func setupImage(for cell: MusicViewCell, at row: Int){
        //cancel a previous task
        let music = controller.musics[row]
        
        if let prevTaskIndex = cell.prevTag,
            let urlstring = music.thumbnailImage {
            if let oldURL = URL(string: urlstring){
                controller.cancelTask(oldURL)
            }
        }
        //set image
        cell.thumbnailImage.image = nil
        if let image = music.thumbnailImage,
            let url = URL(string: image){
            cell.prevTag = row
            controller.getPicture(url) { (data) in
                guard let data = data else{
                    return
                }
                DispatchQueue.main.async {
                    cell.thumbnailImage.image = UIImage(data: data)
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // let detailvc = DetailsViewController(nibName: "DetailsViewController", bundle: nil)
        let detailvc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController
        detailvc!.artisTName = controller.musics[indexPath.row].artistName
        detailvc!.albuMName = controller.musics[indexPath.row].albumName
        detailvc!.copyright = controller.musics[indexPath.row].copyRight
        detailvc!.itunesLink = controller.musics[indexPath.row].url
        detailvc!.releaseDate = controller.musics[indexPath.row].releaseDate
        detailvc!.thumbnaiLImage = controller.musics[indexPath.row].thumbnailImage
        
        
        self.navigationController?.pushViewController(detailvc!, animated: true)
    }
}
    

extension ViewController: UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        controller.search(query: searchText)
        tableview.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        controller.search(query: "")
        tableview.reloadData()
    }
    
}
    












