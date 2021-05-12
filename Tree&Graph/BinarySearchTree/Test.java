class Test{
	public static void main(String[] args) {
		Node o = new Node();
		//o.printNode();
		MyBST ob = new MyBST();
		for(int i = 0; i < 12; i = i+2){
			ob.insert(i);
		}
		ob.display();
		System.out.println(ob.search(12));
	}
}