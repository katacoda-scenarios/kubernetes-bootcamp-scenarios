## Modifying the System Microservice

The system service is hardcoded to have `system` as the app name. To make this configurable, you'll add the `appName` member and code to set the `X-App-Name` to the `/sample-kubernetes-config/start/system/src/main/java/system/SystemResource.java`{{open}} file. Click on the link above to open the file and then use the Katacode text editor to replace the existing code with the following:

<pre class="file" data-target="clipboard">
package system;

// CDI
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.GET;
// JAX-RS
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.eclipse.microprofile.config.inject.ConfigProperty;

@RequestScoped
@Path("/properties")
public class SystemResource {

  @Inject
  @ConfigProperty(name = "APP_NAME")
  private String appName;

  @Inject
  @ConfigProperty(name = "HOSTNAME")
  private String hostname;

  @GET
  @Produces(MediaType.APPLICATION_JSON)
  public Response getProperties() {
    return Response.ok(System.getProperties())
      .header("X-Pod-Name", hostname)
      .header("X-App-Name", appName)
      .build();
  }
}
</pre>

These changes use MicroProfile Config and CDI to inject the value of an environment variable called `APP_NAME` into the `appName` member of the `SystemResource` class.  MicroProfile Config supports a number of config sources from which to receive configuration, including environment variables. 
