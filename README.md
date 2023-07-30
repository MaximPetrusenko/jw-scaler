# jw-scaler


Infrastructure for the service which serves movie & series posters from a S3 compatible object storage
-
 
## Walkthrough
- First, run terraform `terraform apply` in "terraform" folder.
- Afterwards, run terraform `terraform apply` in "minio" folder (Error/Bug REST Client not defined?).
- Upload the dataset to the s3 bucket using the golang client from "uploader" folder `go run main.go`.
- Using the service s3www serve the data from the s3 bucket.
  
## Usage
- To initilize terraform in the repository, run `terraform init`
- To create the infrastructure, run `terraform apply`.
- To destroy the infrastructure, run `terraform destroy`.
- To switch the context for a specific cluster, run e.g `kubectl config use-context kind-infrastructure-local`

## TODO
- create own serving service and dockerize the application
- push the application to the local registry as described here https://kind.sigs.k8s.io/docs/user/local-registry/.
- run own image or s3www in a pod in application-local cluster (extend cluster configuration in terraform/helm).
- for monitoring purposes could be used kubernetess dashboard and minio dashboard, or other services like Grafana or Lens.
- To protect against a DDoS attack:     
      Use traffic filtering and rate limiting.
      Employ specialized DDoS protection services.
      Ensure scalable infrastructure and CDN.
      Utilize IP whitelisting and blacklisting.
      Implement CAPTCHA and rate limiting for authentication.
      Monitor traffic and set up an incident response plan.
      Coordinate with service providers for assistance.
      Implement request filtering at the application level.
  


## Contributing

Contributions are welcome! Please read our [contribution guidelines](CONTRIBUTING.md) before submitting a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
