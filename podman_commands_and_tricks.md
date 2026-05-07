# Podman Commands & Tricks - Complete Reference Guide

## 1. IMAGE COMMANDS

### List Images
```bash
podman images                          # List all images
podman images -a                       # List all images (including intermediate)
podman images --filter "dangling=true" # Show only dangling images
podman images -q                       # Show only image IDs
podman images --format "{{.Repository}}:{{.Tag}}" # Custom format
```

### Search and Pull Images
```bash
podman search ubuntu                   # Search for images in registry
podman pull ubuntu:latest              # Pull specific version
podman pull ubuntu:22.04               # Pull specific Ubuntu version
podman pull quay.io/library/postgres   # Pull from different registry
```

### Remove Images
```bash
podman rmi IMAGE_NAME                  # Remove single image
podman rmi IMAGE_ID                    # Remove by image ID
podman rmi -f IMAGE_NAME               # Force remove (even if in use)
podman rmi IMAGE_1 IMAGE_2 IMAGE_3     # Remove multiple images
podman image prune                     # Remove all dangling images
podman image prune -a                  # Remove all unused images
podman image prune -a --force          # Force remove all unused images
```

### Build Images
```bash
podman build -t my-image:latest .      # Build from Dockerfile in current directory
podman build -t my-image:1.0 -f Dockerfile.prod . # Build with specific Dockerfile
podman build --squash -t my-image .    # Build with layer squashing
```

### Tag and Push Images
```bash
podman tag IMAGE_ID myregistry.com/myimage:latest
podman push myregistry.com/myimage:latest
podman tag local-image new-image-name  # Create alias for image
```

### Inspect Images
```bash
podman inspect IMAGE_NAME              # Get detailed image information
podman history IMAGE_NAME              # View image layers and build history
podman image tree IMAGE_NAME           # Show image dependency tree
```

---

## 2. CONTAINER COMMANDS

### Run Containers
```bash
podman run IMAGE_NAME                  # Run container in foreground
podman run -d IMAGE_NAME               # Run in detached mode (background)
podman run -it IMAGE_NAME /bin/bash    # Run interactively with terminal
podman run --rm IMAGE_NAME             # Auto-remove container when it exits
podman run --name my-container IMAGE_NAME # Specify container name

# Combine flags
podman run -d --name web-app -p 8080:80 --rm nginx:latest
```

### List Containers
```bash
podman ps                              # List running containers
podman ps -a                           # List all containers (running + stopped)
podman ps -q                           # Show only container IDs
podman ps --filter "status=exited"     # Filter by status
podman ps --format "{{.Names}}\t{{.Status}}" # Custom output format
podman ps --size                       # Show container sizes
```

### Start/Stop/Restart Containers
```bash
podman start CONTAINER_NAME            # Start a stopped container
podman stop CONTAINER_NAME             # Stop a running container
podman restart CONTAINER_NAME          # Restart container
podman pause CONTAINER_NAME            # Pause container processes
podman unpause CONTAINER_NAME          # Resume paused container
podman kill CONTAINER_NAME             # Force kill container
podman kill -s SIGTERM CONTAINER_NAME  # Send specific signal
```

### Remove Containers
```bash
podman rm CONTAINER_NAME               # Remove container
podman rm -f CONTAINER_NAME            # Force remove running container
podman rm $(podman ps -aq)             # Remove all containers
podman container prune                 # Remove all stopped containers
podman container prune -a              # Remove all unused containers
```

### Execute Commands in Containers
```bash
podman exec CONTAINER_NAME command     # Execute command in running container
podman exec -it CONTAINER_NAME /bin/bash # Interactive shell in running container
podman exec -u root CONTAINER_NAME command # Execute as specific user
podman exec -w /app CONTAINER_NAME command # Execute in specific directory
```

### Container Logs
```bash
podman logs CONTAINER_NAME             # View container logs
podman logs -f CONTAINER_NAME          # Follow logs (like tail -f)
podman logs --tail 50 CONTAINER_NAME   # Show last 50 lines
podman logs --timestamps CONTAINER_NAME # Show with timestamps
podman logs -n 100 CONTAINER_NAME      # Show last 100 lines
```

### Inspect Containers
```bash
podman inspect CONTAINER_NAME          # Get detailed container info
podman inspect --format '{{.State.Pid}}' CONTAINER_NAME # Get container PID
podman inspect --format '{{.NetworkSettings.IPAddress}}' CONTAINER_NAME # Get IP
podman top CONTAINER_NAME              # Show running processes in container
podman stats CONTAINER_NAME            # Show live resource usage
podman stats                           # Show all containers resource usage
```

---

## 3. PORT & NETWORK COMMANDS

### Port Mapping
```bash
podman run -p 8080:80 nginx            # Map port 8080 (host) → 80 (container)
podman run -p 127.0.0.1:8080:80 nginx  # Bind to specific host IP
podman run -p 8080:80 -p 3306:3306 app # Map multiple ports
podman run -P IMAGE_NAME               # Publish all exposed ports
```

### View Port Mappings
```bash
podman port CONTAINER_NAME             # Show port mappings for container
podman inspect --format='{{range $p, $conf := .NetworkSettings.Ports}}{{$p}} -> {{$conf}}\n{{end}}' CONTAINER_NAME
```

### Network Management
```bash
podman network ls                      # List all networks
podman network create my-network       # Create custom network
podman network rm NETWORK_NAME         # Remove network
podman network inspect NETWORK_NAME    # Inspect network details
podman network prune                   # Remove unused networks

podman run --network my-network IMAGE_NAME # Run container on specific network
podman run --network host IMAGE_NAME   # Use host network (direct access)
```

---

## 4. VOLUME & DATA MANAGEMENT

### Mount Volumes
```bash
podman run -v /host/path:/container/path IMAGE_NAME # Bind mount
podman run -v /container/path IMAGE_NAME # Anonymous volume
podman run -v volume-name:/container/path IMAGE_NAME # Named volume

# Read-only mount
podman run -v /host/path:/container/path:ro IMAGE_NAME

# Multiple volumes
podman run -v /data:/data -v /config:/etc/config IMAGE_NAME
```

### Manage Volumes
```bash
podman volume ls                       # List all volumes
podman volume create my-volume         # Create named volume
podman volume rm my-volume             # Remove volume
podman volume inspect my-volume        # Get volume details
podman volume prune                    # Remove unused volumes
```

### Copy Files
```bash
podman cp FILE_PATH CONTAINER_NAME:/path # Copy file to container
podman cp CONTAINER_NAME:/path ./local   # Copy file from container
podman cp CONTAINER_NAME:/source CONTAINER_NAME:/dest # Between containers
```

---

## 5. ENVIRONMENT & CONFIG

### Environment Variables
```bash
podman run -e VAR=value IMAGE_NAME     # Set single variable
podman run -e VAR1=val1 -e VAR2=val2 IMAGE_NAME # Multiple variables
podman run --env-file .env IMAGE_NAME  # Load from .env file
podman inspect --format='{{range .Config.Env}}{{.}}\n{{end}}' CONTAINER_NAME # View set variables
```

### Resource Limits
```bash
podman run --memory=512m IMAGE_NAME    # Limit memory to 512MB
podman run --cpus=2 IMAGE_NAME         # Limit to 2 CPUs
podman run --memory=1g --cpus=4 IMAGE_NAME # Combined limits
podman run --memory-swap=1g IMAGE_NAME # Limit swap memory
podman run --oom-kill-disable IMAGE_NAME # Prevent OOM kill
```

### Restart Policies
```bash
podman run --restart=no IMAGE_NAME     # Don't restart (default)
podman run --restart=always IMAGE_NAME # Always restart
podman run --restart=on-failure IMAGE_NAME # Restart only on failure
podman run --restart=on-failure:5 IMAGE_NAME # Restart max 5 times on failure
```

---

## 6. DEBUGGING & TROUBLESHOOTING

### Logs and Debugging
```bash
podman logs CONTAINER_NAME             # View container logs
podman logs -f CONTAINER_NAME          # Follow logs in real-time
podman logs --timestamps CONTAINER_NAME # Show timestamps
podman inspect CONTAINER_NAME          # Full container info
podman inspect --format='{{.State}}' CONTAINER_NAME # Just state info
```

### Process Information
```bash
podman top CONTAINER_NAME              # View running processes
podman stats CONTAINER_NAME            # Real-time resource usage
podman events                          # Stream all container events
podman events --filter type=container  # Filter events
```

### Diff Changes
```bash
podman diff CONTAINER_NAME             # Show changes to container filesystem
# Output: A (added), D (deleted), C (changed)
```

### Commit Container to Image
```bash
podman commit CONTAINER_NAME my-new-image:latest # Save container as image
```

---

## 7. SYSTEM MANAGEMENT

### System Information
```bash
podman system info                     # Podman system information
podman version                         # Podman version
podman system df                       # Disk usage by images/containers/volumes
```

### Cleanup Commands
```bash
podman system prune                    # Remove unused containers, networks, volumes
podman system prune -a                 # More aggressive cleanup (removes all unused images)
podman system prune -a --volumes       # Include volumes in cleanup
podman system prune -a --force         # Force cleanup without confirmation
```

### Save and Load Images
```bash
podman save IMAGE_NAME -o image.tar    # Export image to file
podman save IMAGE_NAME > image.tar     # Alternative syntax
podman load -i image.tar               # Load image from file
podman load < image.tar                # Alternative syntax
```

---

## 8. ADVANCED TRICKS & USEFUL ONE-LINERS

### Quick Container Access
```bash
# Quick interactive bash into running container
podman exec -it CONTAINER_ID bash

# Get IP address of container
podman inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' CONTAINER_NAME

# Get container ID from name
podman ps -aqf "name=CONTAINER_NAME"

# Stop and remove all containers
podman ps -aq | xargs podman rm -f
```

### Image Manipulation
```bash
# Remove all dangling images and containers
podman system prune -af

# Get image size
podman images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"

# Find image by partial name
podman images | grep "partial-name"

# Remove all images (careful!)
podman rmi $(podman images -q)
```

### Monitoring
```bash
# Watch resource usage
watch podman stats

# Get container logs with filtering
podman logs CONTAINER_NAME | grep "ERROR"

# Real-time container activity
podman events --filter type=container
```

### Development Tricks
```bash
# Run container and auto-cleanup when done
podman run --rm -it ubuntu bash

# Run with current directory mounted
podman run -v $(pwd):/app -w /app -it IMAGE_NAME bash

# Run and keep stdin open even if detached
podman run -d -i IMAGE_NAME # You can still attach with: podman attach CONTAINER_ID

# Interactive with better shell
podman run -it --entrypoint /bin/bash IMAGE_NAME
```

### Docker Compose Alternative
```bash
# If you have docker-compose file, use with podman
podman-compose -f docker-compose.yml up -d
podman-compose -f docker-compose.yml down
```

---

## 9. CONTAINER LINKING & COMMUNICATION

### Connect Containers
```bash
# Create network and add containers to it
podman network create app-network
podman run -d --network app-network --name db postgres
podman run -d --network app-network --name web nginx

# Containers can now communicate using container names as hostnames
# Example: web container can reach db at "postgres:5432"

# Disconnect container from network
podman network disconnect app-network CONTAINER_NAME

# Connect running container to another network
podman network connect app-network CONTAINER_NAME
```

### Check Connectivity
```bash
# From inside container
podman exec web ping db

# View network bridge
podman network inspect app-network
```

---

## 10. USEFUL ALIASES (Add to ~/.bashrc or ~/.zshrc)

```bash
# Add these to your shell rc file
alias pps='podman ps'
alias ppsa='podman ps -a'
alias pil='podman images'
alias plog='podman logs -f'
alias pexec='podman exec -it'
alias prmi='podman rmi'
alias prm='podman rm'
alias prun='podman run'
alias pstop='podman stop'
alias pstart='podman start'
alias pprune='podman system prune -a --force'
alias pstats='podman stats'

# Function to quickly bash into container
function pbash() {
    podman exec -it $1 bash
}

# Function to see all container info
function pinfo() {
    podman inspect $1 | jq .
}

# Function to follow logs
function plogs() {
    podman logs -f $1
}
```

---

## PRACTICE EXERCISES

### Exercise 1: Basic Container Management
```bash
# 1. Pull ubuntu image
podman pull ubuntu:latest

# 2. Run container with interactive bash
podman run -it ubuntu:latest bash

# 3. Inside container: create a file
touch test.txt
echo "Hello Podman" > test.txt

# 4. Exit and list containers
exit
podman ps -a

# 5. Clean up
podman rm CONTAINER_ID
```

### Exercise 2: Port Mapping & Services
```bash
# 1. Run nginx in background
podman run -d --name webserver -p 8080:80 nginx:latest

# 2. Check if running
podman ps

# 3. View logs
podman logs webserver

# 4. Test connection
curl http://localhost:8080

# 5. Stop and remove
podman stop webserver
podman rm webserver
```

### Exercise 3: Volumes & Data Persistence
```bash
# 1. Create volume
podman volume create my-data

# 2. Run container with volume
podman run -d --name app -v my-data:/data ubuntu sleep 1000

# 3. Copy file into container
podman cp myfile.txt app:/data/

# 4. Verify file is there
podman exec app ls -la /data/

# 5. Stop container and run another with same volume
podman stop app
podman run -it -v my-data:/data ubuntu bash
ls -la /data/  # File should still be there!
exit

# 6. Cleanup
podman rm app
podman volume rm my-data
```

### Exercise 4: Networking
```bash
# 1. Create network
podman network create mynet

# 2. Run two containers on same network
podman run -d --network mynet --name container1 ubuntu sleep 1000
podman run -d --network mynet --name container2 ubuntu sleep 1000

# 3. Test communication
podman exec container1 ping container2

# 4. Check network details
podman network inspect mynet

# 5. Cleanup
podman stop container1 container2
podman rm container1 container2
podman network rm mynet
```

---

## QUICK REFERENCE TABLE

| Task | Command |
|------|---------|
| List running containers | `podman ps` |
| List all containers | `podman ps -a` |
| List images | `podman images` |
| Run container | `podman run IMAGE` |
| Run detached | `podman run -d IMAGE` |
| Run interactive | `podman run -it IMAGE` |
| Stop container | `podman stop CONTAINER` |
| Remove container | `podman rm CONTAINER` |
| Remove image | `podman rmi IMAGE` |
| View logs | `podman logs CONTAINER` |
| Follow logs | `podman logs -f CONTAINER` |
| Execute in container | `podman exec -it CONTAINER bash` |
| Map ports | `podman run -p 8080:80 IMAGE` |
| Mount volume | `podman run -v /host:/container IMAGE` |
| Set environment | `podman run -e VAR=value IMAGE` |
| System cleanup | `podman system prune -a` |

