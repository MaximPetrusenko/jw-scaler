package main

import "minio"

const (
	bucket   = "data-terraform-s3"
	folderPath = "../../dataset"
)

func main() {
	endpoint := "localhost:9000"
	accessKeyID := "*************"
	secretAccessKey := "*************"
	useSSL := false

	mClient := minio.NewClient(endpoint, accessKeyID, secretAccessKey, useSSL)

	filepath.Walk(path, func(folderPath string, info os.FileInfo, err error) error {
        if err != nil {
            log.Fatalf(err.Error())
        }
		mClient.UploadFile(bucket, folderPath+info.Name())
        return nil
    })
}
