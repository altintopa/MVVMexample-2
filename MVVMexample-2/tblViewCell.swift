//
//  tblViewCell.swift
//  MVVMexample-2
//
//  Created by Ahmet WOW on 16/05/2022.
//

import UIKit

protocol tblViewCellDelegate : AnyObject {
    func deneme(
        _ cell: tblViewCell,
        didTapWith viewModel:tblViewCellViewModel)
}

class tblViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    @IBOutlet weak var btnFollow: UIButton!
    
    var viewmodel: tblViewCellViewModel?
    
    weak var delegate:tblViewCellDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        btnFollow.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
    }
    
    @objc func didTapButton(){
        guard let viewmodel = viewmodel else {
            return
        }
        var newViewModel = viewmodel
        newViewModel.currentlyFollowing = !viewmodel.currentlyFollowing
        
        delegate?.deneme(self, didTapWith: newViewModel)
        
        prepareForReuse()
        configureCell(with: newViewModel)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(with viewModel: tblViewCellViewModel) {
        self.viewmodel = viewModel
        lblName.text = viewModel.name
        lblDetail.text = viewModel.username
        imageView?.image = viewModel.image
        
        if viewModel.currentlyFollowing {
            btnFollow.setTitle("Unfollow", for: .normal)
            btnFollow.setTitleColor(.black, for: .normal)
            btnFollow.layer.borderWidth = 1
            btnFollow.layer.borderColor = UIColor.black.cgColor
        } else {
            btnFollow.setTitle("Follow", for: .normal)
            btnFollow.setTitleColor(.white, for: .normal)
            btnFollow.backgroundColor = .link
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblName.text = nil
        lblDetail.text = nil
        btnFollow.backgroundColor = nil
        btnFollow.layer.borderWidth = 0
        btnFollow.setTitle(nil, for: .normal)
        
        
    }
    
}
