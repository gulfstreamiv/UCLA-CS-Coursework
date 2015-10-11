import java.util.concurrent.atomic.AtomicIntegerArray;

class GetNSetState implements State {
    private AtomicIntegerArray value;
	private byte maxval;
	
    GetNSetState(byte[] v) { value = new AtomicIntegerArray(aux(v)); maxval = 127;}
	GetNSetState(byte[] v, byte m) { value = new AtomicIntegerArray(aux(v)); maxval = m; }
    
    public int size() { return value.length(); }
    
    public byte[] current() {
        byte[] v_array = new byte[value.length()];
        for (int i = 0; i < value.length(); i++) {
            v_array[i] = (byte) value.get(i);
        }
        return v_array;
    }

    public boolean swap(int i, int j) 
	{
		int v1 = value.get(i);
		int v2 = value.get(j);
        if (v1 <= 0|| v2 >= maxval) 
		{
            return false;
        }

        value.set(i, --v1);

        value.set(j, ++v2);

        return true;
    }
	
	private int[] aux(byte[] v) //this function converts byte[] to int[]
    {
        int[] nv = new int[v.length];
        for (int i = 0; i < v.length; i++)
        {
            nv[i] = v[i] & 0xff; 
        }
        return nv;
    }
}
