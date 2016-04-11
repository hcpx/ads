package com.edu.ads.common.utils;

import java.util.*;

public class ConfigUtil {
  private static ResourceBundle bundle = ResourceBundle.getBundle("Config");

  public static String getString(String prop) {
	  
    return bundle.getString(prop);
  }

  public static String getProperty(String prop) {

    return getString(prop);
  }

}
