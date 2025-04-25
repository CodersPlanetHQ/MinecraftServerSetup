# 🚀 mc-install-tunnel: Zero to Minecraft in 60 Seconds Flat

**Tired of server setup hell?** This script nukes the complexity of running your own Minecraft server. One command and you're hosting a world with public access through Ngrok. No networking degree required.

![Minecraft Server Banner](https://api.placeholder.com/600/200)

## ✨ What This Script Actually Does

- **One-Command Installation:** Handles Java, dependencies, and server files without asking you 50 questions
- **Auto-Updates PaperMC:** Downloads the latest version so you're not running ancient code
- **"It Just Works" Ngrok Integration:** Bypasses your router's security so friends can connect instantly
- **Set & Forget:** Runs in background with screen so you can close your terminal without killing your world
- **Won't Eat Your RAM:** Configure memory limits that make sense for your machine
- **Crash Protection:** Auto-restart capabilities when things inevitably go sideways

## 🛠️ Requirements

- A Linux machine/VM that isn't a complete potato
- Sudo privileges (or a friend who has them)
- For remote play: Free Ngrok account with auth token ([ngrok.com](https://ngrok.com/))
- Basic typing skills

## 🔥 Quick Start

```bash
# Clone it
git clone https://github.com/CodersPlanetHQ/MinecraftServerSetup.git
cd MinecraftServerSetup

# Make it executable
chmod +x install.sh

# Launch it
./install.sh
```

## ⚙️ Configuration

Edit `install.sh` to personalize these values:

```bash
SERVER_DIR="/opt/minecraft"       # Where your world will live
INITIAL_MEMORY="1G"               # Starting RAM allocation
MAX_MEMORY="4G"                   # Max RAM (don't be greedy)
SERVER_PORT=25565                 # Standard MC port
NGROK_AUTHTOKEN="paste_token"     # Your Ngrok auth token
PAPER_VERSION="latest"            # or specify like "1.20.1"
```

## 🎮 Daily Usage

**Start the server:**
```bash
cd /path/to/script && ./start.sh
```

**Access console:**
```bash
screen -r mcserver
```

**Exit console while keeping server running:**
Press `Ctrl+A` then `D`

**Execute server commands:**
```bash
screen -S mcserver -X stuff "say Hello everyone!$(printf '\r')"
```

**Gracefully shutdown:**
```bash
screen -S mcserver -X stuff "save-all$(printf '\r')"
screen -S mcserver -X stuff "stop$(printf '\r')"
```

## 🌎 Connecting to Your Server

1. After starting, check the console output for your Ngrok address
2. Or visit `http://localhost:4040` to see connection details
3. Share the address with friends (looks like `mc.tcp.ngrok.io:12345`)
4. Enjoy being called a "technical wizard" by your friends

## 🚨 Troubleshooting

**Server crashes on start:**
* Check Java version (needs Java 17+)
* Increase RAM allocation if you have complex mods
* Check logs in `logs/latest.log`

**Nobody can connect via Ngrok:**
* Verify your auth token is correct
* Make sure Ngrok service is running (`ps aux | grep ngrok`)
* Check if your server is actually running (`screen -ls`)

**Performance issues:**
* Lower view-distance in server.properties
* Check for resource-hungry mods/plugins
* Consider dedicating more RAM (if available)

## 🔄 Updating Your Server

```bash
# Stop the server first!
cd /path/to/server
./update.sh
```

The script will backup your world, download the latest PaperMC, and preserve your configs.

## 🛡️ Security Notes

* Change the default ops level in server.properties
* Use a whitelist if you don't want random players
* Consider setting up a firewall if exposing directly (non-Ngrok)
* Don't run as root (the script handles permissions properly)

## 🤝 Contributing

Found a way to make this even better? PRs welcome! Just don't make it more complicated - the whole point is simplicity.

## ⚖️ License

MIT License - Use it, break it, fix it, but don't blame me when something explodes.

## 📝 Final Notes

This script was created by someone who spent too many hours of their life setting up Minecraft servers manually. If this saves you time, consider naming your next diamond pickaxe after me.

**Remember:** Always comply with the Minecraft EULA. No selling in-game advantages for real money or Mojang will find you.
