## Modifying the Inventory Microservice

The inventory service is hardcoded to use `bob` and `bobpwd` as the credentials to authenticate against the system service. You’ll make these credentials configurable using a Kubernetes Secret. In the Katacoda text editor, open the file by clicking on the following link `/sample-kubernetes-config/start/inventory/src/main/java/inventory/client/SystemClient.java`{{open}} and replace the two lines under `// Basic Auth Credentials` with the following

<pre class="file" data-target="clipboard">
  // Basic Auth Credentials
  @Inject
  @ConfigProperty(name = "SYSTEM_APP_USERNAME")
  private String username;

  @Inject
  @ConfigProperty(name = "SYSTEM_APP_PASSWORD")
  private String password;
</pre>

These changes use MicroProfile Config and CDI to inject the value of the environment variables `SYSTEM_APP_USERNAME` and `SYSTEM_APP_PASSWORD` into the SystemClient class.
