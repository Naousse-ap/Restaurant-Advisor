//
//  Test2CollectionViewCell.swift
//  Restaurant
//
//  Created by Anaïs Puig on 17/03/2021.
//

import UIKit

class DisplayMenuCollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    
    @IBOutlet weak var Name: UILabel!
    @IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Picture: UIImageView!
    @IBOutlet weak var Price: UILabel!
    
    //Définition du champ pour l'affichage du delete
    var suppp: UILabel!
    //Variable permettant le mouvement du table View menu
    var pan: UIPanGestureRecognizer!
    
    //Récupération d
    //    var Gtid:String = ""
    //    var aa:String = ""
    
    //Fonction déterminant l'attribution des informations au emplacements prédéfinis
    func setup(with menu: Menu) {
        Name.text = menu.name
        if let imageURL = URL(string: menu.picture) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.Picture.image = image
                    }
                }
            }
        }
        //        Gtid = "\(menu.id)"
      
        Description.text = menu.description
        Price.text = "\(menu.price)"
    }
    
    //Fonctions pour gérer l'affichage du delete ainsi que le mouvement de la tableView
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        self.contentView.backgroundColor = UIColor.white
        self.backgroundColor = UIColor.red
        
        suppp = UILabel()
        suppp.text = "delete"
        suppp.text = "delete"
        suppp.textColor = UIColor.white
        self.insertSubview(suppp, belowSubview: self.contentView)
        
        pan = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        pan.delegate = self
        self.addGestureRecognizer(pan)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        if (pan.state == UIGestureRecognizer.State.changed) {
            let p: CGPoint = pan.translation(in: self)
            let width = self.contentView.frame.width
            let height = self.contentView.frame.height
            self.contentView.frame = CGRect(x: p.x,y: 0, width: width, height: height);
            self.suppp.frame = CGRect(x: p.x - suppp.frame.size.width-10, y: 0, width: 100, height: height);
        }
    }
    @objc func onPan(_ pan: UIPanGestureRecognizer) {
        if pan.state == UIGestureRecognizer.State.began {
            
        } else if pan.state == UIGestureRecognizer.State.changed {
            self.setNeedsLayout()
        } else {
            if abs(pan.velocity(in: self).x) > 500 {
                let collectionView: UICollectionView = self.superview as! UICollectionView
                let indexPath: IndexPath = collectionView.indexPathForItem(at: self.center)!
                collectionView.delegate?.collectionView!(collectionView, performAction: #selector(onPan(_:)), forItemAt: indexPath, withSender: nil)
            } else {
                UIView.animate(withDuration: 0.2, animations: {
                    self.setNeedsLayout()
                    self.layoutIfNeeded()
                })
            }
        }
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    override func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return abs((pan.velocity(in: pan.view)).x) > abs((pan.velocity(in: pan.view)).y)
    }
    
    
    //Fonction permettant de selectionner le menu à modifier
    override var isSelected: Bool{
        didSet{
            if self.isSelected {
                self.contentView.backgroundColor = #colorLiteral(red: 0.8455839753, green: 0.8457264304, blue: 0.8455651999, alpha: 1)
                self.Picture.isHidden = false
            }
            else {
                self.transform = CGAffineTransform.identity
                self.contentView.backgroundColor = UIColor.white
            }
        }
    }
}


