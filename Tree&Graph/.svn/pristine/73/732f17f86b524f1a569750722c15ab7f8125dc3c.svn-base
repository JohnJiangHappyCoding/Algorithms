class LinkedList{
	private Node head;

	// Constructor with default parameter
	LinkedList(){
		this.head = null;
	}
	// Constructor with pre-set parameter
	LinkedList(Node node){
		this.head = node;
	}

	//Accesor and mutator
	public void setHead(Node node){
		this.head = node;
	}
	public Node getHead(){
		return this.head;
	}

	// Function to create linkedlist
	public void createList(int value){
		if(this.head == null){
			this.head = new Node(value);
		}else{
			Node tmp = this.head;
			Node prev = null;
			while(tmp != null){
				prev = tmp;
				tmp = tmp.getNext();
			}
			prev.setNext(new Node(value));
		}
	}

	// Function to print this list
	public void printList(){
		Node tmp = this.head;
		Node prev = null;
		while(tmp != null){
			prev = tmp;
			if(prev.getNext() != null){
				tmp.printNode();
				System.out.print(" -> ");	
			}else{
				tmp.printNode();
			}
			tmp = tmp.getNext();
		}
	}

}