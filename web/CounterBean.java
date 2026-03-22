//package library;
public class CounterBean implements java.io.Serializable
{
	private int counter;

	public CounterBean()
	{
		counter = 0;
	}
	public String getcounter()
	{
		return counter+"";
	}
}