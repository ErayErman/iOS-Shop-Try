//
//  OnboardingViewController.swift
//  Shop&Try
//
//  Created by Eray on 30.10.2022.
//

import UIKit

class OnboardingViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var skip: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        navigationItem.hidesBackButton = true
        
    }
    private func setupUI() {
        let nib = UINib(nibName: "OnboardingCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "OnboardingCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
    }
    
    @IBAction func continueTouched(_ sende: UIButton){
        UserDefaults.standard.set(true, forKey: "openedApp")
    }
    
    @IBAction func didClickedSkipButton(_ sender: Any) {
        let authVC = AuthViewController()
        navigationController?.pushViewController(authVC, animated: true)
    }
    
}
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           
        let width = self.view.frame.width
        let height = self.view.frame.height
           
        return CGSize(width: width, height: height)
    }
    
}
