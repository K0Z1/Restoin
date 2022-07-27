//
//  ViewController.swift
//  Restoin
//
//  Created by Kozi on 27/07/22.
//

import UIKit

class ViewController: UIViewController {

    var listResto: [Restaurants]? {
        didSet {
            DispatchQueue.main.async { [self] in
                restoTableView.reloadData()
            }
        }
    }
    
    @IBOutlet weak var restoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let restoManager = RestoManager()
        restoManager.fetchResto { (resto) in
            self.listResto = resto.restaurants
        }
        
        restoTableView.register(UINib(nibName: "RestoTableViewCell", bundle: nil), forCellReuseIdentifier: "RestoCell")
        
        restoTableView.delegate = self
        restoTableView.dataSource = self
        restoTableView.frame = view.bounds
        
        let header = SrechyHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.width))
        header.imageView.image = UIImage(named: "ImgHeader")
        restoTableView.tableHeaderView = header
    }
    
}

extension UIImageView {
    func loadFrom(URLAddress: String) {
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            if let imageData = try? Data(contentsOf: url) {
                if let loadedImage = UIImage(data: imageData) {
                        self?.image = loadedImage
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listResto?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RestoCell", for: indexPath) as? RestoTableViewCell {
          
            guard let resto = listResto?[indexPath.row] else { return UITableViewCell() }
            
            cell.restoImage.loadFrom(URLAddress: "https://restaurant-api.dicoding.dev/images/small/\(resto.pictureId)")
            cell.restoLabel.text = "\(resto.name)"
            cell.descLabel.text = "\(resto.description)"
            cell.ratingImage.image = UIImage(named: "Star")
            cell.ratingLabel.text = "\(resto.rating)"
            cell.locImage.image = UIImage(named: "Location")
            cell.locLabel.text = "\(resto.city)"
            
            return cell
        } else {
            
          return UITableViewCell()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToDetail", sender: listResto?[indexPath.row])
    }
    
    override func prepare(
        for segue: UIStoryboardSegue,
        sender: Any?
      ) {
        if segue.identifier == "moveToDetail" {
          if let detaiViewController = segue.destination as? DetailViewController {
            detaiViewController.resto = sender as? Restaurants
          }
        }
      }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = restoTableView.tableHeaderView as? SrechyHeaderView else {
            return
        }

        header.scrollViewDidScroll(scrollView: restoTableView)
    }
}
