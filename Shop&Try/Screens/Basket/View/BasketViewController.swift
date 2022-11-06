//
//  BasketViewController.swift
//  Shop&Try
//
//  Created by Eray on 4.11.2022.
//

import UIKit
import FirebaseFirestore
import AlamofireImage

class BasketViewController: UIViewController {
    
    @IBOutlet var paymentButton: UIButton!
    @IBOutlet var tableView: UITableView!
    private var viewModel: BasketViewModelProtocol
    let database = Firestore.firestore()
    
    var addedData = [[String : String]]()
    
    init(viewModel: BasketViewModelProtocol ) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.getData()
        setupUI()
        tableView.reloadData()
    }
    private func setupUI() {
        let nib = UINib(nibName: "BasketTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "BasketTableViewCell")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    
    }

}

extension BasketViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.addedData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketTableViewCell", for: indexPath) as! BasketTableViewCell
        let data = viewModel.addedData[indexPath.row]
        cell.productLabel.text = data["name"]
        cell.priceLabel.text = data["price"]
        cell.stepperLabel.text = data["count"]
        let urlString: String = data["image"] ?? "https://live.staticflickr.com/65535/52439244120_eb00d487fd_c.jpg"
        let url = URL(string: urlString)!
        cell.productImage?.af.setImage(withURL: url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

extension BasketViewController : BasketViewModelDelegate{
    
    func didErrorOccurred(_ error: Error) {
        print(error.localizedDescription)
    }

    func didGetData() {
        tableView.reloadData()
    }
}


