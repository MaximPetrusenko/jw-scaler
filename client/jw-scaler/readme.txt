go install github.com/harshavardhana/s3www@latest

s3www -endpoint "http://127.0.0.1:9000" -accessKey "***" -secretKey "****" -bucket "data-terraform-s3"


OR

podman run --rm -p 8080:8080 y4m4/s3www:latest \
	  -endpoint "http://127.0.0.1:9000" \
	  -accessKey "***" \
	  -secretKey "****" \
	  -bucket "data-terraform-s3" \
	  -address "0.0.0.0:8080"





Reference: https://github.com/harshavardhana/s3www