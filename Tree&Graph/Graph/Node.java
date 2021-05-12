class Node{
	private int index;
	private Node next;

	//Constructor with default parameter
	Node(){
		this.index = 0;
		this.next = null;
	}
	//Constructor with pre-set index
	Node(int data){
		this.index = data;
		this.next = null;
	}

	//Accessor and mutator
	public void setIndex(int data){
		this.index = data;
	}
	public int getIndex(){
		return this.index;
	}
	public void setNext(Node node){
		this.next = node;
	}
	public Node getNext(){
		return this.next;
	}

	//Function to print node index
	public void printNode(){
		System.out.print("Node " + this.index);
	}

}