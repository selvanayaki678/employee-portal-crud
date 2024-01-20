# Employee Management Application Deployment to EKS using Jenkins CICD

An Employee Management Application built with React.js, Node.js, and MySQL, deployed on Amazon EKS using Jenkins as the CI/CD tool.

## Application Overview

This Employee Management Application helps organizations streamline employee-related tasks(create,update, delete and view), utilizing a tech stack of React.js for the front end, Node.js for the backend, and MySQL for data storage.

![image](https://github.com/selvanayaki678/employee-portal-crud/assets/67256407/174b0b89-1d39-49b6-801d-2f3015597edf)


## Tech Stack

- React.js
- Node.js
- MySQL

## Deployment

The application is deployed on Amazon EKS (Elastic Kubernetes Service) using Jenkins for continuous integration and continuous deployment (CI/CD).
   #### Deployment Architecture
   ![employee-management-portal-cicd-flow-diagram](https://github.com/selvanayaki678/employee-portal-crud/assets/67256407/43d83e49-25df-46a6-84a2-db640a251f78)

## CI/CD Pipeline

1. **Version Control:**
   - The source code is hosted on [GitHub](https://github.com/selvanayaki678/employee-portal-crud).

2. **CI/CD with Jenkins:**
   - Jenkins automates the CI/CD pipeline, fetching the latest code from GitHub, performing Docker builds, and deploying the application on Amazon EKS.

3. **Static Code Analysis:**
   - SonarQube is used for static code analysis, ensuring code quality by identifying and fixing issues.

4. **Docker Build:**
   - The application is containerized using Docker. Jenkins initiates Docker builds to create a Docker image.

5. **Image Scan with Trivy:**
   - Trivy is employed to scan the Docker image for vulnerabilities, enhancing security.

6. **Docker Image Push:**
   - The Docker image is pushed to Docker Hub, making it available for deployment and sharing.

7. **Helm Package for Deployment:**
   - Helm is used to package the application for easier deployment and management on Kubernetes clusters.

8. **Monitoring with Prometheus and Grafana:**
   - EKS is monitored using Prometheus and Grafana to provide insights into the performance and health of the application.

# Getting Started

## To run application locally as container

1. **Clone the repository:**
   
   - git clone https://github.com/selvanayaki678/employee-portal-crud.git
   - cd employee-portal-crud

2. **Prerequisites**
    - Mysql instance
    - Reactjs,Npm 
    - java,maven
    - Docker

3. **Mysql setup**
    - Install mysql 
    - Login to mysql using mysql -u root -h localhost --password <password>
    - Create Database --> create database employee_management_system;

4. **Build a Java Docker image**
    - To configure MySQL endpoint(username, and password) in source code , Go to employee-portal-crud/springboot-backend/src/main/resources/application.properties file and add mysql endpoint url.
    - Best practice is to keep these as environment variables rather than hardcoding.
    - To build a docker image; cd employee-portal-crud/springboot-backend/;Run mvn clean install;docker build -t <dockerimagename:version> . 

5. **Build a react image**
    - To congifure java endpoint in react source code, go to react-frontend/src/services/EmployeeService.js file and add javaendpoint url
    - Build docker image : cd react-frontend; docker build -t <reactjs_docker_image:version> . 

6. **Running containers**
    - docker run -dit --name react-app -p 3000:3000 <reactimagename>
    - docker run -dir --name java-app -p 8080:8081 <javaimagename>

**Note**:Mysql needs to allow connections from java endpoint(ip)
         - To allow connections from a specific IP address to the MySQL local instance, execute the following commands inside the MySQL database:\
            - CREATE USER 'root'@'ip_address' IDENTIFIED BY 'some_pass'; \
            - GRANT ALL PRIVILEGES ON . TO 'root'@'ip_address'; \
            - SELECT user,host from mysql.user;

## To Run application in EKS 
1. **Create EKS and RDS instance**
    - Use the following GitHub link to create instances in AWS: https://github.com/selvanayaki678/terraform-aws
![Project1-Employee_portal-Page-1](https://github.com/selvanayaki678/employee-portal-crud/assets/67256407/f0ec20b9-e7a3-425b-9dca-a3b14f0c9166)

2. **Deploying Nginx ingress controller,Prometheus and sonarqube in EKS**
    - Refer this following Github link to deploy Nginx ingress controller,Prometheus and Kube state metrics helm chart and sonarqube in EKS: https://github.com/selvanayaki678/k8s-infra-helm-charts

3. **Deploying React and Java application in EKS using Jenkins**
     - Configured all build and deploy (CI/CD)steps in jenkinsfile to deploy application into EKS

4. **Monitoring EKS using Prometheus and Grafana**
    - Configured Prometheus in EKS using Helm chart, without downloading Prometheus from the official website. Followed the steps provided in this link for setting up Prometheus: https://devopscube.com/setup-prometheus-monitoring-on-kubernetes/.

    - Prometheus targets include kube state metrics and cAdvisor. \
   **Grafana:**
    - Installed Grafana on the local machine.
    - Configured the datasource as Prometheus.
    -  Grafana dashboard: 13332 - kube state metrics.\
        Developed custom queries to obtain the count of pods, running pods, and failed pods in a specific namespace.\
        
5. **To access application publicly using custom url**
    - In Route 53, created a DNS entry to associate our custom URL with the IP address of the Nginx Ingress controller.
# Application Deployment with screenshots
   
   ## Application CICD execution
   ![image](https://github.com/selvanayaki678/employee-portal-crud/assets/67256407/79c31eb5-9969-42df-9e19-bf4d99e28c4d)
   
   ## Docker Hub Application Images
   ![image](https://github.com/selvanayaki678/employee-portal-crud/assets/67256407/21d790b5-338b-4ec6-817e-76e1a9b44913)

   ## Application in EKS
   ![image](https://github.com/selvanayaki678/employee-portal-crud/assets/67256407/b2cbf734-39ba-41f4-91e0-a6b271a4f034)

   ## Route 53 Configuration
  ![image](https://github.com/selvanayaki678/employee-portal-crud/assets/67256407/ef2f5511-13cc-4648-9a2f-de5021976736)

   ## SonarQube 
   ![image](https://github.com/selvanayaki678/employee-portal-crud/assets/67256407/ae24eca3-2fc5-426f-a7f7-60cf86c6598f)
   
   ## Prometheus 
   ![image](https://github.com/selvanayaki678/employee-portal-crud/assets/67256407/b19beef1-9cd6-451f-b1e7-d548cc4988f0)
   ![image](https://github.com/selvanayaki678/employee-portal-crud/assets/67256407/727a2384-7dfb-44b3-b4b6-a49c2306ddc4)
   
   ## Grafana Dashboard
   **Pod Metrics**
   ![image](https://github.com/selvanayaki678/employee-portal-crud/assets/67256407/b84583f6-959c-4ded-abc0-b481605a5472)

   **Cluster node Usage**
   ![image](https://github.com/selvanayaki678/employee-portal-crud/assets/67256407/83bc659f-b959-4dbc-9ce0-b6ea02626992)


