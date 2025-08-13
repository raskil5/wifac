oem_generate_credentials() {
    local WAN_MAC=$(ip -json link show dev wan 2>/dev/null | \
                   jsonfilter -e '@[0].address' || \
                   cat /sys/class/net/wan/address 2>/dev/null || \
                   cat /sys/class/net/eth0/address)
    WAN_MAC=${WAN_MAC//:/}

    local SSID_INDEX=$(uci -q get oem.wifi.index || echo ${WAN_MAC:8:3})
    local WIFI_PASS="Ad${WAN_MAC:4:4}59"

    uci -q batch <<EOUCI
set wireless.radio0.disabled='0'
set wireless.radio1.disabled='0'
set wireless.@wifi-iface[0].ssid="Dialog 4G $SSID_INDEX"
set wireless.@wifi-iface[0].key="$WIFI_PASS"
set wireless.@wifi-iface[1].ssid="Dialog 4G ${SSID_INDEX}5"
set wireless.@wifi-iface[1].key="$WIFI_PASS"
EOUCI
}
