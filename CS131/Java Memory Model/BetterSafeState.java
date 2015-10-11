import java.util.concurrent.locks.ReentrantLock;

class BetterSafeState implements State 
{
    private byte[] value;
	private byte maxval;
    private final ReentrantLock RL = new ReentrantLock();
    
    BetterSafeState(byte[] v) {value = v; maxval = 127;}
	BetterSafeState(byte[] v, byte m) { value = v; maxval = m; }
    
    public int size() { return value.length; }
    
    public byte[] current() {return value;}
    
    public boolean swap(int i, int j) {

        RL.lock();
        try {
			if (value[i] <= 0|| value[j] >= maxval) 
			{
				return false;
			}
			value[i]--;
			value[j]++;
        }
        finally{ 
            RL.unlock();
        }
        return true;
    }
}
