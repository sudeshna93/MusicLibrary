//
//  DetailsViewController.swift
//  MusicLibrary
//
//  Created by Consultant on 11/20/19.
//  Copyright © 2019 Consultant. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageShadowView: UIView!
    @IBOutlet weak var itunesButton: UIButton!
    @IBOutlet weak var copyrightLabel: UILabel!
    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var albumName: UILabel!
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var releaseDateLabel: UILabel!
    var artisTName : String?
    var albuMName :String?
    var thumbnaiLImage : String?
    var copyright : String?
    var itunesLink: String?
    var releaseDate: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.artistName.text = artisTName!
        self.albumName.text = albuMName
        self.releaseDateLabel.text = "Release Date: " + releaseDate!
        self.copyrightLabel.text = "copyright: " + copyright!
        if let img = URL(string: thumbnaiLImage!){
            let dat = NSData(contentsOf: img)
            thumbnailImage.image = UIImage(data: dat! as Data)
        }
        congifView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        UIView.animate(withDuration: 8.0, delay: 1, options: ([.curveLinear, .repeat, .autoreverse]), animations: {() -> Void in
                          self.copyrightLabel.center = CGPoint(x: 80 - self.copyrightLabel.bounds.size.width / 2, y: self.copyrightLabel.center.y)
                      }, completion:  { _ in })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //shadow view configuration
        imageShadowView.clipsToBounds = false
        imageShadowView.layer.shadowColor = UIColor.black.cgColor
        imageShadowView.layer.shadowOpacity = 1
        imageShadowView.layer.shadowOffset = CGSize.zero
        imageShadowView.layer.shadowRadius = 10
        imageShadowView.layer.shadowPath = UIBezierPath(roundedRect: imageShadowView.bounds, cornerRadius: 10).cgPath
                       
        thumbnailImage.clipsToBounds = true
        thumbnailImage.layer.cornerRadius = 10
        imageShadowView.addSubview(thumbnailImage)
    }

    @IBAction func itunesLinkAction(_ sender: Any) {
       //  UIApplication.shared.open(option.url,
        UIApplication.shared.open(URL(string: itunesLink!)!, options: [:], completionHandler: nil)
    }
    
    func congifView(){
        self.itunesButton.layer.cornerRadius = 5
       
    }
    
    

}
