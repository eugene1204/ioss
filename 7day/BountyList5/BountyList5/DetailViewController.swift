//
//  DetailViewController.swift
//  BountyList5
//
//  Created by yujin son on 2021/02/12.
//  Copyright © 2021 yujin son. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    @IBOutlet weak var bountyLabelCenterX: NSLayoutConstraint!
    @IBOutlet weak var nameLabelCenterX: NSLayoutConstraint!
    
    let viewModel = DetailViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        prepareAnimation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showAnimation()
    }

    private func prepareAnimation(){
        // nameLabel이 밖으로 나가게하기
//        nameLabelCenterX.constant = view.bounds.width
//        bountyLabelCenterX.constant = view.bounds.width
        nameLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).rotated(by: 180)
        bountyLabel.transform = CGAffineTransform(translationX: view.bounds.width, y: 0).rotated(by: 180)
        
        nameLabel.alpha = 0
        bountyLabel.alpha = 0
    }
    
    private func showAnimation(){
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.nameLabel.transform = CGAffineTransform.identity
            self.nameLabel.alpha = 1
        }, completion: nil)
        
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.6, initialSpringVelocity: 2, options: .allowUserInteraction, animations: {
            self.bountyLabel.transform = CGAffineTransform.identity
            self.bountyLabel.alpha = 1
        }, completion: nil)
        
        UIView.transition(with: imgView, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
      
    }
    
    func updateUI(){
        // segue로 받아온 데이터를 View로 보여주는 코드
        if let bountyInfo = viewModel.bountyInfo {
            imgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }

    }
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    
    
}
class DetailViewModel{
    var bountyInfo: BountyInfo?
    
    func update(model: BountyInfo?){
        bountyInfo = model
    }
}

