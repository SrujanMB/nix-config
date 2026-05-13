{
  services.cloudflared = {
    enable = true;
    tunnels = {
      "my-tunnel-id" = {
        credentialsFile = "/var/lib/cloudflared/credentials.json";
        default = "http_status:404";
        ingress = {
          "dan.srujanmb.com" = {
            service = "https://localhost:5000";
            # This is where you disable TLS verification
            originRequest = {
              noTLSVerify = true;
            };
          };
        };
      };
    };
  };
}
