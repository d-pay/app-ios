//
//  HomeViewController.swift
//  HackathonVisa
//
//  Created by Jean Paul Marinho on 14/02/19.
//  Copyright © 2019 aKANJ. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet var balanceLabel: UILabel!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var cardView: UIView!
    var blurredView: UIVisualEffectView!
    var user = User()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let visualEffect = UIBlurEffect(style: .light)
        blurredView = UIVisualEffectView(effect: visualEffect)
        blurredView.frame = view.frame
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 80, right: 0);
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        cardView.frame = CGRect(x: 0, y: view.frame.height, width: cardView.frame.width, height: cardView.frame.height)
        view.addSubview(blurredView)
        blurredView.isHidden = true
        view.addSubview(cardView)
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.cardView.center.y -= 50
        }, completion: nil)
        refresh() 
    }
    
    @IBAction func balanceTapped(_ sender: UITapGestureRecognizer) {
        refresh()
    }
    
    @IBAction func transferPressed(_ sender: Any) {
    }
    
    @IBAction func requestPressed(_ sender: Any) {
        let vc = UIActivityViewController(activityItems: ["HackathonVisa"], applicationActivities: nil)
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func cardDragged(_ sender: UIPanGestureRecognizer) {
        let isUp = sender.translation(in: nil).y > 0
        if isUp {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.cardView.frame = CGRect(x: self.cardView.frame.origin.x, y: self.view.frame.height - 50, width: self.cardView.frame.width, height: self.cardView.frame.height)
                self.blurredView.alpha = 0
            }, completion: { success in
                self.blurredView.isHidden = isUp
            })
        }
        else {
            UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.cardView.center.y = self.view.center.y
                self.blurredView.alpha = 1
            }, completion: { success in
                self.blurredView.isHidden = isUp
            })
        }
        
    }
    
    func refresh() {
        APIClient.getInfo { (user) in
            DispatchQueue.main.async {
                self.user = user ?? User()
                self.updateUI()
            }
        }
    }
    
    func updateUI() {
        balanceLabel.text = user.balance
        tableView.reloadData()
    }
}



extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.debits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "transactionCell") as! TransactionCell
        let debit = user.debits[indexPath.row]
        cell.nameLabel.text = debit.name
        cell.createdLabel.text = debit.submitTimeUtc
        cell.priceLabel.text = debit.totalAmount
        cell.daysLeftLabel.text = debit.daysLeft
        cell.brandImageView.image = UIImage(named: "brand-\(indexPath.row+1)")
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableCell(withIdentifier: "headerCell")
    }
}
