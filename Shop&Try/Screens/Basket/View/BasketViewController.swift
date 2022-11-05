//
//  BasketViewController.swift
//  Shop&Try
//
//  Created by Eray on 4.11.2022.
//

import UIKit

class BasketViewController: UIViewController {

    @IBOutlet var paymentButton: UIButton!
    @IBOutlet var tableView: UITableView!
    private var viewModel: BasketViewModel
    
    init(viewModel: BasketViewModel ) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasketTableViewCell", for: indexPath) as! BasketTableViewCell
        
        return cell
    }
    
    
    
    
}
