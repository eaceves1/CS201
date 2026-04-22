#!/bin/bash

# ============================================
# Names: Elijah Aceves
# Course: CI 201 - Section 2
# Description: System Admin Menu Script
# ============================================

main_menu() {
    choice=0

    while [ "$choice" -ne 7 ]; do
        echo "====== MAIN MENU ======"
        echo "1. Disk Management"
        echo "2. File Management"
        echo "3. Network Management"
        echo "4. Process Management"
        echo "5. User Account Management"
        echo "6. Utilities"
        echo "7. Exit"

        read -p "Choose an option: " choice
#examle code
        case $choice in
            1) disk_menu ;;
            2) file_menu ;;
            3) network_menu ;;
            4) process_menu ;;
            5) user_menu ;;
            6) utilities_menu ;;
            7) echo "Exiting..." ;;
            *) echo "Invalid Entry" ;;
        esac
    done
}

#disk management

disk_menu() {
    choice=0

    while [ "$choice" -ne 5 ]; do
        echo "---- Disk Management ----"
        echo "1. Device Info"
        echo "2. Partition Info"
        echo "3. Block Devices"
        echo "4. Mounted Disks"
        echo "5. Return to Main Menu"

        read -p "Choice: " choice
##example code
        case $choice in
            1) lsblk ;;
            2) fdisk -l ;;
            3) lsblk ;;
            4) mount ;;
            5) echo "Returning..." ;;
            *) echo "Invalid Entry" ;;
        esac
    done
}

#file management

file_menu() {
    choice=0

    while [ "$choice" -ne 7 ]; do
        echo "---- File Management ----"
        echo "1. Present Working Directory"
        echo "2. List Directory"
        echo "3. Create File"
        echo "4. Change Permissions"
        echo "5. Remove File"
        echo "6. Read File"
        echo "7. Return"

        read -p "Choice: " choice
#example code
        case $choice in
            1) pwd ;;
            2) ls ;;
            3) read -p "Filename: " f; touch $f ;;
            4) read -p "File: " f; read -p "Permissions: " p; chmod $p $f ;;
            5) read -p "File: " f; rm $f ;;
            6) read -p "File: " f; cat $f ;;
            7) echo "Returning..." ;;
            *) echo "Invalid Entry" ;;
        esac
    done
}

#network management

network_menu() {
    choice=0

    while [ "$choice" -ne 9 ]; do
        echo "---- Network Management ----"
        echo "1. ifconfig"
        echo "2. ping"
        echo "3. traceroute"
        echo "4. nslookup"
        echo "5. Interfaces"
        echo "6. Routing Table"
        echo "7. Users Logged In"
        echo "8. System Info"
        echo "9. Return"

        read -p "Choice: " choice
#example code
        case $choice in
            1) ifconfig ;;
            2) read -p "Host: " h; ping -c 4 $h ;;
            3) read -p "Host: " h; traceroute $h ;;
            4) read -p "Domain: " d; nslookup $d ;;
            5) ip a ;;
            6) netstat -r ;;
            7) who ;;
            8) uname -a ;;
            9) echo "Returning..." ;;
            *) echo "Invalid Entry" ;;
        esac
    done
}

#process management

process_menu() {
    choice=0

    while [ "$choice" -ne 7 ]; do
        echo "---- Process Management ----"
        echo "1. Show Processes"
        echo "2. Top Processes"
        echo "3. Kill Process"
        echo "4. Disk Usage"
        echo "5. Free Space"
        echo "6. Uptime"
        echo "7. Return"

        read -p "Choice: " choice
# example code
        case $choice in
            1) ps ;;
            2) top ;;
            3) read -p "PID: " p; kill $p ;;
            4) du -h ;;
            5) df -h ;;
            6) uptime ;;
            7) echo "Returning..." ;;
            *) echo "Invalid Entry" ;;
        esac
    done
}

#user management

user_menu() {
    choice=0

    while [ "$choice" -ne 9 ]; do
        echo "---- User Management ----"
        echo "1. Add User"
        echo "2. Delete User"
        echo "3. Lock User"
        echo "4. User Info"
        echo "5. Add Group"
        echo "6. Delete Group"
        echo "7. Find User"
        echo "8. Find Group"
        echo "9. Return"

        read -p "Choice: " choice
#example code  for inside menu
        case $choice in
            1) read -p "Username: " u; sudo useradd $u ;;
            2) read -p "Username: " u; sudo userdel $u ;;
            3) read -p "Username: " u; sudo passwd -l $u ;;
            4) read -p "Username: " u; id $u ;;
            5) read -p "Group: " g; sudo groupadd $g ;;
            6) read -p "Group: " g; sudo groupdel $g ;;
            7) read -p "Username: " u; id $u ;;
            8) read -p "Group: " g; getent group $g ;;
            9) echo "Returning..." ;;
            *) echo "Invalid Entry" ;;
        esac
    done
}

main_menu
