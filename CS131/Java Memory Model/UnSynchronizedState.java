class UnSynchronizedState implements State {

    private byte[] value;
    private byte maxval;

    UnSynchronizedState(byte[] v) { value = v; maxval = 127; }

    UnSynchronizedState(byte[] v, byte m) { value = v; maxval = m; }

    public int size() { return value.length; }

    public byte[] current() { return value; }

    public boolean swap(int i, int j) 
	{
		if (value[i] <= 0 || value[j] >= maxval) 
		{
			//System.out.format("We got here \n");
			return false;
		}
		value[i]--;
		value[j]++;
		//System.out.format("WE GOT HERE \n");
		return true;
    }
}
