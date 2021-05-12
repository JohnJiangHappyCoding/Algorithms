class MyGraph{
	private LinkedList adjListArray [];

	// Constructor with default parameter
	MyGraph(){
		adjListArray = new LinkedList[0];
		adjListArray[0] = null;
	}

	// Constructor with pre-set parameter
	MyGraph(int num){
		adjListArray = new LinkedList[num];
		for(int i = 0; i < num; i ++){
			this.adjListArray[i] = new LinkedList();
		}
	}

	// Function to transform the matrix to an adjacency list
	public void matrixToList(int [][] matrix){
		int i = matrix.length;
		int j = matrix[0].length;
		for(int m = 0; m < i; m++){
			for(int n = 0; n < j; n++){
				// Create a list when there is an connection
				if(matrix[m][n] == 1){
					adjListArray[m].createList(n);
				}
			}
		}
	}

	// Function to print out the adjacency list array
	public void displayAdjListArray(){
		int n = adjListArray.length;
		System.out.println("Output: ");
		for(int i = 0; i < n; i++){
			System.out.print(i + ": ");
			adjListArray[i].printList();
			System.out.println();
		}
	}
}