#!/bin/bash

install_packages() {
	echo "Installing packages..."
	while read -r package; do
		if yay -Qs $package &>>/dev/null; then
			echo -e "$package is already installed."
		else
			yay -S --noconfirm "$package"
		fi
	done <packages.txt
}

copy_zshrc() {
	echo "Copying .zshrc to home directory..."
	cp .zshrc ~/
	cp .zsh ~/
}

copy_wezterm() {
	echo "Copying .wezterm.lua to home directory..."
	cp .wezterm.lua ~/
}

copy_config_files() {
	echo "Copying configuration files to .config..."
	cp ./.config ~/
	cd ..
}

# Main script
main() {

	install_packages

	copy_zshrc

	copy_config_files

	copy_wezterm

	echo "Installation completed!"
}

# Run the main script
main
