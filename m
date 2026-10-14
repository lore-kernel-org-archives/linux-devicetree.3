Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12E051B160
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 13:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983971; cv=none; b=MjzE/PZnFbqTHRGkhK16OQy4n9pfSpETbOPyO9TOWGu7oCvjX3KwSjfjJrWomengZtLfOBZ2PxHcAr6k4spN69/SXZBjPyvtNPptzpuYbSdfsPr143pPCRPoq9ICmcjD8ijQiFMqylK9PHTKkZGOm4IuYczcMiGAn2sCmzIhZYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983971; c=relaxed/simple;
	bh=mFDxOJl35Z7o5pZCzo7q3N+bYqugfHYbJLRJsTsLQ7M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fPEspr1OBzG2z3FQNj3f9C3JsNWzqsSNl4d5DoODfCRL1EOpijVg0KsGO7Y2qdN34futPYiJeVdEPYGC5Djv6u96rNwn9ksGoxkm4JtgqIGsbGLue4bXfGed5a2ZAagLBmlU+Kjf7ndVqmRs+2DgXlAMYAruLwTyaIs30FTfX38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WxH6QtJz; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WxH6QtJz"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso4325395e9.1
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 06:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791983962; x=1792588762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ojGtEDomHScyshprs7PljvfCylYOLt5pAtkIt7VER/Q=;
        b=WxH6QtJzalZoiopp6l+s/alOI6dg+0aO317qaESqr0TRT5go4BZwz7BST6AFBBLnfR
         m1QkenS/2UNZ0obkwRJy3VBWA3gcBvecYRlHC7s0jv/mSjPXvzsGGlUJFwGE/SPGqczU
         /cLRl6qq7JzbiJux6zm8gyCNw3kZ4rsESsHKjjqfrDiXT6eoTwsAimEdDitJpuBAwWwz
         KhmeL+r5kV5df2pmHVrvmP6LTh11P9OiJP3bdsY9eF0cRR0/5cVDGrVCr7VRC/QGagUg
         QHHgMe3adXYiARulDYCYugHVxs9HyTy73FXZSS3yWwxpAnA2MZtedisw+9zrqSA3CHPX
         rJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983962; x=1792588762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ojGtEDomHScyshprs7PljvfCylYOLt5pAtkIt7VER/Q=;
        b=SWr2wsW0IREMWKGBVCVcb5OV4ui4hiNlhcL6uVtDHTs6dAL0TTiliprEaypRFU5QwF
         f3jTZ4W7gKpnzciBf+9f7KYnIfDg/lWSHk7anI2ce4BPor3HFkCGeTUzeSffJKyyWp6N
         zrSU0HMTkTyXpOp+2llYcDCOIC3d4QIALRzsCazKs/XieTqCEUOJoj9qCzw8tn6qJCwe
         2ddbkPUpEoJtp8FMETGs6L1/4DJVDJv68/NIWvQC+l20C2KywHheOrzEoHgb+5Ba0X91
         2FuyrlCMlAcZasxoAP+t7COoRf3sEm/baa5wzXWIuDao0+tlYvAt68yRcOFTCFKY6xpH
         rVFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzU+hUvnvGnCBJcan0Bsfmd/OMwTGn16OvCUJrLCy3lhff+QQze6bPZYggJeo2YRKNLU0TSeB0LucFX@vger.kernel.org
X-Gm-Message-State: AFq9FYJwYYJC+WjbBSMLdU2rFVpKyuJvuX9GNd9lZqHBmUeSzMIYMG2G
	VfUpmLLS3tsNM134b7BgkMwTDzJ8iJLpAworn0wWmHcFzTxiOoDz31Dh
X-Gm-Gg: AYBFou18VeOYaXIc9VlE9chXxMIxkAIjVA5+Chus2EQMRhgV2EPvu25ZOFtSgw9KlHP
	6DsG7dRUEsuo+3AxibxcI+HWkv6cwzm8Mv+CJppP22u+JvfhsmpSHFo3Dmi3W8JHNalOCqiJHBq
	UrTQpaOoAxFvppT6eFdqD7qCNrTaPcHQ4/Z6uRT8oVxcDMbN7tsRTu2j6O5J7EiLWdT33S+DMLr
	Bzd/p5IVU8Y+hrJQBwe/c49iO3mtvhJtGh7o/ACyAqL4ZwITwWo9iMz/B3cYjBE66KD43p5/Zy4
	/y8aPK4VmeG3xQw80niW4Bu88R9ycWmZ526BkduOpB2G/sGFRFLjdDXyWcu9SIgCegqy5G6DpEi
	gP4MNlfgaOsgUR/FgMHTkJnWiSoIRXMG4FKdMu4MbeKC5pYctDbE8vPBQVjR/1Fm5zeDhbb381X
	dfJaJBXft0EHx5d4PIS26qxfxN616nrfzlXeVFf8wdI2M1AiSjeiz1SJSy93ERQpWxJ8H3B55M8
	AfOa6V175gRjQi2+7xjRcpac37Od4i1F9xsw/6fI/a3PsLZTBj9mmIKkBaC2JV/XD2Uk53u9m8K
	4aeLEqebLXT3Y6XCkg==
X-Received: by 2002:a05:600c:c107:b0:4a1:875b:8be4 with SMTP id 5b1f17b1804b1-4a193f3b3a4mr212844125e9.8.1791983961670;
        Wed, 14 Oct 2026 06:19:21 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:ea0c:b1b4:c6cc:a0af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bcecbd0dsm1413825e9.8.2026.10.14.06.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 06:19:20 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH net-next v3 09/13] net: dsa: rzn1-a5psw: Get switch info via OF data
Date: Wed, 14 Oct 2026 14:18:57 +0100
Message-ID: <20261014131906.990077-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20261014131906.990077-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The driver previously assumed a fixed 5-port layout and derived the CPU
port and number of PCS instances from this. Newer Renesas variants use
different port counts. Although the CPU port remains the last port, the
fixed port/PCS topology hard coded in the driver no longer matches all
hardware.

Introduce an a5psw_of_data struct holding the per SoC switch info, and
use this match data in place of the previously embedded constants. This
makes the port loops, PCS allocation, management-port setup, and other
topology dependent code reflect the switch layout selected by the
compatible string.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Fixed typo in commit message: swicth -> switch

v1->v2:
- Updated commit message
- Renamed A5PSW_MAX_PORTS macro to A5PSW_MAX_NUM_PCS
---
 drivers/net/dsa/rzn1_a5psw.c | 27 ++++++++++++++++++---------
 drivers/net/dsa/rzn1_a5psw.h | 20 +++++++++++++++++---
 2 files changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/net/dsa/rzn1_a5psw.c b/drivers/net/dsa/rzn1_a5psw.c
index bdfa84745eda..c8197ef62fd2 100644
--- a/drivers/net/dsa/rzn1_a5psw.c
+++ b/drivers/net/dsa/rzn1_a5psw.c
@@ -382,13 +382,14 @@ static void a5psw_port_bridge_leave(struct dsa_switch *ds, int port,
 				    struct dsa_bridge bridge)
 {
 	struct a5psw *a5psw = ds->priv;
+	unsigned int cpu_port = a5psw->of_data->cpu_port;
 
 	a5psw->bridged_ports &= ~BIT(port);
 
 	a5psw_port_set_standalone(a5psw, port, true);
 
 	/* No more ports bridged */
-	if (a5psw->bridged_ports == BIT(A5PSW_CPU_PORT))
+	if (a5psw->bridged_ports == BIT(cpu_port))
 		a5psw->br_dev = NULL;
 }
 
@@ -924,20 +925,21 @@ static void a5psw_vlan_setup(struct a5psw *a5psw, int port)
 static int a5psw_setup(struct dsa_switch *ds)
 {
 	struct a5psw *a5psw = ds->priv;
+	unsigned int cpu_port = a5psw->of_data->cpu_port;
 	int port, vlan, ret;
 	struct dsa_port *dp;
 	u32 reg;
 
-	/* Validate that there is only 1 CPU port with index A5PSW_CPU_PORT */
+	/* Validate that there is only 1 CPU port with index matching cpu_port */
 	dsa_switch_for_each_cpu_port(dp, ds) {
-		if (dp->index != A5PSW_CPU_PORT) {
+		if (dp->index != cpu_port) {
 			dev_err(a5psw->dev, "Invalid CPU port\n");
 			return -EINVAL;
 		}
 	}
 
 	/* Configure management port */
-	reg = A5PSW_CPU_PORT | A5PSW_MGMT_CFG_ENABLE;
+	reg = cpu_port | A5PSW_MGMT_CFG_ENABLE;
 	a5psw_reg_writel(a5psw, A5PSW_MGMT_CFG, reg);
 
 	/* Set pattern 0 to forward all frame to mgmt port */
@@ -1149,7 +1151,7 @@ static void a5psw_pcs_free(struct a5psw *a5psw)
 {
 	int i;
 
-	for (i = 0; i < ARRAY_SIZE(a5psw->pcs); i++) {
+	for (i = 0; i < a5psw->of_data->npcs; i++) {
 		if (a5psw->pcs[i])
 			miic_destroy(a5psw->pcs[i]);
 	}
@@ -1176,7 +1178,7 @@ static int a5psw_pcs_get(struct a5psw *a5psw)
 			goto free_pcs;
 		}
 
-		if (reg >= ARRAY_SIZE(a5psw->pcs)) {
+		if (reg >= a5psw->of_data->npcs) {
 			ret = -ENODEV;
 			goto free_pcs;
 		}
@@ -1226,7 +1228,8 @@ static int a5psw_probe(struct platform_device *pdev)
 	if (IS_ERR(a5psw->base))
 		return PTR_ERR(a5psw->base);
 
-	a5psw->bridged_ports = BIT(A5PSW_CPU_PORT);
+	a5psw->of_data = of_device_get_match_data(dev);
+	a5psw->bridged_ports = BIT(a5psw->of_data->cpu_port);
 
 	ret = a5psw_pcs_get(a5psw);
 	if (ret)
@@ -1271,7 +1274,7 @@ static int a5psw_probe(struct platform_device *pdev)
 
 	ds = &a5psw->ds;
 	ds->dev = dev;
-	ds->num_ports = A5PSW_PORTS_NUM;
+	ds->num_ports = a5psw->of_data->nports;
 	ds->ops = &a5psw_switch_ops;
 	ds->phylink_mac_ops = &a5psw_phylink_mac_ops;
 	ds->priv = a5psw;
@@ -1313,8 +1316,14 @@ static void a5psw_shutdown(struct platform_device *pdev)
 	platform_set_drvdata(pdev, NULL);
 }
 
+static const struct a5psw_of_data rzn1_of_data = {
+	.nports = 5,
+	.npcs = 4,
+	.cpu_port = 4,
+};
+
 static const struct of_device_id a5psw_of_mtable[] = {
-	{ .compatible = "renesas,rzn1-a5psw", },
+	{ .compatible = "renesas,rzn1-a5psw", .data = &rzn1_of_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, a5psw_of_mtable);
diff --git a/drivers/net/dsa/rzn1_a5psw.h b/drivers/net/dsa/rzn1_a5psw.h
index d54acedac194..197ff5916578 100644
--- a/drivers/net/dsa/rzn1_a5psw.h
+++ b/drivers/net/dsa/rzn1_a5psw.h
@@ -195,8 +195,8 @@
 #define A5PSW_aCarrierSenseErrors		0x924
 
 #define A5PSW_VLAN_TAG(prio, id)	(((prio) << 12) | (id))
-#define A5PSW_PORTS_NUM			5
-#define A5PSW_CPU_PORT			(A5PSW_PORTS_NUM - 1)
+/* Maximum number of PCS instances (excludes CPU port) */
+#define A5PSW_MAX_NUM_PCS			4
 #define A5PSW_MDIO_DEF_FREQ		2500000
 #define A5PSW_MDIO_TIMEOUT		100
 #define A5PSW_JUMBO_LEN			(10 * SZ_1K)
@@ -231,12 +231,25 @@ union lk_data {
 	struct fdb_entry entry;
 };
 
+/**
+ * struct a5psw_of_data - OF data structure
+ * @nports: Number of ports in the switch
+ * @npcs: Number of PCS connected to the switch
+ * @cpu_port: CPU port number
+ */
+struct a5psw_of_data {
+	unsigned int nports;
+	unsigned int npcs;
+	unsigned int cpu_port;
+};
+
 /**
  * struct a5psw - switch struct
  * @base: Base address of the switch
  * @hclk: hclk_switch clock
  * @clk: clk_switch clock
  * @dev: Device associated to the switch
+ * @of_data: Pointer to OF data
  * @mii_bus: MDIO bus struct
  * @mdio_freq: MDIO bus frequency requested
  * @pcs: Array of PCS connected to the switch ports (not for the CPU)
@@ -252,8 +265,9 @@ struct a5psw {
 	struct clk *hclk;
 	struct clk *clk;
 	struct device *dev;
+	const struct a5psw_of_data *of_data;
 	struct mii_bus	*mii_bus;
-	struct phylink_pcs *pcs[A5PSW_PORTS_NUM - 1];
+	struct phylink_pcs *pcs[A5PSW_MAX_NUM_PCS];
 	struct dsa_switch ds;
 	struct mutex lk_lock;
 	spinlock_t reg_lock;
-- 
2.55.0

