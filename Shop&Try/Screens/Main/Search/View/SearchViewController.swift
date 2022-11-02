//
//  SearchViewController.swift
//  Shop&Try
//
//  Created by Eray on 2.11.2022.
//

import UIKit

class SearchViewController: CAViewController {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var categoryControll: UISegmentedControl!
    @IBOutlet var searchBar: UISearchBar!
    
    private var viewModel : SearchVM
    init(viewModel: SearchVM ) {
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
        let nib = UINib(nibName: "ProductsCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "productsCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }

}
// MARK: - CollectionView Extension

extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productsCell", for: indexPath) as! ProductsCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
        let width = self.view.frame.width/2.5
        let height = self.view.frame.width/3
           
        return CGSize(width: width, height: height)
    }
    
    
    
}

// MARK: - Searchbar Extension

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            //self.dataList = viewModel.results
            //filteredList = dataList.filter {$0.name!.lowercased().contains(searchText.lowercased())}
            collectionView.reloadData()
            
        }
        func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            self.searchBar.text = ""
            collectionView.reloadData()
        }

}
