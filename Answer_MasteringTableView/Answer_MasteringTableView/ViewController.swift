

import UIKit
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var vacationListTableView: UITableView!
    public var data = [
        VacationData(imagePath: "NewYork", destination: "NewYork", explanation: "Statue of Liberty,Times Square,Central Park"),
        VacationData(imagePath: "Taipei", destination: "Taipei", explanation: "Taipei 101,Shilin Night Market,Ximending"),
        VacationData(imagePath: "Pari", destination: "Pari", explanation: "Eiffel Tower,Palace of Versailles,Notre-Dame Cathedral"),
        VacationData(imagePath: "Seoul", destination: "Seoul", explanation: "Gyeongbokgung Palace,Dongdaemun Design Plaza,Jogyesa Temple:"),
        VacationData(imagePath: "Hawaii", destination: "Hawaii", explanation: "Waikiki Beach,Volcanoes National Park")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //MARK: ①TableViewのdelegateの設定をしよう
        self.vacationListTableView.delegate = self
        self.vacationListTableView.dataSource = self
        self.vacationListTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //MARK: ②ビルドした際に発生するエラーを解決しよう(cellのidentifierが違う)
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        //MARK: ③TableViewにデータを表示しよう
        cell.destinationLabel.text = self.data[indexPath.row].destination
        cell.explanationLabel.text = self.data[indexPath.row].explanation
        cell.vacationImageView.image = UIImage(named: self.data[indexPath.row].imagePath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    //MARK: ④TableViewに設置しているパーツが見えないので、セルのレイアウトを調整してみよう
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    //MARK: ⑤TableViewのセルをスワイプして削除できるようにしよう
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            self.data.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

