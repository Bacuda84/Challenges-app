//
//  favouriteViewController.swift
//  Challenges app
//
//  Created by Bakhtovar Akhmedov on 15.06.2023.
//

import UIKit

class FavouriteViewController: UIViewController {
    
    var tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), style: .plain)
    var ourRealData = [RandomChallenge]()
    let refreshControl = UIRefreshControl()

    override func viewDidLoad() {
        super.viewDidLoad()
        print(4)
        setTabBarItem()
        getRandomData()
        setTableView()
        setNavBarItem()
    }
    fileprivate func setTableView() {
        let frame = CGRect(x: 0, y: 60, width: view.frame.width, height: view.frame.height-60)
        tableView.frame = frame
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ChallengeCell.self, forCellReuseIdentifier: "Challenge")
        tableView.register(FavouriteCell.self, forCellReuseIdentifier: "FavouriteCell")
        tableView.backgroundColor = .init(red: 243/255, green: 244/255, blue: 254/255, alpha: 1)
        tableView.separatorColor = .clear
        //refresh control
        tableView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        
        view.addSubview(tableView)
    }
    //setting 'all delete' button
    fileprivate func setNavBarItem() {
        let barButton = UIBarButtonItem(image: .init(systemName: "delete.left.fill"), style: .done, target: self, action: #selector(deleteAllChallenges))
//        navigationItem.setLeftBarButton(barButton, animated: true)
        navigationItem.leftBarButtonItem = barButton
    }
    
    @objc private func deleteAllChallenges() {
        if ourRealData.isEmpty { return }
        UserDefaultsData.reloadData(newIndex: [])
        print("delete???")

        showAlert()
    }
    
    private func showAlert() {
        let alertController = UIAlertController(title: AlertInfo.titleForDeleting.rawValue,
                                                message: AlertInfo.messageForDeleting.rawValue,
                                                preferredStyle: .alert)
        let action1 = UIAlertAction(title: AlertInfo.ok.rawValue, style: .cancel) { action in
            self.getRandomData()
            self.tableView.reloadData()
        }
        let action2 = UIAlertAction(title: AlertInfo.no.rawValue,
                                    style: .default)
        alertController.addAction(action1)
        alertController.addAction(action2)
        self.present(alertController, animated: true)
        

    }
    
    
    private func getRandomData() {
        
        ourRealData = UserDefaultsData.setFavouriteData()
        print(ourRealData)
    }
    
    
    
    //refresh
    @objc func refresh() {
        Timer.scheduledTimer(withTimeInterval: .ulpOfOne, repeats: false) { timer in
            self.getRandomData()
            self.tableView.reloadData()
        }
        refreshControl.endRefreshing()
    }
    
    func setTabBarItem() {
        tabBarItem.image = UIImage(systemName: "heart.fill")
//        tabBarItem.image
    }

}

//MARK: UITableViewDelegate and UITableViewDataSource
extension FavouriteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(ourRealData.count)
        return ourRealData.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0, let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteCell", for: indexPath) as? FavouriteCell {  //красиво оформить надо
            
            cell.initialize(text: "Понравившиеся задания")
            
            return cell
        }
        
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Challenge", for: indexPath) as? ChallengeCell {
            
            let text = ourRealData[indexPath.row-1].string
            cell.initialize(text: text)
            
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return 50}
        
        let howManyInRow = view.frame.width/21  //узнаем сколько символов в строке
        let howManyRows = ourRealData[indexPath.row-1].string.count / Int(howManyInRow)
        var result = (howManyRows * 21) + 40
        if result < 61 {
            result = 61
        }
        print(result, indexPath.row, "00")
        
        
        return CGFloat(result)
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        if indexPath.row != 0{
            return .delete
        }
        return .none
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            ourRealData.remove(at: indexPath.row-1)
            tableView.deleteRows(at: [indexPath], with: .fade)
            var data = UserDefaultsData.getData()
            data.remove(at: indexPath.row-1)
            UserDefaultsData.reloadData(newIndex: data)
        }
    }
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Удалить задание"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected")
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            title = "Понравившиеся задания"
        }
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            title = ""
        }
    }
    
    
    
}




