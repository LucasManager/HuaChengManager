package com.huacheng.utils;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.collections.ExtendedProperties;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.apache.velocity.exception.VelocityException;
import org.apache.velocity.io.UnicodeInputStream;
import org.apache.velocity.runtime.resource.Resource;
import org.apache.velocity.runtime.resource.loader.ResourceLoader;
import org.apache.velocity.util.StringUtils;

public class MyResourceLoader extends ResourceLoader {
	private List paths = new ArrayList();
	private boolean unicode = false;

	@Override
	public long getLastModified(Resource arg0) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public InputStream getResourceStream(String templateName) throws ResourceNotFoundException {
		/*
		 * Make sure we have a valid templateName.
		 */
		if (org.apache.commons.lang.StringUtils.isEmpty(templateName)) {
			/*
			 * If we don’t get a properly formed templateName then there’s not
			 * much we can do. So we’ll forget about trying to search any more
			 * paths for the template.
			 */
			throw new ResourceNotFoundException("Need to specify a file name or file path!");
		}

		String template = StringUtils.normalizePath(templateName);
		if (template == null || template.length() == 0) {
			String msg = "File resource error : argument " + template + " contains .. and may be trying to access "
					+ "content outside of template root. Rejected.";

			log.error("FileResourceLoader : " + msg);

			throw new ResourceNotFoundException(msg);
		}

		int size = paths.size();
		for (int i = 0; i < size; i++) {
			String path = (String) paths.get(i);
			InputStream inputStream = null;

			try {
				inputStream = findTemplate(path, template);
			} catch (IOException ioe) {
				String msg = "Exception while loading Template " + template;
				log.error(msg, ioe);
				throw new VelocityException(msg, ioe);
			}

			if (inputStream != null) {
				/*
				 * Store the path that this template came from so that we can
				 * check its modification time.
				 */
				// templatePaths.put(templateName, path);
				return inputStream;
			}
		}

		/*
		 * We have now searched all the paths for templates and we didn’t find
		 * anything so throw an exception.
		 */
		throw new ResourceNotFoundException("FileResourceLoader : cannot find " + template);
	}

	@Override
	public void init(ExtendedProperties arg0) {
		// TODO Auto-generated method stub
		this.paths.add("");
		this.paths.add(".");
	}

	@Override
	public boolean isSourceModified(Resource arg0) {
		// TODO Auto-generated method stub
		return false;
	}

	/**
	 * Try to find a template given a normalized path.
	 *
	 * @param path
	 *            a normalized path
	 * @param template
	 *            name of template to find
	 * @return InputStream input stream that will be parsed
	 *
	 */
	private InputStream findTemplate(final String path, final String template) throws IOException {
		try {
			File file = getFile(path, template);

			if (file.canRead()) {
				FileInputStream fis = null;
				try {
					fis = new FileInputStream(file.getAbsolutePath());

					if (unicode) {
						UnicodeInputStream uis = null;

						try {
							uis = new UnicodeInputStream(fis, true);

							if (log.isDebugEnabled()) {
								log.debug("File Encoding for " + file + " is: " + uis.getEncodingFromStream());
							}

							return new BufferedInputStream(uis);
						} catch (IOException e) {
							closeQuiet(uis);
							throw e;
						}
					} else {
						return new BufferedInputStream(fis);
					}
				} catch (IOException e) {
					closeQuiet(fis);
					throw e;
				}
			} else {
				return null;
			}
		} catch (FileNotFoundException fnfe) {
			/*
			 * log and convert to a general Velocity ResourceNotFoundException
			 */
			return null;
		}
	}

	private void closeQuiet(final InputStream is) {
		if (is != null) {
			try {
				is.close();
			} catch (IOException ioe) {
				// Ignore
			}
		}
	}

	private File getFile(String path, String template) {

		File file = null;

		if ("".equals(path)) {
			file = new File(template);
		} else {
			/*
			 * if a / leads off, then just nip that :)
			 */
			if (template.startsWith("/")) {
				template = template.substring(1);
			}

			file = new File(path, template);
		}

		return file;
	}

}