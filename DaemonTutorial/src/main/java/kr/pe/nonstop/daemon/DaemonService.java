package kr.pe.nonstop.daemon;

import org.apache.commons.daemon.Daemon;
import org.apache.commons.daemon.DaemonContext;
import org.apache.commons.daemon.DaemonInitException;

/**
 * Daemon Service
 * @author netcrazy
 *
 */
public class DaemonService implements Daemon {

	Thread t = null;
	public void init(DaemonContext context) throws DaemonInitException, Exception {
		System.out.println("DaemonService init");
		t = new DaemonThread();
	}

	public void start() throws Exception {
		System.out.println("DaemonService start");
		t.start();
	}

	public void stop() throws Exception {
		System.out.println("DaemonService stop");
		t.interrupt();
	}

	public void destroy() {
		System.out.println("DaemonService destroy");
	}
}