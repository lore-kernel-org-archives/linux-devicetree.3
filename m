Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134375;
	b=f47HPFl5D3sfGzFDyDYhxgGbp16/NM1wgbnoIVlclw/WRXvB52vm8y/b3aW7xrkF945a
	 eoIlaUMDINr/0HpKPIX5i9VBPAIAQQC900ws3Eu+G3hGjPsY2lbCNrR0L+Du82znOU/7D
	 iZ12Sb6n/GIepxMVdowPH86I0lJvdYZPHobYMF3cQv+nNCheRPx2z4ryS6H1ryGUwU+hX
	 kgsJBZV36dXgmOeNX29i+Zkndg6xrthE0mm1NrbLhHBH+9lhFO6LNc52hMD04yhU9QABd
	 76tvJ34jVXIqlUNl2Rf0uJ3GScmpjOPPfYxGQeooubDQx97v9gKUOfPlH9e8NILHynA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=F/1ctIp7AsFHBPiKv06Jf7Nbn+DG17vAAWVKaBbsmT0=;
	b=4KvexHP69VuzYA/ahwTY/JklLWLn/KGkpDq5T0i0PnYRcicFNpb+KDDHqiFk6EYTHGs6
	 CdwC2ihUyR5S5iLp3QcuPwzVTvVN/UJOVgZNs5p1aSLfaifI5bh9d3nttEZOylR7KoV17
	 fL0ZNFXGO3fc3mx6jZKTFja7yepcGEo/0kddcS992zZMruZlNTzE9cW2L6MyG6oYztCLF
	 VHSholQka59RFpMviOV4L4X3EqDHvWmwE1kEFiCqrwieZSJ5w4Ubz8k2NeqUC15y9aOjM
	 yA1uaY2YpSYwUp6Sl25SbS/baUgN+fv7Buww1WSEQrSSmp7Sk5Nw42VwXPBUFTnd8bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tha7U7lm;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1597060A380F
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1597060A380F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tha7U7lm
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490d59c3edaso174800f8f.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134373; x=1795739173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/1ctIp7AsFHBPiKv06Jf7Nbn+DG17vAAWVKaBbsmT0=;
        b=tha7U7lmvApivPzw55aSMzpiHvuJYpfU6aHQXx4eY1MmBhNyFMxG1UfxsF9QJzqEel
         1kolxRZtwXPWXrP5ls27Q/kogVL0m+GHbCcwqcJYfM/th8BzckLpvcCtDXvV+V1T1Gve
         Gi1N0W8F8RUtHLslSGLcuNsIeK65ALaQcPOyGiCaj9WD4nesqy8K+ZQzkY7v/9SwvMrS
         kvlciOD+zAJNb0j5fGcLpwxNgd8CVdsNfoJOK0QBO94y4JeLhXxUpnST4CacUCeTQB2y
         eTLiXeGtdYKWY8pIz3XSsQ4/PSvPMLoG6Zz90JgJHApOyA3vpNUh2x7ihHsoVUDJFpwK
         McwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134373; x=1795739173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F/1ctIp7AsFHBPiKv06Jf7Nbn+DG17vAAWVKaBbsmT0=;
        b=062Pnw53TCRK1OmuOQ+BUWUvrR6glrIQzLXvD3lXnsV2xG74U9Mhp/zcmjVSTsTJz2
         Wih1msElaXfMyof+myVlFdOwTDVL/JjYSbQmxlgjD+9jX1C7TnDHGN9HPkD7g8CBi9cO
         9yEj+TWpSVMjOqRFZ9A5NOE1rT7sHpSSvGaUq4yrGFBaOBhEBP2FD8aaYntXwG83gfqf
         4w7QToD9IefMScQji2Yr7zrOMGt9q1Ietsv+sELM2GXKUKNNDd4b51DBAsvFuUahlwQz
         K+H85KhUyjJvY8TXkey2fJ+ciqE9O862hsOcgGBBPDZZF0BVPWGE1dmzZ66xKHTQXo0F
         sgcg==
X-Forwarded-Encrypted: i=1; AL+hErHxn0Ia5IkhmxDRwAR44adsDI7XVJ+MII+5iGgQxd9k/x+ETekxKEBhxYnP19oeLs7wbmj83MsFrePQ@vger.kernel.org
X-Gm-Message-State: APuU4Z82i6TGB0xwrvMnmWT0I4tWo+RZ60WpyiDpnIG+JRjZBjwhV7Fu
	wLFelv7hhqV+x5s9XqDDyXP/qTF6NWz21PaVc3qoT9ij9PzI3lFNtkX0
X-Gm-Gg: AZFdTZeo/Fl1DuFziqeJR5i56ifzDER6RmZUrXaMh7XGpeOSanQQ15mZk8nWNtB4PTI
	CS200tResFIiGzn50fOQwlDgok4qtZjDtiRHEO1Sf8zfo1lAUFkC2XZt/bpLV7Z1MoryarEB+c0
	3ELjWZrqsfTZrlTSkAOWSjk2hjnMwVLu0huvW9nVsizImIwLfxVb5eMsUDYQSkgVThUDo538g8i
	sW56IE017Fy/N3nT1ASItRIX6gfyKPQwXLR0dpODKFFc5r5fz1KSm+UW10qbqIPVnkP2YHDy2Wj
	u+MsZFmhytsprmZDp8ZUCUiznr2ukLSAPcl1jp0E00MObpK/s2Lv6EqwJVFsn0jMbxFg6lwROcL
	wOi9JNmunxfO9j+t/yIlNmI/icZ3jEX+6nQNAxoZpNo3RZJAOpYqRpmd7SVUOKjhXERKUB4lXdh
	Hoey3sE6jklExgiUixquaAcmCfZbGrz++73yaL8yf/liaeAnKPSFSNQsWhUxcUGmPPVc25d1bcf
	mbqjsXUpODv8wgUjnNEGLjSgXMfCubHhhflOy4JzyEvPyW/LWn1tdIMxcYNu+qCMV5ZoFlkCVrV
	/TSvAJBUoe30T1LrdhGIUdkzOCJIsCT3xjvQUzlAAgNrICwZgQ40hFzjb2gPNoWVTrm2o4ZokQO
	QBk+ZLP9/z20pLHcNOd3KLiGt1kWH63doVDItGvplEX5+vP30XkEsQawcRn9zrAqp1EY0kfmR
X-Received: by 2002:a05:6000:2c05:b0:48e:6651:5956 with SMTP id ffacd0b85a97d-4aa488c85eamr6820321f8f.0.1795134373548;
        Thu, 19 Nov 2026 16:26:13 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:26:13 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@linux.dev>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Ralph Siemsen <ralph.siemsen@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v5 22/24] net: dsa: rzn1-a5psw: Keep MAC TX enabled on RZ/T2H
Date: Fri, 20 Nov 2026 00:25:32 +0000
Message-ID: <20261120002549.1908299-23-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261120002549.1908299-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The RZ/T2H and RZ/N2H hardware manual requires
COMMAND_CONFIG_Pn.TX_ENA to remain set. Clearing this bit during
link-down handling or indirectly through CMD_CFG.SW_RESET during
setup violates this restriction.

Keep the MAC TX enable bit set and use PORT_ENA.TXENA to gate port
transmission instead. Account for both the administrative/STP state
and link state when updating PORT_ENA.TXENA, so that a link-up event
does not re-enable transmission on a port blocked by STP. Keep the
CPU port independent of link state.

Avoid CMD_CFG.SW_RESET during setup, as it also clears TX_ENA.
Since SW_RESET is also responsible for clearing the statistics
counters, pulse the switch reset line during probe to ensure the
hardware starts from a clean state.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/dsa/rzn1_a5psw.c | 85 +++++++++++++++++++++++++++++++-----
 drivers/net/dsa/rzn1_a5psw.h |  8 ++++
 2 files changed, 81 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index 751d03b0bde4..86d5b9d52f8d 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -127,11 +127,20 @@ static void a5psw_port_mgmtfwd_set(struct a5psw *a5psw, int port, bool enable)
 	a5psw_port_pattern_set(a5psw, port, A5PSW_PATTERN_MGMTFWD, enable);
 }
 
-static void a5psw_port_tx_enable(struct a5psw *a5psw, int port, bool enable)
+/* Must be called with reg_lock held */
+static void a5psw_port_tx_update(struct a5psw *a5psw, int port)
 {
 	u32 mask = A5PSW_PORT_ENA_TX(port);
-	u32 reg = enable ? mask : 0;
+	u32 reg;
 
+	reg = a5psw_reg_readl(a5psw, A5PSW_PORT_ENA) & ~mask;
+	if (a5psw->tx_allowed & a5psw->link_up & BIT(port))
+		reg |= mask;
+	a5psw_reg_writel(a5psw, A5PSW_PORT_ENA, reg);
+}
+
+static void a5psw_port_tx_enable(struct a5psw *a5psw, int port, bool enable)
+{
 	/* Even though the port TX is disabled through TXENA bit in the
 	 * PORT_ENA register, it can still send BPDUs. This depends on the tag
 	 * configuration added when sending packets from the CPU port to the
@@ -140,18 +149,38 @@ static void a5psw_port_tx_enable(struct a5psw *a5psw, int port, bool enable)
 	 * This allows to implement STP support when ports are in a state where
 	 * forwarding traffic should be stopped but BPDUs should still be sent.
 	 */
-	a5psw_reg_rmw(a5psw, A5PSW_PORT_ENA, mask, reg);
+	spin_lock(&a5psw->reg_lock);
+
+	if (enable)
+		a5psw->tx_allowed |= BIT(port);
+	else
+		a5psw->tx_allowed &= ~BIT(port);
+
+	a5psw_port_tx_update(a5psw, port);
+
+	spin_unlock(&a5psw->reg_lock);
 }
 
-static void a5psw_port_enable_set(struct a5psw *a5psw, int port, bool enable)
+static void a5psw_port_link_set(struct a5psw *a5psw, int port, bool up)
 {
-	u32 port_ena = 0;
+	spin_lock(&a5psw->reg_lock);
 
-	if (enable)
-		port_ena |= A5PSW_PORT_ENA_TX_RX(port);
+	if (up)
+		a5psw->link_up |= BIT(port);
+	else
+		a5psw->link_up &= ~BIT(port);
+
+	a5psw_port_tx_update(a5psw, port);
 
-	a5psw_reg_rmw(a5psw, A5PSW_PORT_ENA, A5PSW_PORT_ENA_TX_RX(port),
-		      port_ena);
+	spin_unlock(&a5psw->reg_lock);
+}
+
+static void a5psw_port_enable_set(struct a5psw *a5psw, int port, bool enable)
+{
+	u32 rx_mask = BIT(port + A5PSW_PORT_ENA_RX_SHIFT);
+
+	a5psw_reg_rmw(a5psw, A5PSW_PORT_ENA, rx_mask, enable ? rx_mask : 0);
+	a5psw_port_tx_enable(a5psw, port, enable);
 }
 
 static int a5psw_lk_execute_ctrl(struct a5psw *a5psw, u32 *ctrl)
@@ -278,6 +307,15 @@ static void a5psw_phylink_mac_link_down(struct phylink_config *config,
 	int port = dp->index;
 	u32 cmd_cfg;
 
+	if (a5psw->of_data->keep_mac_tx_enabled) {
+		if (dsa_port_is_user(dp))
+			a5psw_port_link_set(a5psw, port, false);
+
+		a5psw_reg_rmw(a5psw, A5PSW_CMD_CFG(port),
+			      A5PSW_CMD_CFG_RX_ENA, 0);
+		return;
+	}
+
 	cmd_cfg = a5psw_reg_readl(a5psw, A5PSW_CMD_CFG(port));
 	cmd_cfg &= ~(A5PSW_CMD_CFG_RX_ENA | A5PSW_CMD_CFG_TX_ENA);
 	a5psw_reg_writel(a5psw, A5PSW_CMD_CFG(port), cmd_cfg);
@@ -307,6 +345,9 @@ static void a5psw_phylink_mac_link_up(struct phylink_config *config,
 		cmd_cfg &= ~A5PSW_CMD_CFG_PAUSE_IGNORE;
 
 	a5psw_reg_writel(a5psw, A5PSW_CMD_CFG(dp->index), cmd_cfg);
+
+	if (a5psw->of_data->keep_mac_tx_enabled && dsa_port_is_user(dp))
+		a5psw_port_link_set(a5psw, dp->index, true);
 }
 
 static int a5psw_set_ageing_time(struct dsa_switch *ds, unsigned int msecs)
@@ -996,9 +1037,22 @@ static int a5psw_setup(struct dsa_switch *ds)
 	dsa_switch_for_each_port(dp, ds) {
 		port = dp->index;
 
-		/* Reset the port */
-		a5psw_reg_writel(a5psw, A5PSW_CMD_CFG(port),
-				 A5PSW_CMD_CFG_SW_RESET);
+		/* Gate TX on link state only for user ports */
+		if (!a5psw->of_data->keep_mac_tx_enabled || !dsa_port_is_user(dp))
+			a5psw->link_up |= BIT(port);
+
+		/*
+		 * Writing CMD_CFG = SW_RESET also writes TX_ENA as 0, which
+		 * must never happen on some SoCs. Their switch is reset through
+		 * its reset line in probe, so the statistics are already
+		 * cleared; only disable the MAC receive path.
+		 */
+		if (a5psw->of_data->keep_mac_tx_enabled)
+			a5psw_reg_rmw(a5psw, A5PSW_CMD_CFG(port),
+				      A5PSW_CMD_CFG_RX_ENA, 0);
+		else
+			a5psw_reg_writel(a5psw, A5PSW_CMD_CFG(port),
+					 A5PSW_CMD_CFG_SW_RESET);
 
 		/* Enable only CPU port */
 		a5psw_port_enable_set(a5psw, port, dsa_port_is_cpu(dp));
@@ -1296,6 +1350,13 @@ static int a5psw_probe(struct platform_device *pdev)
 		goto free_pcs;
 	}
 
+	/* The bootloader may have used the switch, start from reset state */
+	ret = reset_control_reset(reset);
+	if (ret) {
+		dev_err(dev, "Failed to reset switch: %d\n", ret);
+		goto free_pcs;
+	}
+
 	mdio = of_get_available_child_by_name(dev->of_node, "mdio");
 	if (mdio) {
 		ret = a5psw_probe_mdio(a5psw, mdio);
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index fd523fe7bf47..3ff76c32e5a4 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -240,6 +240,9 @@ union lk_data {
  * @vlan_res_vlanid: VLANID field mask of the VLAN_RES registers
  * @vlan_res_portmask: PORTMASK field mask of the VLAN_RES registers
  * @lk_table_entries: Number of entries in the lookup table (power of 2)
+ * @keep_mac_tx_enabled: The MAC transmit path (CMD_CFG.TX_ENA) must never be
+ *   disabled, so ports are not reset with CMD_CFG.SW_RESET. Port transmission
+ *   is instead gated through PORT_ENA on link down.
  */
 struct a5psw_of_data {
 	unsigned int nports;
@@ -252,6 +255,7 @@ struct a5psw_of_data {
 	u32 vlan_res_vlanid;
 	u32 vlan_res_portmask;
 	unsigned int lk_table_entries;
+	bool keep_mac_tx_enabled;
 };
 
 /**
@@ -268,6 +272,8 @@ struct a5psw_of_data {
  * @stats_lock: lock to access statistics (shared HI counter)
  * @lk_lock: Lock for the lookup table
  * @reg_lock: Lock for register read-modify-write operation
+ * @tx_allowed: Mask of ports with TX allowed by the port and STP state
+ * @link_up: Mask of ports whose link is up, or which are not link gated
  * @bridged_ports: Mask of ports that are bridged and should be flooded
  * @br_dev: Bridge net device
  */
@@ -282,6 +288,8 @@ struct a5psw {
 	struct dsa_switch ds;
 	struct mutex lk_lock;
 	spinlock_t reg_lock;
+	u32 tx_allowed;
+	u32 link_up;
 	u32 bridged_ports;
 	struct net_device *br_dev;
 };
-- 
2.56.1

