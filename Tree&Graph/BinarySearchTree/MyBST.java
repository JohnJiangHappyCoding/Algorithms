class MyBST{
	private Node root;

	//Constructor with default parameter
	MyBST(){
		this.root = null;
	}
	//Constructor with pre-set parameter
	MyBST(Node node){
		this.root = node;
	}
	//Mutator and accessor
	public void setRoot(Node node){
		this.root = node;
	}
	public Node getRoot(){
		return this.root;
	}
	// Insert to set the root
	public void insert(int value){
		if(this.root == null){
			this.root = new Node(value);
		}else{
			insertRec(this.root, value);
		}
	}
	// Insert in decreasing order 
	public void insertRec(Node current, int value){
		if(current.getData() < value){
			if(current.getLeft() != null){
				insertRec(current.getLeft(),value);
			}else{
				current.setLeft(new Node(value));
			}
		}else if(current.getData() > value){
			if(current.getRight() != null){
				insertRec(current.getRight(),value);
			}else{
				current.setRight(new Node(value));
			}
		}
	}
	// Print data in the node
	public void display(){
		if(this.root == null){
			System.out.println();
		}else{	
			display(this.root);
		}
	}
	// In-order display
	public void display(Node node){
		if(node != null){
			node.printNode();
			display(node.getLeft());
			display(node.getRight());
		}
	}
	// In-order search 
	public boolean search(int value){
		if(this.root == null){
			return false;
		}else{
			if(this.root.getData() == value){
				return true;
			}else{
				return searchRec(this.root, value);
			}
		}
	}
	// Search left and right 
	public boolean searchRec(Node current, int value){
		if(current != null){
			if(current.getData() < value){
				return searchRec(current.getLeft(), value);
			}else if(current.getData() > value){
				return searchRec(current.getRight(), value);
			}else{
				return true;
			}
		}
		else{
			return false;
		}
	}
}




