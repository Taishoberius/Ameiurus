//
//  ChatViewController.swift
//  AmeiurusTest
//
//  Created by Cédric NANTEAU Dev on 23/02/2019.
//  Copyright © 2019 Cedric NANTEAU Dev. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    var ameiurus: Ameiurus!

    public static func instantiateBotChat(ameiurus: Ameiurus) -> ChatViewController {
        let controller = ChatViewController()
        controller.ameiurus = ameiurus

        return controller
    }

    @IBAction func didTouchSend() {
        guard let question = txtField.text,
            !question.isEmpty
        else {
            return
        }
        messages.insert(Message(text: question, type: 0), at: 0)
        tableView.reloadData()
        try! ameiurus.ask(text: question) {
            self.messages.insert(Message(text: $0.response, type: 1), at: 0)
            self.tableView.reloadData()
            self.txtField.text = ""
        }
    }
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.transform = CGAffineTransform(rotationAngle: -(CGFloat)(Double.pi))
        tableView.dataSource = self
        txtField.delegate = self
        tableView.separatorStyle = .none
        self.tableView.backgroundColor = ameiurus.botUI.backgroundColor
        let userMsgCell = UINib(nibName: "UserMessageCell", bundle: nil)
        let serverMsgCell = UINib(nibName: "ServerMessageCell", bundle: nil)
        self.tableView.register(userMsgCell, forCellReuseIdentifier: "UserMessageCell")
        self.tableView.register(serverMsgCell, forCellReuseIdentifier: "ServerMessageCell")

    }
    
    func sendMessageToDialogFlow(message: String) -> String {
        return message
    }

}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idx = self.messages.index(self.messages.startIndex, offsetBy: indexPath.row)
        let message = self.messages[idx]
        if message.type == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserMessageCell") as? UserMessageCell ?? UserMessageCell(style: .default, reuseIdentifier: "UserMessageCell")

            cell.setUI(botUI: self.ameiurus.botUI)
            cell.setMessage(content: message.text)
            cell.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ServerMessageCell") as? ServerMessageCell ?? ServerMessageCell(style: .default, reuseIdentifier: "ServerMessageCell")
            cell.setUI(botUI: self.ameiurus.botUI)
            cell.setMessage(content: message.text)
            cell.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
            return cell
        }
        
    }
}

extension ChatViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.frame.origin.y = 0
        self.txtField.endEditing(true)
        self.didTouchSend()
        return true
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        self.view.frame.origin.y = -345
        return true
    }
}
