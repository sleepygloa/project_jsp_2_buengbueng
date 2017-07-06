package application.controller.order;

public class PCCheckDTO {
	private int pcAllCount;
	private int useCount;
	private int currentCount;
	
	private static PCCheckDTO instance = new PCCheckDTO();
	private PCCheckDTO(){
		pcAllCount = 0;
		useCount = 0;
		currentCount = 0;
	}
	public static PCCheckDTO getInstance(){
		return instance;
	}
	
	public int getPcAllCount() {
		return pcAllCount;
	}
	public void setPcAllCount(int pcAllCount) {
		this.pcAllCount = pcAllCount;
	}
	public int getUseCount() {
		return useCount;
	}
	public void setUseCount(int useCount) {
		this.useCount = useCount;
	}
	public int getCurrentCount() {
		return currentCount;
	}
	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
	}
	
	
	
}
