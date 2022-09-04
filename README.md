# Various ways to debug Cloud Run

## Evolution of Debugging Cloud Run
1. Develop and test your code as you would do with any other application.
2. [Run a Cloud Run service in a local development environment](https://cloud.google.com/sdk/gcloud/reference/beta/code/dev)</br>
2.1 This command watches the relevant source files for changes. as soon as a change is made, it rebuilds the container and deploy to the local environment.
3. [Delete the local development environment](https://cloud.google.com/sdk/gcloud/reference/beta/code/clean-up)
4. [Develop a Cloud Run service locally in Cloud Code for VS Code](https://cloud.google.com/code/docs/vscode/develop-service)
5. [Debug a Cloud Run service in Cloud Code for VS Code](https://cloud.google.com/code/docs/vscode/debugging-a-cloud-run-service)
6. [Deploy the service to production](https://cloud.google.com/sdk/gcloud/reference/run/deploy)</br>
6.1 or use the scripts in the deploy.sh file </br>
6.2 or use [Cloud Code extension](https://cloud.google.com/code/docs/vscode/deploy-service#deploying_a_cloud_run_service)
7. Debug the deployed service using [Rookout](https://www.rookout.com/)
8. [End to End Feature Environments based on Git actions](https://github.com/UriKatsirPrivate/Feature-Environment)