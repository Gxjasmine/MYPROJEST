//
//  CurrentOperation.swift
//  fzOperation
//
//  Created by fuzhong on 2017/12/25.
//  Copyright © 2017年 fuzhong. All rights reserved.
//

import UIKit

class CurrentOperation: Operation {

    enum State {
        case Ready,Executing,finished
        
        func keyPath() -> String {
            
            switch self {
            case .Ready:
                return "isReady"
            case .Executing:
                return "isExecuting"
            case .finished:
                return "isfinished"

            }
        }
    }
    
    var state = State.Ready
    {
        willSet{
            willChangeValue(forKey: newValue.keyPath())
            willChangeValue(forKey: state.keyPath())
        }
        didSet{
            
            didChangeValue(forKey: oldValue.keyPath())
            didChangeValue(forKey: state.keyPath())
            
        }
    }
    
    
    override var isReady: Bool
        {
        return super.isReady && state == .Ready
    }
    
    override var isExecuting: Bool{
        
        return state == .Executing
    }
    
    override var isFinished: Bool{
        
        return state == .finished
    }
    
   public func completeOperation() {
        
        state = .finished
    }
    
    //并发
    override var isAsynchronous: Bool{
        return true
    }
}
