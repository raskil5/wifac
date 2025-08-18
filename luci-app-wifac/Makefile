include $(TOPDIR)/rules.mk

PKG_NAME:=oem-wifi-credentials
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/oem-wifi-credentials
  SECTION:=base
  CATEGORY:=Base system
  TITLE:=OEM WiFi Credential Generator
  DEPENDS:=+libubus +libubox +libuci
endef

define Package/oem-wifi-credentials/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/99-oem-wifi $(1)/etc/uci-defaults/
	$(INSTALL_DIR) $(1)/etc/hotplug.d/iface
	$(INSTALL_BIN) ./files/99-wifi-persist $(1)/etc/hotplug.d/iface/
	$(INSTALL_DIR) $(1)/lib/functions
	$(INSTALL_DATA) ./files/lib/functions/oem-wifi.sh $(1)/lib/functions/
endef

$(eval $(call BuildPackage,oem-wifi-credentials))
