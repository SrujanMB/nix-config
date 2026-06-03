let
  configDir = "/etc/cloudflared";
  tunnelId = "d83cef35-f366-4a9d-95c8-a43498b86dd0";
in
{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "${tunnelId}" = {
        credentialsFile = "${configDir}/${tunnelId}.json";
        default = "http_status:404";
        # ingress = {
        #   "dan.srujanmb.com" = {
        #     service = "https://localhost:5000";
        #     # This is where you disable TLS verification
        #     originRequest = {
        #       noTLSVerify = true;
        #     };
        #   };
        # };
      };
    };
  };
}
