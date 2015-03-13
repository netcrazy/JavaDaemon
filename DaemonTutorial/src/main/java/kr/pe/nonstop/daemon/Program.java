package kr.pe.nonstop.daemon;

/**
 * Main Program
 * @author netcrazy
 *
 */
public class Program {

	public static void main(String[] args) {
		Thread t = new DaemonThread();
		t.start();
	}
}
