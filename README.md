# Custom Keycloak Docker Image

This repository contains the necessary files to build a custom Keycloak Docker image, 
incorporating custom Service Provider Interfaces (SPIs) and themes. 
Our project leverages Docker's multistage build feature to create a lean and secure Keycloak image tailored to our specific needs.

## Introduction

Our custom Keycloak image is designed to extend the functionality of Keycloak by adding custom SPI implementations and a unique theme that enhances the user interface. 
This project is inspired by the [Keycloak User Storage SPI Quickstart](https://github.com/keycloak/keycloak-quickstarts/tree/latest/extension/user-storage-simple) 
and follows the guidelines for creating [custom themes in Keycloak](https://www.keycloak.org/docs/latest/server_development/#_themes).

## Prerequisites

Before you begin, ensure you have the following installed on your system:
- Docker
- Git (for cloning this repository)

## Getting Started

To get started with this project, follow these steps:

1. **Clone the Repository**

```bash
git clone https://github.com/open200/keycloak-blog
cd keycloak-blog
```

2. **Build the Docker Image**

```bash
docker build -t keycloak-blog .
```

3. **Run the Docker Container**

```bash
docker run -p 8080:8080 \
-e KEYCLOAK_ADMIN=admin \
-e KEYCLOAK_ADMIN_PASSWORD=admin \
-v ./volume:/opt/keycloak/properties \
keycloak-blog:latest \
start-dev
```

After running these commands, Keycloak will be accessible at `http://localhost:8080`. 
You can log in using the admin credentials provided in the run command.

## Custom SPIs and Theme

This project includes an example SPI implementation and a custom theme. 
The SPI is based on the readonly-property-file provider, allowing authentication 
against a predefined set of users. The custom theme modifies the appearance of the Keycloak login page.

## Documentation

For an in-depth explanation of how we built this custom Keycloak Docker image, 
including the rationale behind using Docker's multistage build feature, 
the process of incorporating custom SPIs and themes, 
and a step-by-step guide through the Dockerfile, 
check out our blog post: ["Leveraging Docker Multistage Builds for Custom Keycloak SPIs"](https://github.com/open200/keycloak-blog). 
This post provides valuable insights into the project's background, 
the challenges we faced, and how we overcame them to create a lean and secure 
Keycloak image tailored to our specific needs.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Additional Resources

- [Keycloak Documentation](https://www.keycloak.org/documentation.html)
- [Docker Documentation](https://docs.docker.com/)
