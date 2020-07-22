[ 과제 ] 
싱글 링크드 리스트 구현

	import Foundation
	
	protocol LinkedListStack {
	  var isEmpty: Bool { get } // 노드가 있는지 여부
	  var size: Int { get }     // 전체 개수
	  func push(node: Node)     // 데이터 삽입
	  func peek() -> String?    // 마지막 데이터 확인
	  func pop() -> String?     // 데이터 추출
	}
	
	final class Node {
	    var value: String
	    var next: Node?
	    
	    init(value: String) {
	        self.value = value
	    }
	}
	
	final class SingleLinkedList: LinkedListStack {
	    private var head: Node? = nil
	    var isEmpty: Bool { head == nil }
	    var size: Int = 0
	    
	    private var lastNode: Node? {
	        guard var currentNode = head else { return nil }
	        while let nextNode = currentNode.next {
	            currentNode = nextNode
	        }
	        return currentNode
	    }
	    
	    func push(node newNode: Node) {
	        
	        if let lastNode = lastNode { // 노드가 하나 이상 있을 때
	            lastNode.next = newNode
	        } else { // 노드가 nil일 때
	            head = newNode
	        }
	        size += 1
	    }
	    
	    func peek() -> String? {
	        lastNode?.value
	    }
	    
	    func pop() -> String? {
	        guard var currentNode = head else { return nil }
	        while let _ = currentNode.next?.next {
	            currentNode = currentNode.next!
	        }
	        size -= 1
	        if let popValue = currentNode.next?.value {
	            currentNode.next = nil
	            return popValue
	        } else {
	            defer { head = nil } // defer - 해당 중괄호의 마지막에 실행
	            return head?.value
	        }
	    }
	    
	}

