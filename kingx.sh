$AXFUN
printer() {
	text="$1"
	color="$2"
	i=0
	while [ $i -lt ${#text} ]; do
		echo -en "\e[${color}m${text:$i:1}\e[0m"
		sleep 0.02
		i=$((i + 1))
	done
	echo
}
END='\033[0m'
ORANGE='\033[38;2;255;85;3m'
versi="v11.4.4-(KINGX)"
v_toast="Version : 11.4.2"
t_toast="KINGX - HEADTRICK"
linktree="https://linktr.ee/henvxofficial"
architecture=$(getprop ro.product.cpu.abi)
local bin="/data/local/tmp/"
local url64="https://raw.githubusercontent.com/HenBz10Real/snx11response/main/bin/king64"
local url32="https://raw.githubusercontent.com/HenBz10Real/snx11response/main/bin/king32"
local check_id=$(storm "https://henbz10real.github.io/snx11response/function/kingxid.txt")
local check_vip=$(echo "$check_id" | grep -q "$AXERONID" && echo true || echo false)
if [ $check_vip = true ]; then
	if [ "$architecture" = "arm64-v8a" ]; then
		rm -rf $response
		echo ""
		sleep 1
		echo ""
		echo "
█▀ █▀▀ █▄░█ █▀ █ ▀▄▀   █▄▀ █ █▄░█ █▀▀ ▀▄▀
▄█ ██▄ █░▀█ ▄█ █ █░█   █░█ █ █░▀█ █▄█ █░█"
		echo ""
		sleep 0.8 && echo
		printer "- Version : $versi"
		sleep 0.5
		printer "- Developer : @Henpeex"
		sleep 0.1
		echo
		echo
		status=$(pgrep -f king64) >/dev/null 2>&1
		if [ ! "$status" ]; then
			storm -rP "$bin" -s "${url64}" -fn "king64" "$@"
                        nohup /data/local/tmp/king64
		fi
		sleep 2
		status=$(pgrep -f king64) >/dev/null 2>&1
		if [ "$status" ]; then
			echo "${ORANGE}Programs berhasil terpasang :${END} $architecture"
                        am broadcast -a axeron.show.TOAST --es title "$t_toast" --es msg "Developer : henpeex 
$v_toast " --ei duration "4500" >/dev/null 2>&1
		else
			printer "Program failed : $architecture"
			rm -rf $response
		fi
		echo
		echo
		sleep 1
	elif [ "$architecture" = "armeabi-v7a" ]; then
		rm -rf $response
		echo
		sleep 1
		echo ""
		echo "
█▀ █▀▀ █▄░█ █▀ █ ▀▄▀   █▄▀ █ █▄░█ █▀▀ ▀▄▀
▄█ ██▄ █░▀█ ▄█ █ █░█   █░█ █ █░▀█ █▄█ █░█"
		echo ""
		sleep 0.8 && echo
		printer "- Version : $versi"
		sleep 0.5
		printer "- Developer : @Henpeex"
		sleep 0.1
		echo
		echo
		status=$(pgrep -f king32) >/dev/null 2>&1
		if [ ! "$status" ]; then
		        curl -sf -o /data/local/tmp/king32 $url32 2>/dev/null && {
                             chmod +x /data/local/tmp/king32
                             nohup /data/local/tmp/king32 >/dev/null 2>&1 &
                        } || {
                             chmod +x ${path}/king32
                             nohup ${path}/king32 >/dev/null 2>&1 &
                        }
		fi
		sleep 2
		status=$(pgrep -f king32) >/dev/null 2>&1
		if [ "$status" ]; then
			echo "${ORANGE}Programs berhasil terpasang :${END} $architecture"
                        am broadcast -a axeron.show.TOAST --es title "$t_toast" --es msg "Developer : henpeex 
$v_toast " --ei duration "4500" >/dev/null 2>&1
		else
			printer "Program failed : $architecture"
			rm -rf $response
		fi
		echo
		echo
		sleep 2 && rm -rf $response >/dev/null 2>&1
	else
		echo "Unknown: $architecture"
	fi
else
	echo 
	echo
	echo "Invalid device, ${RED}file rusak ( buy to original script )"
	sleep 2
	echo
	echo
	rm -rf $response >/dev/null 2>&1
	am start -a android.intent.action.VIEW -d ${linktree} >/dev/null 2>&1
fi
