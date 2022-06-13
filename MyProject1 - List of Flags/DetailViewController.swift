//
//  DetailViewController.swift
//  MyProject1 - List of Flags
//
//  Created by Vitali Vyucheiski on 3/4/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedFlag: String?
    var messegeToShare: String = ""
    var titleText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = titleText
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        if let imageToLoad = selectedFlag {
            imageView.image = UIImage(named: imageToLoad)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 1) else
            {
            print("No image found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, titleText], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}
