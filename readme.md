# mc-install-tunnel: Your Automated Minecraft Server Setup with Ngrok Tunneling

Spin up a Minecraft server in minutes with automated installation and Ngrok tunneling for easy access! This script simplifies the process of setting up a PaperMC Minecraft server, handling dependencies, downloading the server software, and configuring an Ngrok tunnel for effortless remote access.

## Features

*   **Automated Installation:** Streamlines the installation of essential dependencies like Java, `screen`, and `wget`.
*   **PaperMC Download:** Automatically downloads the latest PaperMC server `.jar` file.
*   **Easy Configuration:**  Configure server settings such as memory allocation and port.
*   **Ngrok Tunneling:**  Sets up an Ngrok tunnel to expose your server to the internet without complex port forwarding (optional).
*   **Screen Management:** Runs the Minecraft server within a `screen` session, allowing it to run in the background.
*   **Logging:** Provides informative logging for easy troubleshooting.

## Prerequisites

*   A Linux-based system (e.g., Ubuntu, Debian).
*   `sudo` privileges.
*   (Optional) An Ngrok account and authtoken (if you want to use Ngrok tunneling). Get your authtoken from [https://ngrok.com/](https://ngrok.com/).

## Installation

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/CodersPlanetHQ/MinecraftServerSetup.git
    cd MinecraftServerSetup
    ```

2.  **Make the script executable:**

    ```bash
    chmod +x install.sh
    ```

3.  **Run the script:**

    ```bash
    ./install.sh
    ```

4.  **Configure:** Edit the `install.sh` file to configure:

    *   `SERVER_DIR`: The directory where the Minecraft server will be installed.
    *   `SERVER_JAR`: The name of the Minecraft server `.jar` file.
    *   `INITIAL_MEMORY`: The initial memory allocation for the server (e.g., "1024M").
    *   `MAX_MEMORY`: The maximum memory allocation for the server (e.g., "2048M").
    *   `SERVER_PORT`: The port the Minecraft server will listen on (default: 25565).
    *   `NGROK_AUTHTOKEN`:  Your Ngrok authtoken (if using Ngrok).

## Usage

After running the script, the Minecraft server will be running in a `screen` session named "mcserver".

*   **Access the Minecraft server console:**

    ```bash
    screen -r mcserver
    ```

*   **Detach from the screen session (leave the server running):**

    Press `Ctrl+a` then `d`.

*   **Stop the Minecraft server:**

    First, access the `screen` session: `screen -r mcserver`. Then, type `stop` in the Minecraft server console.

## Ngrok Tunnel

If you configured an Ngrok authtoken, the script will automatically start an Ngrok tunnel. Check the Ngrok interface (usually at `http://localhost:4040`) to find the public address and port that players can use to connect to your server.

## Updating the Server

To update the Minecraft server to a newer version:

1.  Stop the existing server.
2.  Download the new `.jar` file from PaperMC.
3.  Replace the old `.jar` file in the server directory.
4.  Start the server.

You may also need to update the `SERVER_JAR` variable in the `install.sh` script to reflect the new filename.

## Contributing

Contributions are welcome! Please feel free to submit pull requests with improvements or bug fixes.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Disclaimer

This script is provided as-is, without warranty of any kind. Use at your own risk.  The author is not responsible for any damages caused by the use of this script.  Always ensure you comply with the Minecraft EULA.
