Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795134360;
	b=2GC0ugYHmNGtoQe8/95W9ltrMwsL6VL48/rz+g/aRCMPdRw4gl5XBuczjUjBXKCTcESH
	 hRtMOi6h8YQLxDF/W1U3hiCO0Ksd9Lt9MyidRnoAGj/nWQljzY4r+97nIWPQ0gLqRZRHV
	 wEbrwg0gN1GHGArN+d0jWaBMXcUX9PUxXDPDXL2fobO0SGc9ZolvQs5LqjDdf5nx4XkIg
	 3HwLDY9AUONspRYMhxI6eRE3ubA83CrOqqMeLntJs893VvnS9kumTI+DnIlSytB0WqDff
	 JqfuWHLp3NAfkmDtBp7/XIUdW9OU7x4qjux8jZrKm0lpj9ZnSLVYwBUjvAXav61tOYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795134360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bhbKHe/N0fySKrFN6ia55guV8HN6/nTA4LCSOFT6YVg=;
	b=quWdKgARnWRTdKThIABriFNyfj+3k524tfBAj8o+gSbRcmFsrcYd1Sk4Jwq61jo8KsIo
	 YonPpR5Ls49CaXRAZCXlLm9Jm6qN52haJmBLhPo5Fj1gQRta13YL+0Kw13159yYjFUWSz
	 f3wKPj5gTamshnJcsFE+F6kh48ZKfVxMFI1ZbnrGoHS6J14tjAYyFsg79mJF6nLgdkffO
	 NtdfV082o76h0IvBhYUhykFkEXdIaWqeWpCRgr6GqGycAMhmbnw2IcQm9eUfdasJ9GReY
	 eD5G09Nee5YJ610BhGEfBtku2mT31SNbMW8hEMtPzTts7XnptlQ5LibUTIiDykWQCNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sCvk3CNl;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBDD60A2631
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 00:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACBDD60A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sCvk3CNl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso2379915e9.0
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795134358; x=1795739158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bhbKHe/N0fySKrFN6ia55guV8HN6/nTA4LCSOFT6YVg=;
        b=sCvk3CNlCaauGT0hbbzIMlnQbz+vkZUbNf4XP+JktkcRg37kmLqstmZzaWor9gHStR
         qjkXJ1+rCAFygoKR1LgrlRWb3q4eVHXRKVrs5hbPCDqfmz4OIyPJ6ysdWE4mp5rN5Uzx
         ZDBtAoHquxFB3ca+2w9oWvU67/JyVgL6gGkUsND69UZCj4m2HAjeuGSN5lJVePHMAe26
         UY4u7r3k2yaw6ULxwQYP5GgmEEIHAEt/Q5XGq1uHwc6vLvJGEt3a3XyhfpVwhgPjOhWN
         vUffZMCxnLsCSLonlg+2rBf75P0bXtXsGtUhSB+WKIZyt7vfdJhi7nqli2L4glXrypzA
         XetQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795134358; x=1795739158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bhbKHe/N0fySKrFN6ia55guV8HN6/nTA4LCSOFT6YVg=;
        b=2aGg4pDDLvbl7rIJbUG4outkMYWtuNOPcRXrfSxtkyVP6YrXzUYdxwEZj6EcDy/+3x
         IUUAwsnQkgrkS8bPsL9y54XoYFuJvIusthHuzmOJ5B+W+4OdUGw5OoAJK1WchxCD4RE7
         cPiQO7dZ8qATc9/+b79I7IPe7oLleyMHky0JlPy4L/gqy7Vvzmze81Fsj5OpIZWTXszr
         +awBKs1z1Ifd0JWR3GfRsdJXQknfh6MuNbyIYVsK8/sVpx5kt4nrr/nJTWWc+CiRwZGt
         9riRxKdxR8pF47+289zodofsw5kqKd31vO4qVfBcjzga9BV9/xmWpnOwyTWlVbPA4eeG
         T5nQ==
X-Forwarded-Encrypted: i=1; AL+hErGUsPWhMhDQIomyWRQoA9mV/1TAKgFo5mNwwP9O98dBnbufppPX9ddOSnpGiDjzaI01u+blmiZwYhII@vger.kernel.org
X-Gm-Message-State: APuU4Z+SbJI53U2Smmn4DtwiBabWGYmdyi1OSKxyptO3xE5JEPEfwkPl
	gWAt5xLHo5FPYsUiWy88Gd7XBqWGEGljQ0KrxHqoQI7UYd+mHw/Z5kcY
X-Gm-Gg: AYBFou0+/Sbf04GbtFktn8CIEZvokXMGTzIi7WWyCpdn7h2zxVKeB5JqgcZchgKtk8o
	9HfdDVA404BNKc+COyqPoeuEQm6mS80WdIplNvdfIyQEAlusl5S1WY69za+E05EHmXgF3b5i+0z
	fDTLyAb7XoQlYfKNq1HoZTYIQWNhrwOmfBRyIBq+ZQa2NgcUAUrvg2ybKBwXS8g0Q7TsPQDQjc4
	3DbP94JYuCvp0UgaXb3EDVdjCGPPTIb7uv0khOMOcujNnnKEocuTi+KZe04JVbwtIBj3Ydk+cnI
	LrI+aUmc4BsWTv/KYrM1Txk06Txai8Re2CgazXE9Gg/wYi+K9arjk0ZUklykQkVr4XPZ+gPHjBU
	z1ij5MJyPqHOz7TECjYHVskiBIgwjCFwHwdw53nmVLntH1qyafAn0bcs0+yEMM8RQH8mKmA+Haa
	4wqrAgBUGQn43lJ3MmFBh46lAEwvG+8GvhswL5woV3DQ39HumdpglTY5TRcNOiuUVTYdr/9lkfU
	UnQ3r6aCaHqYqdTY9qqMDYiwido6uzbxMUXyI8B7cfwNcajMTwOfdyvIG6BtAye59jSpY3Gpq7f
	w6HC4hSQ9nmUt4YZJ9HLVnwD85D5ofaF8hxUq/wLeadEu0+S6UAVb4dNRTwbBBmUwYdjQSoGL7i
	Yv80tt9Bj60xBDuNfozcxBrxyA/67C1L/+SjU9iHCBsqujx1FyRcxfYLIpJwtNhefUtELNXqn
X-Received: by 2002:a05:600c:3555:b0:4a1:9663:7639 with SMTP id 5b1f17b1804b1-4bb8882907fmr26927905e9.34.1795134358211;
        Thu, 19 Nov 2026 16:25:58 -0800 (PST)
Received: from iku.lan ([2a00:23c8:254f:fd01:c5c5:590b:f4b8:3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm2629998f8f.55.2026.11.19.16.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 16:25:57 -0800 (PST)
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
Subject: [PATCH net-next v5 04/24] net: pcs: rzn1-miic: Select ETHSW port speed through SWCTRL
Date: Fri, 20 Nov 2026 00:25:14 +0000
Message-ID: <20261120002549.1908299-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

On RZ/T2H and RZ/N2H, the ETHSW MAC speed is not fully controlled
through the switch registers. COMMAND_CONFIG_Pn.ENA_10 has no effect
on the actual MAC speed, and 10 Mbps and 1000 Mbps operation must
instead be selected through SWCTRL.SET10 and SWCTRL.SET1000,
respectively.

Without updating SWCTRL when the link speed changes, ETHSW ports
cannot operate correctly at 10 Mbps.

Select the ETHSW port speed through SWCTRL when bringing up the link
to ensure the MAC operates at the negotiated speed. Limit this
behaviour to the converters routed to ETHSW ports so that RZ/N1
remains unaffected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
- New patch
---
 drivers/net/pcs/pcs-rzn1-miic.c | 39 +++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index 682a73cf5a87..96f4cb533a71 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -11,6 +11,7 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/device/devres.h>
+#include <linux/ethtool.h>
 #include <linux/mdio.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -52,6 +53,10 @@
 #define MIIC_CONVRST_PHYIF_RST_MASK	GENMASK(4, 0)
 
 #define MIIC_SWCTRL			0x304
+#define MIIC_SWCTRL_SET_SPEED_10(x)	(BIT(0) << (x))
+#define MIIC_SWCTRL_SET_SPEED_1000(x)	(BIT(4) << (x))
+#define MIIC_SWCTRL_SET_SPEED_MASK(x)	((BIT(0) | BIT(4)) << (x))
+
 #define MIIC_SWDUPC			0x308
 
 #define MIIC_MODCTRL_CONF_CONV_MAX	6
@@ -197,6 +202,7 @@ struct miic_phy_link_cfg {
  * @rsts: Reset controls for the MII converter
  * @of_data: Pointer to OF data
  * @link_cfg: MIIC PHY_LINK configuration
+ * @conv_conf: Matched MODCTRL configuration of the ethernet port muxes
  */
 struct miic {
 	void __iomem *base;
@@ -205,6 +211,7 @@ struct miic {
 	struct reset_control_bulk_data rsts[MIIC_MAX_NUM_RSTS];
 	const struct miic_of_data *of_data;
 	struct miic_phy_link_cfg link_cfg;
+	const u8 *conv_conf;
 };
 
 enum miic_type {
@@ -230,6 +237,10 @@ enum miic_type {
  *  before access.
  * @miic_write: Function pointer to write a value to a MIIC register
  * @type: Type of MIIC
+ * @swctrl_conf_start: First configuration value of the switch ports whose
+ *  speed has to be selected through SWCTRL
+ * @swctrl_conf_count: Number of switch ports whose speed has to be selected
+ *  through SWCTRL, 0 if not needed
  */
 struct miic_of_data {
 	struct modctrl_match *match_table;
@@ -247,6 +258,8 @@ struct miic_of_data {
 	bool init_unlock_lock_regs;
 	void (*miic_write)(struct miic *miic, int offset, u32 value);
 	enum miic_type type;
+	u8 swctrl_conf_start;
+	u8 swctrl_conf_count;
 };
 
 /**
@@ -383,6 +396,27 @@ static int miic_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 	return 0;
 }
 
+static void miic_swctrl_set_speed(struct miic *miic, int port, int speed)
+{
+	const struct miic_of_data *of_data = miic->of_data;
+	u8 conf = miic->conv_conf[port + 1];
+	u32 val = 0;
+	int sw_port;
+
+	if (conf < of_data->swctrl_conf_start ||
+	    conf >= of_data->swctrl_conf_start + of_data->swctrl_conf_count)
+		return;
+
+	sw_port = conf - of_data->swctrl_conf_start;
+
+	if (speed == SPEED_1000)
+		val = MIIC_SWCTRL_SET_SPEED_1000(sw_port);
+	else if (speed == SPEED_10)
+		val = MIIC_SWCTRL_SET_SPEED_10(sw_port);
+
+	miic_reg_rmw(miic, MIIC_SWCTRL, MIIC_SWCTRL_SET_SPEED_MASK(sw_port), val);
+}
+
 static void miic_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 			 phy_interface_t interface, int speed, int duplex)
 {
@@ -415,6 +449,8 @@ static void miic_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 
 	miic_reg_rmw(miic, MIIC_CONVCTRL(port),
 		     (MIIC_CONVCTRL_CONV_SPEED | MIIC_CONVCTRL_FULLD), val);
+
+	miic_swctrl_set_speed(miic, port, speed);
 }
 
 static int miic_pre_init(struct phylink_pcs *pcs)
@@ -599,6 +635,7 @@ static int miic_match_dt_conf(struct miic *miic, s8 *dt_val, u32 *mode_cfg)
 		if (miic_modctrl_match(table_entry->conv, dt_val,
 				       miic->of_data->conf_conv_count)) {
 			*mode_cfg = table_entry->mode_cfg;
+			miic->conv_conf = table_entry->conv;
 			return 0;
 		}
 	}
@@ -875,6 +912,8 @@ static struct miic_of_data rzt2h_miic_of_data = {
 	.reset_count = ARRAY_SIZE(rzt2h_reset_ids),
 	.miic_write = miic_reg_writel_locked,
 	.type = MIIC_TYPE_RZT2H,
+	.swctrl_conf_start = ETHSS_ETHSW_PORT0,
+	.swctrl_conf_count = 3,
 };
 
 static const struct of_device_id miic_of_mtable[] = {
-- 
2.56.1

