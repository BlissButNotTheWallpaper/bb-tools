#!/bin/bash


echo ""
echo "Updating packages ..."
echo ""
sudo apt update

python_tools=(
	"git+https://github.com/xnl-h4ck3r/waymore.git"
	"bbot"
)

echo ""
echo "Installing Python written tools ..."
echo ""

for python_tool in "${python_tools[@]}"; do 
	echo ""
	echo "Installing $python_tool ..."
	echo ""
	pipx install -y "$python_tool"
done

pacman_tools=(
	"ffuf"
	"nmap"
	"gobuster"
)

echo ""
echo "Installing tools available in package manager ..."
echo ""

for pacman_tool in "${pacman_tools[@]}"; do 
	echo ""
	echo "Installing $pacman_tool ..."
	echo ""
	sudo apt install -y "$pacman_tool"
done

dependencies=(
	"chromium"
	"libpcap-dev"
)

echo ""
echo "Installing tools dependencies ..."
echo ""

for dependency in "${dependencies[@]}"; do 
	echo ""
	echo "Installing $dependency ..."
	echo ""
	sudo apt install -y "$dependency"
done

go_tools=(
	"github.com/projectdiscovery/asnmap/cmd/asnmap@latest"
	"github.com/sensepost/gowitness@latest"
	"github.com/projectdiscovery/httpx/cmd/httpx@latest"
	"github.com/projectdiscovery/naabu/v2/cmd/naabu@latest"
	"github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest"
	"github.com/tomnomnom/waybackurls@latest"
	"github.com/lc/gau/v2/cmd/gau@latest"
)

echo ""
echo "Installing Go written tools ..."
echo ""

for go_tool in "${go_tools[@]}"; do 
	echo ""
	echo "Installing $go_tool ..."
	echo ""
	go install -v "$go_tool"
done

wordlists=(
	"--depth 1 https://github.com/danielmiessler/SecLists.git"
)

for wordlist in "${wordlists[@]}"; do 
	echo ""
	echo "Installing wordlists"
	echo ""
	git clone "$wordlist"
done

