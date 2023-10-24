//
//  ViewController.swift
//  Checkwork_MasteringTableView
//
//  Created by 伊藤明孝 on 2023/10/23.
//

//MARK: ①TableViewのdelegateの設定をしよう
//MARK: ②ビルドした際に発生するエラーを解決しよう
//MARK: ③TableViewのセルにデータを表示しよう
//MARK: ④TableViewに設置しているパーツが見えないので、セルのレイアウトを調整してみよう
//MARK: ⑤TableViewのセルをスワイプして削除できるようにしよう

import UIKit
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    public var data = [
        VacationData(imagePath: "NewYork", destination: "NewYork", explanation: ""),
        VacationData(imagePath: "Taipei", destination: "Taipei", explanation: ""),
        VacationData(imagePath: "Pari", destination: "Pari", explanation: ""),
        VacationData(imagePath: "Seoul", destination: "Seoul", explanation: ""),
        VacationData(imagePath: "Hawaii", destination: "Hawaii", explanation: "")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        self.setupTableView()
    }
    
    private func setupTableView(){
        //デリゲートの処理はここに書こう
        self.tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

