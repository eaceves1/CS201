#!/bin/bash
#Hi its me alex
# Name: Elijah Aceves
# Course: CI 201 Section 2
# Description:
# This script performs:
# - Ping Sweep of a subnet
# - Port Scan of an active host
# - Displays and removes scan result files


# MAIN MENU FUNCTION
main_menu() {

    echo "---------- Main Menu ----------"

    select option in "Ping Sweep" "Port Scan" "Print Scan Results" "Exit Program"
    do
        case $option in
            "Ping Sweep")
                ping_sweep
                break
                ;;
            "Port Scan")
                port_scan
                break
                ;;
            "Print Scan Results")
                print_results
                break
                ;;
            "Exit Program")
                echo "Exiting program. Goodbye."
                exit 0
                ;;
            *)
                echo "Invalid option. Try again."
                ;;
        esac
    done
}

# PING SWEEP FUNCTION
ping_sweep() {

    echo "---------- Ping Sweep ----------"

    # Redirect date (do not initialize file)
    date >> pingresults.txt

    echo "Enter first three octets of IP (example: 192.168.1)"
    read subnet
    echo "Pinging on subent $subnet"
    for i in {1..254}
    do
        ip="$subnet.$i"
	#echo "Pinging on $subnet.$i"

        ping -c 1 -W 1 $ip > /dev/null 2>&1

        if [ $? -eq 0 ]
        then
	    echo "Host $ip is ACTIVE"
            echo "Host $ip is ACTIVE" >> pingresults.txt
        fi
    done
    echo "Sweep complete, returning to main menu"
    main_menu
}


# PORT SCAN FUNCTION
port_scan() {

    echo "---------- Port Scan ----------"

    date >> portscanresults.txt

    echo "Enter full IP address of ACTIVE host (example: 192.168.1.10)"
    read host
    echo "scanning $host..."
    for port in {1..1024}
    do
        timeout 1 bash -c "echo >/dev/tcp/$host/$port" 2>/dev/null
        if [ $? -eq 0 ]
        then
	    echo "Port $port on $host is OPEN"
            echo "Port $port on $host is OPEN" >> portscanresults.txt
        fi
    done
    echo "scan on $host complete"
    main_menu
}


# PRINT RESULTS FUNCTION
print_results() {

    select option in "Display Ping Sweep Results" \
                     "Display Port Scan Results" \
                     "Remove Ping Sweep Results File" \
                     "Remove Port Scan Results File" \
                     "Return to Main Menu"
    do
        case $option in
            "Display Ping Sweep Results")
                if [ -f pingresults.txt ]
                then
                    cat pingresults.txt
                else
                    echo "Ping results file does not exist."
                fi
                ;;
            "Display Port Scan Results")
                if [ -f portscanresults.txt ]
                then
                    cat portscanresults.txt
                else
                    echo "Port scan results file does not exist."
                fi
                ;;
            "Remove Ping Sweep Results File")
                rm -f pingresults.txt
                echo "Ping results file removed."
                ;;
            "Remove Port Scan Results File")
                rm -f portscanresults.txt
                echo "Port scan results file removed."
                ;;
            "Return to Main Menu")
                main_menu
                break
                ;;
            *)
                echo "Invalid option."
                ;;
        esac
    done
}

# START PROGRAM
main_menu
