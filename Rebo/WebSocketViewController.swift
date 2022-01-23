//
//  WebSocketViewController.swift
//  WebSocketViewController
//
//  Created by Urmat on 4/1/22.
//

import UIKit

class WebSocketViewController: UIViewController, URLSessionWebSocketDelegate {

    private var webSocketTask: URLSessionWebSocketTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBlue
        
        let session = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())
        
        let url = URL(string: "wss://demo.piesocket.com/v3/channel_1?api_key=oCdCMcMPQpbvNjUIzqtvF1d2X2okWpDQj4AwARJuAgtjhzKxVEjQU6IdCjwm&notify_self")
        
        webSocketTask = session.webSocketTask(with: url!)
        
        webSocketTask?.resume()
    }
    
    private func ping() {
        
    }
    private func close() {
        
    }
    
    private func receive() {
        
    }
    
    private func send() {
        
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("Did Open")
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        print("Did Close")
    }
    


}
