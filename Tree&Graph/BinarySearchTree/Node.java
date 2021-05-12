class Node{
	private int data;
	private Node left;
	private Node right;

	// Construsctors to set default parameters
	Node(){
		this.data = 0;
		this.left = null;
		this.right = null;
	}
	// Constructors to set int data parameter
	Node(int infor){
		this.data = infor;
		this.left = null;
		this.right = null;
	}

	// Accessors and mutators
	public void setData(int infor){
		this.data = infor;
	}
	public int getData(){
		return this.data;
	}
	public void setLeft(Node node){
		this.left = node;
	}
	public Node getLeft(){
		return this.left;
	}
	public void setRight(Node node){
		this.right = node;
	}
	public Node getRight(){
		return this.right;
	}

	// Function to print the data
	public void printNode(){
		System.out.println("Node data: " + this.data);
	}
}