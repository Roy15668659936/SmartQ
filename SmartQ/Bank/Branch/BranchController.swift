//
//  BranchController.swift
//  SmartQ
//
//  Created by vewang on 2019/6/15.
//  Copyright © 2019 tiny. All rights reserved.
//

import UIKit

class BranchController: BaseViewController,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {

    }
    
    var branchLinkList = [BranchLink]()
    var searchBranchList = [BranchLink]()
    var isSearch = false
    var searchController: UISearchController!
    
    lazy var tableView: UITableView = {
        let tempTableView = UITableView (frame: CGRect(x: 0, y: 104, width: self.view.frame.width, height: self.view.frame.height-154), style: UITableViewStyle.plain)
        tempTableView.delegate = self
        tempTableView.dataSource = self
//        tempTableView.tableFooterView = UIView.init()
        return tempTableView
    }()
    lazy var searchBar: UISearchBar = {
        let tempSearchBar = UISearchBar(frame:CGRect(x: 0, y: 64, width: self.view.frame.width, height: 40))
        //        tempSearchBar.prompt = "Search Bank"
        tempSearchBar.placeholder = "请输入名称"
        tempSearchBar.showsCancelButton = true
        tempSearchBar.delegate = self
        tempSearchBar.barStyle = .default
        tempSearchBar.showsBookmarkButton = true
        tempSearchBar.showsSearchResultsButton = true
        tempSearchBar.showsCancelButton = true
        tempSearchBar.showsScopeBar = true
        tempSearchBar.keyboardType = UIKeyboardType.default
        //            tempSearchBar.backgroundColor = UIColor.black
        //            tempSearchBar.barTintColor=UIColor.white
        
        return tempSearchBar
    }()

    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch {
            return searchBranchList.count
        }
        else{
            return branchLinkList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = BranchViewCell(style:UITableViewCellStyle.default, reuseIdentifier: "branchCell")
        cell.accessoryType = .disclosureIndicator
//        cell.setValueForCell(model:branchLinkList[indexPath.row])
        if isSearch {
            cell.setValueForCell(model:searchBranchList[indexPath.row])
        }
        else{
            cell.setValueForCell(model:branchLinkList[indexPath.row])
        }

//        print("branchLinkList : ", branchLinkList[indexPath.row].branchName)
        return cell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewController = ReserveViewController()
        viewController.branchItem = branchLinkList[indexPath.row]
        self.navigationController?.pushViewController(viewController, animated: true)

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.00
    }
    
    struct BranchTemp: Decodable {
        var branchId: String
        var branchName: String
        var branchDistance: String
        var branchAddress: String
        var branchIcon: String
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        super.title = "选择网点";
        self.navigationController?.navigationItem.title="1234"
        super.setNavigation(Title: "选择网点")

//        print("start")
        loadBankLinkList()
//        tableView = UITableView(frame:self.view.bounds,style:.plain)
//        tableView.tableHeaderView = searchBar
        self.view.addSubview(searchBar)
        self.view.addSubview(tableView)
        tableView.register(NSClassFromString("BranchViewCell"), forCellReuseIdentifier: "branchCell")
        tableView.delegate = self
        tableView.dataSource = self
//        print("start")
        self.view.addSubview(searchBar)

    }
//    override func viewWillAppear(_ animated: Bool) {
//        self.setNavigation(Title: "选择网点");
//    }
    
    func loadBankLinkList() -> () {
        guard let fileURL = Bundle.main.url(forResource: "BranchList.json", withExtension: nil),
            let data = try? Data.init(contentsOf: fileURL) else{
                fatalError("`JSON File Fetch Failed`")
        }
        let decoder = JSONDecoder()
        guard let temp = try? decoder.decode([BranchTemp].self, from: data) else{
            fatalError("`JSON Decode Failed`")
        }
//        print(temp)
        
        for i in 0..<temp.count {
            let b = BranchLink()
            b.branchName = temp[i].branchName
            b.branchId = temp[i].branchId
            b.branchDistance = temp[i].branchDistance
            b.branchAddress = temp[i].branchAddress
            b.branchIcon = temp[i].branchIcon
//            print("branch Name : ", b.branchName)
            branchLinkList.append(b)
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearch = false
        searchBar.resignFirstResponder()
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {

        filterBySubstring(filterStr: searchBar.text!)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

        filterBySubstring(filterStr: searchText)
    }
    
    func filterBySubstring(filterStr : String) {
        isSearch = true
        print(filterStr)

        if filterStr == "" {
            self.searchBranchList = self.branchLinkList
        }else{
            var str: String = "*"
            for character in filterStr.characters {
                str.append("\(character)*")
            }
            let preicate = NSPredicate.init(format: "branchName LIKE[c] %@", str)
            self.searchBranchList = branchLinkList.filter(preicate.evaluate(with:))
//            self.searchBranchList = self.branchLinkList.filtered(using: preicate) as! NSMutableArray
            print("test ", self.searchBranchList)
//            for branchLink in self.branchLinkList {
//                print("test ", branchLink.branchName!)
//
//            }
//            self.searchBranchList = []
//            for branchLink in self.branchLinkList {
//                print("test ", branchLink.branchName!)
//                if branchLink.branchName!.(filterStr! as String) {
//                    print("result ", branchLink)
//                    self.searchBranchList.append(branchLink)
//                }
//            }
        }
        print("searchBranchList", searchBranchList)
        self.searchBar.endEditing(true)
        self.tableView.reloadData()
    }
    
}
