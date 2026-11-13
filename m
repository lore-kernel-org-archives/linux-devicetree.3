Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794529991;
	b=uV8laDdzY1Kuw118rcaOtPukmYujqZu5m70irB5Yv7MVNS5vUpCHlEchln8gau+M8HHh
	 DX/wXLEGFDQ6NTw46wUdQbOudTvOen2HlFTOweSQc7tEACrQDlmuJgLOJmo4GT8EuhLFU
	 /YN1H6QtFMVb8oKRjTIBHVHRaTvOJRIqPpfOgWUBCoft8nX17zQGsoNF1B+BEcgEo1y0H
	 iqSVziS0/bmVatPY74FilE3g26Xw8wHI3Jcp8JucebNeitE+s/M9B4yvxudNVwFd+SnzL
	 8hAl+ocAbMo1P/UW/WeiEIbP6iBrzjuOX82W0ieUrLJVWGHlPOi6EeEDzyYJ8HMf8zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794529991;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1Qx/w97/Ge0dQ9t4hQAOOBki4nWw7shLdPCI1PWwoSs=;
	b=Qx9GaG8C0JRW2qwmI7Lw8gpr9Trg7/gkHPRHsk7CK9mqiQbgXlvJVsco6kr1d5wT2xNc
	 grSgPZc2PnFMic0aypgszFxeDAnqYX50fVD43ZKNuC3Al0GGqYYdUJVKmD9e3RWzcytBl
	 nkKL6+oPRvAR8qX3W87/N1SdBoVb6yA4jX+4IKRDf3Md58E7bMI/XeN5Y3agMfmlvrMEd
	 plSl6unpbcGghs8EezxzEGmboSx+pXrkdh6dIqz2M9A/OdaMUsRPc4U2JcTHnNHya0ytg
	 TZ6cX7CHjqODMWVyNvtVXAZKCpx0jWtY4SK7dWZGksuyYCpTkoUxmhXrEdOK8X9ofTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HjZCi+Sj;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BEFC60A6F7F
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:33:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BEFC60A6F7F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HjZCi+Sj
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso1999985e9.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794529989; x=1795134789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Qx/w97/Ge0dQ9t4hQAOOBki4nWw7shLdPCI1PWwoSs=;
        b=HjZCi+SjkxKI6iXSCxET8dbf7FPogzcKQZTHxdoRnULNu6/pVv6BYLxZ1YcJdRL+Yy
         4RUP+tDPNZ1hqZf8un0Bd9vUhFsA9ikcucfAKB1WvNoRKJWRRbHEW0Sqz6oQsQY7Ozoa
         l/gaLe0MPYOGr5aEyGIh2SljAeLU4bNHu2+jcufv1yegfipIrNk5wXh5CxBA8cOG8A2T
         sAXwa0hIybRL1vPvlS1Sg6J80h5tCD3fHVrCrnCbdbCAeRq9UOuUV4gA2YR38AAPJWLg
         riYmHQTieJNfPvLsoF4XESlHqA4wirv8HOupwhfNPs7g02t8xmuFcy13fYTn6O71tq/z
         088w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794529989; x=1795134789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Qx/w97/Ge0dQ9t4hQAOOBki4nWw7shLdPCI1PWwoSs=;
        b=hVecrQl8FjvIuyE1kytBpzhXp94Gti3M9ha18ARIGYebSr0wF6MebOQGf03IbRT6Rv
         QJWG8q5GpJvkTNleJuXhV80bCm2PfCrgvWNvPuCiQOXj35Yy4/rmm9T9aZfRiiOwF4eM
         2pcjJhprb/OuPEAoyaDSgQFVh2f6YiLZyPR2apwWNZt/q9btznuN3RIUXsfo5DI3R0Ih
         QvQMvtjPbx7KIgB3PRSvnvorpoW8lU+M3G9mh7j8VLTqAtsFUdXy7enZuY/84JY1UYru
         KWQnh0nw60P8m2WMld4qwmZ2+aWwlpPe/9+qMwMbwd9x/pZeqyxjop3RiC6fBY0hO1V8
         COvg==
X-Forwarded-Encrypted: i=1; AL+hErEBC19e6rOZX73IK3gFkoxlb6TsH4rswQbOPbUxyv+XfHc0TZRCyHWmsxkHT6xuYbKk2TquViLyw9zP@vger.kernel.org
X-Gm-Message-State: APuU4Z8tiOcFBB/wuY6CssXVkUGUpDKe+pL7TKtTBQHFU9Bl7UdPC/wx
	cXDCvyY98S+fQAFke26YO4BKHlnyfkdX/Jg3EDR4yTfX4KcieFjNClvt
X-Gm-Gg: AYBFou07aRR71uIOwiXLE63SjmdbzQl4sYZoa808g8IaSW8X6hPmGtUHm12Q9/wLiCI
	ZSz6oR5x9UQvuCIf99aBcZx9IXYGGR2MHWmRYLfb6/TClgc1XjNzidBGaNBCWX28ZqL5WG6Ilsk
	x66Eya4n9TdxLLQitpGL0TTUPywGSKoy7OV5rkVju8WrbLIg6cxeQ4TSTNfC3gSijzoAf4kEUQM
	E5JZREqlC8bZxy2JcWKDoax4HjUUEsIOn8RmndLqY/Ujzw4I3t8rvr7VDdh8L48/y7I8R8bC2is
	VUvCHSHcF/LvUIqHa37N6itU73YSDul38J1Rc1v6gFMd3gRZDu8EdwZvH2cmug7XRCBtO1i6RX2
	GyeYPKlcE2vHm+k+Zp1jYSr0VvyB2FhvrGF1Ygj2DW8O95bNL9wF4hyGUvn+uHtDS6eDMAwDNYs
	scJbC0gYJLPtgXdm8uSAYWNjx9mFy8XQlou6mnjF5I3d0U7zRoTs4bxiZlUXTFmo8J1pGUAWEoe
	mTKP0Sq+DS92lF/3uZB52N0i1EF/sAZaxqkWL9HXXrKs6vGG/kJVZZnvEgu8+9yizyOy1Hfk51P
	GAGMjhzAAXaNUkhd2KJ3vPuxpivKsDXMfP0fa0OkoVYRpZ5OC+/PDE05z/H+/sz0TyVpMTL/hAR
	G1bRi+UcK4sFwm0uNmfr5TrJTup4iG8PP36zmPtA8QNJPGYZEFGkdEQ==
X-Received: by 2002:a05:6000:4556:b0:498:c3fa:5ca9 with SMTP id ffacd0b85a97d-49c7316494fmr1480689f8f.20.1794529988818;
        Thu, 12 Nov 2026 16:33:08 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (host-212-171-11-167.retail.telecomitalia.it. [212.171.11.167])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm2029768f8f.23.2026.11.12.16.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:33:07 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Cc: Zhengping Zhang <zhengping.zhang@airoha.com>
Subject: [PATCH net-next v19 15/15] net: airoha: add phylink support
Date: Fri, 13 Nov 2026 01:32:05 +0100
Message-ID: <20261113003217.197757-16-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113003217.197757-1-ansuelsmth@gmail.com>
References: <20261113003217.197757-1-ansuelsmth@gmail.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add phylink support for each GDM port. For GDM1 add the internal interface
mode as the only supported mode. For GDM2/3/4 add the required
configuration of the PCS to make the external PHY or attached SFP cage
work.

These needs to be defined in the GDM port node using the pcs-handle
property.

Update and provide a .get/set_link_ksettings function that use phylink
for ethtool OPs now that we fully support phylink.

Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/ethernet/airoha/Kconfig       |   2 +
 drivers/net/ethernet/airoha/airoha_eth.c  | 197 +++++++++++++++++++++-
 drivers/net/ethernet/airoha/airoha_eth.h  |   5 +
 drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
 4 files changed, 213 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/airoha/Kconfig
index 1f6640a15fc9..5c54a07d2a76 100644
--- a/drivers/net/ethernet/airoha/Kconfig
+++ b/drivers/net/ethernet/airoha/Kconfig
@@ -20,6 +20,8 @@ config NET_AIROHA
 	depends on NET_DSA || !NET_DSA
 	select NET_AIROHA_NPU
 	select PAGE_POOL
+	select PCS_AIROHA
+	select PHYLINK
 	help
 	  This driver supports the gigabit ethernet MACs in the
 	  Airoha SoC family.
diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index b164a78ddac9..81a8da721c13 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -6,6 +6,7 @@
 #include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/pcs/pcs.h>
 #include <linux/platform_device.h>
 #include <linux/tcp.h>
 #include <linux/u64_stats_sync.h>
@@ -2194,10 +2195,18 @@ static int airoha_dev_open(struct net_device *netdev)
 		return -EBUSY;
 	}
 
+	err = phylink_of_phy_connect(dev->phylink, netdev->dev.of_node, 0);
+	if (err) {
+		netdev_err(netdev, "could not attach PHY: %d\n", err);
+		return err;
+	}
+
+	phylink_start(dev->phylink);
+
 	netif_tx_start_all_queues(netdev);
 	err = airoha_set_vip_for_gdm_port(dev, true);
 	if (err)
-		return err;
+		goto err_phy_stop;
 
 	if (netdev_uses_dsa(netdev))
 		airoha_fe_set(qdma->eth, REG_GDM_INGRESS_CFG(port->id),
@@ -2219,6 +2228,12 @@ static int airoha_dev_open(struct net_device *netdev)
 		airoha_dev_lro_enable(dev);
 
 	return 0;
+
+err_phy_stop:
+	phylink_stop(dev->phylink);
+	phylink_disconnect_phy(dev->phylink);
+
+	return err;
 }
 
 static int airoha_dev_stop(struct net_device *netdev)
@@ -2226,6 +2241,8 @@ static int airoha_dev_stop(struct net_device *netdev)
 	struct airoha_gdm_dev *dev = netdev_priv(netdev);
 	struct airoha_gdm_port *port = dev->port;
 
+	phylink_stop(dev->phylink);
+
 	netif_tx_disable(netdev);
 	airoha_set_vip_for_gdm_port(dev, false);
 
@@ -2239,6 +2256,8 @@ static int airoha_dev_stop(struct net_device *netdev)
 	if (netdev->features & NETIF_F_LRO)
 		airoha_dev_lro_disable(dev);
 
+	phylink_disconnect_phy(dev->phylink);
+
 	return 0;
 }
 
@@ -2829,6 +2848,24 @@ airoha_ethtool_get_rmon_stats(struct net_device *netdev,
 	} while (u64_stats_fetch_retry(&dev->stats.syncp, start));
 }
 
+static int
+airoha_ethtool_get_link_ksettings(struct net_device *netdev,
+				  struct ethtool_link_ksettings *cmd)
+{
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+
+	return phylink_ethtool_ksettings_get(dev->phylink, cmd);
+}
+
+static int
+airoha_ethtool_set_link_ksettings(struct net_device *netdev,
+				  const struct ethtool_link_ksettings *cmd)
+{
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+
+	return phylink_ethtool_ksettings_set(dev->phylink, cmd);
+}
+
 static int airoha_qdma_set_chan_tx_sched(struct net_device *netdev,
 					 int channel, enum tx_sched_mode mode,
 					 const u16 *weights, u8 n_weights)
@@ -3696,7 +3733,8 @@ static const struct ethtool_ops airoha_ethtool_ops = {
 	.get_drvinfo		= airoha_ethtool_get_drvinfo,
 	.get_eth_mac_stats      = airoha_ethtool_get_mac_stats,
 	.get_rmon_stats		= airoha_ethtool_get_rmon_stats,
-	.get_link_ksettings	= phy_ethtool_get_link_ksettings,
+	.get_link_ksettings	= airoha_ethtool_get_link_ksettings,
+	.set_link_ksettings	= airoha_ethtool_set_link_ksettings,
 	.get_link		= ethtool_op_get_link,
 };
 
@@ -3752,6 +3790,155 @@ bool airoha_is_valid_gdm_dev(struct airoha_eth *eth,
 	return false;
 }
 
+/* Nothing to do in MAC, everything is handled in PCS */
+static void airoha_mac_config(struct phylink_config *config, unsigned int mode,
+			      const struct phylink_link_state *state)
+{
+}
+
+static void airoha_mac_link_up(struct phylink_config *config, struct phy_device *phy,
+			       unsigned int mode, phy_interface_t interface,
+			       int speed, int duplex, bool tx_pause, bool rx_pause)
+{
+	struct airoha_gdm_dev *dev = container_of(config, struct airoha_gdm_dev,
+						  phylink_config);
+	struct airoha_gdm_port *port = dev->port;
+	struct airoha_eth *eth = dev->eth;
+	u32 frag_size_tx, frag_size_rx;
+
+	/* TX/RX frag is configured only for GDM4 */
+	if (port->id != AIROHA_GDM4_IDX)
+		return;
+
+	switch (speed) {
+	case SPEED_10000:
+	case SPEED_5000:
+		frag_size_tx = 8;
+		frag_size_rx = 8;
+		break;
+	case SPEED_2500:
+		frag_size_tx = 2;
+		frag_size_rx = 1;
+		break;
+	default:
+		frag_size_tx = 1;
+		frag_size_rx = 0;
+		break;
+	}
+
+	mutex_lock(&port->link_lock);
+
+	/* Configure TX/RX frag based on speed */
+	if (dev->nbq == 1) {
+		airoha_fe_rmw(eth, REG_FE_GDM4_TMBI_FRAG,
+			      GDM4_SGMII1_TX_FRAG_SIZE_MASK,
+			      FIELD_PREP(GDM4_SGMII1_TX_FRAG_SIZE_MASK,
+					 frag_size_tx));
+
+		airoha_fe_rmw(eth, REG_FE_GDM4_RMBI_FRAG,
+			      GDM4_SGMII1_RX_FRAG_SIZE_MASK,
+			      FIELD_PREP(GDM4_SGMII1_RX_FRAG_SIZE_MASK,
+					 frag_size_rx));
+	} else {
+		airoha_fe_rmw(eth, REG_FE_GDM4_TMBI_FRAG,
+			      GDM4_SGMII0_TX_FRAG_SIZE_MASK,
+			      FIELD_PREP(GDM4_SGMII0_TX_FRAG_SIZE_MASK,
+					 frag_size_tx));
+
+		airoha_fe_rmw(eth, REG_FE_GDM4_RMBI_FRAG,
+			      GDM4_SGMII0_RX_FRAG_SIZE_MASK,
+			      FIELD_PREP(GDM4_SGMII0_RX_FRAG_SIZE_MASK,
+					 frag_size_rx));
+	}
+
+	mutex_unlock(&port->link_lock);
+}
+
+/* Nothing to do in MAC, everything is handled in PCS */
+static void airoha_mac_link_down(struct phylink_config *config, unsigned int mode,
+				 phy_interface_t interface)
+{
+}
+
+static const struct phylink_mac_ops airoha_phylink_ops = {
+	.mac_config = airoha_mac_config,
+	.mac_link_up = airoha_mac_link_up,
+	.mac_link_down = airoha_mac_link_down,
+};
+
+static int airoha_fill_available_pcs(struct phylink_config *config,
+				     struct phylink_pcs **available_pcs,
+				     unsigned int num_possible_pcs)
+{
+	struct device *dev = config->dev;
+
+	return fwnode_phylink_pcs_parse(dev_fwnode(dev), available_pcs,
+					num_possible_pcs);
+}
+
+static int airoha_setup_phylink(struct net_device *netdev)
+{
+	struct airoha_gdm_dev *dev = netdev_priv(netdev);
+	struct device_node *np = netdev->dev.of_node;
+	struct airoha_gdm_port *port = dev->port;
+	struct phylink_config *config;
+	phy_interface_t phy_mode;
+	struct phylink *phylink;
+	int err;
+
+	err = of_get_phy_mode(np, &phy_mode);
+	if (err) {
+		dev_err(&netdev->dev, "incorrect phy-mode\n");
+		return err;
+	}
+
+	config = &dev->phylink_config;
+	config->dev = &netdev->dev;
+	config->type = PHYLINK_NETDEV;
+
+	/*
+	 * GDM1 only supports internal for Embedded Switch
+	 * and doesn't require a PCS.
+	 */
+	if (port->id == AIROHA_GDM1_IDX) {
+		config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
+					   MAC_10000FD;
+
+		__set_bit(PHY_INTERFACE_MODE_INTERNAL,
+			  config->supported_interfaces);
+	} else {
+		config->mac_capabilities = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
+					   MAC_10 | MAC_100 | MAC_1000 |
+					   MAC_2500FD | MAC_5000FD | MAC_10000FD;
+
+		config->num_possible_pcs = fwnode_phylink_pcs_count(dev_fwnode(config->dev));
+		config->fill_available_pcs = airoha_fill_available_pcs;
+
+		__set_bit(PHY_INTERFACE_MODE_SGMII,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_2500BASEX,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_10GBASER,
+			  config->supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_USXGMII,
+			  config->supported_interfaces);
+
+		phy_interface_copy(config->pcs_interfaces,
+				   config->supported_interfaces);
+	}
+
+	phylink = phylink_create(config, of_fwnode_handle(np),
+				 phy_mode, &airoha_phylink_ops);
+	if (IS_ERR(phylink))
+		return PTR_ERR(phylink);
+
+	dev->phylink = phylink;
+
+	return 0;
+}
+
 static int airoha_alloc_gdm_device(struct airoha_eth *eth,
 				   struct airoha_gdm_port *port,
 				   int nbq, struct device_node *np)
@@ -3815,7 +4002,7 @@ static int airoha_alloc_gdm_device(struct airoha_eth *eth,
 	dev->nbq = nbq;
 	port->devs[index] = dev;
 
-	return 0;
+	return airoha_setup_phylink(netdev);
 }
 
 static int airoha_alloc_gdm_port(struct airoha_eth *eth,
@@ -3851,6 +4038,7 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 
 	port->id = id;
 	spin_lock_init(&port->stats_lock);
+	mutex_init(&port->link_lock);
 	eth->ports[p] = port;
 
 	err = airoha_metadata_dst_alloc(port);
@@ -4047,6 +4235,8 @@ static int airoha_probe(struct platform_device *pdev)
 			netdev = netdev_from_priv(dev);
 			if (netdev->reg_state == NETREG_REGISTERED)
 				unregister_netdev(netdev);
+			if (dev->phylink)
+				phylink_destroy(dev->phylink);
 			of_node_put(netdev->dev.of_node);
 		}
 		airoha_metadata_dst_free(port);
@@ -4085,6 +4275,7 @@ static void airoha_remove(struct platform_device *pdev)
 
 			netdev = netdev_from_priv(dev);
 			unregister_netdev(netdev);
+			phylink_destroy(dev->phylink);
 			of_node_put(netdev->dev.of_node);
 		}
 		airoha_metadata_dst_free(port);
diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index d270729e22ff..909e75fec279 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -612,6 +612,9 @@ struct airoha_gdm_dev {
 	 * QDMA migration.
 	 */
 	spinlock_t txq_lock[AIROHA_NUM_NETDEV_TX_RINGS];
+
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
 };
 
 struct airoha_gdm_port {
@@ -621,6 +624,8 @@ struct airoha_gdm_port {
 
 	/* protect concurrent hw_stats accesses */
 	spinlock_t stats_lock;
+	/* protect concurrent GDM4 register access */
+	struct mutex link_lock;
 
 	struct metadata_dst *dsa_meta[AIROHA_MAX_DSA_PORTS];
 };
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 07dd04859fde..94d53d4c3ab7 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -371,6 +371,18 @@
 #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
 #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
 
+#define REG_FE_GDM4_TMBI_FRAG		0x2028
+#define GDM4_SGMII1_TX_WEIGHT_MASK	GENMASK(31, 26)
+#define GDM4_SGMII1_TX_FRAG_SIZE_MASK	GENMASK(25, 16)
+#define GDM4_SGMII0_TX_WEIGHT_MASK	GENMASK(15, 10)
+#define GDM4_SGMII0_TX_FRAG_SIZE_MASK	GENMASK(9, 0)
+
+#define REG_FE_GDM4_RMBI_FRAG		0x202c
+#define GDM4_SGMII1_RX_WEIGHT_MASK	GENMASK(31, 26)
+#define GDM4_SGMII1_RX_FRAG_SIZE_MASK	GENMASK(25, 16)
+#define GDM4_SGMII0_RX_WEIGHT_MASK	GENMASK(15, 10)
+#define GDM4_SGMII0_RX_FRAG_SIZE_MASK	GENMASK(9, 0)
+
 #define REG_MC_VLAN_EN			0x2100
 #define MC_VLAN_EN_MASK			BIT(0)
 
-- 
2.55.0

