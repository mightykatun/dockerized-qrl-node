# Docker-QRL-Node

This repository provides everything you need to set up and run a fully containerized Quantum Resistant Ledger (QRL) node. By leveraging Docker, this setup resolves build issues caused by module version conflicts, ensuring a seamless and reliable deployment process.

---

## Features
- **Fully Dockerized**: Simplifies running a QRL node by encapsulating all dependencies and configurations.
- **Automated Deployment**: Quickly deploy your QRL node with minimal setup.
- **Version Control**: Ensures compatibility by pinning module versions.
- **Customizable**: Configure runtime behavior via environment variables.
- **Persistent Data**: Store your QRL blockchain data on the host machine for easy reuse.

---

## Getting Started

### Prerequisites
- [Docker](https://www.docker.com/get-started) installed on your system.
- [Docker Compose](https://docs.docker.com/compose/) installed for managing multi-container applications.

---

## Usage

### Sample `docker-compose.yml` File
Below is an example of how to set up and run the QRL node using Docker Compose:

```yaml
services:
  node:
    container_name: qrl-node
    image: qrl-node:latest
    restart: unless-stopped
    environment:
      - START_CMD=qrl_start # Command executed at startup (see docs below)
    volumes:
      - ./qrl-data:/root/.qrl # Maps local directory to container for persistent data
    ports:
      - 19000:19000 # Port for P2P network (requires port forwarding outside your network)
```

### Steps to Deploy
1. **Clone the Repository**:
   ```bash
   git clone https://github.com/mightykatun/Docker-QRL-Node.git
   cd Docker-QRL-Node
   ```

2. **Build the Docker Image**:
   ```bash
   docker build -t qrl-node:latest .
   ```

3. **Start the QRL Node**:
   - Create a `docker-compose.yml` file (use the sample above).
   - Run the container:
     ```bash
     docker-compose up -d
     ```

4. **Verify the Node is Running**:
   - Check the container logs:
     ```bash
     docker logs qrl-node
     ```
   - Access QRL documentation for detailed node commands: [QRL Node Docs](https://docs.theqrl.org/use/node/installation)

---

## Environment Variables
Customize the behavior of your QRL node using the following environment variables:

| Variable    | Description                                                                                   | Default Value |
|-------------|-----------------------------------------------------------------------------------------------|---------------|
| `START_CMD` | The command executed on container startup. Refer to [QRL Docs](https://docs.theqrl.org/use/) for options. | `qrl_start`   |

---

## Volumes
The container uses a volume to store blockchain data persistently:
- **Host Directory**: `./qrl-data`

This ensures that your data is not lost when the container is stopped or removed. You may mount it anywhere else.

---

## Ports
The container exposes the following port for network communication:

| Port   | Purpose                              |
|--------|--------------------------------------|
| `19000`| P2P network (requires port forwarding)|

Ensure this port is accessible from outside your network if you intend to participate in the QRL P2P network.

---

## Troubleshooting
- **Container Not Starting?**
  - Check logs for errors:
    ```bash
    docker logs qrl-node
    ```

- **Port Conflicts?**
  - Ensure no other service is using port `19000` on your host machine.

- **Data Issues?**
  - Verify that the `./qrl-data` directory has proper permissions.

---

## Resources
- [QRL Official Documentation](https://docs.theqrl.org/)
- [Docker Documentation](https://docs.docker.com/)
- [Docker Compose Documentation](https://docs.docker.com/compose/)

---

## Contributing
Contributions are welcome! Please feel free to submit a pull request or open an issue if you encounter any problems or have suggestions for improvement.

---

## License
This project is licensed under the [MIT License](LICENSE).

