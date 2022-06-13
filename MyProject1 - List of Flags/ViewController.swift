//
//  ViewController.swift
//  MyProject1 - List of Flags
//
//  Created by Vitali Vyucheiski on 3/3/22.
//

import UIKit

class ViewController: UITableViewController {
    var flagImages = [String]()
    var flagImagesTitles = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "List Of Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let flags = try! fm.contentsOfDirectory(atPath: path)

        for flag in flags.sorted() {
            if flag.hasPrefix("flag") {
                flagImages.append(flag)
            }
        }
        
        for flag in flagImages {
            flagImagesTitles.append(flag.replacingOccurrences(of: "flag-", with: "").replacingOccurrences(of: "@3x.png", with: "").uppercased())
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flagImages.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = flagImagesTitles[indexPath.row]
        cell.imageView?.image = UIImage(named: flagImages[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedFlag = flagImages[indexPath.row]
            vc.titleText = flagImagesTitles[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}

