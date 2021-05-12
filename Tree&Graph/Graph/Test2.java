class Test2{
	public static void main(String[] args) {
		//Node o = new Node();
		//o.printNode();
		int num = 4;
		MyGraph graph = new MyGraph(num);
		int [][] matrix = {{0,1,1,1}, 
						   {1,0,1,1}, 
						   {1,1,0,0}, 
						   {0,0,0,0}};
		graph.matrixToList(matrix);
		graph.displayAdjListArray();
	}
}