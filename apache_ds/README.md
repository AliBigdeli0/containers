# Apache DS Container

This container creates an ApacheDS server on Docker with **bash shell** access.

> **Note:** Although the project has been tested on Debian Linux, it should also work on other operating systems.

> **Note:** The installed ApacheDS version will be **2.0.0**.

> **Note:** To view the Apache license, visit the [License page](https://www.apache.org/licenses/).

---

## Requirements

The following dependencies should be installed before running Docker:

- Docker  
- GNU Make (or its Windows equivalent)

---

## Installation

1. First, you need to create a Docker network.  
   To do so, run `make create_network` on your host machine.  
   This will create a bridge network named `network_apacheds` in Docker.

2. Next, run `make build_ads` on your host.  
   This will build a container named `ubuntu_apacheds` in Docker.

   - If you want to change the container name, modify the `NAME` variable in the `Makefile`.

---

## Run

To start the container, run `make run_ads` in your host machine's terminal (PowerShell or CMD).  
A new bash shell will open in your terminal.

Inside the running container, two default groups named `groups` and `users` will be created, along with an `admin` user under `ou=users,dc=example,dc=com` with the password `admin`.

> **Note:** The system `admin` password is `secret`, which is **different** from the `admin` user's password mentioned above.

---

## Remove

To remove the container, simply run `make remove_ads` on your host machine.

> **Note:** This command only removes the container image. The bridge network will **not** be removed.

---

# LICENSE

This project is licensed under the **GNU General Public License** — see the [LICENSE](LICENSE) file for details.
