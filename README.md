# Ansible_Playground

A playground environment for practicing and testing **Ansible** automation using Docker-based nodes. This setup allows you to experiment with Ansible playbooks, roles, custom modules, and network configurations in an isolated environment.

---

## Architecture

This environment consists of:

- **1 node** created and managed through **VSCode** (Dev Container)
- **2 nodes** created via **Docker Compose**

All nodes are connected through a user-defined Docker network (`ansible-net`) for seamless communication.

### Architecture Diagram

```mermaid
graph LR
    VSCode["VSCode Dev Container"]
    Node1["Docker Node 1"]
    Node2["Docker Node 2"]
    Network["ansible-net"]

    VSCode -->|Ansible Control| Node1
    VSCode -->|Ansible Control| Node2
    Node1 --- Network
    Node2 --- Network
    VSCode --- Network

## Prerequisites

Before setting up this playground, ensure you have:

- **Docker** installed on your system  
  [Get Docker](https://www.docker.com/get-started)

- **VSCode** installed with the **Ansible extension/plugins**  
  [VSCode](https://code.visualstudio.com/)

- Basic familiarity with **Ansible** concepts, playbooks, and inventories.

---

## Setting up the Environment

Follow these steps to get the environment ready:

1. **Create a VSCode Workspace**  
   Configure your workspace to make the UI suitable for an Ansible project.

2. **Create the Ansible Project**  
   Initialize your project structure (or clone this repo).

3. **Create the Dev Container**  
   - Edit `devcontainer.json` and add:  
     ```json
     "--network=ansible-net"
     ```  
     This connects your Dev Container to a user-defined Docker network.

4. **Create Docker Compose for Additional Nodes**  
   - Use `docker_compose.yml` to define the number and type of nodes you want for your playground.
   - Example command to start the nodes:  
     ```bash
     docker-compose up -d
     ```

5. **Verify the Directory Structure**  
``
.
├── AGENTS.md
├── README.md
├── ansible.cfg
├── collections
│ └── requirements.yml
├── docker_compose.yml
├── else
│ ├── ansible-navigator.yml
│ ├── argspec_validation_plays.meta.yml
│ ├── argspec_validation_plays.yml
│ ├── devfile.yaml
│ └── run
│ └── README.md
├── files
│ └── sample.conf
├── filter_plugins
│ └── custom_filters.py
├── group_vars
├── host_vars
├── inventory
├── library
├── playbooks
├── roles
└── vars
``


## Usage

- **Start VSCode Dev Container** to access the main node.
- **Start Docker nodes** using Docker Compose:
  ```bash
  docker-compose up -d
  ```
- **Check connectivity between nodes:
  ```bash
  ansible all -m ping -i inventory/dev/hosts.ini
  ```
- **Run playbooks: 
  ```bash
  ansible-playbook -i inventory/dev/hosts.ini playbooks/setup_tools.yml
  ansible-playbook -i inventory/dev/hosts.ini playbooks/myping_playground.yml
  ```
- ** Modify roles, custom modules, and filters under roles/, library/, and filter_plugins/ for testing and experimentation.

## Notes

- The `ansible-net` Docker network ensures all nodes can communicate for Ansible orchestration.
- Custom modules are included in `library/` and custom filters in `filter_plugins/`.
- Inventory files are organized by environment (`dev`, `prod`, `uat`) for testing.
- The repository includes example playbooks (`playbooks/`) to help you get started quickly.

---

## References

- [Ansible Documentation](https://docs.ansible.com/)
- [Docker Documentation](https://docs.docker.com/)
- [VSCode Remote - Containers](https://code.visualstudio.com/docs/remote/containers)