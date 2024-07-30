#!/bin/bash

echo Method 1: Remove lock files
echo "Removing lock files..."
sudo rm /var/lib/pacman/db.lck
sudo rm /var/lib/pacman/db.lock

echo Method 2: Kill pacman processes
echo "Killing pacman processes..."
sudo pkill pacman

echo Method 3: Check for stale locks
echo "Checking for stale locks..."
sudo lsof | grep pacman | awk '{print $2}' | xargs sudo kill -9

echo Method 4: Update pacman database
echo "Updating pacman database..."
sudo pacman-db-upgrade

echo Method 5: Synchronize package databases again
echo "Synchronizing package databases again..."
sudo pacman -Syy

echo Method 6: Check for package conflicts
echo "Checking for package conflicts..."
sudo pacman -Qq | sudo pacman -S -

echo Method 7: Update system
echo "Updating system..."
sudo pacman -Su

echo "Done! Try running 'pacman -Syy' again to see if the issue is resolved."
