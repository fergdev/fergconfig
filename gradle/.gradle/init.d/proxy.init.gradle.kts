import java.net.URL

val enabled = true
if (enabled) {
  val map = mapOf("HTTP_PROXY" to "http", "HTTPS_PROXY" to "https")
  System.getenv().forEach { (k, v) ->
      map[k]?.let { base ->
          val url = URL(v!!)
          println("Setting proxy '$base' '${url}'")
          System.setProperty("${base}.proxyHost", url.host)
          System.setProperty("${base}.proxyPort", url.port.toString())
      }
  }
}


