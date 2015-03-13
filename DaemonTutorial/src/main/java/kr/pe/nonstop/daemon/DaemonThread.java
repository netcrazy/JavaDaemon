package kr.pe.nonstop.daemon;

import java.util.Date;

/**
 * Daemon business Logic
 * @author netcrazy
 *
 */
public class DaemonThread extends Thread {
	@Override
	public void run() {

		System.out.println("!!!! thread start !!!! ");

		int i = 0;
		while( true ) {
			try {
				Date today = new Date ();
				System.out.println("Thread job running " + today + " --> " + i + "\n");
				Thread.sleep(1000);
			} catch (Exception e) {
				return;
			}
			i++;
		}
	}
}