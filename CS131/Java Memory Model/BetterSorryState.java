import java.util.concurrent.atomic.AtomicInteger;
class BetterSorryState implements State {

    private AtomicInteger[] value;
    private byte maxval;

    BetterSorryState(byte[] v) { 
        value = new AtomicInteger[v.length]; 
        maxval = 127;
        for (int i = 0; i < v.length; i++)
            value[i] = new AtomicInteger((int) v[i]);
     }
	 
    BetterSorryState(byte[] v, byte m) { 
        value = new AtomicInteger[v.length]; 
        maxval = m;
        for (int i = 0; i < v.length; i++)
            value[i] = new AtomicInteger((int) v[i]);
     }	 
	
    public int size() { return value.length; }

    public byte[] current() { 
        byte[] output = new byte[value.length];
        for(int i = 0; i < value.length; i++)
            output[i] = (byte) value[i].get();
        return output; 
    }

    public boolean swap(int i, int j) {
		int v1 = value[i].get();
		int v2 = value[j].get();
		if (v1 <= 0 || v2 >= maxval) {
			return false;
		}
		value[i].set(--v1);
		value[j].set(++v2);
		return true;
    }
}
