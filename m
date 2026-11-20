Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795179405;
	b=ScG2z7aMr1QSyGb9zpol0tgTjr+TaBBZWAaJpTrHOYUjvVSNRs9P4rgfZ2zh5IF7JnIO
	 LGOVNYV/GOmi4oYJhNu8xhRHy19sgb2A3Ql0dFSIV3eD+2quHnl/RQzGApQxBZbtxF08X
	 Y/BsqAHlcDvE7d2YQMGdwSKrO5KLYTLFlcv0GkUPwh8z5BKWWT9R7t+cdbt67qCzJ/VX3
	 8Ct8EJQo50spWo/gWfpPa6sAS9nC/bN61iUX0vYG/vFL+CCjqULRNf1lkTDE+o6G5pPk7
	 TJNYexEooBk9v36daUBtIXf2uMbxQDa0xun49PAqtoTZj0rCiLS8kv2gR6Odnq9KVVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795179405;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=NT+Ur9HHVW8HQb7TVoQZ2lHlhO8TLgobut9foIV77Vw=;
	b=tNDdyVwE4xtcAKCmoaZbZsW8rtq8n0iW4A0hC8UnJKwYUny4wylAv1BEZAoGHA/5qkGw
	 e03FFJ7oAY7FQcQDmkh6J2O6cr9UBphPqFuLf/j+KXsKY4BvNjLeB8Fam3006HHfmblJZ
	 XnvjPzOw9or/DrYOQC0fOkjoZufOBooVL61J9L02FwTaFnrJvVdHq2YuTRX7q+VImmJqU
	 2zJj2ooqzg+z5nah24bPkAdDDQqUftsV5ODrTvrfRhPbMYPD43Rg1C+ORyhDzlNTNOYSa
	 ioj237sywm7s2rDZ70A4Jtvw2NRdQYm86m/BPxk9giED4qGtp4vaBD8aO9pg3Tga6Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="XxipCx/x";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C512F606A32C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 12:56:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C512F606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XxipCx/x
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 37692C62216;
	Fri, 20 Nov 2026 12:56:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7B7FF601B9;
	Fri, 20 Nov 2026 12:56:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DE56311BC003E;
	Fri, 20 Nov 2026 13:56:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795179398; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NT+Ur9HHVW8HQb7TVoQZ2lHlhO8TLgobut9foIV77Vw=;
	b=XxipCx/xSVxOF+hUpxqo2B57k2h9Q9OoxVQZjxjEu4KGASfV1QwtJy7/HaMb8TedrcTJNi
	6LXgnkNznkf2YD33A35jKreYXX8yakOiZ7XI6K1hvVLIxSEQzzq2I5UMts/57WtyJPP2H8
	HHOJ6HK7oyrtMyivmOSU69BjuxG0VSVjqKmr3OW1QX2TJSYlk046c4Dy/XR5grX93cHfCC
	WqGjI91RKx+ZMcJ8pM7wM4hvoj2BNOjdENkXVxCSVylXv9yoMDh/+fJ0MV7xfUnQoFxrdz
	WFbX1hszfjhJL8i/a2KgKpA6n7a43Gcet/m8zsEuQPcxp5Qqoc0FZ4q3pk58+w==
From: Benjamin Robin <benjamin.robin@bootlin.com>
Date: Fri, 20 Nov 2026 13:55:52 +0100
Subject: [PATCH 4/4] phy: cadence-torrent: rewrite Torrent PHY driver
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-phy-cadence-torrent-ng-v1-4-da2db7125cd7@bootlin.com>
References: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
In-Reply-To: <20261120-phy-cadence-torrent-ng-v1-0-da2db7125cd7@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yuti Amonkar <yamonkar@cadence.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Andrew Davis <afd@ti.com>
Cc: Vinod Koul <vkoul@kernel.org>, Chintan Vankar <c-vankar@ti.com>, 
 Abhash Kumar Jha <a-kumar2@ti.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Swapnil Jakhade <sjakhade@cadence.com>, 
 Siddharth Vadapalli <s-vadapalli@ti.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 Benjamin Robin <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

The Cadence Torrent PHY (sd0801) is a multi-protocol SerDes used in
several SoCs, among them the Texas Instruments J72xx family. Its
programming depends on many parameters: the selected protocol (each
associated PLL has to be set to a different frequency), the DisplayPort
bit rate, the reference clock frequency, whether spread-spectrum
clocking (SSC) is enabled, the number of lanes, and the PHY revision
and technology (process node).

The current phy-cadence-torrent driver hard-codes, for every supported
configuration, the set of register values to program. Because this
configuration space is large, adding a new board or a new combination
of standards requires duplicating dozens of opaque register values,
which is inflexible and hard to maintain.

This new driver version computes the register values instead:

  - registers that depend on the reference clock frequency or on a PLL
    frequency are computed at run time, from the reference clock
    obtained through the clock framework and from the PLL frequency
    derived from the selected standard;
  - the other registers, which only depend on the standard type, the
    PHY revision and the technology, are handled by one function per
    register, using an internal table selected through a
    standard/revision/technology key.

The PHY revision and technology are detected automatically from the
PHY identification registers, and the DisplayPort link initialization
and rate reconfiguration have been rewritten.

Compared with the existing driver, this rewrite provides:

  - support for all the reference clock frequencies supported by the
    Cadence Torrent PHY;
  - support for multiple links per standard without restriction, as
    described in the "Supported PHY configurations" table of the user
    guide;
  - the ability to reconfigure the DisplayPort link rate dynamically,
    regardless of the reference clock frequency, which also allows the
    spread-spectrum clocking (SSC) to be enabled or disabled at run
    time;
  - the ability to reconfigure the SerDes link rate dynamically (for
    example, to switch between SGMII and 2500BASE-X), which would rely
    on the PHY set_mode() operation, not implemented yet.

The register calculations were initially derived from the Cadence
"Torrent Programmers Guide" spreadsheet in versions 0.28, then the
driver was partially updated by using the version 0.30 of this
spreadsheet.

Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
---
 drivers/phy/cadence/phy-cadence-torrent.c | 9417 +++++++++++++----------------
 1 file changed, 4357 insertions(+), 5060 deletions(-)

diff --git a/drivers/phy/cadence/phy-cadence-torrent.c b/drivers/phy/cadence/phy-cadence-torrent.c
index 1e178aa2ffd7..74a65f0f4b24 100644
--- a/drivers/phy/cadence/phy-cadence-torrent.c
+++ b/drivers/phy/cadence/phy-cadence-torrent.c
@@ -2,7 +2,7 @@
 /*
  * Cadence Torrent SD0801 PHY driver.
  *
- * Copyright 2018 Cadence Design Systems, Inc.
+ * Copyright 2026 Mobileye Vision Technologies Ltd.
  *
  */
 
@@ -20,63 +20,53 @@
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
-#include <linux/regmap.h>
 
-#define REF_CLK_19_2MHZ		19200000
-#define REF_CLK_25MHZ		25000000
-#define REF_CLK_100MHZ		100000000
-#define REF_CLK_156_25MHZ	156250000
-
-#define MAX_NUM_LANES		4
+#define MAX_NUM_LANES		8
 #define DEFAULT_MAX_BIT_RATE	8100 /* in Mbps */
 
 #define POLL_TIMEOUT_US		5000
 #define PLL_LOCK_TIMEOUT	100000
 
-#define DP_PLL0			BIT(0)
-#define DP_PLL1			BIT(1)
-
 #define TORRENT_COMMON_CDB_OFFSET	0x0
 
-#define TORRENT_TX_LANE_CDB_OFFSET(ln, block_offset, reg_offset)	\
-				((0x4000 << (block_offset)) +		\
-				(((ln) << 9) << (reg_offset)))
+#define TORRENT_TX_LANE_CDB_OFFSET(ln, block_offset, reg_offset) \
+	((0x4000U << (block_offset)) + (((ln) << 9) << (reg_offset)))
 
-#define TORRENT_RX_LANE_CDB_OFFSET(ln, block_offset, reg_offset)	\
-				((0x8000 << (block_offset)) +		\
-				(((ln) << 9) << (reg_offset)))
+#define TORRENT_RX_LANE_CDB_OFFSET(ln, block_offset, reg_offset) \
+	((0x8000U << (block_offset)) + (((ln) << 9) << (reg_offset)))
 
-#define TORRENT_PHY_PCS_COMMON_OFFSET(block_offset)	\
-				(0xC000 << (block_offset))
+#define TORRENT_PHY_PCS_COMMON_OFFSET(block_offset) (0xC000U << (block_offset))
 
-#define TORRENT_PHY_PCS_LANE_CDB_OFFSET(ln, block_offset, reg_offset)	\
-				((0xD000 << (block_offset)) +		\
-				(((ln) << 8) << (reg_offset)))
+#define TORRENT_PHY_PCS_LANE_CDB_OFFSET(ln, block_offset, reg_offset) \
+	((0xD000U << (block_offset)) + (((ln) << 8) << (reg_offset)))
 
-#define TORRENT_PHY_PMA_COMMON_OFFSET(block_offset)	\
-				(0xE000 << (block_offset))
-
-#define TORRENT_DPTX_PHY_OFFSET		0x0
+#define TORRENT_PHY_PMA_COMMON_OFFSET(block_offset) (0xE000U << (block_offset))
 
 /*
  * register offsets from DPTX PHY register block base (i.e MHDP
  * register base + 0x30a00)
  */
-#define PHY_AUX_CTRL			0x04
-#define PHY_RESET			0x20
-#define PMA_TX_ELEC_IDLE_SHIFT		4
-#define PHY_PMA_XCVR_PLLCLK_EN		0x24
-#define PHY_PMA_XCVR_PLLCLK_EN_ACK	0x28
-#define PHY_PMA_XCVR_POWER_STATE_REQ	0x2c
-#define PHY_POWER_STATE_LN(ln)		((ln) * 8)
+#define PHY_AUX_CTRL				0x04
+#define PHY_RESET				0x20
+#define PMA_TX_ELEC_IDLE_SHIFT			4
+#define PHY_PMA_XCVR_PLLCLK_EN			0x24
+#define PHY_PMA_XCVR_PLLCLK_EN_ACK		0x28
+#define PHY_PMA_XCVR_POWER_STATE_REQ		0x2c
+#define PHY_POWER_STATE_LN(ln)			((ln) * 8)
 #define PMA_XCVR_POWER_STATE_REQ_LN_MASK	0x3FU
-#define PHY_PMA_XCVR_POWER_STATE_ACK	0x30
-#define PHY_PMA_CMN_READY		0x34
+#define PHY_PMA_XCVR_POWER_STATE_ACK		0x30
+#define PHY_PMA_CMN_READY			0x34
 
 /*
  * register offsets from SD0801 PHY register block base (i.e MHDP
  * register base + 0x500000)
  */
+#define CMN_PID_TYPE			0x0000U
+#define CMN_PID_NUM			0x0003U
+#define CMN_PID_REV			0x0004U
+#define CMN_PID_MFG			0x0008U
+#define CMN_PID_NODE			0x0009U
+
 #define CMN_SSM_BANDGAP_TMR		0x0021U
 #define CMN_SSM_BIAS_TMR		0x0022U
 #define CMN_PLLSM0_PLLPRE_TMR		0x002AU
@@ -90,52 +80,29 @@
 #define CMN_BGCAL_INIT_TMR		0x0064U
 #define CMN_BGCAL_ITER_TMR		0x0065U
 #define CMN_IBCAL_INIT_TMR		0x0074U
-#define CMN_PLL0_VCOCAL_TCTRL		0x0082U
-#define CMN_PLL0_VCOCAL_INIT_TMR	0x0084U
-#define CMN_PLL0_VCOCAL_ITER_TMR	0x0085U
-#define CMN_PLL0_VCOCAL_REFTIM_START	0x0086U
-#define CMN_PLL0_VCOCAL_PLLCNT_START	0x0088U
-#define CMN_PLL0_INTDIV_M0		0x0090U
-#define CMN_PLL0_FRACDIVL_M0		0x0091U
-#define CMN_PLL0_FRACDIVH_M0		0x0092U
-#define CMN_PLL0_HIGH_THR_M0		0x0093U
-#define CMN_PLL0_DSM_DIAG_M0		0x0094U
-#define CMN_PLL0_DSM_FBH_OVRD_M0	0x0095U
-#define CMN_PLL0_DSM_FBL_OVRD_M0	0x0096U
-#define CMN_PLL0_SS_CTRL1_M0		0x0098U
-#define CMN_PLL0_SS_CTRL2_M0            0x0099U
-#define CMN_PLL0_SS_CTRL3_M0            0x009AU
-#define CMN_PLL0_SS_CTRL4_M0            0x009BU
-#define CMN_PLL0_LOCK_REFCNT_START      0x009CU
-#define CMN_PLL0_LOCK_PLLCNT_START	0x009EU
-#define CMN_PLL0_LOCK_PLLCNT_THR        0x009FU
-#define CMN_PLL0_INTDIV_M1		0x00A0U
-#define CMN_PLL0_FRACDIVH_M1		0x00A2U
-#define CMN_PLL0_HIGH_THR_M1		0x00A3U
-#define CMN_PLL0_DSM_DIAG_M1		0x00A4U
-#define CMN_PLL0_SS_CTRL1_M1		0x00A8U
-#define CMN_PLL0_SS_CTRL2_M1		0x00A9U
-#define CMN_PLL0_SS_CTRL3_M1		0x00AAU
-#define CMN_PLL0_SS_CTRL4_M1		0x00ABU
-#define CMN_PLL1_VCOCAL_TCTRL		0x00C2U
-#define CMN_PLL1_VCOCAL_INIT_TMR	0x00C4U
-#define CMN_PLL1_VCOCAL_ITER_TMR	0x00C5U
-#define CMN_PLL1_VCOCAL_REFTIM_START	0x00C6U
-#define CMN_PLL1_VCOCAL_PLLCNT_START	0x00C8U
-#define CMN_PLL1_INTDIV_M0		0x00D0U
-#define CMN_PLL1_FRACDIVL_M0		0x00D1U
-#define CMN_PLL1_FRACDIVH_M0		0x00D2U
-#define CMN_PLL1_HIGH_THR_M0		0x00D3U
-#define CMN_PLL1_DSM_DIAG_M0		0x00D4U
-#define CMN_PLL1_DSM_FBH_OVRD_M0	0x00D5U
-#define CMN_PLL1_DSM_FBL_OVRD_M0	0x00D6U
-#define CMN_PLL1_SS_CTRL1_M0		0x00D8U
-#define CMN_PLL1_SS_CTRL2_M0            0x00D9U
-#define CMN_PLL1_SS_CTRL3_M0            0x00DAU
-#define CMN_PLL1_SS_CTRL4_M0            0x00DBU
-#define CMN_PLL1_LOCK_REFCNT_START      0x00DCU
-#define CMN_PLL1_LOCK_PLLCNT_START	0x00DEU
-#define CMN_PLL1_LOCK_PLLCNT_THR        0x00DFU
+
+#define CMN_PLLx_Mx_REG_OFFSET(o, x)   ({ u32 __x = (x); (o) + 16U * (__x) * (__x); })
+
+#define CMN_PLLx_VCOCAL_TCTRL(x)	(0x0082U + 32U * (x))
+#define CMN_PLLx_VCOCAL_INIT_TMR(x)	(0x0084U + 32U * (x))
+#define CMN_PLLx_VCOCAL_ITER_TMR(x)	(0x0085U + 32U * (x))
+#define CMN_PLLx_VCOCAL_REFTIM_START(x)	(0x0086U + 32U * (x))
+#define CMN_PLLx_VCOCAL_PLLCNT_START(x)	(0x0088U + 32U * (x))
+#define CMN_PLLx_INTDIV_Mx(x)		CMN_PLLx_Mx_REG_OFFSET(0x0090U, x)
+#define CMN_PLLx_FRACDIVL_Mx(x)		CMN_PLLx_Mx_REG_OFFSET(0x0091U, x)
+#define CMN_PLLx_FRACDIVH_Mx(x)		CMN_PLLx_Mx_REG_OFFSET(0x0092U, x)
+#define CMN_PLLx_HIGH_THR_Mx(x)		CMN_PLLx_Mx_REG_OFFSET(0x0093U, x)
+#define CMN_PLLx_DSM_DIAG_Mx(x)		CMN_PLLx_Mx_REG_OFFSET(0x0094U, x)
+#define CMN_PLLx_DSM_FBH_OVRD_Mx(x)	CMN_PLLx_Mx_REG_OFFSET(0x0095U, x)
+#define CMN_PLLx_DSM_FBL_OVRD_Mx(x)	CMN_PLLx_Mx_REG_OFFSET(0x0096U, x)
+#define CMN_PLLx_SS_CTRL1_Mx(x)		CMN_PLLx_Mx_REG_OFFSET(0x0098U, x)
+#define CMN_PLLx_SS_CTRL2_Mx(x)		CMN_PLLx_Mx_REG_OFFSET(0x0099U, x)
+#define CMN_PLLx_SS_CTRL3_Mx(x)		CMN_PLLx_Mx_REG_OFFSET(0x009AU, x)
+#define CMN_PLLx_SS_CTRL4_Mx(x)		CMN_PLLx_Mx_REG_OFFSET(0x009BU, x)
+#define CMN_PLLx_LOCK_REFCNT_START(x)	(0x009CU + 32U * (x))
+#define CMN_PLLx_LOCK_PLLCNT_START(x)	(0x009EU + 32U * (x))
+#define CMN_PLLx_LOCK_PLLCNT_THR(x)	(0x009FU + 32U * (x))
+
 #define CMN_TXPUCAL_TUNE		0x0103U
 #define CMN_TXPUCAL_INIT_TMR		0x0104U
 #define CMN_TXPUCAL_ITER_TMR		0x0105U
@@ -148,21 +115,14 @@
 #define CMN_SD_CAL_ITER_TMR		0x0125U
 #define CMN_SD_CAL_REFTIM_START		0x0126U
 #define CMN_SD_CAL_PLLCNT_START		0x0128U
-#define CMN_PDIAG_PLL0_CTRL_M0		0x01A0U
-#define CMN_PDIAG_PLL0_CLK_SEL_M0	0x01A1U
-#define CMN_PDIAG_PLL0_CP_PADJ_M0	0x01A4U
-#define CMN_PDIAG_PLL0_CP_IADJ_M0	0x01A5U
-#define CMN_PDIAG_PLL0_FILT_PADJ_M0	0x01A6U
-#define CMN_PDIAG_PLL0_CTRL_M1		0x01B0U
-#define CMN_PDIAG_PLL0_CLK_SEL_M1	0x01B1U
-#define CMN_PDIAG_PLL0_CP_PADJ_M1	0x01B4U
-#define CMN_PDIAG_PLL0_CP_IADJ_M1	0x01B5U
-#define CMN_PDIAG_PLL0_FILT_PADJ_M1	0x01B6U
-#define CMN_PDIAG_PLL1_CTRL_M0		0x01C0U
-#define CMN_PDIAG_PLL1_CLK_SEL_M0	0x01C1U
-#define CMN_PDIAG_PLL1_CP_PADJ_M0	0x01C4U
-#define CMN_PDIAG_PLL1_CP_IADJ_M0	0x01C5U
-#define CMN_PDIAG_PLL1_FILT_PADJ_M0	0x01C6U
+
+#define CMN_PDIAG_PLLx_CTRL_Mx(x)	(0x01A0U + 16U * (x))
+#define CMN_PDIAG_PLLx_CLK_SEL_Mx(x)	(0x01A1U + 16U * (x))
+#define CMN_PDIAG_PLLx_ITRIM_Mx(x)      (0x01A3U + 16U * (x))
+#define CMN_PDIAG_PLLx_CP_PADJ_Mx(x)	(0x01A4U + 16U * (x))
+#define CMN_PDIAG_PLLx_CP_IADJ_Mx(x)	(0x01A5U + 16U * (x))
+#define CMN_PDIAG_PLLx_FILT_PADJ_Mx(x)	(0x01A6U + 16U * (x))
+
 #define CMN_DIAG_BIAS_OVRD1		0x01E1U
 
 /* PMA TX Lane registers */
@@ -216,7 +176,7 @@
 #define RX_DIAG_DFE_AMP_TUNE_2		0x01E2U
 #define RX_DIAG_DFE_AMP_TUNE_3		0x01E3U
 #define RX_DIAG_REE_DAC_CTRL		0x01E4U
-#define RX_DIAG_NQST_CTRL		0x01E5U
+#define RX_DIAG_NQST_CTRL		0x01E6U
 #define RX_DIAG_SIGDET_TUNE		0x01E8U
 #define RX_DIAG_PI_RATE			0x01F4U
 #define RX_DIAG_PI_CAP			0x01F5U
@@ -237,154 +197,315 @@
 #define PHY_PMA_CMN_CTRL2		0x0001U
 #define PHY_PMA_PLL_RAW_CTRL		0x0003U
 
-#define CDNS_TORRENT_OUTPUT_CLOCKS	3
+struct tp_reg_base {
+	void __iomem *base;
+	u8 reg_offset_shift;
+	u32 block_off;
+	struct device *dev;
+};
 
-static const char * const clk_names[] = {
+struct tp_reg_field {
+	void __iomem *reg_addr;
+	u16 mask;
+	u32 reg_off;
+	struct device *dev;
+};
+
+#define CDNS_TORRENT_OUTPUT_CLOCKS 3
+
+static const char *const tp_clk_names[] = {
 	[CDNS_TORRENT_REFCLK_DRIVER] = "refclk-driver",
 	[CDNS_TORRENT_DERIVED_REFCLK] = "refclk-der",
 	[CDNS_TORRENT_RECEIVED_REFCLK] = "refclk-rec",
 };
 
-static const struct reg_field phy_pll_cfg =
-				REG_FIELD(PHY_PLL_CFG, 0, 1);
-
-static const struct reg_field phy_pma_cmn_ctrl_1 =
-				REG_FIELD(PHY_PMA_CMN_CTRL1, 0, 0);
-
-static const struct reg_field phy_pma_cmn_ctrl_2 =
-				REG_FIELD(PHY_PMA_CMN_CTRL2, 0, 7);
-
-static const struct reg_field phy_pma_pll_raw_ctrl =
-				REG_FIELD(PHY_PMA_PLL_RAW_CTRL, 0, 1);
-
-static const struct reg_field phy_reset_ctrl =
-				REG_FIELD(PHY_RESET, 8, 8);
-
-static const struct reg_field phy_pcs_iso_link_ctrl_1 =
-				REG_FIELD(PHY_PCS_ISO_LINK_CTRL, 1, 1);
-
-static const struct reg_field phy_pipe_cmn_ctrl1_0 = REG_FIELD(PHY_PIPE_CMN_CTRL1, 0, 0);
-
-static const struct reg_field cmn_cdiag_refclk_ovrd_4 =
-				REG_FIELD(CMN_CDIAG_REFCLK_OVRD, 4, 4);
-
-#define REFCLK_OUT_NUM_CMN_CONFIG	4
-
-enum cdns_torrent_refclk_out_cmn {
+enum tp_refclk_out_cmn {
 	CMN_CDIAG_REFCLK_DRV0_CTRL_1,
 	CMN_CDIAG_REFCLK_DRV0_CTRL_4,
 	CMN_CDIAG_REFCLK_DRV0_CTRL_5,
 	CMN_CDIAG_REFCLK_DRV0_CTRL_6,
+	TP_REFCLK_OUT_NUM_CMN_CONFIG
 };
 
-static const struct reg_field refclk_out_cmn_cfg[] = {
-	[CMN_CDIAG_REFCLK_DRV0_CTRL_1]	= REG_FIELD(CMN_CDIAG_REFCLK_DRV0_CTRL, 1, 1),
-	[CMN_CDIAG_REFCLK_DRV0_CTRL_4]	= REG_FIELD(CMN_CDIAG_REFCLK_DRV0_CTRL, 4, 4),
-	[CMN_CDIAG_REFCLK_DRV0_CTRL_5]  = REG_FIELD(CMN_CDIAG_REFCLK_DRV0_CTRL, 5, 5),
-	[CMN_CDIAG_REFCLK_DRV0_CTRL_6]	= REG_FIELD(CMN_CDIAG_REFCLK_DRV0_CTRL, 6, 6),
+static const int tp_refclk_driver_parent_idx[] = {
+	CDNS_TORRENT_DERIVED_REFCLK, CDNS_TORRENT_RECEIVED_REFCLK
 };
 
-static const int refclk_driver_parent_index[] = {
-	CDNS_TORRENT_DERIVED_REFCLK,
-	CDNS_TORRENT_RECEIVED_REFCLK
+static const u32 tp_refclk_driver_mux_table[] = { 1, 0 };
+
+struct tp_refclk_driver {
+	struct clk_hw hw;
+	struct tp_reg_field fields[TP_REFCLK_OUT_NUM_CMN_CONFIG];
+	u8 parent_index;
+};
+
+#define tp_to_refclk_driver(_hw) \
+	container_of(_hw, struct tp_refclk_driver, hw)
+
+#define tp_from_derived_refclk(_hw) \
+	container_of(_hw, struct tp_phy, derived_refclk)
+
+#define tp_from_received_refclk(_hw) \
+	container_of(_hw, struct tp_phy, received_refclk)
+
+/* Revisions and revision masks */
+enum tp_revision {
+	REV_R100,
+	REV_R110,
+	REV_R120,
+	REV_R130,
+	REV_R140,
+	REV_R150,
+	REV_R200,
+	REV_R210,
+	REV_R220,
+};
+
+#define REV_MSK_R220		BIT(REV_R220)
+#define REV_MSK_R210		BIT(REV_R210)
+#define REV_MSK_R210P		(REV_MSK_R210 | REV_MSK_R220)
+#define REV_MSK_R200		BIT(REV_R200)
+#define REV_MSK_R200P		(REV_MSK_R200 | REV_MSK_R210P)
+#define REV_MSK_R150		BIT(REV_R150)
+#define REV_MSK_R150P		(REV_MSK_R150 | REV_MSK_R200P)
+#define REV_MSK_R140		BIT(REV_R140)
+#define REV_MSK_R140P		(REV_MSK_R140 | REV_MSK_R150P)
+#define REV_MSK_R130		BIT(REV_R130)
+#define REV_MSK_R130P		(REV_MSK_R130 | REV_MSK_R140P)
+#define REV_MSK_R120		BIT(REV_R120)
+#define REV_MSK_R120P		(REV_MSK_R120 | REV_MSK_R130P)
+#define REV_MSK_R110		BIT(REV_R110)
+#define REV_MSK_R110P		(REV_MSK_R110 | REV_MSK_R120P)
+#define REV_MSK_R100		BIT(REV_R100)
+#define REV_MSK_R100P		(REV_MSK_R100 | REV_MSK_R110P)
+
+/* Technology tags */
+#define TECH_TSMC_16		BIT(0)
+#define TECH_TSMC_16_0805	BIT(1)
+#define TECH_TSMC_12		BIT(2)
+#define TECH_TSMC_7		BIT(3)
+#define TECH_TSMC_5		BIT(4)
+#define TECH_TSMC_5A		BIT(5)
+#define TECH_TSMC_5_0806	BIT(6)
+#define TECH_TSMC_4		BIT(7)
+#define TECH_TSMC_3		BIT(8)
+#define TECH_SS_7		BIT(9)
+#define TECH_SS_5		BIT(10)
+#define TECH_IN_16		BIT(11)
+#define TECH_IN_I18A_0801	BIT(12)
+#define TECH_IN_I18A_0807	BIT(13)
+#define TECH_UMC_14		BIT(14)
+
+#define TECH_SS_ALL		(TECH_SS_7 | TECH_SS_5)
+
+#define TECH_TSMC_ALL		(TECH_TSMC_16 | TECH_TSMC_16_0805 | TECH_TSMC_12 | \
+				 TECH_TSMC_7 | TECH_TSMC_5 | TECH_TSMC_5A | \
+				 TECH_TSMC_5_0806 | TECH_TSMC_4 | TECH_TSMC_3)
+
+#define TECH_INTEL_ALL		(TECH_IN_16 | TECH_IN_I18A_0801 | TECH_IN_I18A_0807)
+
+#define TECH_UMC_ALL		(TECH_UMC_14)
+
+#define TECH_ALL		(TECH_SS_ALL | TECH_TSMC_ALL | TECH_INTEL_ALL | TECH_UMC_ALL)
+
+/* PHY standards */
+enum tp_std_type {
+	STD_TYPE_NONE,
+	STD_TYPE_PCIE,
+	STD_TYPE_USB_TXRX,
+	STD_TYPE_DP,
+	STD_TYPE_XAUI,
+	STD_TYPE_SGMII,
+	STD_TYPE_SATA,
+	STD_TYPE_USXGMII,
+};
+
+#define STD_FLAG_NONE		CDNS_TORRENT_MODE_NONE
+#define STD_FLAG_USB_G1		CDNS_TORRENT_MODE_USB_G1
+#define STD_FLAG_USB_IO_11V	CDNS_TORRENT_MODE_USB_IO_11V
+#define STD_FLAG_XAUI_LP	CDNS_TORRENT_MODE_XAUI_LP
+#define STD_FLAG_SATA_LP	CDNS_TORRENT_MODE_SATA_LP
+#define STD_FLAG_SGMIIP		CDNS_TORRENT_MODE_2500_BASEX
+#define STD_FLAG_QSGMII		CDNS_TORRENT_MODE_QSGMII
+#define STD_FLAG_PCIE_ML	0x0100
+#define STD_FLAG_S_SSC		0x0200 /* Same SSC */
+#define STD_FLAG_U_SSC		0x0400 /* No SSC for PCIe */
+
+#define STD_FLAG_FIND_CFG_MASK	(STD_FLAG_USB_G1 | STD_FLAG_XAUI_LP | STD_FLAG_SATA_LP | \
+				 STD_FLAG_SGMIIP | STD_FLAG_PCIE_ML)
+
+#define STD_FLAGS_FROM_ID(std_id)	((std_id) >> 4)
+#define STD_TYPE_FROM_ID(std_id)	((std_id) & 0x0F)
+#define STD_ID(std_type, std_flags)	((std_flags) << 4 | (std_type))
+
+enum tp_standard0 {
+	STD0_NONE = STD_ID(STD_TYPE_NONE, STD_FLAG_NONE),
+	/* PCIe Gen 1,2,3 Single Link */
+	STD0_PCIE_SL = STD_ID(STD_TYPE_PCIE, STD_FLAG_NONE),
+	/* PCIe Gen 1,2,3 Multiple Links */
+	STD0_PCIE_ML = STD_ID(STD_TYPE_PCIE, STD_FLAG_PCIE_ML),
+	/* USB 3.0 / 3.1 (Gen 1 Only) */
+	STD0_USB_G1 = STD_ID(STD_TYPE_USB_TXRX, STD_FLAG_USB_G1),
+	/* USB 3.0 / 3.1 */
+	STD0_USB = STD_ID(STD_TYPE_USB_TXRX, STD_FLAG_NONE),
+	/* Display Port / eDP */
+	STD0_DP = STD_ID(STD_TYPE_DP, STD_FLAG_NONE),
+	/* XAUI (1X Only) */
+	STD0_XAUI_LP = STD_ID(STD_TYPE_XAUI, STD_FLAG_XAUI_LP),
+	/* XAUI */
+	STD0_XAUI = STD_ID(STD_TYPE_XAUI, STD_FLAG_NONE),
+	/* SGMII / QSGMII */
+	STD0_SGMII_1G_5G = STD_ID(STD_TYPE_SGMII, STD_FLAG_NONE),
+	/* SGMII 2.5 Gbps */
+	STD0_SGMII_2P5G = STD_ID(STD_TYPE_SGMII, STD_FLAG_SGMIIP),
+	/* SATA (1.5 and 3.0 Only) */
+	STD0_SATA_LP = STD_ID(STD_TYPE_SATA, STD_FLAG_SATA_LP),
+	/* SATA */
+	STD0_SATA = STD_ID(STD_TYPE_SATA, STD_FLAG_NONE),
+	/* USXGMII */
+	STD0_USXGMII = STD_ID(STD_TYPE_USXGMII, STD_FLAG_NONE),
+};
+
+enum tp_standard1 {
+	STD1_NONE = STD_ID(STD_TYPE_NONE, STD_FLAG_NONE),
+	/* USB 3.0 / 3.1 */
+	STD1_USB = STD_ID(STD_TYPE_USB_TXRX, STD_FLAG_NONE),
+	/* USB 3.0 / 3.1 Same SSC */
+	STD1_USB_SS = STD_ID(STD_TYPE_USB_TXRX, STD_FLAG_S_SSC),
+	/* USB 3.0 / 3.1 Unique SSC */
+	STD1_USB_US = STD_ID(STD_TYPE_USB_TXRX, STD_FLAG_U_SSC),
+	/* Display Port / eDP */
+	STD1_DP = STD_ID(STD_TYPE_DP, STD_FLAG_NONE),
+	/* XAUI */
+	STD1_XAUI = STD_ID(STD_TYPE_XAUI, STD_FLAG_NONE),
+	/* XAUI Same SSC since sharing PLL0 */
+	STD1_XAUI_SS = STD_ID(STD_TYPE_XAUI, STD_FLAG_S_SSC),
+	/* SGMII / QSGMII */
+	STD1_SGMII_1G_5G = STD_ID(STD_TYPE_SGMII, STD_FLAG_NONE),
+	/* SGMII 2.5 Gbps */
+	STD1_SGMII_2P5G = STD_ID(STD_TYPE_SGMII, STD_FLAG_SGMIIP),
+	/* SGMII Same SSC */
+	STD1_SGMII_1G_5G_SS = STD_ID(STD_TYPE_SGMII, STD_FLAG_S_SSC),
+	/* SGMII Unique SSC */
+	STD1_SGMII_1G_5G_US = STD_ID(STD_TYPE_SGMII, STD_FLAG_U_SSC),
+	/* SATA */
+	STD1_SATA = STD_ID(STD_TYPE_SATA, STD_FLAG_NONE),
+	/* USXGMII */
+	STD1_USXGMII = STD_ID(STD_TYPE_USXGMII, STD_FLAG_NONE),
+};
+
+enum tp_pll_freq {
+	PLL_UNUSED,
+	PLL_DP,
+	PLL_6_00_GHZ,
+	PLL_6_25_GHZ,
+	PLL_8_00_GHZ,
+	PLL_10_00_GHZ,
+	PLL_10_31_GHZ,
 };
 
-static const u32 cdns_torrent_refclk_driver_mux_table[] = { 1, 0 };
-
-enum cdns_torrent_phy_type {
-	TYPE_NONE,
-	TYPE_DP,
-	TYPE_PCIE,
-	TYPE_SGMII,
-	TYPE_QSGMII,
-	TYPE_USB,
-	TYPE_USXGMII,
-	TYPE_PCIE_ML,
-	TYPE_XAUI,
+enum tp_pll_fb_div_mode {
+	PLL_FB_DIV_MODE_FBR,
+	PLL_FB_DIV_MODE_DR,
+	PLL_FB_DIV_MODE_D32,
 };
 
-enum cdns_torrent_ref_clk {
-	CLK_19_2_MHZ,
-	CLK_25_MHZ,
-	CLK_100_MHZ,
-	CLK_156_25_MHZ,
-	CLK_ANY,
+union tp_reg_cfg_key {
+	struct {
+		u16 std;
+		u16 rev;
+		u32 tech;
+	};
+	u64 key;
 };
 
-enum cdns_torrent_ssc_mode {
-	NO_SSC,
-	EXTERNAL_SSC,
-	INTERNAL_SSC,
-	ANY_SSC,
+struct tp_reg_cfg {
+	union tp_reg_cfg_key cfg;
+	u32 std_flags;
+	u16 val;
 };
 
-/* Unique key id for vals table entry
- * REFCLK0_RATE | REFCLK1_RATE | LINK0_TYPE | LINK1_TYPE | SSC_TYPE
- */
-#define REFCLK0_SHIFT	15
-#define REFCLK0_MASK	GENMASK(18, 15)
-#define REFCLK1_SHIFT	11
-#define REFCLK1_MASK	GENMASK(14, 11)
-#define LINK0_SHIFT	7
-#define LINK0_MASK	GENMASK(10, 7)
-#define LINK1_SHIFT	3
-#define LINK1_MASK	GENMASK(6, 3)
-#define SSC_SHIFT	0
-#define SSC_MASK	GENMASK(2, 0)
-
-#define CDNS_TORRENT_KEY(refclk0, refclk1, link0, link1, ssc) \
-			((((refclk0) << REFCLK0_SHIFT) & REFCLK0_MASK) | \
-			(((refclk1) << REFCLK1_SHIFT) & REFCLK1_MASK) | \
-			(((link0) << LINK0_SHIFT) & LINK0_MASK) | \
-			(((link1) << LINK1_SHIFT) & LINK1_MASK) | \
-			(((ssc) << SSC_SHIFT) & SSC_MASK))
-
-#define CDNS_TORRENT_KEY_ANYCLK(link0, link1) \
-			CDNS_TORRENT_KEY(CLK_ANY, CLK_ANY, \
-					 (link0), (link1), ANY_SSC)
-
-struct cdns_torrent_inst {
+struct tp_link {
 	struct phy *phy;
-	u32 mlane;
-	enum cdns_torrent_phy_type phy_type;
-	u32 num_lanes;
 	struct reset_control *lnk_rst;
-	enum cdns_torrent_ssc_mode ssc_mode;
+	enum tp_std_type type;
+	u32 flags;
+	u8 std_idx;
+	u8 mlane;
+	u8 num_lanes;
+	u8 max_lanes;
+	u16 max_bit_rate;
 };
 
-struct cdns_torrent_phy {
-	void __iomem *base;	/* DPTX registers base */
+struct tp_standard {
+	enum tp_std_type type : 16;
+	u8 ssc_mode; /* CDNS_SERDES_NO_SSC, ... */
+	u32 flags; /* Common flags shared between all links using this standard */
+};
+
+#define MAX_NUM_STANDARDS 2
+
+enum tp_pll_id { PLL0_MODE0, PLL0_MODE1, PLL1_MODE0, TP_NB_PLLS };
+
+struct tp_pll_data {
+	u32 freq_khz;
+	u32 ref_clk_khz;
+	bool ssc;
+	bool fractional_mode;
+	enum tp_pll_fb_div_mode fb_div_mode : 8;
+};
+
+struct tp_init_data {
+	u8 block_offset_shift;
+	u8 reg_offset_shift;
+	u8 mask_available_lanes;
+	bool usxgmii_refclk_rcv_out_en : 1;
+	bool rxda_des_clk_2x_en : 1;
+};
+
+struct tp_phy {
+	void __iomem *base; /* DPTX registers base */
 	void __iomem *sd_base; /* SD0801 registers base */
-	u32 max_bit_rate; /* Maximum link bit rate to use (in Mbps) */
-	u32 dp_pll;
-	u32 protocol_bitmask;
+
+	/* Protect `nb_phy_on` and concurrent register writes */
+	struct mutex lock;
 	struct reset_control *phy_rst;
 	struct reset_control *apb_rst;
 	struct device *dev;
 	struct clk *clk;
 	struct clk *clk1;
-	enum cdns_torrent_ref_clk ref_clk_rate;
-	enum cdns_torrent_ref_clk ref_clk1_rate;
-	struct cdns_torrent_inst phys[MAX_NUM_LANES];
-	int nsubnodes;
-	int already_configured;
-	const struct cdns_torrent_data *init_data;
-	struct regmap *regmap_common_cdb;
-	struct regmap *regmap_phy_pcs_common_cdb;
-	struct regmap *regmap_phy_pma_common_cdb;
-	struct regmap *regmap_tx_lane_cdb[MAX_NUM_LANES];
-	struct regmap *regmap_rx_lane_cdb[MAX_NUM_LANES];
-	struct regmap *regmap_phy_pcs_lane_cdb[MAX_NUM_LANES];
-	struct regmap *regmap_dptx_phy_reg;
-	struct regmap_field *phy_pll_cfg;
-	struct regmap_field *phy_pipe_cmn_ctrl1_0;
-	struct regmap_field *cmn_cdiag_refclk_ovrd_4;
-	struct regmap_field *phy_pma_cmn_ctrl_1;
-	struct regmap_field *phy_pma_cmn_ctrl_2;
-	struct regmap_field *phy_pma_pll_raw_ctrl;
-	struct regmap_field *phy_reset_ctrl;
-	struct regmap_field *phy_pcs_iso_link_ctrl_1[MAX_NUM_LANES];
+	u32 ref_clk_khz;
+	u32 ref_clk1_khz;
+
+	u32 tech_tag;
+	enum tp_revision rev;
+
+	bool already_configured;
+	u8 mask_used_lanes;
+	u8 nb_phy_on;
+	u8 nb_links;
+
+	struct tp_standard standards[MAX_NUM_STANDARDS];
+	struct tp_pll_data plls[TP_NB_PLLS];
+	struct tp_link links[MAX_NUM_LANES];
+
+	const struct tp_link_cfg *link_cfg;
+	const struct tp_init_data *init_data;
+
+	struct tp_reg_base reg_common_cdb;
+	struct tp_reg_base reg_phy_pcs_common_cdb;
+	struct tp_reg_base reg_phy_pma_common_cdb;
+	struct tp_reg_base reg_tx_lane_cdb[MAX_NUM_LANES];
+	struct tp_reg_base reg_rx_lane_cdb[MAX_NUM_LANES];
+	struct tp_reg_base reg_phy_pcs_lane_cdb[MAX_NUM_LANES];
+	struct tp_reg_field phy_pll_cfg;
+	struct tp_reg_field phy_pipe_cmn_ctrl1_0;
+	struct tp_reg_field cmn_cdiag_refclk_ovrd_4;
+
 	struct clk_hw_onecell_data *clk_hw_data;
+	struct tp_refclk_driver refclk_driver;
+	struct clk_hw derived_refclk;
+	struct clk_hw received_refclk;
 };
 
 enum phy_powerstate {
@@ -394,250 +515,468 @@ enum phy_powerstate {
 	POWERSTATE_A3 = 3,
 };
 
-struct cdns_torrent_refclk_driver {
-	struct clk_hw		hw;
-	struct regmap_field	*cmn_fields[REFCLK_OUT_NUM_CMN_CONFIG];
-	struct clk_init_data	clk_data;
-	u8 parent_index;
+#define REG_COMPUTED 0xFFFF
+
+struct tp_link_cfg {
+	enum tp_standard0 std0;
+	enum tp_standard1 std1;
+	enum tp_pll_freq pll_freq[TP_NB_PLLS];
+	u16 phy_pll_cfg;
+	u16 pll_clk_sel[TP_NB_PLLS];
+	u16 xcvr_diag_plldrc_ctrl[MAX_NUM_STANDARDS];
+	u16 xcvr_diag_hsclk_sel[MAX_NUM_STANDARDS];
+	u16 xcvr_diag_hsclk_div[MAX_NUM_STANDARDS];
 };
 
-#define to_cdns_torrent_refclk_driver(_hw)	\
-			container_of(_hw, struct cdns_torrent_refclk_driver, hw)
-
-struct cdns_torrent_derived_refclk {
-	struct clk_hw		hw;
-	struct regmap_field	*phy_pipe_cmn_ctrl1_0;
-	struct regmap_field	*cmn_cdiag_refclk_ovrd_4;
-	struct clk_init_data	clk_data;
-};
-
-#define to_cdns_torrent_derived_refclk(_hw)	\
-			container_of(_hw, struct cdns_torrent_derived_refclk, hw)
-
-struct cdns_torrent_received_refclk {
-	struct clk_hw		hw;
-	struct regmap_field	*phy_pipe_cmn_ctrl1_0;
-	struct regmap_field	*cmn_cdiag_refclk_ovrd_4;
-	struct clk_init_data	clk_data;
-};
-
-#define to_cdns_torrent_received_refclk(_hw)	\
-			container_of(_hw, struct cdns_torrent_received_refclk, hw)
-
-struct cdns_reg_pairs {
-	u32 val;
-	u32 off;
-};
-
-struct cdns_torrent_vals {
-	const struct cdns_reg_pairs *reg_pairs;
-	u32 num_regs;
-};
-
-struct cdns_torrent_vals_entry {
-	u32 key;
-	const struct cdns_torrent_vals *vals;
-};
-
-struct cdns_torrent_vals_table {
-	const struct cdns_torrent_vals_entry *entries;
-	u32 num_entries;
-};
-
-struct cdns_torrent_data {
-	u8 block_offset_shift;
-	u8 reg_offset_shift;
-	struct cdns_torrent_vals_table link_cmn_vals_tbl;
-	struct cdns_torrent_vals_table xcvr_diag_vals_tbl;
-	struct cdns_torrent_vals_table pcs_cmn_vals_tbl;
-	struct cdns_torrent_vals_table phy_pma_cmn_vals_tbl;
-	struct cdns_torrent_vals_table cmn_vals_tbl;
-	struct cdns_torrent_vals_table tx_ln_vals_tbl;
-	struct cdns_torrent_vals_table rx_ln_vals_tbl;
-};
-
-struct cdns_regmap_cdb_context {
-	struct device *dev;
-	void __iomem *base;
-	u8 reg_offset_shift;
+static const struct tp_link_cfg tp_link_cfgs[] = {
+	{
+		/* PLL 0 M0: PCIe, PLL 0 M1: PCIe, PLL 1: None */
+		.std0 = STD0_PCIE_SL,	.std1 = STD1_NONE,
+		.pll_freq = { PLL_10_00_GHZ, PLL_8_00_GHZ, PLL_8_00_GHZ },
+		.phy_pll_cfg = 0x0001,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x0012 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0000 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: PCIe (No SSC), PLL 0 M1: PCIe (No SSC), PLL 1: USB */
+		.std0 = STD0_PCIE_SL,	.std1 = STD1_USB_US,
+		.pll_freq = { PLL_10_00_GHZ, PLL_8_00_GHZ, PLL_10_00_GHZ },
+		.phy_pll_cfg = 0x0003,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x8600 },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x00C9 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0011 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: PCIe, PLL 0 M1: PCIe, PLL 1: DP */
+		.std0 = STD0_PCIE_SL,	.std1 = STD1_DP,
+		.pll_freq = { PLL_10_00_GHZ, PLL_8_00_GHZ, PLL_DP },
+		.phy_pll_cfg = 0x0003,
+		.pll_clk_sel = { 0x0601, 0x0400, REG_COMPUTED },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x0019 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0001 },
+		.xcvr_diag_hsclk_div = { 0x0001, REG_COMPUTED },
+	},
+	{
+		/* PLL 0 M0: PCIe, PLL 0 M1: PCIe, PLL 1: XAUI */
+		.std0 = STD0_PCIE_SL,	.std1 = STD1_XAUI,
+		.pll_freq = { PLL_10_00_GHZ, PLL_8_00_GHZ, PLL_6_25_GHZ },
+		.phy_pll_cfg = 0x0003,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0600 },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x0089 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0011 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: PCIe (No SSC), PLL 0 M1: PCIe (No SSC), PLL 1: SGMII */
+		.std0 = STD0_PCIE_SL,	.std1 = STD1_SGMII_1G_5G_US,
+		.pll_freq = { PLL_10_00_GHZ, PLL_8_00_GHZ, PLL_10_00_GHZ },
+		.phy_pll_cfg = 0x0003,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0601 },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x091B },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0101 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0003 },
+	},
+	{
+		/* PLL 0 M0: PCIe, PLL 0 M1: PCIe, PLL 1: SGMII 2.5 */
+		.std0 = STD0_PCIE_SL,	.std1 = STD1_SGMII_2P5G,
+		.pll_freq = { PLL_10_00_GHZ, PLL_8_00_GHZ, PLL_6_25_GHZ },
+		.phy_pll_cfg = 0x0003,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0601 },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x0092 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0010 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: PCIe, PLL 0 M1: PCIe, PLL 1: USXGMII */
+		.std0 = STD0_PCIE_SL,	.std1 = STD1_USXGMII,
+		.pll_freq = { PLL_10_00_GHZ, PLL_8_00_GHZ, PLL_10_31_GHZ },
+		.phy_pll_cfg = 0x0003,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x0089 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0011 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: PCIe, PLL 0 M1: PCIe, PLL 1: SATA */
+		.std0 = STD0_PCIE_SL,	.std1 = STD1_SATA,
+		.pll_freq = { PLL_10_00_GHZ, PLL_8_00_GHZ, PLL_6_00_GHZ },
+		.phy_pll_cfg = 0x0003,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0600 },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x089A },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0111 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0013 },
+	},
+	{
+		/* PLL 0 M0: PCIe, PLL 0 M1: Unused, PLL 1: PCIe */
+		.std0 = STD0_PCIE_ML,	.std1 = STD1_NONE,
+		.pll_freq = { PLL_10_00_GHZ, PLL_UNUSED, PLL_8_00_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0812, 0x0012 },
+		.xcvr_diag_hsclk_sel = { 0x0100, 0x0000 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: PCIe / USB, PLL 0 M1: Unused, PLL 1: PCIe */
+		.std0 = STD0_PCIE_ML,	.std1 = STD1_USB_SS,
+		.pll_freq = { PLL_10_00_GHZ, PLL_UNUSED, PLL_8_00_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x8600, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0812, 0x0041 },
+		.xcvr_diag_hsclk_sel = { 0x0100, 0x0000 },
+		.xcvr_diag_hsclk_div = { 0x0013, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: PCIe / SGMII, PLL 0 M1: Unused, PLL 1: PCIe */
+		.std0 = STD0_PCIE_ML,	.std1 = STD1_SGMII_1G_5G_SS,
+		.pll_freq = { PLL_10_00_GHZ, PLL_UNUSED, PLL_8_00_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0812, 0x0113 },
+		.xcvr_diag_hsclk_sel = { 0x0100, 0x0000 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0003 },
+	},
+	{
+		/* PLL 0 M0: USB, PLL 0 M1: Unused, PLL 1: Unused */
+		.std0 = STD0_USB_G1,	.std1 = STD1_NONE,
+		.pll_freq = { PLL_10_00_GHZ, PLL_UNUSED, PLL_8_00_GHZ },
+		.phy_pll_cfg = 0x0000,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0011, 0x0012 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0000 },
+		.xcvr_diag_hsclk_div = { 0x0000, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: USB, PLL 0 M1: Unused, PLL 1: Unused */
+		.std0 = STD0_USB,	.std1 = STD1_NONE,
+		.pll_freq = { PLL_10_00_GHZ, PLL_UNUSED, PLL_8_00_GHZ },
+		.phy_pll_cfg = 0x0000,
+		.pll_clk_sel = { 0x8600, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0041, 0x0012 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0000 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: USB, PLL 0 M1: Unused, PLL 1: DP */
+		.std0 = STD0_USB,	.std1 = STD1_DP,
+		.pll_freq = { PLL_10_00_GHZ, PLL_UNUSED, PLL_DP },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x8600, 0x0400, REG_COMPUTED },
+		.xcvr_diag_plldrc_ctrl = { 0x0041, 0x0019 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0001 },
+		.xcvr_diag_hsclk_div = { 0x0001, REG_COMPUTED },
+	},
+	{
+		/* PLL 0 M0: USB, PLL 0 M1: Unused, PLL 1: XAUI */
+		.std0 = STD0_USB,	.std1 = STD1_XAUI,
+		.pll_freq = { PLL_10_00_GHZ, PLL_UNUSED, PLL_6_25_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x8600, 0x0400, 0x0600 },
+		.xcvr_diag_plldrc_ctrl = { 0x0041, 0x0089 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0011 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: USB, PLL 0 M1: Unused, PLL 1: SATA */
+		.std0 = STD0_USB,	.std1 = STD1_SATA,
+		.pll_freq = { PLL_10_00_GHZ, PLL_UNUSED, PLL_6_00_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x8600, 0x0400, 0x0600 },
+		.xcvr_diag_plldrc_ctrl = { 0x0041, 0x089A },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0111 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0013 },
+	},
+	{
+		/* PLL 0 M0: USB, PLL 0 M1: Unused, PLL 1: USXGMII */
+		.std0 = STD0_USB,	.std1 = STD1_USXGMII,
+		.pll_freq = { PLL_10_00_GHZ, PLL_UNUSED, PLL_10_31_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x8600, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0041, 0x0089 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0011 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: DP, PLL 0 M1: Unused, PLL 1: Unused */
+		.std0 = STD0_DP,	.std1 = STD1_NONE,
+		.pll_freq = { PLL_DP, PLL_UNUSED, PLL_8_00_GHZ },
+		.phy_pll_cfg = 0x0000,
+		.pll_clk_sel = { REG_COMPUTED, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0011, 0x0012 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0000 },
+		.xcvr_diag_hsclk_div = { REG_COMPUTED, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: DP, PLL 0 M1: Unused, PLL 1: DP */
+		.std0 = STD0_DP,	.std1 = STD1_DP,
+		.pll_freq = { PLL_DP, PLL_UNUSED, PLL_DP },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { REG_COMPUTED, 0x0400, REG_COMPUTED },
+		.xcvr_diag_plldrc_ctrl = { 0x0011, 0x0019 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0001 },
+		.xcvr_diag_hsclk_div = { REG_COMPUTED, REG_COMPUTED },
+	},
+	{
+		/* PLL 0 M0: DP, PLL 0 M1: Unused, PLL 1: XAUI */
+		.std0 = STD0_DP,	.std1 = STD1_XAUI,
+		.pll_freq = { PLL_DP, PLL_UNUSED, PLL_6_25_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { REG_COMPUTED, 0x0400, 0x0600 },
+		.xcvr_diag_plldrc_ctrl = { 0x0011, 0x0089 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0011 },
+		.xcvr_diag_hsclk_div = { REG_COMPUTED, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: DP, PLL 0 M1: Unused, PLL 1: USXGMII */
+		.std0 = STD0_DP,	.std1 = STD1_USXGMII,
+		.pll_freq = { PLL_DP, PLL_UNUSED, PLL_10_31_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { REG_COMPUTED, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0011, 0x0089 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0011 },
+		.xcvr_diag_hsclk_div = { REG_COMPUTED, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: XAUI, PLL 0 M1: Unused, PLL 1: Unused */
+		.std0 = STD0_XAUI_LP,	.std1 = STD1_NONE,
+		.pll_freq = { PLL_6_25_GHZ, PLL_UNUSED, PLL_8_00_GHZ },
+		.phy_pll_cfg = 0x0000,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0001, 0x0012 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0000 },
+		.xcvr_diag_hsclk_div = { 0x0000, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: XAUI, PLL 0 M1: Unused, PLL 1: Unused */
+		.std0 = STD0_XAUI,	.std1 = STD1_NONE,
+		.pll_freq = { PLL_6_25_GHZ, PLL_UNUSED, PLL_8_00_GHZ },
+		.phy_pll_cfg = 0x0000,
+		.pll_clk_sel = { 0x0600, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0001, 0x0012 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0000 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: XAUI / XAUI, PLL 0 M1: Unused, PLL 1: Unused */
+		.std0 = STD0_XAUI,	.std1 = STD1_XAUI_SS,
+		.pll_freq = { PLL_6_25_GHZ, PLL_UNUSED, PLL_8_00_GHZ },
+		.phy_pll_cfg = 0x0000,
+		.pll_clk_sel = { 0x0600, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0001, 0x0001 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0000 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: SGMII, PLL 0 M1: Unused, PLL 1: SGMII 2.5 */
+		.std0 = STD0_SGMII_1G_5G,	.std1 = STD1_SGMII_2P5G,
+		.pll_freq = { PLL_10_00_GHZ, PLL_UNUSED, PLL_6_25_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0601 },
+		.xcvr_diag_plldrc_ctrl = { 0x0113, 0x0092 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0010 },
+		.xcvr_diag_hsclk_div = { 0x0003, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: SGMII, PLL 0 M1: Unused, PLL 1: Unused */
+		.std0 = STD0_SGMII_1G_5G,	.std1 = STD1_NONE,
+		.pll_freq = { PLL_10_00_GHZ, PLL_UNUSED, PLL_8_00_GHZ },
+		.phy_pll_cfg = 0x0000,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0113, 0x0012 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0000 },
+		.xcvr_diag_hsclk_div = { 0x0003, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: SGMII 2.5, PLL 0 M1: Unused, PLL 1: Unused */
+		.std0 = STD0_SGMII_2P5G,	.std1 = STD1_NONE,
+		.pll_freq = { PLL_6_25_GHZ, PLL_UNUSED, PLL_8_00_GHZ },
+		.phy_pll_cfg = 0x0000,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x0012 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0000 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: SGMII, PLL 0 M1: Unused, PLL 1: DP */
+		.std0 = STD0_SGMII_1G_5G,	.std1 = STD1_DP,
+		.pll_freq = { PLL_10_00_GHZ, PLL_UNUSED, PLL_DP },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x0601, 0x0400, REG_COMPUTED },
+		.xcvr_diag_plldrc_ctrl = { 0x0113, 0x0019 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0001 },
+		.xcvr_diag_hsclk_div = { 0x0003, REG_COMPUTED },
+	},
+	{
+		/* PLL 0 M0: SGMII 2.5, PLL 0 M1: Unused, PLL 1: DP */
+		.std0 = STD0_SGMII_2P5G,	.std1 = STD1_DP,
+		.pll_freq = { PLL_6_25_GHZ, PLL_UNUSED, PLL_DP },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x0601, 0x0400, REG_COMPUTED },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x0019 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0001 },
+		.xcvr_diag_hsclk_div = { 0x0001, REG_COMPUTED },
+	},
+	{
+		/* PLL 0 M0: SGMII, PLL 0 M1: Unused, PLL 1: XAUI */
+		.std0 = STD0_SGMII_1G_5G,	.std1 = STD1_XAUI,
+		.pll_freq = { PLL_10_00_GHZ, PLL_UNUSED, PLL_6_25_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0600 },
+		.xcvr_diag_plldrc_ctrl = { 0x0113, 0x0089 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0011 },
+		.xcvr_diag_hsclk_div = { 0x0003, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: SGMII 2.5, PLL 0 M1: Unused, PLL 1: XAUI */
+		.std0 = STD0_SGMII_2P5G,	.std1 = STD1_XAUI,
+		.pll_freq = { PLL_6_25_GHZ, PLL_UNUSED, PLL_8_00_GHZ },
+		.phy_pll_cfg = 0x0000,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x0001 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0000 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: SGMII, PLL 0 M1: Unused, PLL 1: USB */
+		.std0 = STD0_SGMII_1G_5G,	.std1 = STD1_USB,
+		.pll_freq = { PLL_10_00_GHZ, PLL_UNUSED, PLL_10_00_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x8600 },
+		.xcvr_diag_plldrc_ctrl = { 0x0113, 0x00C9 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0011 },
+		.xcvr_diag_hsclk_div = { 0x0003, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: SGMII 2.5, PLL 0 M1: Unused, PLL 1: USB */
+		.std0 = STD0_SGMII_2P5G,	.std1 = STD1_USB,
+		.pll_freq = { PLL_6_25_GHZ, PLL_UNUSED, PLL_10_00_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x8600 },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x00C9 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0011 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: SGMII, PLL 0 M1: Unused, PLL 1: SATA */
+		.std0 = STD0_SGMII_1G_5G,	.std1 = STD1_SATA,
+		.pll_freq = { PLL_10_00_GHZ, PLL_UNUSED, PLL_6_00_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0600 },
+		.xcvr_diag_plldrc_ctrl = { 0x0113, 0x089A },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0111 },
+		.xcvr_diag_hsclk_div = { 0x0003, 0x0013 },
+	},
+	{
+		/* PLL 0 M0: SGMII 2.5, PLL 0 M1: Unused, PLL 1: SATA */
+		.std0 = STD0_SGMII_2P5G,	.std1 = STD1_SATA,
+		.pll_freq = { PLL_6_25_GHZ, PLL_UNUSED, PLL_6_00_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0600 },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x089A },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0111 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0013 },
+	},
+	{
+		/* PLL 0 M0: SGMII, PLL 0 M1: Unused, PLL 1: USXGMII */
+		.std0 = STD0_SGMII_1G_5G,	.std1 = STD1_USXGMII,
+		.pll_freq = { PLL_10_00_GHZ, PLL_UNUSED, PLL_10_31_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0113, 0x0089 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0011 },
+		.xcvr_diag_hsclk_div = { 0x0003, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: SGMII 2.5, PLL 0 M1: Unused, PLL 1: USXGMII */
+		.std0 = STD0_SGMII_2P5G,	.std1 = STD1_USXGMII,
+		.pll_freq = { PLL_6_25_GHZ, PLL_UNUSED, PLL_10_31_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x0089 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0011 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: SATA, PLL 0 M1: Unused, PLL 1: Unused */
+		.std0 = STD0_SATA_LP,	.std1 = STD1_NONE,
+		.pll_freq = { PLL_6_00_GHZ, PLL_UNUSED, PLL_8_00_GHZ },
+		.phy_pll_cfg = 0x0000,
+		.pll_clk_sel = { 0x0601, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x0012 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0000 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: SATA, PLL 0 M1: Unused, PLL 1: Unused */
+		.std0 = STD0_SATA,	.std1 = STD1_NONE,
+		.pll_freq = { PLL_6_00_GHZ, PLL_UNUSED, PLL_8_00_GHZ },
+		.phy_pll_cfg = 0x0000,
+		.pll_clk_sel = { 0x0600, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x0012 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0000 },
+		.xcvr_diag_hsclk_div = { 0x0013, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: SATA, PLL 0 M1: Unused, PLL 1: DP */
+		.std0 = STD0_SATA,	.std1 = STD1_DP,
+		.pll_freq = { PLL_6_00_GHZ, PLL_UNUSED, PLL_DP },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x0600, 0x0400, REG_COMPUTED },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x0019 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0001 },
+		.xcvr_diag_hsclk_div = { 0x0013, REG_COMPUTED },
+	},
+	{
+		/* PLL 0 M0: SATA, PLL 0 M1: Unused, PLL 1: XAUI */
+		.std0 = STD0_SATA,	.std1 = STD1_XAUI,
+		.pll_freq = { PLL_6_00_GHZ, PLL_UNUSED, PLL_6_25_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x0600, 0x0400, 0x0600 },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x0089 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0011 },
+		.xcvr_diag_hsclk_div = { 0x0013, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: SATA, PLL 0 M1: Unused, PLL 1: USXGMII */
+		.std0 = STD0_SATA,	.std1 = STD1_USXGMII,
+		.pll_freq = { PLL_6_00_GHZ, PLL_UNUSED, PLL_10_31_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x0600, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0012, 0x0089 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0011 },
+		.xcvr_diag_hsclk_div = { 0x0013, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: USXGMII, PLL 0 M1: Unused, PLL 1: Unused */
+		.std0 = STD0_USXGMII,	.std1 = STD1_NONE,
+		.pll_freq = { PLL_10_31_GHZ, PLL_UNUSED, PLL_8_00_GHZ },
+		.phy_pll_cfg = 0x0000,
+		.pll_clk_sel = { 0x0400, 0x0400, 0x0400 },
+		.xcvr_diag_plldrc_ctrl = { 0x0001, 0x0012 },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0000 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0001 },
+	},
+	{
+		/* PLL 0 M0: USXGMII, PLL 0 M1: Unused, PLL 1: SGMII */
+		.std0 = STD0_USXGMII,	.std1 = STD1_SGMII_1G_5G,
+		.pll_freq = { PLL_10_31_GHZ, PLL_UNUSED, PLL_10_00_GHZ },
+		.phy_pll_cfg = 0x0002,
+		.pll_clk_sel = { 0x0400, 0x0400, 0x0601 },
+		.xcvr_diag_plldrc_ctrl = { 0x0001, 0x0A9B },
+		.xcvr_diag_hsclk_sel = { 0x0000, 0x0111 },
+		.xcvr_diag_hsclk_div = { 0x0001, 0x0103 },
+	},
 };
 
-static const struct cdns_torrent_vals *cdns_torrent_get_tbl_vals(const struct cdns_torrent_vals_table *tbl,
-								 enum cdns_torrent_ref_clk refclk0,
-								 enum cdns_torrent_ref_clk refclk1,
-								 enum cdns_torrent_phy_type link0,
-								 enum cdns_torrent_phy_type link1,
-								 enum cdns_torrent_ssc_mode ssc)
-{
-	int i;
-	u32 key = CDNS_TORRENT_KEY(refclk0, refclk1, link0, link1, ssc);
-
-	for (i = 0; i < tbl->num_entries; i++) {
-		if (tbl->entries[i].key == key)
-			return tbl->entries[i].vals;
-	}
-
-	return NULL;
-}
-
-static int cdns_regmap_write(void *context, unsigned int reg, unsigned int val)
-{
-	struct cdns_regmap_cdb_context *ctx = context;
-	u32 offset = reg << ctx->reg_offset_shift;
-
-	writew(val, ctx->base + offset);
-
-	return 0;
-}
-
-static int cdns_regmap_read(void *context, unsigned int reg, unsigned int *val)
-{
-	struct cdns_regmap_cdb_context *ctx = context;
-	u32 offset = reg << ctx->reg_offset_shift;
-
-	*val = readw(ctx->base + offset);
-	return 0;
-}
-
-static int cdns_regmap_dptx_write(void *context, unsigned int reg,
-				  unsigned int val)
-{
-	struct cdns_regmap_cdb_context *ctx = context;
-	u32 offset = reg;
-
-	writel(val, ctx->base + offset);
-
-	return 0;
-}
-
-static int cdns_regmap_dptx_read(void *context, unsigned int reg,
-				 unsigned int *val)
-{
-	struct cdns_regmap_cdb_context *ctx = context;
-	u32 offset = reg;
-
-	*val = readl(ctx->base + offset);
-	return 0;
-}
-
-#define TORRENT_TX_LANE_CDB_REGMAP_CONF(n) \
-{ \
-	.name = "torrent_tx_lane" n "_cdb", \
-	.reg_stride = 1, \
-	.fast_io = true, \
-	.reg_write = cdns_regmap_write, \
-	.reg_read = cdns_regmap_read, \
-}
-
-#define TORRENT_RX_LANE_CDB_REGMAP_CONF(n) \
-{ \
-	.name = "torrent_rx_lane" n "_cdb", \
-	.reg_stride = 1, \
-	.fast_io = true, \
-	.reg_write = cdns_regmap_write, \
-	.reg_read = cdns_regmap_read, \
-}
-
-static const struct regmap_config cdns_torrent_tx_lane_cdb_config[] = {
-	TORRENT_TX_LANE_CDB_REGMAP_CONF("0"),
-	TORRENT_TX_LANE_CDB_REGMAP_CONF("1"),
-	TORRENT_TX_LANE_CDB_REGMAP_CONF("2"),
-	TORRENT_TX_LANE_CDB_REGMAP_CONF("3"),
-};
-
-static const struct regmap_config cdns_torrent_rx_lane_cdb_config[] = {
-	TORRENT_RX_LANE_CDB_REGMAP_CONF("0"),
-	TORRENT_RX_LANE_CDB_REGMAP_CONF("1"),
-	TORRENT_RX_LANE_CDB_REGMAP_CONF("2"),
-	TORRENT_RX_LANE_CDB_REGMAP_CONF("3"),
-};
-
-static const struct regmap_config cdns_torrent_common_cdb_config = {
-	.name = "torrent_common_cdb",
-	.reg_stride = 1,
-	.fast_io = true,
-	.reg_write = cdns_regmap_write,
-	.reg_read = cdns_regmap_read,
-};
-
-#define TORRENT_PHY_PCS_LANE_CDB_REGMAP_CONF(n) \
-{ \
-	.name = "torrent_phy_pcs_lane" n "_cdb", \
-	.reg_stride = 1, \
-	.fast_io = true, \
-	.reg_write = cdns_regmap_write, \
-	.reg_read = cdns_regmap_read, \
-}
-
-static const struct regmap_config cdns_torrent_phy_pcs_lane_cdb_config[] = {
-	TORRENT_PHY_PCS_LANE_CDB_REGMAP_CONF("0"),
-	TORRENT_PHY_PCS_LANE_CDB_REGMAP_CONF("1"),
-	TORRENT_PHY_PCS_LANE_CDB_REGMAP_CONF("2"),
-	TORRENT_PHY_PCS_LANE_CDB_REGMAP_CONF("3"),
-};
-
-static const struct regmap_config cdns_torrent_phy_pcs_cmn_cdb_config = {
-	.name = "torrent_phy_pcs_cmn_cdb",
-	.reg_stride = 1,
-	.fast_io = true,
-	.reg_write = cdns_regmap_write,
-	.reg_read = cdns_regmap_read,
-};
-
-static const struct regmap_config cdns_torrent_phy_pma_cmn_cdb_config = {
-	.name = "torrent_phy_pma_cmn_cdb",
-	.reg_stride = 1,
-	.fast_io = true,
-	.reg_write = cdns_regmap_write,
-	.reg_read = cdns_regmap_read,
-};
-
-static const struct regmap_config cdns_torrent_dptx_phy_config = {
-	.name = "torrent_dptx_phy",
-	.reg_stride = 1,
-	.fast_io = true,
-	.reg_write = cdns_regmap_dptx_write,
-	.reg_read = cdns_regmap_dptx_read,
-};
-
-/* PHY mmr access functions */
-
-static void cdns_torrent_phy_write(struct regmap *regmap, u32 offset, u32 val)
-{
-	regmap_write(regmap, offset, val);
-}
-
-static u32 cdns_torrent_phy_read(struct regmap *regmap, u32 offset)
-{
-	unsigned int val;
-
-	regmap_read(regmap, offset, &val);
-	return val;
-}
-
-/* DPTX mmr access functions */
-
-static void cdns_torrent_dp_write(struct regmap *regmap, u32 offset, u32 val)
-{
-	regmap_write(regmap, offset, val);
-}
-
-static u32 cdns_torrent_dp_read(struct regmap *regmap, u32 offset)
-{
-	u32 val;
-
-	regmap_read(regmap, offset, &val);
-	return val;
-}
-
 /*
  * Structure used to store values of PHY registers for voltage-related
  * coefficients, for particular voltage swing and pre-emphasis level. Values
  * are shared across all physical lanes.
  */
 struct coefficients {
-	/* Value of DRV_DIAG_TX_DRV register to use */
-	u16 diag_tx_drv;
 	/* Value of TX_TXCC_MGNFS_MULT_000 register to use */
 	u16 mgnfs_mult;
 	/* Value of TX_TXCC_CPOST_MULT_00 register to use */
@@ -650,1225 +989,3059 @@ struct coefficients {
  */
 static const struct coefficients vltg_coeff[4][4] = {
 	/* voltage swing 0, pre-emphasis 0->3 */
-	{	{.diag_tx_drv = 0x0003, .mgnfs_mult = 0x002A,
-		 .cpost_mult = 0x0000},
-		{.diag_tx_drv = 0x0003, .mgnfs_mult = 0x001F,
-		 .cpost_mult = 0x0014},
-		{.diag_tx_drv = 0x0003, .mgnfs_mult = 0x0012,
-		 .cpost_mult = 0x0020},
-		{.diag_tx_drv = 0x0003, .mgnfs_mult = 0x0000,
-		 .cpost_mult = 0x002A}
+	{
+		{ .mgnfs_mult = 0x002A, .cpost_mult = 0x0000 },
+		{ .mgnfs_mult = 0x001F, .cpost_mult = 0x0014 },
+		{ .mgnfs_mult = 0x0012, .cpost_mult = 0x0020 },
+		{ .mgnfs_mult = 0x0000, .cpost_mult = 0x002A },
 	},
 
 	/* voltage swing 1, pre-emphasis 0->3 */
-	{	{.diag_tx_drv = 0x0003, .mgnfs_mult = 0x001F,
-		 .cpost_mult = 0x0000},
-		{.diag_tx_drv = 0x0003, .mgnfs_mult = 0x0013,
-		 .cpost_mult = 0x0012},
-		{.diag_tx_drv = 0x0003, .mgnfs_mult = 0x0000,
-		 .cpost_mult = 0x001F},
-		{.diag_tx_drv = 0xFFFF, .mgnfs_mult = 0xFFFF,
-		 .cpost_mult = 0xFFFF}
+	{
+		{ .mgnfs_mult = 0x001F, .cpost_mult = 0x0000 },
+		{ .mgnfs_mult = 0x0013, .cpost_mult = 0x0012 },
+		{ .mgnfs_mult = 0x0000, .cpost_mult = 0x001F },
+		{ .mgnfs_mult = 0xFFFF, .cpost_mult = 0xFFFF },
 	},
 
 	/* voltage swing 2, pre-emphasis 0->3 */
-	{	{.diag_tx_drv = 0x0003, .mgnfs_mult = 0x0013,
-		 .cpost_mult = 0x0000},
-		{.diag_tx_drv = 0x0003, .mgnfs_mult = 0x0000,
-		 .cpost_mult = 0x0013},
-		{.diag_tx_drv = 0xFFFF, .mgnfs_mult = 0xFFFF,
-		 .cpost_mult = 0xFFFF},
-		{.diag_tx_drv = 0xFFFF, .mgnfs_mult = 0xFFFF,
-		 .cpost_mult = 0xFFFF}
+	{
+		{ .mgnfs_mult = 0x0013, .cpost_mult = 0x0000 },
+		{ .mgnfs_mult = 0x0000, .cpost_mult = 0x0013 },
+		{ .mgnfs_mult = 0xFFFF, .cpost_mult = 0xFFFF },
+		{ .mgnfs_mult = 0xFFFF, .cpost_mult = 0xFFFF },
 	},
 
 	/* voltage swing 3, pre-emphasis 0->3 */
-	{	{.diag_tx_drv = 0x0003, .mgnfs_mult = 0x0000,
-		 .cpost_mult = 0x0000},
-		{.diag_tx_drv = 0xFFFF, .mgnfs_mult = 0xFFFF,
-		 .cpost_mult = 0xFFFF},
-		{.diag_tx_drv = 0xFFFF, .mgnfs_mult = 0xFFFF,
-		 .cpost_mult = 0xFFFF},
-		{.diag_tx_drv = 0xFFFF, .mgnfs_mult = 0xFFFF,
-		 .cpost_mult = 0xFFFF}
+	{
+		{ .mgnfs_mult = 0x0000, .cpost_mult = 0x0000 },
+		{ .mgnfs_mult = 0xFFFF, .cpost_mult = 0xFFFF },
+		{ .mgnfs_mult = 0xFFFF, .cpost_mult = 0xFFFF },
+		{ .mgnfs_mult = 0xFFFF, .cpost_mult = 0xFFFF },
 	}
 };
 
-static const char *cdns_torrent_get_phy_type(enum cdns_torrent_phy_type phy_type)
+static void tp_reg_base_init(const struct tp_phy *tp_phy, u32 block_offset,
+			     struct tp_reg_base *ctx)
 {
-	switch (phy_type) {
-	case TYPE_DP:
-		return "DisplayPort";
-	case TYPE_PCIE:
-	case TYPE_PCIE_ML:
+	ctx->base = tp_phy->sd_base + block_offset;
+	ctx->reg_offset_shift = tp_phy->init_data->reg_offset_shift;
+	ctx->block_off = block_offset;
+	ctx->dev = tp_phy->dev;
+}
+
+static void tp_reg_write(const struct tp_reg_base *ctx, u32 reg, u16 val)
+{
+	u32 offset = reg << ctx->reg_offset_shift;
+
+	writew(val, ctx->base + offset);
+	dev_dbg(ctx->dev, "write: 0x%08X = 0x%04X", ctx->block_off + offset, val);
+}
+
+static u16 tp_reg_read(const struct tp_reg_base *ctx, u32 reg)
+{
+	u32 offset = reg << ctx->reg_offset_shift;
+	u16 val = readw(ctx->base + offset);
+
+	dev_dbg(ctx->dev, "read: 0x%08X = 0x%04X", ctx->block_off + offset, val);
+	return val;
+}
+
+static void tp_reg_set_bits(const struct tp_reg_base *ctx, u32 reg, u16 bits)
+{
+	u16 val = tp_reg_read(ctx, reg);
+
+	if ((val & bits) != bits) {
+		val |= bits;
+		tp_reg_write(ctx, reg, val);
+	}
+}
+
+static void tp_reg_clear_bits(const struct tp_reg_base *ctx, u32 reg, u16 bits)
+{
+	u16 val = tp_reg_read(ctx, reg);
+
+	if ((val & bits) != 0) {
+		val &= ~bits;
+		tp_reg_write(ctx, reg, val);
+	}
+}
+
+static void tp_reg_field_init(const struct tp_reg_base *ctx, u32 reg, u16 mask,
+			      struct tp_reg_field *field)
+{
+	u32 offset = reg << ctx->reg_offset_shift;
+
+	field->reg_addr = ctx->base + offset;
+	field->mask = mask;
+	field->reg_off = ctx->block_off + offset;
+	field->dev = ctx->dev;
+}
+
+static u16 tp_reg_field_read(const struct tp_reg_field *field)
+{
+	u16 val = readw(field->reg_addr);
+
+	dev_dbg(field->dev, "read (field): 0x%08X = 0x%04X", field->reg_off, val);
+	val &= field->mask;
+	return val >> __ffs(field->mask);
+}
+
+static void tp_reg_field_write(const struct tp_reg_field *field, u16 val)
+{
+	u16 reg_val = readw(field->reg_addr);
+
+	reg_val &= ~field->mask;
+	reg_val |= val << __ffs(field->mask);
+	dev_dbg(field->dev, "write (field): 0x%08X = 0x%04X", field->reg_off, reg_val);
+	writew(reg_val, field->reg_addr);
+}
+
+static void tp_reg_dptx_write(const struct tp_phy *tp_phy, u32 reg, u32 val)
+{
+	writel(val, tp_phy->base + reg);
+	dev_dbg(tp_phy->dev, "write (dptx): 0x%08X = 0x%04X", reg, val);
+}
+
+static u32 tp_reg_dptx_read(const struct tp_phy *tp_phy, u32 reg)
+{
+	u32 val = readl(tp_phy->base + reg);
+
+	dev_dbg(tp_phy->dev, "read (dptx): 0x%08X = 0x%04X", reg, val);
+	return val;
+}
+
+static void tp_dp_deassert_phy_reset(const struct tp_phy *tp_phy)
+{
+	u32 val = tp_reg_dptx_read(tp_phy, PHY_RESET);
+
+	tp_reg_dptx_write(tp_phy, PHY_RESET, val | 0x0100);
+}
+
+static const char *tp_get_std_name(enum tp_std_type std_type, u32 std_flags)
+{
+	switch (std_type) {
+	case STD_TYPE_PCIE:
 		return "PCIe";
-	case TYPE_SGMII:
-		return "SGMII";
-	case TYPE_QSGMII:
-		return "QSGMII";
-	case TYPE_USB:
+	case STD_TYPE_USB_TXRX:
 		return "USB";
-	case TYPE_USXGMII:
-		return "USXGMII";
-	case TYPE_XAUI:
+	case STD_TYPE_DP:
+		return "DisplayPort";
+	case STD_TYPE_XAUI:
 		return "XAUI";
+	case STD_TYPE_SGMII:
+		if (std_flags & STD_FLAG_QSGMII)
+			return "QSGMII";
+		if (std_flags & STD_FLAG_SGMIIP)
+			return "SGMII-2.5";
+		return "SGMII";
+	case STD_TYPE_SATA:
+		return "SATA";
+	case STD_TYPE_USXGMII:
+		return "USXGMII";
 	default:
 		return "None";
 	}
 }
 
-/*
- * Set registers responsible for enabling and configuring SSC, with second and
- * third register values provided by parameters.
- */
-static
-void cdns_torrent_dp_enable_ssc_19_2mhz(struct cdns_torrent_phy *cdns_phy,
-					u32 ctrl2_val, u32 ctrl3_val)
+static const char *tp_get_revision_desc(enum tp_revision rev)
 {
-	struct regmap *regmap = cdns_phy->regmap_common_cdb;
+	switch (rev) {
+	case REV_R100: return "100";
+	case REV_R110: return "110";
+	case REV_R120: return "120";
+	case REV_R130: return "130";
+	case REV_R140: return "140";
+	case REV_R150: return "150";
+	case REV_R200: return "200";
+	case REV_R210: return "210";
+	case REV_R220: return "220";
+	default:
+		break;
+	}
+	return "?";
+}
 
-	cdns_torrent_phy_write(regmap, CMN_PLL0_SS_CTRL1_M0, 0x0001);
-	cdns_torrent_phy_write(regmap, CMN_PLL0_SS_CTRL1_M0, ctrl2_val);
-	cdns_torrent_phy_write(regmap, CMN_PLL0_SS_CTRL1_M0, ctrl3_val);
-	cdns_torrent_phy_write(regmap, CMN_PLL0_SS_CTRL4_M0, 0x0003);
-	cdns_torrent_phy_write(regmap, CMN_PLL1_SS_CTRL1_M0, 0x0001);
-	cdns_torrent_phy_write(regmap, CMN_PLL1_SS_CTRL1_M0, ctrl2_val);
-	cdns_torrent_phy_write(regmap, CMN_PLL1_SS_CTRL1_M0, ctrl3_val);
-	cdns_torrent_phy_write(regmap, CMN_PLL1_SS_CTRL4_M0, 0x0003);
+static const char *tp_get_tech_desc(u32 tech_tag)
+{
+	switch (tech_tag) {
+	case TECH_TSMC_16: return "TSMC-16";
+	case TECH_TSMC_16_0805: return "TSMC-16-0805";
+	case TECH_TSMC_12: return "TSMC-12";
+	case TECH_TSMC_7: return "TSMC-7";
+	case TECH_TSMC_5: return "TSMC-5";
+	case TECH_SS_7: return "SS-7";
+	case TECH_SS_5: return "SS-5";
+	default:
+		break;
+	}
+	return "?";
 }
 
-static
-void cdns_torrent_dp_pma_cmn_vco_cfg_19_2mhz(struct cdns_torrent_phy *cdns_phy,
-					     u32 rate, bool ssc)
+static enum tp_pll_fb_div_mode tp_calc_pcie_pll_fb_div_mode(const struct tp_phy *tp_phy)
 {
-	struct regmap *regmap = cdns_phy->regmap_common_cdb;
+	u32 tech_tag = tp_phy->tech_tag;
+	enum tp_revision rev = tp_phy->rev;
+	enum tp_pll_fb_div_mode div_mode;
 
-	/* Assumes 19.2 MHz refclock */
-	switch (rate) {
-	/* Setting VCO for 10.8GHz */
-	case 2700:
-	case 5400:
-		cdns_torrent_phy_write(regmap, CMN_PLL0_INTDIV_M0, 0x0119);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVL_M0, 0x4000);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVH_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_HIGH_THR_M0, 0x00BC);
-		cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL0_CTRL_M0, 0x0012);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_INTDIV_M0, 0x0119);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVL_M0, 0x4000);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVH_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_HIGH_THR_M0, 0x00BC);
-		cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_CTRL_M0, 0x0012);
-		if (ssc)
-			cdns_torrent_dp_enable_ssc_19_2mhz(cdns_phy, 0x033A, 0x006A);
-		break;
-	/* Setting VCO for 9.72GHz */
-	case 1620:
-	case 2430:
-	case 3240:
-		cdns_torrent_phy_write(regmap, CMN_PLL0_INTDIV_M0, 0x01FA);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVL_M0, 0x4000);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVH_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_HIGH_THR_M0, 0x0152);
-		cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL0_CTRL_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_INTDIV_M0, 0x01FA);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVL_M0, 0x4000);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVH_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_HIGH_THR_M0, 0x0152);
-		cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_CTRL_M0, 0x0002);
-		if (ssc)
-			cdns_torrent_dp_enable_ssc_19_2mhz(cdns_phy, 0x05DD, 0x0069);
-		break;
-	/* Setting VCO for 8.64GHz */
-	case 2160:
-	case 4320:
-		cdns_torrent_phy_write(regmap, CMN_PLL0_INTDIV_M0, 0x01C2);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVL_M0, 0x0000);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVH_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_HIGH_THR_M0, 0x012C);
-		cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL0_CTRL_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_INTDIV_M0, 0x01C2);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVL_M0, 0x0000);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVH_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_HIGH_THR_M0, 0x012C);
-		cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_CTRL_M0, 0x0002);
-		if (ssc)
-			cdns_torrent_dp_enable_ssc_19_2mhz(cdns_phy, 0x0536, 0x0069);
-		break;
-	/* Setting VCO for 8.1GHz */
-	case 8100:
-		cdns_torrent_phy_write(regmap, CMN_PLL0_INTDIV_M0, 0x01A5);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVL_M0, 0xE000);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVH_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_HIGH_THR_M0, 0x011A);
-		cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL0_CTRL_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_INTDIV_M0, 0x01A5);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVL_M0, 0xE000);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVH_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_HIGH_THR_M0, 0x011A);
-		cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_CTRL_M0, 0x0002);
-		if (ssc)
-			cdns_torrent_dp_enable_ssc_19_2mhz(cdns_phy, 0x04D7, 0x006A);
-		break;
+	if (tech_tag & (TECH_TSMC_16 | TECH_TSMC_12)) {
+		if (rev == REV_R100) {
+			if (tp_phy->plls[PLL1_MODE0].freq_khz == 0)
+				div_mode = PLL_FB_DIV_MODE_FBR;
+			else
+				div_mode = PLL_FB_DIV_MODE_D32;
+		} else {
+			if (tp_phy->plls[PLL0_MODE0].ref_clk_khz == 100000U)
+				div_mode = PLL_FB_DIV_MODE_FBR;
+			else
+				div_mode = PLL_FB_DIV_MODE_DR;
+		}
+	} else if (tech_tag & TECH_TSMC_16_0805) {
+		if (tp_phy->plls[PLL0_MODE0].ref_clk_khz == 100000U)
+			div_mode = PLL_FB_DIV_MODE_FBR;
+		else
+			div_mode = PLL_FB_DIV_MODE_DR;
+	} else {
+		div_mode = PLL_FB_DIV_MODE_DR;
 	}
 
-	if (ssc) {
-		cdns_torrent_phy_write(regmap, CMN_PLL0_VCOCAL_PLLCNT_START, 0x025E);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_LOCK_PLLCNT_THR, 0x0005);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_VCOCAL_PLLCNT_START, 0x025E);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_LOCK_PLLCNT_THR, 0x0005);
+	return div_mode;
+}
+
+static void tp_calc_pll_fb_div_modes(struct tp_phy *tp_phy)
+{
+	enum tp_pll_fb_div_mode div_mode;
+	const struct tp_standard *std0 = &tp_phy->standards[0];
+
+	if (std0->type == STD_TYPE_PCIE) {
+		div_mode = tp_calc_pcie_pll_fb_div_mode(tp_phy);
+
+		tp_phy->plls[PLL0_MODE0].fb_div_mode = div_mode;
+		tp_phy->plls[PLL0_MODE1].fb_div_mode = div_mode;
+
+		if (std0->flags & STD_FLAG_PCIE_ML)
+			tp_phy->plls[PLL1_MODE0].fb_div_mode = div_mode;
+		else
+			tp_phy->plls[PLL1_MODE0].fb_div_mode = PLL_FB_DIV_MODE_FBR;
 	} else {
-		cdns_torrent_phy_write(regmap, CMN_PLL0_VCOCAL_PLLCNT_START, 0x0260);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_VCOCAL_PLLCNT_START, 0x0260);
-		/* Set reset register values to disable SSC */
-		cdns_torrent_phy_write(regmap, CMN_PLL0_SS_CTRL1_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_SS_CTRL2_M0, 0x0000);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_SS_CTRL3_M0, 0x0000);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_SS_CTRL4_M0, 0x0000);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_LOCK_PLLCNT_THR, 0x0003);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_SS_CTRL1_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_SS_CTRL2_M0, 0x0000);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_SS_CTRL3_M0, 0x0000);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_SS_CTRL4_M0, 0x0000);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_LOCK_PLLCNT_THR, 0x0003);
-	}
-
-	cdns_torrent_phy_write(regmap, CMN_PLL0_LOCK_REFCNT_START, 0x0099);
-	cdns_torrent_phy_write(regmap, CMN_PLL0_LOCK_PLLCNT_START, 0x0099);
-	cdns_torrent_phy_write(regmap, CMN_PLL1_LOCK_REFCNT_START, 0x0099);
-	cdns_torrent_phy_write(regmap, CMN_PLL1_LOCK_PLLCNT_START, 0x0099);
+		tp_phy->plls[PLL0_MODE0].fb_div_mode = PLL_FB_DIV_MODE_FBR;
+		tp_phy->plls[PLL0_MODE1].fb_div_mode = PLL_FB_DIV_MODE_FBR;
+		tp_phy->plls[PLL1_MODE0].fb_div_mode = PLL_FB_DIV_MODE_FBR;
+	}
 }
 
-/*
- * Set registers responsible for enabling and configuring SSC, with second
- * register value provided by a parameter.
- */
-static void cdns_torrent_dp_enable_ssc_25mhz(struct cdns_torrent_phy *cdns_phy,
-					     u32 ctrl2_val)
+static u16 tp_get_pll_lock_cnt_subtract(const struct tp_phy *tp_phy,
+					const struct tp_pll_data *pll)
 {
-	struct regmap *regmap = cdns_phy->regmap_common_cdb;
+	bool t = (tp_phy->tech_tag & (TECH_TSMC_16 | TECH_TSMC_16_0805 | TECH_TSMC_12)) ||
+		 ((tp_phy->tech_tag & TECH_TSMC_7) && (tp_phy->rev <= REV_R110));
 
-	cdns_torrent_phy_write(regmap, CMN_PLL0_SS_CTRL1_M0, 0x0001);
-	cdns_torrent_phy_write(regmap, CMN_PLL0_SS_CTRL1_M0, ctrl2_val);
-	cdns_torrent_phy_write(regmap, CMN_PLL0_SS_CTRL1_M0, 0x007F);
-	cdns_torrent_phy_write(regmap, CMN_PLL0_SS_CTRL4_M0, 0x0003);
-	cdns_torrent_phy_write(regmap, CMN_PLL1_SS_CTRL1_M0, 0x0001);
-	cdns_torrent_phy_write(regmap, CMN_PLL1_SS_CTRL1_M0, ctrl2_val);
-	cdns_torrent_phy_write(regmap, CMN_PLL1_SS_CTRL1_M0, 0x007F);
-	cdns_torrent_phy_write(regmap, CMN_PLL1_SS_CTRL4_M0, 0x0003);
+	return (pll->ref_clk_khz != 100000U || pll->ssc || !t) ? 1 : 0;
 }
 
-static
-void cdns_torrent_dp_pma_cmn_vco_cfg_25mhz(struct cdns_torrent_phy *cdns_phy,
-					   u32 rate, bool ssc)
+static bool tp_is_pll_fractional_mode_required(const struct tp_pll_data *pll)
 {
-	struct regmap *regmap = cdns_phy->regmap_common_cdb;
+	if (pll->ssc)
+		return true;
 
-	/* Assumes 25 MHz refclock */
-	switch (rate) {
-	/* Setting VCO for 10.8GHz */
-	case 2700:
-	case 5400:
-		cdns_torrent_phy_write(regmap, CMN_PLL0_INTDIV_M0, 0x01B0);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVL_M0, 0x0000);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVH_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_HIGH_THR_M0, 0x0120);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_INTDIV_M0, 0x01B0);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVL_M0, 0x0000);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVH_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_HIGH_THR_M0, 0x0120);
-		if (ssc)
-			cdns_torrent_dp_enable_ssc_25mhz(cdns_phy, 0x0423);
-		break;
-	/* Setting VCO for 9.72GHz */
+	return (pll->freq_khz % (pll->ref_clk_khz * 2U)) != 0;
+}
+
+static u32 tp_dp_pll_freq_from_bit_rate(u32 bit_rate)
+{
+	/* provide the PLL frequency in kHz */
+	switch (bit_rate) {
 	case 1620:
 	case 2430:
 	case 3240:
-		cdns_torrent_phy_write(regmap, CMN_PLL0_INTDIV_M0, 0x0184);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVL_M0, 0xCCCD);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVH_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_HIGH_THR_M0, 0x0104);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_INTDIV_M0, 0x0184);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVL_M0, 0xCCCD);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVH_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_HIGH_THR_M0, 0x0104);
-		if (ssc)
-			cdns_torrent_dp_enable_ssc_25mhz(cdns_phy, 0x03B9);
-		break;
-	/* Setting VCO for 8.64GHz */
+		return 9720000;
 	case 2160:
 	case 4320:
-		cdns_torrent_phy_write(regmap, CMN_PLL0_INTDIV_M0, 0x0159);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVL_M0, 0x999A);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVH_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_HIGH_THR_M0, 0x00E7);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_INTDIV_M0, 0x0159);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVL_M0, 0x999A);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVH_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_HIGH_THR_M0, 0x00E7);
-		if (ssc)
-			cdns_torrent_dp_enable_ssc_25mhz(cdns_phy, 0x034F);
-		break;
-	/* Setting VCO for 8.1GHz */
+		return 8640000;
+	case 2700:
+	case 5400:
+		return 10800000;
 	case 8100:
-		cdns_torrent_phy_write(regmap, CMN_PLL0_INTDIV_M0, 0x0144);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVL_M0, 0x0000);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVH_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_HIGH_THR_M0, 0x00D8);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_INTDIV_M0, 0x0144);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVL_M0, 0x0000);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVH_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_HIGH_THR_M0, 0x00D8);
-		if (ssc)
-			cdns_torrent_dp_enable_ssc_25mhz(cdns_phy, 0x031A);
+		return 8100000;
+	default:
 		break;
 	}
 
-	cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL0_CTRL_M0, 0x0002);
-	cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_CTRL_M0, 0x0002);
+	return 0;
+}
 
-	if (ssc) {
-		cdns_torrent_phy_write(regmap,
-				       CMN_PLL0_VCOCAL_PLLCNT_START, 0x0315);
-		cdns_torrent_phy_write(regmap,
-				       CMN_PLL0_LOCK_PLLCNT_THR, 0x0005);
-		cdns_torrent_phy_write(regmap,
-				       CMN_PLL1_VCOCAL_PLLCNT_START, 0x0315);
-		cdns_torrent_phy_write(regmap,
-				       CMN_PLL1_LOCK_PLLCNT_THR, 0x0005);
-	} else {
-		cdns_torrent_phy_write(regmap,
-				       CMN_PLL0_VCOCAL_PLLCNT_START, 0x0317);
-		cdns_torrent_phy_write(regmap,
-				       CMN_PLL1_VCOCAL_PLLCNT_START, 0x0317);
-		/* Set reset register values to disable SSC */
-		cdns_torrent_phy_write(regmap, CMN_PLL0_SS_CTRL1_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_SS_CTRL2_M0, 0x0000);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_SS_CTRL3_M0, 0x0000);
-		cdns_torrent_phy_write(regmap, CMN_PLL0_SS_CTRL4_M0, 0x0000);
-		cdns_torrent_phy_write(regmap,
-				       CMN_PLL0_LOCK_PLLCNT_THR, 0x0003);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_SS_CTRL1_M0, 0x0002);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_SS_CTRL2_M0, 0x0000);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_SS_CTRL3_M0, 0x0000);
-		cdns_torrent_phy_write(regmap, CMN_PLL1_SS_CTRL4_M0, 0x0000);
-		cdns_torrent_phy_write(regmap,
-				       CMN_PLL1_LOCK_PLLCNT_THR, 0x0003);
-	}
-
-	cdns_torrent_phy_write(regmap, CMN_PLL0_LOCK_REFCNT_START, 0x00C7);
-	cdns_torrent_phy_write(regmap, CMN_PLL0_LOCK_PLLCNT_START, 0x00C7);
-	cdns_torrent_phy_write(regmap, CMN_PLL1_LOCK_REFCNT_START, 0x00C7);
-	cdns_torrent_phy_write(regmap, CMN_PLL1_LOCK_PLLCNT_START, 0x00C7);
-}
-
-static
-void cdns_torrent_dp_pma_cmn_vco_cfg_100mhz(struct cdns_torrent_phy *cdns_phy,
-					    u32 rate, bool ssc)
-{
-	struct regmap *regmap = cdns_phy->regmap_common_cdb;
-
-	/* Assumes 100 MHz refclock */
-	switch (rate) {
-	/* Setting VCO for 10.8GHz */
+static u16 tp_dp_pll_clk_sel_from_bit_rate(u32 bit_rate)
+{
+	/* calculates the CMN_PDIAG_PLL{0,1}_CLK_SEL_M{0,1} register value */
+	switch (bit_rate) {
+	case 1620:
+		return 0x0F01;
+	case 3240:
+		return 0x0B00;
+	case 2160:
+	case 2430:
 	case 2700:
+		return 0x0701;
+	case 4320:
 	case 5400:
-		if (cdns_phy->dp_pll & DP_PLL0)
-			cdns_torrent_phy_write(regmap, CMN_PLL0_DSM_FBH_OVRD_M0, 0x0022);
-
-		if (cdns_phy->dp_pll & DP_PLL1) {
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_CP_PADJ_M0, 0x0028);
-			cdns_torrent_phy_write(regmap, CMN_PLL1_DSM_FBH_OVRD_M0, 0x0022);
-			cdns_torrent_phy_write(regmap, CMN_PLL1_DSM_FBL_OVRD_M0, 0x000C);
-		}
+		return 0x0301;
+	case 8100:
+		return 0x0200;
+	default:
+		__WARN();
 		break;
-	/* Setting VCO for 9.72GHz */
+	}
+
+	return 0;
+}
+
+static u16 tp_dp_xcvr_diag_hsclk_div_from_bit_rate(u32 bit_rate)
+{
+	/* calculates the XCVR_DIAG_HSCLK_DIV register value */
+	switch (bit_rate) {
 	case 1620:
-	case 2430:
 	case 3240:
-		if (cdns_phy->dp_pll & DP_PLL0) {
-			cdns_torrent_phy_write(regmap, CMN_PLL0_DSM_DIAG_M0, 0x0004);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL0_CP_PADJ_M0, 0x0509);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL0_CP_IADJ_M0, 0x0F00);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL0_FILT_PADJ_M0, 0x0F08);
-			cdns_torrent_phy_write(regmap, CMN_PLL0_INTDIV_M0, 0x0061);
-			cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVL_M0, 0x3333);
-			cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVH_M0, 0x0002);
-			cdns_torrent_phy_write(regmap, CMN_PLL0_HIGH_THR_M0, 0x0042);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL0_CTRL_M0, 0x0002);
-		}
-		if (cdns_phy->dp_pll & DP_PLL1) {
-			cdns_torrent_phy_write(regmap, CMN_PLL1_DSM_DIAG_M0, 0x0004);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_CP_PADJ_M0, 0x0509);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_CP_IADJ_M0, 0x0F00);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_FILT_PADJ_M0, 0x0F08);
-			cdns_torrent_phy_write(regmap, CMN_PLL1_INTDIV_M0, 0x0061);
-			cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVL_M0, 0x3333);
-			cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVH_M0, 0x0002);
-			cdns_torrent_phy_write(regmap, CMN_PLL1_HIGH_THR_M0, 0x0042);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_CTRL_M0, 0x0002);
-		}
-		break;
-	/* Setting VCO for 8.64GHz */
+		return 0x0002;
 	case 2160:
+	case 2430:
+	case 2700:
+		return 0x0001;
 	case 4320:
-		if (cdns_phy->dp_pll & DP_PLL0) {
-			cdns_torrent_phy_write(regmap, CMN_PLL0_DSM_DIAG_M0, 0x0004);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL0_CP_PADJ_M0, 0x0509);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL0_CP_IADJ_M0, 0x0F00);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL0_FILT_PADJ_M0, 0x0F08);
-			cdns_torrent_phy_write(regmap, CMN_PLL0_INTDIV_M0, 0x0056);
-			cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVL_M0, 0x6666);
-			cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVH_M0, 0x0002);
-			cdns_torrent_phy_write(regmap, CMN_PLL0_HIGH_THR_M0, 0x003A);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL0_CTRL_M0, 0x0002);
-		}
-		if (cdns_phy->dp_pll & DP_PLL1) {
-			cdns_torrent_phy_write(regmap, CMN_PLL1_DSM_DIAG_M0, 0x0004);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_CP_PADJ_M0, 0x0509);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_CP_IADJ_M0, 0x0F00);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_FILT_PADJ_M0, 0x0F08);
-			cdns_torrent_phy_write(regmap, CMN_PLL1_INTDIV_M0, 0x0056);
-			cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVL_M0, 0x6666);
-			cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVH_M0, 0x0002);
-			cdns_torrent_phy_write(regmap, CMN_PLL1_HIGH_THR_M0, 0x003A);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_CTRL_M0, 0x0002);
-		}
-		break;
-	/* Setting VCO for 8.1GHz */
+	case 5400:
 	case 8100:
-		if (cdns_phy->dp_pll & DP_PLL0) {
-			cdns_torrent_phy_write(regmap, CMN_PLL0_DSM_DIAG_M0, 0x0004);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL0_CP_PADJ_M0, 0x0509);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL0_CP_IADJ_M0, 0x0F00);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL0_FILT_PADJ_M0, 0x0F08);
-			cdns_torrent_phy_write(regmap, CMN_PLL0_INTDIV_M0, 0x0051);
-			cdns_torrent_phy_write(regmap, CMN_PLL0_FRACDIVH_M0, 0x0002);
-			cdns_torrent_phy_write(regmap, CMN_PLL0_HIGH_THR_M0, 0x0036);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL0_CTRL_M0, 0x0002);
-		}
-		if (cdns_phy->dp_pll & DP_PLL1) {
-			cdns_torrent_phy_write(regmap, CMN_PLL1_DSM_DIAG_M0, 0x0004);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_CP_PADJ_M0, 0x0509);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_CP_IADJ_M0, 0x0F00);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_FILT_PADJ_M0, 0x0F08);
-			cdns_torrent_phy_write(regmap, CMN_PLL1_INTDIV_M0, 0x0051);
-			cdns_torrent_phy_write(regmap, CMN_PLL1_FRACDIVH_M0, 0x0002);
-			cdns_torrent_phy_write(regmap, CMN_PLL1_HIGH_THR_M0, 0x0036);
-			cdns_torrent_phy_write(regmap, CMN_PDIAG_PLL1_CTRL_M0, 0x0002);
-		}
+		return 0x0000;
+	default:
+		__WARN();
 		break;
 	}
+
+	return 0;
 }
 
-/* Set PLL used for DP configuration */
-static int cdns_torrent_dp_get_pll(struct cdns_torrent_phy *cdns_phy,
-				   enum cdns_torrent_phy_type phy_t2)
+static const struct tp_link *tp_dp_link_from_pll_id(const struct tp_phy *tp_phy,
+						    enum tp_pll_id pll_id)
 {
-	switch (phy_t2) {
-	case TYPE_PCIE:
-	case TYPE_USB:
-		cdns_phy->dp_pll = DP_PLL1;
-		break;
-	case TYPE_SGMII:
-	case TYPE_QSGMII:
-		cdns_phy->dp_pll = DP_PLL0;
-		break;
-	case TYPE_NONE:
-		cdns_phy->dp_pll = DP_PLL0 | DP_PLL1;
-		break;
-	default:
-		dev_err(cdns_phy->dev, "Unsupported PHY configuration\n");
+	u8 std_idx;
+
+	if (pll_id == PLL0_MODE0)
+		std_idx = 0;
+	else if (pll_id == PLL1_MODE0)
+		std_idx = 1;
+	else
+		return NULL;
+
+	for (u8 i = 0; i < tp_phy->nb_links; ++i) {
+		const struct tp_link *link = &tp_phy->links[i];
+
+		if (link->type == STD_TYPE_DP && link->std_idx == std_idx)
+			return link;
+	}
+
+	return NULL;
+}
+
+static u32 tp_dp_get_default_pll_freq(const struct tp_phy *tp_phy, enum tp_pll_id pll_id)
+{
+	const struct tp_link *link;
+	u32 freq_khz = 0;
+
+	link = tp_dp_link_from_pll_id(tp_phy, pll_id);
+	if (link)
+		freq_khz = tp_dp_pll_freq_from_bit_rate(link->max_bit_rate);
+
+	WARN(freq_khz == 0, "failed to get DP PLL frequency");
+	return freq_khz;
+}
+
+static int tp_init_plls_data(struct tp_phy *tp_phy)
+{
+	const struct tp_link_cfg *link_cfg = tp_phy->link_cfg;
+	const struct tp_standard *std0 = &tp_phy->standards[0];
+	const struct tp_standard *std1 = &tp_phy->standards[1];
+	bool has_std1 = std1->type != STD_TYPE_NONE;
+	struct device *dev = tp_phy->dev;
+	bool std0_ssc;
+	bool std1_ssc;
+
+	tp_phy->plls[PLL0_MODE0].ref_clk_khz = tp_phy->ref_clk_khz;
+	tp_phy->plls[PLL0_MODE1].ref_clk_khz = tp_phy->ref_clk_khz;
+	tp_phy->plls[PLL1_MODE0].ref_clk_khz = tp_phy->ref_clk1_khz;
+
+	for (u32 i = 0; i < TP_NB_PLLS; ++i) {
+		u32 pll_freq_khz = 0;
+
+		switch (link_cfg->pll_freq[i]) {
+		case PLL_DP:
+			pll_freq_khz = tp_dp_get_default_pll_freq(tp_phy, i);
+			break;
+		case PLL_6_00_GHZ:
+			pll_freq_khz = 6000000;
+			break;
+		case PLL_6_25_GHZ:
+			pll_freq_khz = 6250000;
+			break;
+		case PLL_8_00_GHZ:
+			pll_freq_khz = 8000000;
+			break;
+		case PLL_10_00_GHZ:
+			pll_freq_khz = 10000000;
+			break;
+		case PLL_10_31_GHZ:
+			pll_freq_khz = 10312500;
+			break;
+		default:
+			break;
+		}
+
+		tp_phy->plls[i].freq_khz = pll_freq_khz;
+	}
+
+	/* Check if both standards should share the same SSC since sharing PLL0 */
+	if (has_std1 && (std1->flags & STD_FLAG_S_SSC) && std0->ssc_mode != std1->ssc_mode) {
+		dev_err(dev, "Both standards must share the same SSC");
 		return -EINVAL;
 	}
 
+	/* Configure SSC for PLLs */
+	std0_ssc = (std0->ssc_mode == CDNS_SERDES_INTERNAL_SSC);
+	std1_ssc = (std1->ssc_mode == CDNS_SERDES_INTERNAL_SSC);
+	tp_phy->plls[PLL0_MODE0].ssc = std0_ssc;
+	tp_phy->plls[PLL0_MODE1].ssc = std0_ssc;
+	tp_phy->plls[PLL1_MODE0].ssc = has_std1 ? std1_ssc : std0_ssc;
+
+	tp_calc_pll_fb_div_modes(tp_phy);
+
+	for (u32 i = 0; i < TP_NB_PLLS; ++i) {
+		struct tp_pll_data *pll = &tp_phy->plls[i];
+
+		pll->fractional_mode = tp_is_pll_fractional_mode_required(pll);
+	}
+
+	return 0;
+}
+
+static void tp_write_lanes_reg(const struct tp_link *link,
+			       const struct tp_reg_base reg_base[MAX_NUM_LANES],
+			       u16 reg, u16 val)
+{
+	u32 num_lanes = link->num_lanes;
+	u32 mlane = link->mlane;
+
+	for (u32 i = 0; i < num_lanes; ++i)
+		tp_reg_write(&reg_base[mlane + i], reg, val);
+}
+
+static void tp_write_links_lanes_reg(const struct tp_phy *tp_phy,
+				     const struct tp_reg_base reg_base[MAX_NUM_LANES],
+				     u16 reg, u16 val)
+{
+	for (u8 i = 0; i < tp_phy->nb_links; ++i)
+		tp_write_lanes_reg(&tp_phy->links[i], reg_base, reg, val);
+}
+
+static void tp_find_cfg_write_lanes_reg(const struct tp_phy *tp_phy, const struct tp_link *link,
+					const struct tp_reg_base reg_base[MAX_NUM_LANES],
+					u16 reg, const struct tp_reg_cfg cfg[], u32 nb_cfg)
+{
+	union tp_reg_cfg_key key = {
+		.std = BIT(link->type),
+		.tech = tp_phy->tech_tag,
+		.rev = BIT(tp_phy->rev),
+	};
+	u32 std_flags = link->flags;
+	bool found = false;
+	u16 val = 0;
+
+	for (u32 i = 0U; i < nb_cfg; ++i) {
+		const struct tp_reg_cfg *p_cfg = &cfg[i];
+
+		if (((p_cfg->cfg.key & key.key) == key.key) &&
+		    ((p_cfg->std_flags & std_flags) == p_cfg->std_flags)) {
+			val = p_cfg->val;
+			found = true;
+			break;
+		}
+	}
+
+	if (found)
+		tp_write_lanes_reg(link, reg_base, reg, val);
+}
+
+static void tp_write_tx_lane_reg(const struct tp_phy *tp_phy, const struct tp_link *link,
+				 u16 reg, const struct tp_reg_cfg cfg[], u32 nb_cfg)
+{
+	tp_find_cfg_write_lanes_reg(tp_phy, link, tp_phy->reg_tx_lane_cdb, reg, cfg, nb_cfg);
+}
+
+static void tp_write_rx_lane_reg(const struct tp_phy *tp_phy, const struct tp_link *link,
+				 u16 reg, const struct tp_reg_cfg cfg[], u32 nb_cfg)
+{
+	tp_find_cfg_write_lanes_reg(tp_phy, link, tp_phy->reg_rx_lane_cdb, reg, cfg, nb_cfg);
+}
+
+static void tp_write_tx_txcc_ctrl(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	/* For DP, this is also handled by tp_dp_set_voltages() */
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x2A84,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x2A82,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_SATA),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x2AA0,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_DP),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x08A4,
+		},
+	};
+
+	tp_write_tx_lane_reg(tp_phy, link, TX_TXCC_CTRL, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_tx_txcc_cpost_mult_00(const struct tp_phy *tp_phy,
+					   const struct tp_link *link)
+{
+	/* For DP, this is also handled by tp_dp_set_voltages() */
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_16 | TECH_TSMC_12,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x001C,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_SGMII) | BIT(STD_TYPE_SATA) | BIT(STD_TYPE_DP) |
+				   BIT(STD_TYPE_USXGMII) | BIT(STD_TYPE_XAUI),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0000,
+		},
+	};
+
+	tp_write_tx_lane_reg(tp_phy, link, TX_TXCC_CPOST_MULT_00, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_tx_txcc_cpost_mult_01(const struct tp_phy *tp_phy,
+					   const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0014,
+		},
+	};
+
+	tp_write_tx_lane_reg(tp_phy, link, TX_TXCC_CPOST_MULT_01, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_tx_txcc_mgnfs_mult_000(const struct tp_phy *tp_phy,
+					    const struct tp_link *link)
+{
+	/* For DP, this is also handled by tp_dp_set_voltages() */
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_7,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0007,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_TSMC_7 | TECH_TSMC_5 | TECH_SS_7 | TECH_SS_5,
+			.cfg.rev = REV_MSK_R100P,
+			.std_flags = STD_FLAG_USB_IO_11V,
+			.val = 0x0002,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_TSMC_7 | TECH_TSMC_5 | TECH_SS_7 | TECH_SS_5,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0007,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_SATA),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0011,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_DP),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x002A,
+		},
+	};
+
+	tp_write_tx_lane_reg(tp_phy, link, TX_TXCC_MGNFS_MULT_000, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_tx_txcc_mgnfs_mult_100(const struct tp_phy *tp_phy,
+					    const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_7 | TECH_TSMC_5,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0019,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_SGMII),
+			.cfg.tech = TECH_TSMC_16 | TECH_TSMC_16_0805 | TECH_TSMC_12,
+			.cfg.rev = REV_MSK_R100P,
+			.std_flags = STD_FLAG_QSGMII,
+			.val = 0x0011,
+		},
+	};
+
+	tp_write_tx_lane_reg(tp_phy, link, TX_TXCC_MGNFS_MULT_100, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_drv_diag_tx_drv(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	/* For DP, this is also handled by tp_dp_set_voltages() */
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_16 | TECH_TSMC_12,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x00A3,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_SGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.std_flags = STD_FLAG_QSGMII,
+			.val = 0x0003,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_SGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x00B3,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_DP),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0003,
+		},
+	};
+
+	tp_write_tx_lane_reg(tp_phy, link, DRV_DIAG_TX_DRV, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_xcvr_diag_rxclk_ctrl(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_SGMII) | BIT(STD_TYPE_XAUI),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x4000,
+		},
+	};
+
+	if (!tp_phy->init_data->rxda_des_clk_2x_en)
+		return;
+
+	tp_write_tx_lane_reg(tp_phy, link, XCVR_DIAG_RXCLK_CTRL, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_xcvr_diag_bidi_ctrl(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_DP),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x000F,
+		},
+	};
+
+	tp_write_tx_lane_reg(tp_phy, link, XCVR_DIAG_BIDI_CTRL, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_xcvr_diag_psc_ovrd(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0003,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_SGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0002,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_SATA),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0004,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0000,
+		},
+	};
+
+	tp_write_tx_lane_reg(tp_phy, link, XCVR_DIAG_PSC_OVRD, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_tx_psc_a0(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.std_flags = STD_FLAG_USB_G1,
+			.val = 0x02FB,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x02FF,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_DP) | BIT(STD_TYPE_SATA),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x00FB,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_XAUI) | BIT(STD_TYPE_SGMII) |
+				   BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x00F3,
+		},
+	};
+
+	tp_write_tx_lane_reg(tp_phy, link, TX_PSC_A0, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_tx_psc_a1(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.std_flags = STD_FLAG_USB_G1,
+			.val = 0x06AB,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x06AF,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_SATA),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x04BB,
+		},
+	};
+
+	tp_write_tx_lane_reg(tp_phy, link, TX_PSC_A1, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_tx_psc_a2_a3(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.std_flags = STD_FLAG_USB_G1,
+			.val = 0x06AA,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x06AE,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_DP) | BIT(STD_TYPE_SATA),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x04AA,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_XAUI) | BIT(STD_TYPE_SGMII) |
+				   BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x04A2,
+		},
+	};
+
+	tp_write_tx_lane_reg(tp_phy, link, TX_PSC_A2, cfg, ARRAY_SIZE(cfg));
+	tp_write_tx_lane_reg(tp_phy, link, TX_PSC_A3, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_psc_a0(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0D1D,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_DP),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0000,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_SGMII) | BIT(STD_TYPE_SATA) |
+				   BIT(STD_TYPE_USXGMII) | BIT(STD_TYPE_XAUI),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x091D,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_PSC_A0, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_psc_a1(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0D1D,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_SATA),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x091D,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_PSC_A1, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_psc_a2(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0D00,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_DP),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0000,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_XAUI) | BIT(STD_TYPE_SGMII) |
+				   BIT(STD_TYPE_SATA) | BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0900,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_PSC_A2, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_psc_a3(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0500,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_DP),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0000,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_XAUI) | BIT(STD_TYPE_SGMII) |
+				   BIT(STD_TYPE_SATA) | BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0100,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_PSC_A3, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_psc_cal(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_DP),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0000,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_PSC_CAL, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_cdrlf_cnfg(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_16,
+			.cfg.rev = REV_MSK_R130P,
+			.val = 0x018E,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_12 | TECH_TSMC_7 | TECH_TSMC_5,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x010A,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX) | BIT(STD_TYPE_XAUI) |
+				   BIT(STD_TYPE_SGMII) | BIT(STD_TYPE_SATA) |
+				   BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x018C,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_CDRLF_CNFG, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_cdrlf_cnfg2(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_SS_7 | TECH_SS_5,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0E39,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_16,
+			.cfg.rev = REV_MSK_R130P,
+			.val = 0x2E33,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_CDRLF_CNFG2, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_cdrlf_cnfg3(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0003,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_SATA),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0007,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_CDRLF_CNFG3, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_sigdet_hl_filt_tmr(const struct tp_phy *tp_phy,
+					   const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0013,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_SATA),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0005,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_SIGDET_HL_FILT_TMR, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_ree_gcsm1_ctrl(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0000,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_DP),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0000,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_REE_GCSM1_CTRL, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_ree_gcsm1_eqenm_ph1(const struct tp_phy *tp_phy,
+					    const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x03E7,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_XAUI) | BIT(STD_TYPE_SGMII) |
+				   BIT(STD_TYPE_SATA) | BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x03C7,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_REE_GCSM1_EQENM_PH1, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_ree_gcsm1_eqenm_ph2(const struct tp_phy *tp_phy,
+					    const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x01E7,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_XAUI) | BIT(STD_TYPE_SGMII) |
+				   BIT(STD_TYPE_SATA) | BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x01C7,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_REE_GCSM1_EQENM_PH2, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_ree_gcsm2_ctrl(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_DP),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0000,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_REE_GCSM2_CTRL, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_ree_pergcsm_ctrl(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_DP),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0000,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_REE_PERGCSM_CTRL, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_ree_peak_uthr(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_16,
+			.cfg.rev = REV_MSK_R130P,
+			.val = 0x0008,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_TSMC_16,
+			.cfg.rev = REV_MSK_R130P,
+			.val = 0x0000,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_TSMC_16_0805,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0000,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_REE_PEAK_UTHR, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_ree_peak_lthr(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_TSMC_16,
+			.cfg.rev = REV_MSK_R130P,
+			.val = 0x01F5,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_TSMC_16_0805,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x01F5,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_TSMC_5,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x01F2,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_REE_PEAK_LTHR, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_ree_atten_thr(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0C02,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_REE_ATTEN_THR, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_ree_tap_clip(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE) | BIT(STD_TYPE_USB_TXRX) |
+				   BIT(STD_TYPE_XAUI) | BIT(STD_TYPE_SGMII) |
+				   BIT(STD_TYPE_SATA),
+			.cfg.tech = TECH_TSMC_16 | TECH_TSMC_16_0805 | TECH_TSMC_12 |
+				    TECH_TSMC_7,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0019,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_TSMC_16 | TECH_TSMC_16_0805 | TECH_TSMC_12,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0019,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_REE_TAP1_CLIP, cfg, ARRAY_SIZE(cfg));
+	tp_write_rx_lane_reg(tp_phy, link, RX_REE_TAP2TON_CLIP, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_ree_smgm_ctrl1(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0330,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_SATA),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0474,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0030,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_REE_SMGM_CTRL1, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_ree_smgm_ctrl2(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0300,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_REE_SMGM_CTRL2, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_diag_dfe_ctrl(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_16,
+			.cfg.rev = REV_MSK_R100,
+			.val = 0x0004,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_12,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0000,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE) | BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_TSMC_7,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0006,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_XAUI) | BIT(STD_TYPE_SGMII) |
+				   BIT(STD_TYPE_SATA) | BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0000,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_DIAG_DFE_CTRL, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_diag_dfe_amp_tune_2(const struct tp_phy *tp_phy,
+					    const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_16,
+			.cfg.rev = REV_MSK_R130P,
+			.val = 0x0C21,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_SS_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0CA1,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX) | BIT(STD_TYPE_XAUI) |
+				   BIT(STD_TYPE_SGMII) | BIT(STD_TYPE_SATA),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0C01,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_TSMC_16 | TECH_TSMC_16_0805 | TECH_TSMC_12 | TECH_TSMC_7,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0C21,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_TSMC_5,
+			.cfg.rev = REV_MSK_R200P,
+			.val = 0x0C01,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_DIAG_DFE_AMP_TUNE_2, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_diag_dfe_amp_tune_3(const struct tp_phy *tp_phy,
+					    const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_16,
+			.cfg.rev = REV_MSK_R130P,
+			.val = 0x0002,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_5,
+			.cfg.rev = REV_MSK_R100,
+			.val = 0x4005,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_TSMC_16 | TECH_TSMC_16_0805 | TECH_TSMC_12 |
+				    TECH_TSMC_7 | TECH_SS_7 | TECH_SS_5,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0002,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_TSMC_5,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x3113,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_XAUI) | BIT(STD_TYPE_SGMII) |
+				   BIT(STD_TYPE_SATA),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0000,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_TSMC_16 | TECH_TSMC_16_0805 | TECH_TSMC_12 | TECH_TSMC_7,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0002,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_TSMC_5,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0022,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_DIAG_DFE_AMP_TUNE_3, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_diag_ree_dac_ctrl(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_16,
+			.cfg.rev = REV_MSK_R130P,
+			.val = 0x0005,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_DIAG_REE_DAC_CTRL, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_diag_nqst_ctrl(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x00F9,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_XAUI) | BIT(STD_TYPE_SGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0098,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_SATA),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0988,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x00B9,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_DIAG_NQST_CTRL, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_diag_sigdet_tune(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_16 | TECH_TSMC_12 | TECH_TSMC_7,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x1002,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_TSMC_16 | TECH_TSMC_16_0805 | TECH_TSMC_12 |
+				    TECH_TSMC_7 | TECH_SS_7 | TECH_SS_5,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x1004,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX),
+			.cfg.tech = TECH_TSMC_5,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x1003,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_DIAG_SIGDET_TUNE, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_diag_pi_rate(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE),
+			.cfg.tech = TECH_TSMC_5,
+			.cfg.rev = REV_MSK_R100,
+			.val = 0x0310,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX) | BIT(STD_TYPE_XAUI),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0031,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_SGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0010,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_SATA),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0310,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0033,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_DIAG_PI_RATE, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_diag_pi_cap(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_USB_TXRX) | BIT(STD_TYPE_XAUI) |
+				   BIT(STD_TYPE_SGMII) | BIT(STD_TYPE_SATA),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0000,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_DIAG_PI_CAP, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_rx_diag_acya(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	static const struct tp_reg_cfg cfg[] = {
+		{
+			.cfg.std = BIT(STD_TYPE_PCIE) | BIT(STD_TYPE_USB_TXRX) |
+				   BIT(STD_TYPE_XAUI) | BIT(STD_TYPE_SGMII) |
+				   BIT(STD_TYPE_SATA),
+			.cfg.tech = TECH_TSMC_16 | TECH_TSMC_16_0805 | TECH_TSMC_12 |
+				    TECH_TSMC_7,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0001,
+		},
+		{
+			.cfg.std = BIT(STD_TYPE_USXGMII),
+			.cfg.tech = TECH_ALL,
+			.cfg.rev = REV_MSK_R100P,
+			.val = 0x0001,
+		},
+	};
+
+	tp_write_rx_lane_reg(tp_phy, link, RX_DIAG_ACYA, cfg, ARRAY_SIZE(cfg));
+}
+
+static void tp_write_phy_pipe_usb3_gen2_cfg(const struct tp_phy *tp_phy,
+					    const struct tp_link *link)
+{
+	const struct tp_reg_base *reg_base = &tp_phy->reg_phy_pcs_common_cdb;
+
+	if (link->type != STD_TYPE_USB_TXRX)
+		return;
+
+	tp_reg_write(reg_base, PHY_PIPE_USB3_GEN2_PRE_CFG0, 0x0A0A);
+	tp_reg_write(reg_base, PHY_PIPE_USB3_GEN2_POST_CFG0, 0x1000);
+	tp_reg_write(reg_base, PHY_PIPE_USB3_GEN2_POST_CFG1, 0x0010);
+}
+
+static void tp_write_cmn_cdiag_pwri_ovrd(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	const struct tp_reg_base *reg_base = &tp_phy->reg_common_cdb;
+
+	if (link->type != STD_TYPE_USB_TXRX)
+		return;
+
+	tp_reg_write(reg_base, CMN_CDIAG_CDB_PWRI_OVRD, 0x8200);
+	tp_reg_write(reg_base, CMN_CDIAG_XCVRC_PWRI_OVRD, 0x8200);
+}
+
+static void tp_write_refclk_rcv_out_en(const struct tp_phy *tp_phy)
+{
+	bool has_usxgmii = false;
+
+	if (!tp_phy->init_data->usxgmii_refclk_rcv_out_en)
+		return;
+
+	/* USXGMII configuration: Enable cmn_refclk_rcv_out_en */
+	for (u8 i = 0; i < tp_phy->nb_links; ++i) {
+		const struct tp_link *link = &tp_phy->links[i];
+
+		if (link->type == STD_TYPE_USXGMII) {
+			has_usxgmii = true;
+			break;
+		}
+	}
+
+	if (has_usxgmii)
+		tp_reg_write(&tp_phy->reg_phy_pma_common_cdb, PHY_PMA_CMN_CTRL1, 0x0040);
+}
+
+static void tp_write_ana_cfg(const struct tp_phy *tp_phy)
+{
+	const struct tp_reg_base *reg_base = &tp_phy->reg_common_cdb;
+	const struct tp_standard *std0 = &tp_phy->standards[0];
+	const struct tp_standard *std1 = &tp_phy->standards[1];
+
+	/* TX pull-down and pull-up resistors calibration tune register */
+	if (std1->type != STD_TYPE_NONE && std0->type != std1->type) {
+		tp_reg_write(reg_base, CMN_TXPDCAL_TUNE, 0x007F);
+		tp_reg_write(reg_base, CMN_TXPUCAL_TUNE, 0x007F);
+	}
+
+	/* Bias override register */
+	if (tp_phy->tech_tag & TECH_TSMC_7)
+		tp_reg_write(reg_base, CMN_DIAG_BIAS_OVRD1, 0x7400);
+	else if (tp_phy->tech_tag & TECH_TSMC_5)
+		tp_reg_write(reg_base, CMN_DIAG_BIAS_OVRD1, 0x5400);
+}
+
+static __always_inline u16 tp_calc_refclk_reg(u32 ref_clk_hz, u32 clk_div_shift, u32 val_ns)
+{
+	/* Compute ceiling of: refclk(Hz) * val(seconds) / clk_div */
+	u32 den = DIV_ROUND_UP(1000000000U, val_ns) << clk_div_shift;
+
+	return DIV_ROUND_UP(ref_clk_hz, den);
+}
+
+static u32 tp_calc_refclk_div_shift(u32 ref_clk_hz)
+{
+	if (ref_clk_hz <= 32000000U)
+		return 0;
+	if (ref_clk_hz <= 64000000U)
+		return 1;
+	if (ref_clk_hz <= 128000000U)
+		return 2;
+	return 3;
+}
+
+static u16 tp_calc_pll_lock_tmr(const struct tp_phy *tp_phy, u32 ref_clk_hz, u32 clk_div_shift,
+				enum tp_pll_id pll_id)
+{
+	u32 tech_tag = tp_phy->tech_tag;
+	enum tp_pll_id pll_id_m1 = (pll_id == PLL0_MODE0) ? PLL0_MODE1 : PLL1_MODE0;
+
+	if (tech_tag & (TECH_TSMC_16 | TECH_TSMC_16_0805 | TECH_TSMC_12)) {
+		/* PLL lock delay timer (normal exit time) */
+		return tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 8360);
+	}
+
+	if (tp_phy->plls[pll_id].fractional_mode || tp_phy->plls[pll_id_m1].fractional_mode) {
+		/* PLL lock delay timer (Special case: 7nm fractional mode only) */
+		return tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 10000);
+	}
+
+	/* PLL lock delay timer (reduced exit time) */
+	return tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 1500);
+}
+
+static void tp_write_pll_lock_tmr(const struct tp_phy *tp_phy, enum tp_pll_id pll_id)
+{
+	u32 ref_clk_hz = tp_phy->ref_clk_khz * 1000U;
+	u32 clk_div_shift = tp_calc_refclk_div_shift(ref_clk_hz);
+	u16 val = tp_calc_pll_lock_tmr(tp_phy, ref_clk_hz, clk_div_shift, pll_id);
+
+	tp_reg_write(&tp_phy->reg_common_cdb, (pll_id == PLL0_MODE0) ?
+			CMN_PLLSM0_PLLLOCK_TMR : CMN_PLLSM1_PLLLOCK_TMR, val);
+}
+
+static void tp_write_refclk_regs(const struct tp_phy *tp_phy)
+{
+	const struct tp_reg_base *reg_base = &tp_phy->reg_common_cdb;
+	u32 tech_tag = tp_phy->tech_tag;
+	u32 clk_div_shift;
+	u32 ref_clk_hz;
+	u32 tmp;
+	u16 val;
+
+	ref_clk_hz = tp_phy->ref_clk_khz * 1000U;
+
+	/* Get the digital reference clock divider value */
+	clk_div_shift = tp_calc_refclk_div_shift(ref_clk_hz);
+
+	/* Bias timer value */
+	tp_reg_write(reg_base, CMN_SSM_BIAS_TMR,
+		     tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 1000));
+
+	/* PLL control state machine register: */
+	/* PLL pre timer */
+	if ((tech_tag & (TECH_TSMC_7 | TECH_TSMC_5 | TECH_SS_7 | TECH_SS_5)) &&
+	    ref_clk_hz == 100000000U) {
+		/* PLL pre timer (reduced exit time) */
+		val = tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 800);
+	} else {
+		/* PLL pre timer (normal exit time) */
+		val = tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 2000);
+	}
+	tp_reg_write(reg_base, CMN_PLLSM0_PLLPRE_TMR, val);
+	tp_reg_write(reg_base, CMN_PLLSM1_PLLPRE_TMR, val);
+
+	/* PLL lock delay timer */
+	val = tp_calc_pll_lock_tmr(tp_phy, ref_clk_hz, clk_div_shift, PLL0_MODE0);
+	tp_reg_write(reg_base, CMN_PLLSM0_PLLLOCK_TMR, val);
+
+	val = tp_calc_pll_lock_tmr(tp_phy, ref_clk_hz, clk_div_shift, PLL1_MODE0);
+	tp_reg_write(reg_base, CMN_PLLSM1_PLLLOCK_TMR, val);
+
+	/* Bandgap calibration controller register: */
+	/* Initialization timer value and Iteration timer value */
+	val = tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 5000);
+	tp_reg_write(reg_base, CMN_BGCAL_INIT_TMR, val);
+	tp_reg_write(reg_base, CMN_BGCAL_ITER_TMR, val);
+
+	/* External bias current calibration register: */
+	/* Initialization timer value */
+	tp_reg_write(reg_base, CMN_IBCAL_INIT_TMR,
+		     tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 1000));
+
+	/* Resistor calibration register: */
+	/* TX initialization timer value */
+	val = tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 1200);
+	tp_reg_write(reg_base, CMN_TXPUCAL_INIT_TMR, val);
+	tp_reg_write(reg_base, CMN_TXPDCAL_INIT_TMR, val);
+
+	/* TX iteration timer value */
+	val = tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 240);
+	tp_reg_write(reg_base, CMN_TXPUCAL_ITER_TMR, val);
+	tp_reg_write(reg_base, CMN_TXPDCAL_ITER_TMR, val);
+
+	/* RX initialization timer value */
+	tp_reg_write(reg_base, CMN_RXCAL_INIT_TMR,
+		     tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 30000));
+
+	/* RX iteration timer value */
+	tp_reg_write(reg_base, CMN_RXCAL_ITER_TMR,
+		     tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 240));
+
+	/* Signal detect clock calibration register: */
+	/* Initialization timer value */
+	tp_reg_write(reg_base, CMN_SD_CAL_INIT_TMR,
+		     tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 80) + 4);
+
+	/* Iteration timer value */
+	tp_reg_write(reg_base, CMN_SD_CAL_ITER_TMR,
+		     tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 80));
+
+	/* Reference clock timer */
+	val = tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 600) - 1;
+	tp_reg_write(reg_base, CMN_SD_CAL_REFTIM_START, val);
+
+	/* PLL clock counter with computation of actual ref timer time based on rounding */
+	tmp = (val + 1U) * (500000000U >> 4);
+	tmp /= ref_clk_hz >> (4 + clk_div_shift);
+	tp_reg_write(reg_base, CMN_SD_CAL_PLLCNT_START, tmp - 1);
+
+	/* Receiver detect calibration register calculations */
+	/* Receiver detect time */
+	tp_write_links_lanes_reg(tp_phy, tp_phy->reg_tx_lane_cdb, TX_RCVDET_ST_TMR,
+				 tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 100000));
+
+	/* Signal detect calibration register calculations */
+	/* Initialization timer value */
+	val = tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 1000);
+	tp_write_links_lanes_reg(tp_phy, tp_phy->reg_rx_lane_cdb, RX_SDCAL0_INIT_TMR, val);
+	tp_write_links_lanes_reg(tp_phy, tp_phy->reg_rx_lane_cdb, RX_SDCAL1_INIT_TMR, val);
+
+	/* Iteration timer value */
+	val = tp_calc_refclk_reg(ref_clk_hz, clk_div_shift, 5000);
+	tp_write_links_lanes_reg(tp_phy, tp_phy->reg_rx_lane_cdb, RX_SDCAL0_ITER_TMR, val);
+	tp_write_links_lanes_reg(tp_phy, tp_phy->reg_rx_lane_cdb, RX_SDCAL1_ITER_TMR, val);
+}
+
+static __always_inline u16 tp_calc_pll_ref_clk_reg(u32 ref_clk_hz, u32 val_ns)
+{
+	/* Compute ceiling of: refclk(Hz) * val(seconds) */
+	u32 den = DIV_ROUND_UP(1000000000U, val_ns);
+
+	return DIV_ROUND_UP(ref_clk_hz, den);
+}
+
+static void tp_write_ssc_ctrl(const struct tp_phy *tp_phy, enum tp_pll_id pll_id,
+			      u32 fd_div_prescale)
+{
+	u32 tech_tag = tp_phy->tech_tag;
+	const struct tp_reg_base *reg_base = &tp_phy->reg_common_cdb;
+	const struct tp_pll_data *pll = &tp_phy->plls[pll_id];
+	u32 ref_clk_khz = pll->ref_clk_khz;
+	u32 pll_freq_khz = pll->freq_khz;
+	u32 ref_clk_hz = ref_clk_khz * 1000U;
+
+	s32 min_delta_ppm = S32_MAX;
+	u16 ssc_num_steps = 0;
+	u16 ssc_amp_step = 0;
+	u16 ssc_step_time = 0;
+
+	/* Calculated spread spectrum values */
+	for (u32 steps = 127; steps >= 80; --steps) {
+		s32 delta_ppm;
+		u32 amp_step;
+		s32 ppm;
+		u64 num;
+
+		/* Compute step time: ref_clk / (steps * 31.5e3 * 2) */
+		u32 step_time = DIV_ROUND_CLOSEST(ref_clk_hz, steps * 63000U);
+
+		/* Compute SSC actual frequency */
+		u32 ssc_freq = ref_clk_hz / (steps * 2U * step_time);
+
+		/* Ignore this configuration if not between 30kHz and 33kHz */
+		if (ssc_freq < 30000U || ssc_freq > 33000)
+			continue;
+
+		/* Compute Amp Step: round(-1 * ideal_ppm * 95% * 0.000001 *
+		 *  ((vco_freq / (vco_div / 2 * ref_clk) +2^-17)) * 2^16 / steps)
+		 * With ideal_ppm = -5000
+		 */
+		amp_step = div_u64(311296ULL * pll_freq_khz,
+				   (ref_clk_khz << fd_div_prescale) * steps);
+		amp_step = DIV_ROUND_CLOSEST(amp_step, 1000U);
+
+		/* Compute Actual SSC PPM: (-1 * steps * amp_step / 2^16) /
+		 *  ((vco_freq / (vco_div / 2 * ref_clk)) + 2^-17) * 1000000
+		 * The resulting value is multiplied by -512 (for better precision)
+		 */
+		num = steps * amp_step * 15625U;
+		num *= ref_clk_khz << fd_div_prescale;
+		ppm = div_u64(num, pll_freq_khz * 2U);
+
+		/* Exit if the error is less than 0.5 PPM */
+		delta_ppm = abs(ppm - (4750 * 512));
+		if (delta_ppm <= 256) {
+			ssc_num_steps = steps;
+			ssc_amp_step = amp_step;
+			ssc_step_time = step_time;
+			break;
+		}
+
+		/* Otherwise look for the smallest error */
+		if (min_delta_ppm > delta_ppm) {
+			ssc_num_steps = steps;
+			ssc_amp_step = amp_step;
+			ssc_step_time = step_time;
+			min_delta_ppm = delta_ppm;
+		}
+	}
+
+	/* PLL spread spectrum control register 1 */
+	tp_reg_write(reg_base, CMN_PLLx_SS_CTRL1_Mx(pll_id), 1U);
+
+	/* PLL spread spectrum control register 2 */
+	if ((tech_tag & (TECH_TSMC_12 | TECH_TSMC_16 | TECH_TSMC_16_0805)) &&
+	    pll->ref_clk_khz == 24000) {
+		if (pll_freq_khz == 10000000)
+			ssc_amp_step = 0x0416;
+		else if (pll_freq_khz == 10800000)
+			ssc_amp_step = 0x044F;
+		else if (pll_freq_khz == 9720000)
+			ssc_amp_step = 0x0401;
+		else if (pll_freq_khz == 8640000)
+			ssc_amp_step = 0x038F;
+		else if (pll_freq_khz == 8100000)
+			ssc_amp_step = 0x0342;
+	} else if ((tech_tag & TECH_TSMC_7) && pll->ref_clk_khz == 24000 &&
+		   pll_freq_khz == 8000000) {
+		ssc_amp_step = 0x03C7;
+	} else if ((tech_tag & TECH_TSMC_5) && pll->ref_clk_khz == 24000) {
+		if (pll_freq_khz == 8000000)
+			ssc_amp_step = 0x03C7;
+		else if (pll_freq_khz == 10800000)
+			ssc_amp_step = 0x03DF;
+		else if (pll_freq_khz == 8100000)
+			ssc_amp_step = 0x03CA;
+		else if (pll_freq_khz == 9720000)
+			ssc_amp_step = 0x03A2;
+	}
+
+	tp_reg_write(reg_base, CMN_PLLx_SS_CTRL2_Mx(pll_id), ssc_amp_step);
+
+	/* PLL spread spectrum control register 3 */
+	if ((tech_tag & (TECH_TSMC_12 | TECH_TSMC_16 | TECH_TSMC_16_0805)) &&
+	    pll->ref_clk_khz == 24000) {
+		if (pll_freq_khz == 9720000)
+			ssc_num_steps = 0x007B;
+		else if (pll_freq_khz == 8640000)
+			ssc_num_steps = 0x007B;
+	}
+
+	tp_reg_write(reg_base, CMN_PLLx_SS_CTRL3_Mx(pll_id), ssc_num_steps);
+
+	/* PLL spread spectrum control register 4 */
+	tp_reg_write(reg_base, CMN_PLLx_SS_CTRL4_Mx(pll_id), ssc_step_time);
+}
+
+static void tp_write_pll_ctrl_reg(const struct tp_phy *tp_phy, enum tp_pll_id pll_id,
+				  u32 fd_div_prescale)
+{
+	u32 tech_tag = tp_phy->tech_tag;
+	u32 rev_msk = BIT(tp_phy->rev);
+	const struct tp_pll_data *pll = &tp_phy->plls[pll_id];
+	u32 pll_freq_khz = pll->freq_khz;
+	u16 bits_12_15;
+	u16 bit_8;
+	u16 bit_5;
+	u16 bit_4;
+	u16 bits_1_0;
+	u16 val;
+
+	/* PLL control register */
+	/* Compute bits 15:12 */
+	if (tech_tag & (TECH_TSMC_5 | TECH_SS_7 | TECH_SS_5)) {
+		/* For these cases, the bits are spare, so leave unchanged */
+		bits_12_15 = 1;
+	} else if ((tech_tag & TECH_TSMC_7) && (rev_msk & REV_MSK_R200P)) {
+		/* For this case, the bits are spare, so leave unchanged */
+		bits_12_15 = 1;
+	} else if (pll->fb_div_mode == PLL_FB_DIV_MODE_D32) {
+		bits_12_15 = 0;
+	} else if (pll->fb_div_mode == PLL_FB_DIV_MODE_FBR) {
+		if ((tech_tag & (TECH_TSMC_16 | TECH_TSMC_16_0805)) && (rev_msk & REV_MSK_R100)) {
+			if (!pll->fractional_mode || pll_freq_khz < 8000000)
+				bits_12_15 = 1;
+			else
+				bits_12_15 = 0;
+		} else {
+			if (!pll->fractional_mode)
+				bits_12_15 = 1;
+			else if (pll_freq_khz >= 8000000)
+				bits_12_15 = 0;
+			else if (pll_freq_khz >= 6000000)
+				bits_12_15 = 3;
+			else if (pll_freq_khz >= 5500000)
+				bits_12_15 = 2;
+			else if (pll_freq_khz >= 4750000)
+				bits_12_15 = 1;
+			else
+				bits_12_15 = 0;
+		}
+	} else {
+		/* PLL_FB_DIV_MODE_DR */
+		if (((tech_tag & TECH_TSMC_7) && (rev_msk & (REV_MSK_R100 | REV_MSK_R110))) ||
+		    pll->ref_clk_khz != 100000)
+			bits_12_15 = 0;
+		else
+			bits_12_15 = 1;
+	}
+
+	/* Compute bit 8: PLL VCO mode select: LC tank (0) / ring oscillator (1) */
+	bit_8 = (pll_freq_khz >= 8000000) ? 0 : 1;
+
+	/*
+	 * Compute bit 5: PLL feedback divider mode select: FBR (0) /
+	 * D32 (1) / DR (1)
+	 */
+	bit_5 = (pll->fb_div_mode == PLL_FB_DIV_MODE_FBR) ? 0 : 1;
+
+	/* Compute bit 4: PLL feedback divider prescale */
+	bit_4 = fd_div_prescale;
+
+	/* Compute bit 1:0 */
+	if (pll->fb_div_mode != PLL_FB_DIV_MODE_DR || pll->ref_clk_khz != 100000)
+		bits_1_0 = 2;
+	else if (tech_tag & (TECH_SS_5 | TECH_SS_7))
+		bits_1_0 = 1;
+	else
+		bits_1_0 = 0;
+
+	val = bits_1_0 | (bit_4 << 4) | (bit_5 << 5) | (bit_8 << 8) | (bits_12_15 << 12);
+
+	tp_reg_write(&tp_phy->reg_common_cdb, CMN_PDIAG_PLLx_CTRL_Mx(pll_id), val);
+}
+
+static void tp_write_pll_cp_padj(const struct tp_phy *tp_phy, enum tp_pll_id pll_id)
+{
+	u32 tech_tag = tp_phy->tech_tag;
+	u32 rev_msk = BIT(tp_phy->rev);
+	const struct tp_pll_data *pll = &tp_phy->plls[pll_id];
+	u16 val;
+
+	/* PLL charge pump proportional path adjust register */
+	if (pll->freq_khz < 8000000) {
+		val = 0x0B17;
+	} else if (pll->fractional_mode) {
+		if (tech_tag & TECH_TSMC_7)
+			val = 0x0B17;
+		else if (tech_tag & (TECH_SS_5 | TECH_SS_7))
+			val = 0x0309;
+		else
+			val = 0x0509; /* TSMC_5, TSMC_12, TSMC_16, TSMC_16_0805 */
+	} else if (pll->freq_khz >= 10000000) {
+		if (tech_tag & TECH_TSMC_7)
+			val = (rev_msk & (REV_MSK_R100 | REV_MSK_R110)) ? 0x0023 : 0x0035;
+		else if (tech_tag & TECH_TSMC_5)
+			val = (pll_id == PLL0_MODE0) ? 0x002D : 0x0035;
+		else if (tech_tag & (TECH_SS_5 | TECH_SS_7))
+			val = 0x013E;
+		else
+			val = 0x0028; /* TSMC_12, TSMC_16, TSMC_16_0805 */
+	} else {
+		if (tech_tag & TECH_TSMC_16)
+			val = (rev_msk & REV_MSK_R100) ? 0x0028 : 0x0128;
+		else if (tech_tag & TECH_TSMC_16_0805)
+			val = 0x0128;
+		else if (tech_tag & TECH_TSMC_12)
+			val = 0x0028;
+		else if (tech_tag & TECH_TSMC_7)
+			val = (rev_msk & (REV_MSK_R100 | REV_R110)) ? 0x001D : 0x0031;
+		else if (tech_tag & TECH_TSMC_5)
+			val = (pll_id == PLL0_MODE1) ? 0x0012 : 0x0031;
+		else
+			val = 0x0131; /* SS_7, SS_5 */
+	}
+
+	tp_reg_write(&tp_phy->reg_common_cdb, CMN_PDIAG_PLLx_CP_PADJ_Mx(pll_id), val);
+}
+
+static void tp_write_pll_cp_iadj(const struct tp_phy *tp_phy, enum tp_pll_id pll_id)
+{
+	u32 tech_tag = tp_phy->tech_tag;
+	u32 rev_msk = BIT(tp_phy->rev);
+	const struct tp_pll_data *pll = &tp_phy->plls[pll_id];
+	u16 val;
+
+	/* PLL charge pump integral path adjust register */
+	if (pll->freq_khz < 8000000) {
+		val = 0x0E01;
+	} else if (pll->fractional_mode) {
+		if (tech_tag & (TECH_TSMC_16 | TECH_TSMC_16_0805 | TECH_TSMC_12))
+			val = 0x0F00;
+		else if (tech_tag & (TECH_TSMC_7 | TECH_TSMC_5))
+			val = 0x0E01;
+		else /* SS_7, SS_5 */
+			val = 0x0E02;
+	} else {
+		if (tech_tag & (TECH_TSMC_16 | TECH_TSMC_16_0805 | TECH_TSMC_12))
+			val = 0x0808;
+		else if (tech_tag & TECH_TSMC_7)
+			val = (rev_msk & (REV_MSK_R100 | REV_MSK_R110)) ? 0x0F0D : 0x0F07;
+		else if (tech_tag & TECH_TSMC_5)
+			val = 0x0F07;
+		else /* SS_7, SS_5 */
+			val = 0x0F0D;
+	}
+
+	tp_reg_write(&tp_phy->reg_common_cdb, CMN_PDIAG_PLLx_CP_IADJ_Mx(pll_id), val);
+}
+
+static void tp_write_pll_filt_padj(const struct tp_phy *tp_phy, enum tp_pll_id pll_id)
+{
+	u32 tech_tag = tp_phy->tech_tag;
+	u32 rev_msk = BIT(tp_phy->rev);
+	const struct tp_pll_data *pll = &tp_phy->plls[pll_id];
+	u16 val;
+
+	/* PLL proportional path filter adjust register */
+	if (pll->freq_khz < 8000000) {
+		val = 0x0D05;
+	} else if (pll->fractional_mode) {
+		if (tech_tag & (TECH_TSMC_16 | TECH_TSMC_16_0805 | TECH_TSMC_12))
+			val = 0x0F08;
+		else if (tech_tag & (TECH_TSMC_7 | TECH_TSMC_5))
+			val = 0x0D05;
+		else /* SS_7, SS_5 */
+			val = 0x0D07;
+	} else {
+		if (tech_tag & (TECH_TSMC_16 | TECH_TSMC_16_0805 | TECH_TSMC_12))
+			val = 0x0000;
+		else if (tech_tag & TECH_TSMC_7)
+			val = ((pll_id == PLL0_MODE1) && (rev_msk & REV_MSK_R200P)) ?
+				0x0001 : 0x0100;
+		else if (tech_tag & TECH_TSMC_5)
+			val = (pll_id == PLL0_MODE1) ? 0x0001 : 0x0100;
+		else /* TECH_TSMC_7, TECH_TSMC_5, SS_7, SS_5 */
+			val = 0x0100;
+	}
+
+	tp_reg_write(&tp_phy->reg_common_cdb, CMN_PDIAG_PLLx_FILT_PADJ_Mx(pll_id), val);
+}
+
+static int tp_write_pll_clk_sel(const struct tp_phy *tp_phy, enum tp_pll_id pll_id)
+{
+	const struct tp_link_cfg *link_cfg = tp_phy->link_cfg;
+	u16 val = 0;
+
+	if (link_cfg->pll_freq[pll_id] == PLL_DP) {
+		const struct tp_link *link = tp_dp_link_from_pll_id(tp_phy, pll_id);
+
+		if (!link)
+			return -EINVAL;
+
+		val = tp_dp_pll_clk_sel_from_bit_rate(link->max_bit_rate);
+	} else {
+		val = link_cfg->pll_clk_sel[pll_id];
+		if (WARN_ON(val == REG_COMPUTED))
+			return -EINVAL;
+	}
+
+	tp_reg_write(&tp_phy->reg_common_cdb, CMN_PDIAG_PLLx_CLK_SEL_Mx(pll_id), val);
+	return 0;
+}
+
+static void tp_write_xcvr_diag_hsclk_sel(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	u16 val = tp_phy->link_cfg->xcvr_diag_hsclk_sel[link->std_idx];
+
+	tp_write_lanes_reg(link, tp_phy->reg_tx_lane_cdb, XCVR_DIAG_HSCLK_SEL, val);
+}
+
+static void tp_write_xcvr_diag_hsclk_div(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	u16 val;
+
+	if (link->type == STD_TYPE_DP)
+		val = tp_dp_xcvr_diag_hsclk_div_from_bit_rate(link->max_bit_rate);
+	else
+		val = tp_phy->link_cfg->xcvr_diag_hsclk_div[link->std_idx];
+
+	tp_write_lanes_reg(link, tp_phy->reg_tx_lane_cdb, XCVR_DIAG_HSCLK_DIV, val);
+}
+
+static void tp_write_xcvr_diag_plldrc_ctrl(const struct tp_phy *tp_phy,
+					   const struct tp_link *link)
+{
+	u16 val = tp_phy->link_cfg->xcvr_diag_plldrc_ctrl[link->std_idx];
+
+	tp_write_lanes_reg(link, tp_phy->reg_tx_lane_cdb, XCVR_DIAG_PLLDRC_CTRL, val);
+}
+
+static u32 tp_calc_pll_fb_div_clk_khz(const struct tp_pll_data *pll)
+{
+	switch (pll->fb_div_mode) {
+	case PLL_FB_DIV_MODE_FBR:
+		return pll->ref_clk_khz;
+	case PLL_FB_DIV_MODE_D32:
+		return pll->freq_khz / 32U;
+	default:
+		return 500000;
+	}
+}
+
+static void tp_write_pll_vco_regs(const struct tp_phy *tp_phy, enum tp_pll_id pll_id)
+{
+	const struct tp_reg_base *base = &tp_phy->reg_common_cdb;
+	const struct tp_standard *std0 = &tp_phy->standards[0];
+	const struct tp_pll_data *pll = &tp_phy->plls[pll_id];
+	u32 ref_clk_hz = pll->ref_clk_khz * 1000U;
+	u32 tech_tag = tp_phy->tech_tag;
+	u32 rev_msk = BIT(tp_phy->rev);
+	u16 vcocal_reftim_start;
+	u16 vco_cnt_subtract;
+	u32 fb_div_clk_khz;
+	u16 val;
+
+	/* Check if PCIE_SL is used with a reference clock of 100 MHz */
+	bool pcie_sl_with_100mhz = (ref_clk_hz == 100000000U) && (std0->type == STD_TYPE_PCIE) &&
+				   ((std0->flags & STD_FLAG_PCIE_ML) == 0);
+
+	/* VCO calibration initial time scale control */
+	if ((tech_tag & (TECH_TSMC_16 | TECH_TSMC_16_0805 | TECH_TSMC_12 | TECH_TSMC_7)) &&
+	    !pcie_sl_with_100mhz)
+		tp_reg_write(base, CMN_PLLx_VCOCAL_TCTRL(pll_id), 3);
+
+	/* VCO calibration initialization time */
+	tp_reg_write(base, CMN_PLLx_VCOCAL_INIT_TMR(pll_id),
+		     tp_calc_pll_ref_clk_reg(ref_clk_hz, 10000));
+
+	/* VCO calibration iteration time */
+	tp_reg_write(base, CMN_PLLx_VCOCAL_ITER_TMR(pll_id),
+		     tp_calc_pll_ref_clk_reg(ref_clk_hz, 160));
+
+	/* VCO cal ref timer start */
+	vco_cnt_subtract = (pll->ref_clk_khz != 100000U) || pll->ssc;
+	vcocal_reftim_start = tp_calc_pll_ref_clk_reg(ref_clk_hz, 31670) - vco_cnt_subtract;
+
+	tp_reg_write(base, CMN_PLLx_VCOCAL_REFTIM_START(pll_id), vcocal_reftim_start);
+
+	/* Feedback divider clock period: Compute a frequency in kHz */
+	fb_div_clk_khz = tp_calc_pll_fb_div_clk_khz(pll);
+
+	/* VCO cal PLL clock counter start */
+	if (!pll->ssc && pcie_sl_with_100mhz &&
+	    ((tech_tag & (TECH_TSMC_5 | TECH_SS_5 | TECH_SS_7)) ||
+	    ((tech_tag & TECH_TSMC_7) && (rev_msk & REV_MSK_R200P)))) {
+		/* Special condition */
+		val = 0x3DDA;
+	} else if (pll->ssc) {
+		/* SSC enabled:
+		 * [(vcocal_reftim_start + 1) / ref_clk] / [1.0025 / fb_div_clk]
+		 */
+		u64 num = (vcocal_reftim_start + 1U) * fb_div_clk_khz;
+
+		val = DIV_U64_ROUND_CLOSEST(num * 10000U, 10025U * pll->ref_clk_khz) - 1U;
+	} else {
+		/* SSC disabled:
+		 * [(vcocal_reftim_start + 1) / ref_clk] / fb_div_clk
+		 */
+		u32 num = (vcocal_reftim_start + 1U) * fb_div_clk_khz;
+
+		val = DIV_ROUND_CLOSEST(num, pll->ref_clk_khz) - 1U;
+	}
+	tp_reg_write(base, CMN_PLLx_VCOCAL_PLLCNT_START(pll_id), val);
+}
+
+static void tp_write_pll_lock_regs(const struct tp_phy *tp_phy, enum tp_pll_id pll_id)
+{
+	const struct tp_reg_base *base = &tp_phy->reg_common_cdb;
+	const struct tp_pll_data *pll = &tp_phy->plls[pll_id];
+	u32 ref_clk_hz = pll->ref_clk_khz * 1000U;
+	u16 lock_refcnt_start;
+	u16 lock_pllcnt_start;
+	u16 lock_cnt_subtract;
+	u32 fb_div_clk_khz;
+	u16 val;
+
+	lock_cnt_subtract = tp_get_pll_lock_cnt_subtract(tp_phy, pll);
+
+	/* Lock reference clock counter start (ideal / programmed) */
+	if (pll->fb_div_mode == PLL_FB_DIV_MODE_FBR) {
+		if (ref_clk_hz >= 100000000U)
+			lock_refcnt_start = tp_calc_pll_ref_clk_reg(ref_clk_hz, 2000);
+		else
+			lock_refcnt_start = tp_calc_pll_ref_clk_reg(ref_clk_hz, 8000);
+	} else if (pll->fb_div_mode == PLL_FB_DIV_MODE_D32) {
+		lock_refcnt_start = tp_calc_pll_ref_clk_reg(ref_clk_hz, 1000);
+	} else {
+		lock_refcnt_start = tp_calc_pll_ref_clk_reg(ref_clk_hz, 800);
+	}
+
+	val = lock_refcnt_start - lock_cnt_subtract;
+	tp_reg_write(base, CMN_PLLx_LOCK_REFCNT_START(pll_id), val);
+
+	/* Feedback divider clock period: Compute a frequency in kHz */
+	fb_div_clk_khz = tp_calc_pll_fb_div_clk_khz(pll);
+
+	/* Lock PLL feedback divider clock count start */
+	if (pll->ssc) {
+		u64 num;
+
+		/* SSC enabled:
+		 * [lock_refcnt_start / ref_clk] / [1.0025 / fb_div_clk]
+		 */
+		num = fb_div_clk_khz * lock_refcnt_start;
+		lock_pllcnt_start = DIV_U64_ROUND_CLOSEST(num * 10000U,
+							  10025U * pll->ref_clk_khz);
+	} else {
+		/* SSC disabled:
+		 * [lock_refcnt_start / ref_clk] / [1.0 / fb_div_clk]
+		 */
+		lock_pllcnt_start = DIV_ROUND_CLOSEST(lock_refcnt_start * fb_div_clk_khz,
+						      pll->ref_clk_khz);
+	}
+	val = lock_pllcnt_start - lock_cnt_subtract;
+	tp_reg_write(base, CMN_PLLx_LOCK_PLLCNT_START(pll_id), val);
+
+	/* Special case */
+	if (pll->fb_div_mode == PLL_FB_DIV_MODE_FBR && !pll->ssc) {
+		val = 3;
+	} else {
+		u32 err_in_ref_time = 0;
+		u32 err_rel_ref_clk;
+		u32 actual_cnt;
+		u64 num;
+
+		/* Error in reference time, in per 10000 */
+		if (pll->ssc)
+			err_in_ref_time = 25U - (lock_refcnt_start * 781250U) / ref_clk_hz;
+
+		/* Actual PLL feedback divider count time multiplied by reference clock and
+		 * by 10000: lock_pllcnt_start * ref_clk * 1e4 / fb_div_clk
+		 */
+		num = pll->ref_clk_khz * lock_pllcnt_start;
+		actual_cnt = div_u64(num * (pll->ssc ? 10025U : 10000U), fb_div_clk_khz);
+
+		/* Error in the PLL counter relative to the reference clock time, in per 10000 */
+		err_rel_ref_clk = abs(10000U * lock_refcnt_start - actual_cnt)
+				/ lock_refcnt_start;
+
+		val = DIV_ROUND_UP((err_in_ref_time + err_rel_ref_clk) *
+				   lock_pllcnt_start, 10000U) + 4U;
+	}
+	tp_reg_write(base, CMN_PLLx_LOCK_PLLCNT_THR(pll_id), val);
+}
+
+static void tp_write_pll_fd_div_regs(const struct tp_phy *tp_phy, enum tp_pll_id pll_id,
+				     u32 div_ratio)
+{
+	const struct tp_reg_base *base = &tp_phy->reg_common_cdb;
+	const struct tp_pll_data *pll = &tp_phy->plls[pll_id];
+	u32 tech_tag = tp_phy->tech_tag;
+	u16 high_div;
+	u16 low_div;
+
+	/* In fractional mode, we use default/reset value */
+	if (pll->fractional_mode)
+		return;
+
+	if (pll_id == PLL0_MODE0 && pll->ref_clk_khz == 100000 && pll->freq_khz == 10000000) {
+		/* 100 MHz refclk, 10 GHz PLL */
+		if (tech_tag & (TECH_TSMC_12 | TECH_TSMC_16 | TECH_TSMC_16_0805)) {
+			high_div = 30;
+			low_div = 12;
+		} else {
+			high_div = 36;
+			low_div = 6;
+		}
+	} else if (pll->ref_clk_khz == 100000 && pll->freq_khz == 8000000) {
+		/* 100 MHz refclk, 8 GHz PLL */
+		if (tech_tag & (TECH_TSMC_12 | TECH_TSMC_16 | TECH_TSMC_16_0805)) {
+			high_div = 16;
+			low_div = 16;
+		} else {
+			high_div = 28;
+			low_div = 4;
+		}
+	} else {
+		/* Generic calculations */
+
+		/* PLL high integer divider val: EVEN(div_ratio_2 * 67/100) - 4 */
+		high_div = DIV_ROUND_UP((div_ratio >> 1) * 67U, 100U);
+		high_div -= (high_div & 1U) ? 3U : 4U;
+
+		/* PLL low integer divider val: div_ratio_2 - 8 - high_div */
+		low_div = (div_ratio >> 1) - 8 - high_div;
+	}
+
+	tp_reg_write(base, CMN_PLLx_DSM_FBH_OVRD_Mx(pll_id), high_div);
+	tp_reg_write(base, CMN_PLLx_DSM_FBL_OVRD_Mx(pll_id), low_div);
+}
+
+static void tp_write_pll_itrim_reg(const struct tp_phy *tp_phy, enum tp_pll_id pll_id)
+{
+	const struct tp_reg_base *base = &tp_phy->reg_common_cdb;
+	const struct tp_pll_data *pll = &tp_phy->plls[pll_id];
+
+	if (tp_phy->tech_tag & TECH_TSMC_ALL) {
+		u16 val = (pll->freq_khz >= 10000000) ? 0x003F : 0x007F;
+
+		tp_reg_write(base, CMN_PDIAG_PLLx_ITRIM_Mx(pll_id), val);
+	}
+}
+
+static void tp_write_pll_regs(const struct tp_phy *tp_phy, enum tp_pll_id pll_id)
+{
+	const struct tp_reg_base *base = &tp_phy->reg_common_cdb;
+	const struct tp_pll_data *pll = &tp_phy->plls[pll_id];
+	u32 fd_div_prescale;
+	u32 div_ratio;
+	u16 fracdivl;
+	u16 val;
+
+	if (pll_id != PLL0_MODE1)
+		tp_write_pll_vco_regs(tp_phy, pll_id);
+
+	/* Divide ratio */
+	div_ratio = pll->freq_khz / pll->ref_clk_khz;
+
+	/* PLL feedback divider prescale */
+	fd_div_prescale = ((!pll->fractional_mode) || (div_ratio > 512)) ? 1 : 0;
+
+	/* PLL integer divider value */
+	val = (pll->fractional_mode) ? (div_ratio >> fd_div_prescale) : 0;
+	tp_reg_write(base, CMN_PLLx_INTDIV_Mx(pll_id), val);
+
+	/* PLL fractional divider value */
+	if (pll->fractional_mode) {
+		u32 den = pll->ref_clk_khz << fd_div_prescale;
+		u32 rem = pll->freq_khz % den;
+
+		fracdivl = DIV_ROUND_CLOSEST(rem << 16, den);
+	} else {
+		fracdivl = 0;
+	}
+
+	tp_reg_write(base, CMN_PLLx_FRACDIVL_Mx(pll_id), fracdivl);
+	tp_reg_write(base, CMN_PLLx_FRACDIVH_Mx(pll_id), pll->fractional_mode ? 2 : 0);
+
+	/* PLL high threshold value */
+	if (pll->fractional_mode) {
+		/* EVEN(CEIL((fracdivl/65536 + (div_ratio >> fd_div_prescale)) * 2 / 3)) */
+		u32 num = fracdivl + (div_ratio << (16 - fd_div_prescale));
+
+		val = DIV_ROUND_UP(num, 3 << 15);
+		if (val & 1)
+			val++;
+	} else {
+		val = 0;
+	}
+
+	tp_reg_write(base, CMN_PLLx_HIGH_THR_Mx(pll_id), val);
+
+	/* PLL delta sigma modulator diagnostics register */
+	tp_reg_write(base, CMN_PLLx_DSM_DIAG_Mx(pll_id),
+		     pll->fractional_mode ? 0x0004 : 0x4004);
+
+	/* PLL high and low integer divider value */
+	tp_write_pll_fd_div_regs(tp_phy, pll_id, div_ratio);
+
+	if (pll->ssc)
+		tp_write_ssc_ctrl(tp_phy, pll_id, fd_div_prescale);
+
+	if (pll_id != PLL0_MODE1)
+		tp_write_pll_lock_regs(tp_phy, pll_id);
+
+	tp_write_pll_ctrl_reg(tp_phy, pll_id, fd_div_prescale);
+	tp_write_pll_itrim_reg(tp_phy, pll_id);
+	tp_write_pll_cp_padj(tp_phy, pll_id);
+	tp_write_pll_cp_iadj(tp_phy, pll_id);
+	tp_write_pll_filt_padj(tp_phy, pll_id);
+}
+
+static int tp_configure_links(struct tp_phy *tp_phy)
+{
+	const struct tp_link_cfg *link_cfg = tp_phy->link_cfg;
+	int ret;
+
+	ret = tp_init_plls_data(tp_phy);
+	if (ret)
+		return ret;
+
+	tp_reg_field_write(&tp_phy->phy_pll_cfg, link_cfg->phy_pll_cfg);
+
+	for (u32 i = 0; i < TP_NB_PLLS; ++i) {
+		ret = tp_write_pll_clk_sel(tp_phy, i);
+		if (ret)
+			return ret;
+	}
+
+	tp_write_refclk_rcv_out_en(tp_phy);
+	tp_write_refclk_regs(tp_phy);
+	tp_write_ana_cfg(tp_phy);
+
+	for (u32 i = 0; i < TP_NB_PLLS; ++i) {
+		if (tp_phy->plls[i].freq_khz)
+			tp_write_pll_regs(tp_phy, i);
+	}
+
+	for (u8 i = 0; i < tp_phy->nb_links; ++i) {
+		const struct tp_link *link = &tp_phy->links[i];
+
+		tp_write_xcvr_diag_hsclk_sel(tp_phy, link);
+		tp_write_xcvr_diag_hsclk_div(tp_phy, link);
+		tp_write_xcvr_diag_plldrc_ctrl(tp_phy, link);
+
+		tp_write_phy_pipe_usb3_gen2_cfg(tp_phy, link);
+		tp_write_cmn_cdiag_pwri_ovrd(tp_phy, link);
+
+		tp_write_tx_txcc_ctrl(tp_phy, link);
+		tp_write_tx_txcc_cpost_mult_00(tp_phy, link);
+		tp_write_tx_txcc_cpost_mult_01(tp_phy, link);
+		tp_write_tx_txcc_mgnfs_mult_000(tp_phy, link);
+		tp_write_tx_txcc_mgnfs_mult_100(tp_phy, link);
+		tp_write_drv_diag_tx_drv(tp_phy, link);
+		tp_write_xcvr_diag_rxclk_ctrl(tp_phy, link);
+		tp_write_xcvr_diag_bidi_ctrl(tp_phy, link);
+		tp_write_xcvr_diag_psc_ovrd(tp_phy, link);
+		tp_write_tx_psc_a0(tp_phy, link);
+		tp_write_tx_psc_a1(tp_phy, link);
+		tp_write_tx_psc_a2_a3(tp_phy, link);
+
+		tp_write_rx_psc_a0(tp_phy, link);
+		tp_write_rx_psc_a1(tp_phy, link);
+		tp_write_rx_psc_a2(tp_phy, link);
+		tp_write_rx_psc_a3(tp_phy, link);
+		tp_write_rx_psc_cal(tp_phy, link);
+		tp_write_rx_cdrlf_cnfg(tp_phy, link);
+		tp_write_rx_cdrlf_cnfg2(tp_phy, link);
+		tp_write_rx_cdrlf_cnfg3(tp_phy, link);
+		tp_write_rx_sigdet_hl_filt_tmr(tp_phy, link);
+		tp_write_rx_ree_gcsm1_ctrl(tp_phy, link);
+		tp_write_rx_ree_gcsm1_eqenm_ph1(tp_phy, link);
+		tp_write_rx_ree_gcsm1_eqenm_ph2(tp_phy, link);
+		tp_write_rx_ree_gcsm2_ctrl(tp_phy, link);
+		tp_write_rx_ree_pergcsm_ctrl(tp_phy, link);
+		tp_write_rx_ree_peak_uthr(tp_phy, link);
+		tp_write_rx_ree_peak_lthr(tp_phy, link);
+		tp_write_rx_ree_atten_thr(tp_phy, link);
+		tp_write_rx_ree_tap_clip(tp_phy, link);
+		tp_write_rx_ree_smgm_ctrl1(tp_phy, link);
+		tp_write_rx_ree_smgm_ctrl2(tp_phy, link);
+		tp_write_rx_diag_dfe_ctrl(tp_phy, link);
+		tp_write_rx_diag_dfe_amp_tune_2(tp_phy, link);
+		tp_write_rx_diag_dfe_amp_tune_3(tp_phy, link);
+		tp_write_rx_diag_ree_dac_ctrl(tp_phy, link);
+		tp_write_rx_diag_nqst_ctrl(tp_phy, link);
+		tp_write_rx_diag_sigdet_tune(tp_phy, link);
+		tp_write_rx_diag_pi_rate(tp_phy, link);
+		tp_write_rx_diag_pi_cap(tp_phy, link);
+		tp_write_rx_diag_acya(tp_phy, link);
+	}
+
+	return 0;
+}
+
+static int tp_dp_update_pll_freq(struct tp_phy *tp_phy, const struct tp_link *link,
+				 enum tp_pll_id pll_id, u32 bit_rate, bool ssc)
+{
+	const struct tp_link_cfg *link_cfg = tp_phy->link_cfg;
+	struct tp_pll_data *pll = &tp_phy->plls[pll_id];
+	u32 pll_freq_khz = 0;
+	u16 val;
+
+	if (link_cfg->pll_freq[pll_id] != PLL_DP)
+		return -EINVAL;
+
+	pll_freq_khz = tp_dp_pll_freq_from_bit_rate(bit_rate);
+	if (pll_freq_khz == 0)
+		return -EINVAL;
+
+	pll->freq_khz = pll_freq_khz;
+	pll->ssc = ssc;
+	pll->fractional_mode = tp_is_pll_fractional_mode_required(pll);
+
+	val = tp_dp_pll_clk_sel_from_bit_rate(bit_rate);
+	tp_reg_write(&tp_phy->reg_common_cdb, CMN_PDIAG_PLLx_CLK_SEL_Mx(pll_id), val);
+
+	val = tp_dp_xcvr_diag_hsclk_div_from_bit_rate(bit_rate);
+	tp_write_lanes_reg(link, tp_phy->reg_tx_lane_cdb, XCVR_DIAG_HSCLK_DIV, val);
+
+	tp_write_pll_lock_tmr(tp_phy, pll_id);
+	tp_write_pll_regs(tp_phy, pll_id);
+
+	return 0;
+}
+
+/*
+ * Perform register operations related to setting link rate, once powerstate is
+ * set and PLL disable request was processed.
+ */
+static int tp_dp_configure_rate(struct tp_phy *tp_phy, const struct tp_link *link,
+				const struct phy_configure_opts_dp *dp)
+{
+	struct tp_reg_base *reg_base = &tp_phy->reg_phy_pma_common_cdb;
+	u16 pll_mask;
+	u16 val;
+	int ret;
+
+	pll_mask = 1U << link->std_idx;
+
+	/*
+	 * Disable the associated PLL (cmn_pll0_en or cmn_pll1_en) before
+	 * re-programming the new data rate.
+	 */
+	tp_reg_clear_bits(reg_base, PHY_PMA_PLL_RAW_CTRL, pll_mask);
+
+	/*
+	 * Wait for PLL ready de-assertion.
+	 * For PLL0 - PHY_PMA_CMN_CTRL2[2] == 1
+	 * For PLL1 - PHY_PMA_CMN_CTRL2[3] == 1
+	 */
+	ret = read_poll_timeout(tp_reg_read, val, (val & (pll_mask << 2)) != 0, 0,
+				POLL_TIMEOUT_US, false, reg_base, PHY_PMA_CMN_CTRL2);
+	if (ret)
+		return ret;
+
+	ndelay(200);
+
+	/* Reconfigure registers associated with link rate */
+	return tp_dp_update_pll_freq(tp_phy, link,
+				     (link->std_idx == 0) ? PLL0_MODE0 : PLL1_MODE0,
+				     dp->link_rate, dp->ssc);
+}
+
+static int tp_dp_enable_pll(const struct tp_phy *tp_phy, const struct tp_link *link)
+{
+	const struct tp_reg_base *reg_base = &tp_phy->reg_phy_pma_common_cdb;
+	u16 pll_mask;
+	u16 val;
+
+	pll_mask = 1U << link->std_idx;
+
+	/* Enable the associated PLL (cmn_pll0_en or cmn_pll1_en) */
+	tp_reg_set_bits(reg_base, PHY_PMA_PLL_RAW_CTRL, pll_mask);
+
+	/*
+	 * Wait for PLL ready assertion.
+	 * For PLL0 - PHY_PMA_CMN_CTRL2[0] == 1
+	 * For PLL1 - PHY_PMA_CMN_CTRL2[1] == 1
+	 */
+	return read_poll_timeout(tp_reg_read, val, (val & pll_mask) != 0, 0, POLL_TIMEOUT_US,
+				 false, reg_base, PHY_PMA_CMN_CTRL2);
+}
+
+/* Verify, that parameters to configure PHY with are correct. */
+static int tp_dp_verify_config(const struct tp_link *link,
+			       const struct phy_configure_opts_dp *dp)
+{
+	u32 num_lanes;
+
+	/* If changing link rate was required, verify it's supported. */
+	if (dp->set_rate) {
+		if (tp_dp_pll_freq_from_bit_rate(dp->link_rate) == 0)
+			return -EINVAL;
+	}
+
+	/* Verify lane count. */
+	if (dp->set_lanes) {
+		switch (dp->lanes) {
+		case 1:
+		case 2:
+		case 4:
+			/* valid lane count. */
+			break;
+		default:
+			return -EINVAL;
+		}
+
+		/* Check against actual number of PHY's lanes. */
+		if (dp->lanes > link->max_lanes)
+			return -EINVAL;
+
+		num_lanes = dp->lanes;
+	} else {
+		num_lanes = link->num_lanes;
+	}
+
+	/* If changing voltages is required, check swing and pre-emphasis levels, per-lane. */
+	if (dp->set_voltages) {
+		/* Lane count verified previously. */
+		for (u32 i = 0; i < num_lanes; ++i) {
+			if (dp->voltage[i] > 3 || dp->pre[i] > 3)
+				return -EINVAL;
+
+			/* Sum of voltage swing and pre-emphasis levels cannot exceed 3. */
+			if (dp->voltage[i] + dp->pre[i] > 3)
+				return -EINVAL;
+		}
+	}
+
 	return 0;
 }
 
 /*
  * Enable or disable PLL for selected lanes.
  */
-static int cdns_torrent_dp_set_pll_en(struct cdns_torrent_phy *cdns_phy,
-				      struct cdns_torrent_inst *inst,
-				      struct phy_configure_opts_dp *dp,
-				      bool enable)
+static int tp_dptx_set_pll_en(const struct tp_phy *tp_phy, u32 num_lanes, bool enable)
 {
-	struct regmap *regmap = cdns_phy->regmap_dptx_phy_reg;
-	u32 rd_val, pll_ack_val;
+	void __iomem *addr;
+	u32 pll_ack_val;
+	u32 rd_val;
 	int ret;
 
-	/*
-	 * Used to determine, which bits to check for or enable in
-	 * PHY_PMA_XCVR_PLLCLK_EN register.
-	 */
+	/* Used to determine which bits to check for or enable in PHY_PMA_XCVR_PLLCLK_EN reg */
 	u32 pll_bits;
 	/* Used to enable or disable lanes. */
 	u32 pll_val;
 
-	/* Select values of registers and mask, depending on enabled lane count. */
-	pll_val = cdns_torrent_dp_read(regmap, PHY_PMA_XCVR_PLLCLK_EN);
+	/* Select reg value and mask, depending on enabled lane count. */
+	pll_val = tp_reg_dptx_read(tp_phy, PHY_PMA_XCVR_PLLCLK_EN);
 
 	if (enable) {
-		pll_bits = ((1 << dp->lanes) - 1);
+		pll_bits = ((1 << num_lanes) - 1);
 		pll_val |= pll_bits;
 		pll_ack_val = pll_bits;
 	} else {
-		pll_bits = ((1 << inst->num_lanes) - 1);
+		pll_bits = ((1 << num_lanes) - 1);
 		pll_val &= (~pll_bits);
 		pll_ack_val = 0;
 	}
 
-	cdns_torrent_dp_write(regmap, PHY_PMA_XCVR_PLLCLK_EN, pll_val);
+	tp_reg_dptx_write(tp_phy, PHY_PMA_XCVR_PLLCLK_EN, pll_val);
 
 	/* Wait for acknowledgment from PHY. */
-	ret = regmap_read_poll_timeout(regmap,
-				       PHY_PMA_XCVR_PLLCLK_EN_ACK,
-				       rd_val,
-				       (rd_val & pll_bits) == pll_ack_val,
-				       0, POLL_TIMEOUT_US);
+	addr = tp_phy->base + PHY_PMA_XCVR_PLLCLK_EN_ACK;
+	ret = readl_poll_timeout(addr, rd_val, (rd_val & pll_bits) == pll_ack_val, 0,
+				 POLL_TIMEOUT_US);
+	if (ret < 0) {
+		dev_err(tp_phy->dev, "timeout waiting for link PLL clock enable ack\n");
+		return ret;
+	}
+
 	ndelay(100);
-	return ret;
+	return 0;
 }
 
-static int cdns_torrent_dp_set_power_state(struct cdns_torrent_phy *cdns_phy,
-					   struct cdns_torrent_inst *inst,
-					   u32 num_lanes,
-					   enum phy_powerstate powerstate)
+static int tp_dptx_set_power_state(const struct tp_phy *tp_phy, u32 mlane, u32 num_lanes,
+				   enum phy_powerstate powerstate)
 {
-	/* Register value for power state for a single byte. */
-	u32 value_part, i;
+	void __iomem *addr;
+	u32 value_part;
 	u32 value = 0;
 	u32 mask = 0;
 	u32 read_val;
 	int ret;
-	struct regmap *regmap = cdns_phy->regmap_dptx_phy_reg;
 
 	switch (powerstate) {
-	case (POWERSTATE_A0):
+	case POWERSTATE_A0:
 		value_part = 0x01U;
 		break;
-	case (POWERSTATE_A2):
+	case POWERSTATE_A2:
 		value_part = 0x04U;
 		break;
+	case POWERSTATE_A3:
 	default:
-		/* Powerstate A3 */
 		value_part = 0x08U;
 		break;
 	}
 
 	/* Select values of registers and mask, depending on enabled lane count. */
+	for (u32 i = 0; i < num_lanes; ++i) {
+		value |= value_part << PHY_POWER_STATE_LN(mlane + i);
+		mask |= PMA_XCVR_POWER_STATE_REQ_LN_MASK << PHY_POWER_STATE_LN(mlane + i);
+	}
 
-	for (i = 0; i < num_lanes; i++) {
-		value |= (value_part << PHY_POWER_STATE_LN(i));
-		mask |= (PMA_XCVR_POWER_STATE_REQ_LN_MASK << PHY_POWER_STATE_LN(i));
+	/* Do not got to power state A3 if already off */
+	if (powerstate == POWERSTATE_A3) {
+		read_val = tp_reg_dptx_read(tp_phy, PHY_PMA_XCVR_POWER_STATE_ACK);
+		if ((read_val & mask) == 0)
+			return 0;
 	}
 
 	/* Set power state A<n>. */
-	cdns_torrent_dp_write(regmap, PHY_PMA_XCVR_POWER_STATE_REQ, value);
+	tp_reg_dptx_write(tp_phy, PHY_PMA_XCVR_POWER_STATE_REQ, value);
+
 	/* Wait, until PHY acknowledges power state completion. */
-	ret = regmap_read_poll_timeout(regmap, PHY_PMA_XCVR_POWER_STATE_ACK,
-				       read_val, (read_val & mask) == value, 0,
-				       POLL_TIMEOUT_US);
+	addr = tp_phy->base + PHY_PMA_XCVR_POWER_STATE_ACK;
+	ret = readl_poll_timeout(addr, read_val, (read_val & mask) == value, 0,
+				 POLL_TIMEOUT_US);
 	if (ret)
 		return ret;
 
-	cdns_torrent_dp_write(regmap, PHY_PMA_XCVR_POWER_STATE_REQ, 0x00000000);
+	tp_reg_dptx_write(tp_phy, PHY_PMA_XCVR_POWER_STATE_REQ, 0x00000000);
 	ndelay(100);
 
 	return ret;
 }
 
-static int cdns_torrent_dp_run(struct cdns_torrent_phy *cdns_phy,
-			       struct cdns_torrent_inst *inst, u32 num_lanes)
-{
-	unsigned int read_val;
-	int ret;
-	struct regmap *regmap = cdns_phy->regmap_dptx_phy_reg;
-
-	/*
-	 * waiting for ACK of pma_xcvr_pllclk_en_ln_*, only for the
-	 * master lane
-	 */
-	ret = regmap_read_poll_timeout(regmap, PHY_PMA_XCVR_PLLCLK_EN_ACK,
-				       read_val, read_val & 1,
-				       0, POLL_TIMEOUT_US);
-	if (ret == -ETIMEDOUT) {
-		dev_err(cdns_phy->dev,
-			"timeout waiting for link PLL clock enable ack\n");
-		return ret;
-	}
-
-	ndelay(100);
-
-	ret = cdns_torrent_dp_set_power_state(cdns_phy, inst, num_lanes,
-					      POWERSTATE_A2);
-	if (ret)
-		return ret;
-
-	ret = cdns_torrent_dp_set_power_state(cdns_phy, inst, num_lanes,
-					      POWERSTATE_A0);
-
-	return ret;
-}
-
-static int cdns_torrent_dp_wait_pma_cmn_ready(struct cdns_torrent_phy *cdns_phy)
+static int tp_dptx_wait_pma_cmn_ready(const struct tp_phy *tp_phy)
 {
+	void __iomem *addr;
 	unsigned int reg;
 	int ret;
-	struct regmap *regmap = cdns_phy->regmap_dptx_phy_reg;
 
-	ret = regmap_read_poll_timeout(regmap, PHY_PMA_CMN_READY, reg,
-				       reg & 1, 0, POLL_TIMEOUT_US);
-	if (ret == -ETIMEDOUT) {
-		dev_err(cdns_phy->dev,
-			"timeout waiting for PMA common ready\n");
-		return -ETIMEDOUT;
+	addr = tp_phy->base + PHY_PMA_CMN_READY;
+	ret = readl_poll_timeout(addr, reg, reg & 1, 0, POLL_TIMEOUT_US);
+	if (ret < 0) {
+		dev_err(tp_phy->dev, "timeout waiting for PMA common ready\n");
+		return ret;
 	}
 
 	return 0;
 }
 
-static void cdns_torrent_dp_pma_cmn_rate(struct cdns_torrent_phy *cdns_phy,
-					 struct cdns_torrent_inst *inst,
-					 u32 rate, u32 num_lanes)
-{
-	unsigned int clk_sel_val = 0;
-	unsigned int hsclk_div_val = 0;
-	unsigned int i;
-
-	switch (rate) {
-	case 1620:
-		clk_sel_val = 0x0f01;
-		hsclk_div_val = 2;
-		break;
-	case 2160:
-	case 2430:
-	case 2700:
-		clk_sel_val = 0x0701;
-		hsclk_div_val = 1;
-		break;
-	case 3240:
-		clk_sel_val = 0x0b00;
-		hsclk_div_val = 2;
-		break;
-	case 4320:
-	case 5400:
-		clk_sel_val = 0x0301;
-		hsclk_div_val = 0;
-		break;
-	case 8100:
-		clk_sel_val = 0x0200;
-		hsclk_div_val = 0;
-		break;
-	}
-
-	if (cdns_phy->dp_pll & DP_PLL0)
-		cdns_torrent_phy_write(cdns_phy->regmap_common_cdb,
-				       CMN_PDIAG_PLL0_CLK_SEL_M0, clk_sel_val);
-
-	if (cdns_phy->dp_pll & DP_PLL1)
-		cdns_torrent_phy_write(cdns_phy->regmap_common_cdb,
-				       CMN_PDIAG_PLL1_CLK_SEL_M0, clk_sel_val);
-
-	/* PMA lane configuration to deal with multi-link operation */
-	for (i = 0; i < num_lanes; i++)
-		cdns_torrent_phy_write(cdns_phy->regmap_tx_lane_cdb[inst->mlane + i],
-				       XCVR_DIAG_HSCLK_DIV, hsclk_div_val);
-}
-
-/*
- * Perform register operations related to setting link rate, once powerstate is
- * set and PLL disable request was processed.
- */
-static int cdns_torrent_dp_configure_rate(struct cdns_torrent_phy *cdns_phy,
-					  struct cdns_torrent_inst *inst,
-					  struct phy_configure_opts_dp *dp)
+static int tp_dp_run(const struct tp_phy *tp_phy, const struct tp_link *link)
 {
-	u32 read_val, field_val;
 	int ret;
 
-	/*
-	 * Disable the associated PLL (cmn_pll0_en or cmn_pll1_en) before
-	 * re-programming the new data rate.
-	 */
-	ret = regmap_field_read(cdns_phy->phy_pma_pll_raw_ctrl, &field_val);
+	ret = tp_dp_enable_pll(tp_phy, link);
 	if (ret)
 		return ret;
-	field_val &= ~(cdns_phy->dp_pll);
-	regmap_field_write(cdns_phy->phy_pma_pll_raw_ctrl, field_val);
-
-	/*
-	 * Wait for PLL ready de-assertion.
-	 * For PLL0 - PHY_PMA_CMN_CTRL2[2] == 1
-	 * For PLL1 - PHY_PMA_CMN_CTRL2[3] == 1
-	 */
-	if (cdns_phy->dp_pll & DP_PLL0) {
-		ret = regmap_field_read_poll_timeout(cdns_phy->phy_pma_cmn_ctrl_2,
-						     read_val,
-						     ((read_val >> 2) & 0x01) != 0,
-						     0, POLL_TIMEOUT_US);
-		if (ret)
-			return ret;
-	}
-
-	if ((cdns_phy->dp_pll & DP_PLL1) && cdns_phy->nsubnodes != 1) {
-		ret = regmap_field_read_poll_timeout(cdns_phy->phy_pma_cmn_ctrl_2,
-						     read_val,
-						     ((read_val >> 3) & 0x01) != 0,
-						     0, POLL_TIMEOUT_US);
-		if (ret)
-			return ret;
-	}
-	ndelay(200);
-
-	/* DP Rate Change - VCO Output settings. */
-	if (cdns_phy->ref_clk_rate == CLK_19_2_MHZ)
-		/* PMA common configuration 19.2MHz */
-		cdns_torrent_dp_pma_cmn_vco_cfg_19_2mhz(cdns_phy, dp->link_rate, dp->ssc);
-	else if (cdns_phy->ref_clk_rate == CLK_25_MHZ)
-		/* PMA common configuration 25MHz */
-		cdns_torrent_dp_pma_cmn_vco_cfg_25mhz(cdns_phy, dp->link_rate, dp->ssc);
-	else if (cdns_phy->ref_clk_rate == CLK_100_MHZ)
-		/* PMA common configuration 100MHz */
-		cdns_torrent_dp_pma_cmn_vco_cfg_100mhz(cdns_phy, dp->link_rate, dp->ssc);
-
-	cdns_torrent_dp_pma_cmn_rate(cdns_phy, inst, dp->link_rate, dp->lanes);
 
-	/* Enable the associated PLL (cmn_pll0_en or cmn_pll1_en) */
-	ret = regmap_field_read(cdns_phy->phy_pma_pll_raw_ctrl, &field_val);
+	ret = tp_dptx_wait_pma_cmn_ready(tp_phy);
 	if (ret)
 		return ret;
-	field_val |= cdns_phy->dp_pll;
-	regmap_field_write(cdns_phy->phy_pma_pll_raw_ctrl, field_val);
-
-	/*
-	 * Wait for PLL ready assertion.
-	 * For PLL0 - PHY_PMA_CMN_CTRL2[0] == 1
-	 * For PLL1 - PHY_PMA_CMN_CTRL2[1] == 1
-	 */
-	if (cdns_phy->dp_pll & DP_PLL0) {
-		ret = regmap_field_read_poll_timeout(cdns_phy->phy_pma_cmn_ctrl_2,
-						     read_val,
-						     (read_val & 0x01) != 0,
-						     0, POLL_TIMEOUT_US);
-		if (ret)
-			return ret;
-	}
-
-	if ((cdns_phy->dp_pll & DP_PLL1) && cdns_phy->nsubnodes != 1)
-		ret = regmap_field_read_poll_timeout(cdns_phy->phy_pma_cmn_ctrl_2,
-						     read_val,
-						     ((read_val >> 1) & 0x01) != 0,
-						     0, POLL_TIMEOUT_US);
-
-	return ret;
-}
 
-/*
- * Verify, that parameters to configure PHY with are correct.
- */
-static int cdns_torrent_dp_verify_config(struct cdns_torrent_inst *inst,
-					 struct phy_configure_opts_dp *dp)
-{
-	u8 i;
-
-	/* If changing link rate was required, verify it's supported. */
-	if (dp->set_rate) {
-		switch (dp->link_rate) {
-		case 1620:
-		case 2160:
-		case 2430:
-		case 2700:
-		case 3240:
-		case 4320:
-		case 5400:
-		case 8100:
-			/* valid bit rate */
-			break;
-		default:
-			return -EINVAL;
-		}
-	}
-
-	/* Verify lane count. */
-	switch (dp->lanes) {
-	case 1:
-	case 2:
-	case 4:
-		/* valid lane count. */
-		break;
-	default:
-		return -EINVAL;
-	}
-
-	/* Check against actual number of PHY's lanes. */
-	if (dp->lanes > inst->num_lanes)
-		return -EINVAL;
+	ndelay(100);
+	ret = tp_dptx_set_pll_en(tp_phy, link->num_lanes, true);
+	if (ret)
+		return ret;
 
-	/*
-	 * If changing voltages is required, check swing and pre-emphasis
-	 * levels, per-lane.
-	 */
-	if (dp->set_voltages) {
-		/* Lane count verified previously. */
-		for (i = 0; i < dp->lanes; i++) {
-			if (dp->voltage[i] > 3 || dp->pre[i] > 3)
-				return -EINVAL;
+	ndelay(100);
+	ret = tp_dptx_set_power_state(tp_phy, link->mlane, link->num_lanes, POWERSTATE_A2);
+	if (ret)
+		return ret;
 
-			/* Sum of voltage swing and pre-emphasis levels cannot
-			 * exceed 3.
-			 */
-			if (dp->voltage[i] + dp->pre[i] > 3)
-				return -EINVAL;
-		}
-	}
+	ret = tp_dptx_set_power_state(tp_phy, link->mlane, link->num_lanes, POWERSTATE_A0);
+	if (ret)
+		return ret;
 
+	ndelay(900);
 	return 0;
 }
 
-/* Set power state A0 and PLL clock enable to 0 on enabled lanes. */
-static void cdns_torrent_dp_set_a0_pll(struct cdns_torrent_phy *cdns_phy,
-				       struct cdns_torrent_inst *inst,
-				       u32 num_lanes)
+static void tp_dp_set_lanes(const struct tp_phy *tp_phy, struct tp_link *link, u32 num_lanes)
 {
-	struct regmap *regmap = cdns_phy->regmap_dptx_phy_reg;
-	u32 pwr_state = cdns_torrent_dp_read(regmap,
-					     PHY_PMA_XCVR_POWER_STATE_REQ);
-	u32 pll_clk_en = cdns_torrent_dp_read(regmap,
-					      PHY_PMA_XCVR_PLLCLK_EN);
-	u32 i;
-
-	for (i = 0; i < num_lanes; i++) {
-		pwr_state &= ~(PMA_XCVR_POWER_STATE_REQ_LN_MASK
-			     << PHY_POWER_STATE_LN(inst->mlane + i));
-
-		pll_clk_en &= ~(0x01U << (inst->mlane + i));
-	}
-
-	cdns_torrent_dp_write(regmap, PHY_PMA_XCVR_POWER_STATE_REQ, pwr_state);
-	cdns_torrent_dp_write(regmap, PHY_PMA_XCVR_PLLCLK_EN, pll_clk_en);
-}
+	u32 pma_tx_elec_idle_mask;
+	u8 used_lane_mask;
+	u8 all_lane_mask;
+	u32 pll_clk_en;
+	u32 pwr_state;
+	u32 value;
+	u32 mlane = link->mlane;
 
-/* Configure lane count as required. */
-static int cdns_torrent_dp_set_lanes(struct cdns_torrent_phy *cdns_phy,
-				     struct cdns_torrent_inst *inst,
-				     struct phy_configure_opts_dp *dp)
-{
-	u32 value, i;
-	int ret;
-	struct regmap *regmap = cdns_phy->regmap_dptx_phy_reg;
-	u8 lane_mask = (1 << dp->lanes) - 1;
-	u8 pma_tx_elec_idle_mask = 0;
-	u32 clane = inst->mlane;
+	used_lane_mask = ((1U << num_lanes) - 1) << mlane;
+	all_lane_mask = ((1U << link->max_lanes) - 1) << mlane;
 
-	lane_mask <<= clane;
+	value = tp_reg_dptx_read(tp_phy, PHY_RESET);
 
-	value = cdns_torrent_dp_read(regmap, PHY_RESET);
 	/* clear pma_tx_elec_idle_ln_* bits. */
-	pma_tx_elec_idle_mask = ((1 << inst->num_lanes) - 1) << clane;
-
+	pma_tx_elec_idle_mask = ((1U << link->max_lanes) - 1) << mlane;
 	pma_tx_elec_idle_mask <<= PMA_TX_ELEC_IDLE_SHIFT;
 
 	value &= ~pma_tx_elec_idle_mask;
 
 	/* Assert pma_tx_elec_idle_ln_* for disabled lanes. */
-	value |= ((~lane_mask) << PMA_TX_ELEC_IDLE_SHIFT) &
-		 pma_tx_elec_idle_mask;
+	value |= ((~used_lane_mask) << PMA_TX_ELEC_IDLE_SHIFT) & pma_tx_elec_idle_mask;
 
-	cdns_torrent_dp_write(regmap, PHY_RESET, value);
+	tp_reg_dptx_write(tp_phy, PHY_RESET, value);
 
 	/* reset the link by asserting master lane phy_l0*_reset_n low */
-	cdns_torrent_dp_write(regmap, PHY_RESET,
-			      value & (~(1 << clane)));
+	value &= ~(1U << mlane);
+	tp_reg_dptx_write(tp_phy, PHY_RESET, value);
 
 	/*
-	 * Assert lane reset on unused lanes and master lane so they remain in reset
-	 * and powered down when re-enabling the link
+	 * Assert lane reset on unused lanes and master lane so they remain in
+	 * reset and powered down when re-enabling the link
 	 */
-	for (i = 0; i < inst->num_lanes; i++)
-		value &= (~(1 << (clane + i)));
+	value &= ~all_lane_mask;
+	value |= used_lane_mask;
+	value &= ~(1U << mlane);
+	tp_reg_dptx_write(tp_phy, PHY_RESET, value);
 
-	for (i = 1; i < inst->num_lanes; i++)
-		value |= ((1 << (clane + i)) & lane_mask);
+	/* Clear requested power state set PLL clock enable to 0 on all used lanes. */
+	pwr_state = tp_reg_dptx_read(tp_phy, PHY_PMA_XCVR_POWER_STATE_REQ);
+	pll_clk_en = tp_reg_dptx_read(tp_phy, PHY_PMA_XCVR_PLLCLK_EN);
 
-	cdns_torrent_dp_write(regmap, PHY_RESET, value);
+	for (u32 i = 0; i < num_lanes; ++i)
+		pwr_state &= ~(PMA_XCVR_POWER_STATE_REQ_LN_MASK << PHY_POWER_STATE_LN(mlane + i));
 
-	cdns_torrent_dp_set_a0_pll(cdns_phy, inst, dp->lanes);
+	pll_clk_en &= ~used_lane_mask;
 
-	/* release phy_l0*_reset_n based on used laneCount */
-	for (i = 0; i < inst->num_lanes; i++)
-		value &= (~(1 << (clane + i)));
+	tp_reg_dptx_write(tp_phy, PHY_PMA_XCVR_POWER_STATE_REQ, pwr_state);
+	tp_reg_dptx_write(tp_phy, PHY_PMA_XCVR_PLLCLK_EN, pll_clk_en);
 
-	for (i = 0; i < inst->num_lanes; i++)
-		value |= ((1 << (clane + i)) & lane_mask);
+	/* release master lane reset */
+	value |= 1 << mlane;
+	tp_reg_dptx_write(tp_phy, PHY_RESET, value);
 
-	cdns_torrent_dp_write(regmap, PHY_RESET, value);
-
-	/* Wait, until PHY gets ready after releasing PHY reset signal. */
-	ret = cdns_torrent_dp_wait_pma_cmn_ready(cdns_phy);
-	if (ret)
-		return ret;
-
-	ndelay(100);
-
-	/* release pma_xcvr_pllclk_en_ln_*, only for the master lane */
-	value = cdns_torrent_dp_read(regmap, PHY_PMA_XCVR_PLLCLK_EN);
-	value |= (1 << clane);
-	cdns_torrent_dp_write(regmap, PHY_PMA_XCVR_PLLCLK_EN, value);
-
-	ret = cdns_torrent_dp_run(cdns_phy, inst, dp->lanes);
-
-	return ret;
+	/* update the number of used lanes */
+	link->num_lanes = num_lanes;
 }
 
 /* Configure link rate as required. */
-static int cdns_torrent_dp_set_rate(struct cdns_torrent_phy *cdns_phy,
-				    struct cdns_torrent_inst *inst,
-				    struct phy_configure_opts_dp *dp)
+static int tp_dp_set_rate(struct tp_phy *tp_phy, const struct tp_link *link,
+			  const struct phy_configure_opts_dp *dp)
 {
 	int ret;
 
-	ret = cdns_torrent_dp_set_power_state(cdns_phy, inst, dp->lanes,
-					      POWERSTATE_A3);
+	ret = tp_dptx_set_power_state(tp_phy, link->mlane, link->num_lanes, POWERSTATE_A3);
 	if (ret)
 		return ret;
-	ret = cdns_torrent_dp_set_pll_en(cdns_phy, inst, dp, false);
-	if (ret)
-		return ret;
-	ndelay(200);
 
-	ret = cdns_torrent_dp_configure_rate(cdns_phy, inst, dp);
+	ret = tp_dptx_set_pll_en(tp_phy, link->num_lanes, false);
 	if (ret)
 		return ret;
-	ndelay(200);
 
-	ret = cdns_torrent_dp_set_pll_en(cdns_phy, inst, dp, true);
-	if (ret)
-		return ret;
-	ret = cdns_torrent_dp_set_power_state(cdns_phy, inst, dp->lanes,
-					      POWERSTATE_A2);
-	if (ret)
-		return ret;
-	ret = cdns_torrent_dp_set_power_state(cdns_phy, inst, dp->lanes,
-					      POWERSTATE_A0);
+	ndelay(200);
+	ret = tp_dp_configure_rate(tp_phy, link, dp);
 	if (ret)
 		return ret;
-	ndelay(900);
 
+	ndelay(200);
 	return ret;
 }
 
 /* Configure voltage swing and pre-emphasis for all enabled lanes. */
-static void cdns_torrent_dp_set_voltages(struct cdns_torrent_phy *cdns_phy,
-					 struct cdns_torrent_inst *inst,
-					 struct phy_configure_opts_dp *dp)
+static void tp_dp_set_voltages(const struct tp_phy *tp_phy, const struct tp_link *link,
+			       const struct phy_configure_opts_dp *dp)
 {
-	u8 lane;
-	u16 val;
+	for (u32 lane = 0; lane < link->num_lanes; ++lane) {
+		const struct tp_reg_base *reg_base;
+		u16 val;
+
+		reg_base = &tp_phy->reg_tx_lane_cdb[link->mlane + lane];
 
-	for (lane = 0; lane < dp->lanes; lane++) {
-		val = cdns_torrent_phy_read(cdns_phy->regmap_tx_lane_cdb[inst->mlane + lane],
-					    TX_DIAG_ACYA);
 		/*
 		 * Write 1 to register bit TX_DIAG_ACYA[0] to freeze the
 		 * current state of the analog TX driver.
 		 */
-		val |= TX_DIAG_ACYA_HBDC_MASK;
-		cdns_torrent_phy_write(cdns_phy->regmap_tx_lane_cdb[inst->mlane + lane],
-				       TX_DIAG_ACYA, val);
+		tp_reg_set_bits(reg_base, TX_DIAG_ACYA, TX_DIAG_ACYA_HBDC_MASK);
 
-		cdns_torrent_phy_write(cdns_phy->regmap_tx_lane_cdb[inst->mlane + lane],
-				       TX_TXCC_CTRL, 0x08A4);
-		val = vltg_coeff[dp->voltage[lane]][dp->pre[lane]].diag_tx_drv;
-		cdns_torrent_phy_write(cdns_phy->regmap_tx_lane_cdb[inst->mlane + lane],
-				       DRV_DIAG_TX_DRV, val);
+		tp_reg_write(reg_base, TX_TXCC_CTRL, 0x08A4);
+		tp_reg_write(reg_base, DRV_DIAG_TX_DRV, 0x0003);
 		val = vltg_coeff[dp->voltage[lane]][dp->pre[lane]].mgnfs_mult;
-		cdns_torrent_phy_write(cdns_phy->regmap_tx_lane_cdb[inst->mlane + lane],
-				       TX_TXCC_MGNFS_MULT_000,
-				       val);
+		tp_reg_write(reg_base, TX_TXCC_MGNFS_MULT_000, val);
 		val = vltg_coeff[dp->voltage[lane]][dp->pre[lane]].cpost_mult;
-		cdns_torrent_phy_write(cdns_phy->regmap_tx_lane_cdb[inst->mlane + lane],
-				       TX_TXCC_CPOST_MULT_00,
-				       val);
+		tp_reg_write(reg_base, TX_TXCC_CPOST_MULT_00, val);
 
-		val = cdns_torrent_phy_read(cdns_phy->regmap_tx_lane_cdb[inst->mlane + lane],
-					    TX_DIAG_ACYA);
 		/*
 		 * Write 0 to register bit TX_DIAG_ACYA[0] to allow the state of
 		 * analog TX driver to reflect the new programmed one.
 		 */
-		val &= ~TX_DIAG_ACYA_HBDC_MASK;
-		cdns_torrent_phy_write(cdns_phy->regmap_tx_lane_cdb[inst->mlane + lane],
-				       TX_DIAG_ACYA, val);
+		tp_reg_clear_bits(reg_base, TX_DIAG_ACYA, TX_DIAG_ACYA_HBDC_MASK);
 	}
-};
+}
 
-static int cdns_torrent_dp_configure(struct phy *phy,
-				     union phy_configure_opts *opts)
+static int tp_phy_configure(struct phy *phy, union phy_configure_opts *opts)
 {
-	struct cdns_torrent_inst *inst = phy_get_drvdata(phy);
-	struct cdns_torrent_phy *cdns_phy = dev_get_drvdata(phy->dev.parent);
+	struct tp_phy *tp_phy = dev_get_drvdata(phy->dev.parent);
+	struct tp_link *link = phy_get_drvdata(phy);
+	bool run_needed = false;
 	int ret;
 
-	if (cdns_phy->already_configured)
+	guard(mutex)(&tp_phy->lock);
+
+	if (tp_phy->already_configured)
 		return 0;
 
-	ret = cdns_torrent_dp_verify_config(inst, &opts->dp);
+	if (link->type != STD_TYPE_DP)
+		return -EINVAL;
+
+	ret = tp_dp_verify_config(link, &opts->dp);
 	if (ret) {
 		dev_err(&phy->dev, "invalid params for phy configure\n");
 		return ret;
 	}
 
-	if (opts->dp.set_lanes) {
-		ret = cdns_torrent_dp_set_lanes(cdns_phy, inst, &opts->dp);
-		if (ret) {
-			dev_err(&phy->dev, "cdns_torrent_dp_set_lanes failed\n");
-			return ret;
-		}
+	if (opts->dp.set_lanes && opts->dp.lanes != link->num_lanes) {
+		tp_dp_set_lanes(tp_phy, link, opts->dp.lanes);
+		run_needed = true;
 	}
 
 	if (opts->dp.set_rate) {
-		ret = cdns_torrent_dp_set_rate(cdns_phy, inst, &opts->dp);
+		ret = tp_dp_set_rate(tp_phy, link, &opts->dp);
 		if (ret) {
-			dev_err(&phy->dev, "cdns_torrent_dp_set_rate failed\n");
+			dev_err(&phy->dev, "Set rate failed\n");
 			return ret;
 		}
+		run_needed = true;
 	}
 
 	if (opts->dp.set_voltages)
-		cdns_torrent_dp_set_voltages(cdns_phy, inst, &opts->dp);
+		tp_dp_set_voltages(tp_phy, link, &opts->dp);
+
+	if (phy->power_count && run_needed)
+		ret = tp_dp_run(tp_phy, link);
 
 	return ret;
 }
 
-static int cdns_torrent_phy_on(struct phy *phy)
+static int tp_phy_on(struct phy *phy)
 {
-	struct cdns_torrent_inst *inst = phy_get_drvdata(phy);
-	struct cdns_torrent_phy *cdns_phy = dev_get_drvdata(phy->dev.parent);
-	u32 read_val;
+	struct tp_link *link = phy_get_drvdata(phy);
+	struct tp_phy *tp_phy = dev_get_drvdata(phy->dev.parent);
+	u16 val;
 	int ret;
 
-	if (cdns_phy->already_configured) {
+	guard(mutex)(&tp_phy->lock);
+
+	if (tp_phy->already_configured) {
 		/* Give 5ms to 10ms delay for the PIPE clock to be stable */
 		usleep_range(5000, 10000);
 		return 0;
 	}
 
-	if (cdns_phy->nsubnodes == 1) {
-		/* Take the PHY lane group out of reset */
-		reset_control_deassert(inst->lnk_rst);
-
+	if (tp_phy->nb_phy_on == 0) {
 		/* Take the PHY out of reset */
-		ret = reset_control_deassert(cdns_phy->phy_rst);
+		ret = reset_control_deassert(tp_phy->phy_rst);
 		if (ret)
 			return ret;
 	}
 
+	/* Take the PHY lane group out of reset */
+	ret = reset_control_deassert(link->lnk_rst);
+	if (ret)
+		return ret;
+
 	/*
 	 * Wait for cmn_ready assertion
 	 * PHY_PMA_CMN_CTRL1[0] == 1
 	 */
-	ret = regmap_field_read_poll_timeout(cdns_phy->phy_pma_cmn_ctrl_1,
-					     read_val, read_val, 1000,
-					     PLL_LOCK_TIMEOUT);
+	ret = read_poll_timeout(tp_reg_read, val, val & 1, 1000, PLL_LOCK_TIMEOUT, false,
+				&tp_phy->reg_phy_pma_common_cdb, PHY_PMA_CMN_CTRL1);
 	if (ret) {
-		dev_err(cdns_phy->dev, "Timeout waiting for CMN ready\n");
+		dev_err(tp_phy->dev, "Timeout waiting for CMN ready\n");
 		return ret;
 	}
 
-	if (inst->phy_type == TYPE_PCIE || inst->phy_type == TYPE_USB) {
-		ret = regmap_field_read_poll_timeout(cdns_phy->phy_pcs_iso_link_ctrl_1[inst->mlane],
-						     read_val, !read_val, 1000,
-						     PLL_LOCK_TIMEOUT);
-		if (ret == -ETIMEDOUT) {
-			dev_err(cdns_phy->dev, "Timeout waiting for PHY status ready\n");
+	if (link->type == STD_TYPE_DP) {
+		tp_dp_run(tp_phy, link);
+	} else if (link->type == STD_TYPE_PCIE || link->type == STD_TYPE_USB_TXRX) {
+		struct tp_reg_base *reg_base;
+
+		reg_base = &tp_phy->reg_phy_pcs_lane_cdb[link->mlane];
+		ret = read_poll_timeout(tp_reg_read, val, (val & 2) == 0, 1000,
+					PLL_LOCK_TIMEOUT, false, reg_base,
+					PHY_PCS_ISO_LINK_CTRL);
+		if (ret < 0) {
+			dev_err(tp_phy->dev, "Timeout waiting for PHY status ready\n");
 			return ret;
 		}
 	}
 
+	tp_phy->nb_phy_on++;
 	return 0;
 }
 
-static int cdns_torrent_phy_off(struct phy *phy)
+static int tp_phy_off(struct phy *phy)
 {
-	struct cdns_torrent_inst *inst = phy_get_drvdata(phy);
-	struct cdns_torrent_phy *cdns_phy = dev_get_drvdata(phy->dev.parent);
+	struct tp_link *inst = phy_get_drvdata(phy);
+	struct tp_phy *tp_phy = dev_get_drvdata(phy->dev.parent);
 	int ret;
 
-	if (cdns_phy->nsubnodes != 1)
-		return 0;
+	guard(mutex)(&tp_phy->lock);
 
-	ret = reset_control_assert(cdns_phy->phy_rst);
+	ret = reset_control_assert(inst->lnk_rst);
 	if (ret)
 		return ret;
 
-	return reset_control_assert(inst->lnk_rst);
+	if (tp_phy->nb_phy_on == 1) {
+		ret = reset_control_assert(tp_phy->phy_rst);
+		if (ret)
+			return ret;
+	}
+
+	tp_phy->nb_phy_on--;
+	return 0;
 }
 
-static void cdns_torrent_dp_common_init(struct cdns_torrent_phy *cdns_phy,
-					struct cdns_torrent_inst *inst)
+static int tp_dp_phy_init(const struct tp_phy *tp_phy, struct tp_link *inst)
 {
-	struct regmap *regmap = cdns_phy->regmap_dptx_phy_reg;
-	unsigned char lane_bits;
-	u32 val;
+	 /* enable AUX */
+	tp_reg_dptx_write(tp_phy, PHY_AUX_CTRL, 0x0003);
 
-	cdns_torrent_dp_write(regmap, PHY_AUX_CTRL, 0x0003); /* enable AUX */
-
-	/*
-	 * Set lines power state to A0
-	 * Set lines pll clk enable to 0
-	 */
-	cdns_torrent_dp_set_a0_pll(cdns_phy, inst, inst->num_lanes);
-
-	/*
-	 * release phy_l0*_reset_n and pma_tx_elec_idle_ln_* based on
-	 * used lanes
-	 */
-	lane_bits = (1 << inst->num_lanes) - 1;
-
-	val = cdns_torrent_dp_read(regmap, PHY_RESET);
-	val |= (0xF & lane_bits);
-	val &= ~(lane_bits << 4);
-	cdns_torrent_dp_write(regmap, PHY_RESET, val);
-
-	/* release pma_xcvr_pllclk_en_ln_*, only for the master lane */
-	val = cdns_torrent_dp_read(regmap, PHY_PMA_XCVR_PLLCLK_EN);
-	val |= 1;
-	cdns_torrent_dp_write(regmap, PHY_PMA_XCVR_PLLCLK_EN, val);
-
-	/*
-	 * PHY PMA registers configuration functions
-	 * Initialize PHY with max supported link rate, without SSC.
-	 */
-	if (cdns_phy->ref_clk_rate == CLK_19_2_MHZ)
-		cdns_torrent_dp_pma_cmn_vco_cfg_19_2mhz(cdns_phy,
-							cdns_phy->max_bit_rate,
-							false);
-	else if (cdns_phy->ref_clk_rate == CLK_25_MHZ)
-		cdns_torrent_dp_pma_cmn_vco_cfg_25mhz(cdns_phy,
-						      cdns_phy->max_bit_rate,
-						      false);
-	else if (cdns_phy->ref_clk_rate == CLK_100_MHZ)
-		cdns_torrent_dp_pma_cmn_vco_cfg_100mhz(cdns_phy,
-						       cdns_phy->max_bit_rate,
-						       false);
-
-	cdns_torrent_dp_pma_cmn_rate(cdns_phy, inst, cdns_phy->max_bit_rate,
-				     inst->num_lanes);
+	/* configure the number of lanes */
+	tp_dp_set_lanes(tp_phy, inst, inst->num_lanes);
 
 	/* take out of reset */
-	regmap_field_write(cdns_phy->phy_reset_ctrl, 0x1);
+	tp_dp_deassert_phy_reset(tp_phy);
+
+	return 0;
 }
 
-static int cdns_torrent_dp_start(struct cdns_torrent_phy *cdns_phy,
-				 struct cdns_torrent_inst *inst,
-				 struct phy *phy)
+static int tp_phy_init(struct phy *phy)
 {
-	int ret;
+	struct tp_phy *tp_phy = dev_get_drvdata(phy->dev.parent);
+	struct tp_link *link = phy_get_drvdata(phy);
+	int ret = 0;
 
-	ret = cdns_torrent_phy_on(phy);
-	if (ret)
-		return ret;
+	guard(mutex)(&tp_phy->lock);
 
-	ret = cdns_torrent_dp_wait_pma_cmn_ready(cdns_phy);
-	if (ret)
-		return ret;
+	if (tp_phy->already_configured)
+		return 0;
 
-	ret = cdns_torrent_dp_run(cdns_phy, inst, inst->num_lanes);
+	if (link->type == STD_TYPE_DP)
+		ret = tp_dp_phy_init(tp_phy, link);
 
 	return ret;
 }
 
-static int cdns_torrent_dp_init(struct phy *phy)
+static const struct phy_ops cdns_torrent_phy_ops = {
+	.init		= tp_phy_init,
+	.configure	= tp_phy_configure,
+	.power_on	= tp_phy_on,
+	.power_off	= tp_phy_off,
+	.owner		= THIS_MODULE,
+};
+
+static int tp_derived_refclk_enable(struct clk_hw *hw)
 {
-	struct cdns_torrent_inst *inst = phy_get_drvdata(phy);
-	struct cdns_torrent_phy *cdns_phy = dev_get_drvdata(phy->dev.parent);
-	int ret;
+	struct tp_phy *tp_phy = tp_from_derived_refclk(hw);
 
-	switch (cdns_phy->ref_clk_rate) {
-	case CLK_19_2_MHZ:
-	case CLK_25_MHZ:
-	case CLK_100_MHZ:
-		/* Valid Ref Clock Rate */
-		break;
-	default:
-		dev_err(cdns_phy->dev, "Unsupported Ref Clock Rate\n");
-		return -EINVAL;
-	}
-
-	ret = cdns_torrent_dp_get_pll(cdns_phy, TYPE_NONE);
-	if (ret)
-		return ret;
-
-	cdns_torrent_dp_common_init(cdns_phy, inst);
-
-	return cdns_torrent_dp_start(cdns_phy, inst, phy);
-}
-
-static int cdns_torrent_dp_multilink_init(struct cdns_torrent_phy *cdns_phy,
-					  struct cdns_torrent_inst *inst,
-					  struct phy *phy)
-{
-	if (cdns_phy->ref_clk_rate != CLK_100_MHZ) {
-		dev_err(cdns_phy->dev, "Unsupported Ref Clock Rate\n");
-		return -EINVAL;
-	}
-
-	cdns_torrent_dp_common_init(cdns_phy, inst);
-
-	return cdns_torrent_dp_start(cdns_phy, inst, phy);
-}
-
-static int cdns_torrent_derived_refclk_enable(struct clk_hw *hw)
-{
-	struct cdns_torrent_derived_refclk *derived_refclk = to_cdns_torrent_derived_refclk(hw);
-
-	regmap_field_write(derived_refclk->cmn_cdiag_refclk_ovrd_4, 1);
-	regmap_field_write(derived_refclk->phy_pipe_cmn_ctrl1_0, 1);
+	tp_reg_field_write(&tp_phy->cmn_cdiag_refclk_ovrd_4, 1);
+	tp_reg_field_write(&tp_phy->phy_pipe_cmn_ctrl1_0, 1);
 
 	return 0;
 }
 
-static void cdns_torrent_derived_refclk_disable(struct clk_hw *hw)
+static void tp_derived_refclk_disable(struct clk_hw *hw)
 {
-	struct cdns_torrent_derived_refclk *derived_refclk = to_cdns_torrent_derived_refclk(hw);
+	struct tp_phy *tp_phy = tp_from_derived_refclk(hw);
 
-	regmap_field_write(derived_refclk->phy_pipe_cmn_ctrl1_0, 0);
-	regmap_field_write(derived_refclk->cmn_cdiag_refclk_ovrd_4, 0);
+	tp_reg_field_write(&tp_phy->phy_pipe_cmn_ctrl1_0, 0);
+	tp_reg_field_write(&tp_phy->cmn_cdiag_refclk_ovrd_4, 0);
 }
 
-static int cdns_torrent_derived_refclk_is_enabled(struct clk_hw *hw)
+static int tp_derived_refclk_is_enabled(struct clk_hw *hw)
 {
-	struct cdns_torrent_derived_refclk *derived_refclk = to_cdns_torrent_derived_refclk(hw);
-	int val;
-
-	regmap_field_read(derived_refclk->cmn_cdiag_refclk_ovrd_4, &val);
+	struct tp_phy *tp_phy = tp_from_derived_refclk(hw);
+	u16 val;
 
+	val = tp_reg_field_read(&tp_phy->cmn_cdiag_refclk_ovrd_4);
 	return !!val;
 }
 
-static const struct clk_ops cdns_torrent_derived_refclk_ops = {
-	.enable = cdns_torrent_derived_refclk_enable,
-	.disable = cdns_torrent_derived_refclk_disable,
-	.is_enabled = cdns_torrent_derived_refclk_is_enabled,
+static const struct clk_ops tp_derived_refclk_ops = {
+	.enable = tp_derived_refclk_enable,
+	.disable = tp_derived_refclk_disable,
+	.is_enabled = tp_derived_refclk_is_enabled,
 };
 
-static int cdns_torrent_derived_refclk_register(struct cdns_torrent_phy *cdns_phy)
+static int tp_derived_refclk_register(struct tp_phy *tp_phy)
 {
-	struct cdns_torrent_derived_refclk *derived_refclk;
-	struct device *dev = cdns_phy->dev;
-	struct clk_init_data *init;
+	struct clk_init_data init_data = { .flags = 0 };
+	struct device *dev = tp_phy->dev;
 	const char *parent_name;
 	char clk_name[100];
 	struct clk_hw *hw;
 	struct clk *clk;
 	int ret;
 
-	derived_refclk = devm_kzalloc_obj(dev, *derived_refclk);
-	if (!derived_refclk)
-		return -ENOMEM;
-
 	snprintf(clk_name, sizeof(clk_name), "%s_%s", dev_name(dev),
-		 clk_names[CDNS_TORRENT_DERIVED_REFCLK]);
+		 tp_clk_names[CDNS_TORRENT_DERIVED_REFCLK]);
 
 	clk = devm_clk_get_optional(dev, "phy_en_refclk");
 	if (IS_ERR(clk)) {
@@ -1876,82 +4049,69 @@ static int cdns_torrent_derived_refclk_register(struct cdns_torrent_phy *cdns_ph
 		return PTR_ERR(clk);
 	}
 
-	init = &derived_refclk->clk_data;
-
 	if (clk) {
 		parent_name = __clk_get_name(clk);
-		init->parent_names = &parent_name;
-		init->num_parents = 1;
+		init_data.parent_names = &parent_name;
+		init_data.num_parents = 1;
 	}
-	init->ops = &cdns_torrent_derived_refclk_ops;
-	init->flags = 0;
-	init->name = clk_name;
+	init_data.ops = &tp_derived_refclk_ops;
+	init_data.name = clk_name;
 
-	derived_refclk->phy_pipe_cmn_ctrl1_0 = cdns_phy->phy_pipe_cmn_ctrl1_0;
-	derived_refclk->cmn_cdiag_refclk_ovrd_4 = cdns_phy->cmn_cdiag_refclk_ovrd_4;
-
-	derived_refclk->hw.init = init;
-
-	hw = &derived_refclk->hw;
+	hw = &tp_phy->derived_refclk;
+	hw->init = &init_data;
 	ret = devm_clk_hw_register(dev, hw);
 	if (ret)
 		return ret;
 
-	cdns_phy->clk_hw_data->hws[CDNS_TORRENT_DERIVED_REFCLK] = hw;
+	tp_phy->clk_hw_data->hws[CDNS_TORRENT_DERIVED_REFCLK] = hw;
 
 	return 0;
 }
 
-static int cdns_torrent_received_refclk_enable(struct clk_hw *hw)
+static int tp_received_refclk_enable(struct clk_hw *hw)
 {
-	struct cdns_torrent_received_refclk *received_refclk = to_cdns_torrent_received_refclk(hw);
-
-	regmap_field_write(received_refclk->phy_pipe_cmn_ctrl1_0, 1);
+	struct tp_phy *tp_phy = tp_from_received_refclk(hw);
 
+	tp_reg_field_write(&tp_phy->phy_pipe_cmn_ctrl1_0, 1);
 	return 0;
 }
 
-static void cdns_torrent_received_refclk_disable(struct clk_hw *hw)
+static void tp_received_refclk_disable(struct clk_hw *hw)
 {
-	struct cdns_torrent_received_refclk *received_refclk = to_cdns_torrent_received_refclk(hw);
+	struct tp_phy *tp_phy = tp_from_received_refclk(hw);
 
-	regmap_field_write(received_refclk->phy_pipe_cmn_ctrl1_0, 0);
+	tp_reg_field_write(&tp_phy->phy_pipe_cmn_ctrl1_0, 0);
 }
 
-static int cdns_torrent_received_refclk_is_enabled(struct clk_hw *hw)
+static int tp_received_refclk_is_enabled(struct clk_hw *hw)
 {
-	struct cdns_torrent_received_refclk *received_refclk = to_cdns_torrent_received_refclk(hw);
-	int val, cmn_val;
+	struct tp_phy *tp_phy = tp_from_received_refclk(hw);
+	u16 val, cmn_val;
 
-	regmap_field_read(received_refclk->phy_pipe_cmn_ctrl1_0, &val);
-	regmap_field_read(received_refclk->cmn_cdiag_refclk_ovrd_4, &cmn_val);
+	val = tp_reg_field_read(&tp_phy->phy_pipe_cmn_ctrl1_0);
+	cmn_val = tp_reg_field_read(&tp_phy->cmn_cdiag_refclk_ovrd_4);
 
 	return val && !cmn_val;
 }
 
 static const struct clk_ops cdns_torrent_received_refclk_ops = {
-	.enable = cdns_torrent_received_refclk_enable,
-	.disable = cdns_torrent_received_refclk_disable,
-	.is_enabled = cdns_torrent_received_refclk_is_enabled,
+	.enable = tp_received_refclk_enable,
+	.disable = tp_received_refclk_disable,
+	.is_enabled = tp_received_refclk_is_enabled,
 };
 
-static int cdns_torrent_received_refclk_register(struct cdns_torrent_phy *cdns_phy)
+static int tp_received_refclk_register(struct tp_phy *tp_phy)
 {
-	struct cdns_torrent_received_refclk *received_refclk;
-	struct device *dev = cdns_phy->dev;
-	struct clk_init_data *init;
+	struct clk_init_data init_data = { .flags = 0 };
+	struct device *dev = tp_phy->dev;
 	const char *parent_name;
 	char clk_name[100];
 	struct clk_hw *hw;
 	struct clk *clk;
 	int ret;
 
-	received_refclk = devm_kzalloc_obj(dev, *received_refclk);
-	if (!received_refclk)
-		return -ENOMEM;
-
 	snprintf(clk_name, sizeof(clk_name), "%s_%s", dev_name(dev),
-		 clk_names[CDNS_TORRENT_RECEIVED_REFCLK]);
+		 tp_clk_names[CDNS_TORRENT_RECEIVED_REFCLK]);
 
 	clk = devm_clk_get_optional(dev, "phy_en_refclk");
 	if (IS_ERR(clk)) {
@@ -1959,111 +4119,97 @@ static int cdns_torrent_received_refclk_register(struct cdns_torrent_phy *cdns_p
 		return PTR_ERR(clk);
 	}
 
-	init = &received_refclk->clk_data;
-
 	if (clk) {
 		parent_name = __clk_get_name(clk);
-		init->parent_names = &parent_name;
-		init->num_parents = 1;
+		init_data.parent_names = &parent_name;
+		init_data.num_parents = 1;
 	}
-	init->ops = &cdns_torrent_received_refclk_ops;
-	init->flags = 0;
-	init->name = clk_name;
+	init_data.ops = &cdns_torrent_received_refclk_ops;
+	init_data.name = clk_name;
 
-	received_refclk->phy_pipe_cmn_ctrl1_0 = cdns_phy->phy_pipe_cmn_ctrl1_0;
-	received_refclk->cmn_cdiag_refclk_ovrd_4 = cdns_phy->cmn_cdiag_refclk_ovrd_4;
-
-	received_refclk->hw.init = init;
-
-	hw = &received_refclk->hw;
+	hw = &tp_phy->received_refclk;
+	hw->init = &init_data;
 	ret = devm_clk_hw_register(dev, hw);
 	if (ret)
 		return ret;
 
-	cdns_phy->clk_hw_data->hws[CDNS_TORRENT_RECEIVED_REFCLK] = hw;
+	tp_phy->clk_hw_data->hws[CDNS_TORRENT_RECEIVED_REFCLK] = hw;
 
 	return 0;
 }
 
-static int cdns_torrent_refclk_driver_enable(struct clk_hw *hw)
+static int tp_refclk_driver_enable(struct clk_hw *hw)
 {
-	struct cdns_torrent_refclk_driver *refclk_driver = to_cdns_torrent_refclk_driver(hw);
+	struct tp_refclk_driver *refclk = tp_to_refclk_driver(hw);
 
-	regmap_field_write(refclk_driver->cmn_fields[CMN_CDIAG_REFCLK_DRV0_CTRL_6], 0);
-	regmap_field_write(refclk_driver->cmn_fields[CMN_CDIAG_REFCLK_DRV0_CTRL_5], 1);
-	regmap_field_write(refclk_driver->cmn_fields[CMN_CDIAG_REFCLK_DRV0_CTRL_1], 0);
+	tp_reg_field_write(&refclk->fields[CMN_CDIAG_REFCLK_DRV0_CTRL_6], 0);
+	tp_reg_field_write(&refclk->fields[CMN_CDIAG_REFCLK_DRV0_CTRL_5], 1);
+	tp_reg_field_write(&refclk->fields[CMN_CDIAG_REFCLK_DRV0_CTRL_1], 0);
 
 	return 0;
 }
 
-static void cdns_torrent_refclk_driver_disable(struct clk_hw *hw)
+static void tp_refclk_driver_disable(struct clk_hw *hw)
 {
-	struct cdns_torrent_refclk_driver *refclk_driver = to_cdns_torrent_refclk_driver(hw);
+	struct tp_refclk_driver *refclk = tp_to_refclk_driver(hw);
 
-	regmap_field_write(refclk_driver->cmn_fields[CMN_CDIAG_REFCLK_DRV0_CTRL_1], 1);
+	tp_reg_field_write(&refclk->fields[CMN_CDIAG_REFCLK_DRV0_CTRL_1], 1);
 }
 
-static int cdns_torrent_refclk_driver_is_enabled(struct clk_hw *hw)
+static int tp_refclk_driver_is_enabled(struct clk_hw *hw)
 {
-	struct cdns_torrent_refclk_driver *refclk_driver = to_cdns_torrent_refclk_driver(hw);
-	int val;
-
-	regmap_field_read(refclk_driver->cmn_fields[CMN_CDIAG_REFCLK_DRV0_CTRL_1], &val);
+	struct tp_refclk_driver *refclk = tp_to_refclk_driver(hw);
+	u16 val;
 
+	val = tp_reg_field_read(&refclk->fields[CMN_CDIAG_REFCLK_DRV0_CTRL_1]);
 	return !val;
 }
 
-static u8 cdns_torrent_refclk_driver_get_parent(struct clk_hw *hw)
+static u8 tp_refclk_driver_get_parent(struct clk_hw *hw)
 {
-	struct cdns_torrent_refclk_driver *refclk_driver = to_cdns_torrent_refclk_driver(hw);
-	unsigned int val;
+	struct tp_refclk_driver *refclk = tp_to_refclk_driver(hw);
+	u16 val;
 
-	regmap_field_read(refclk_driver->cmn_fields[CMN_CDIAG_REFCLK_DRV0_CTRL_4], &val);
-	return clk_mux_val_to_index(hw, cdns_torrent_refclk_driver_mux_table, 0, val);
+	val = tp_reg_field_read(&refclk->fields[CMN_CDIAG_REFCLK_DRV0_CTRL_4]);
+	return clk_mux_val_to_index(hw, tp_refclk_driver_mux_table, 0, val);
 }
 
-static int cdns_torrent_refclk_driver_set_parent(struct clk_hw *hw, u8 index)
+static int tp_refclk_driver_set_parent(struct clk_hw *hw, u8 index)
 {
-	struct cdns_torrent_refclk_driver *refclk_driver = to_cdns_torrent_refclk_driver(hw);
-	unsigned int val;
+	struct tp_refclk_driver *refclk = tp_to_refclk_driver(hw);
+	u16 val;
 
-	val = cdns_torrent_refclk_driver_mux_table[index];
-	return regmap_field_write(refclk_driver->cmn_fields[CMN_CDIAG_REFCLK_DRV0_CTRL_4], val);
+	if (index >= ARRAY_SIZE(tp_refclk_driver_mux_table))
+		return -EINVAL;
+
+	val = tp_refclk_driver_mux_table[index];
+	tp_reg_field_write(&refclk->fields[CMN_CDIAG_REFCLK_DRV0_CTRL_4], val);
+	return 0;
 }
 
-static const struct clk_ops cdns_torrent_refclk_driver_ops = {
-	.enable = cdns_torrent_refclk_driver_enable,
-	.disable = cdns_torrent_refclk_driver_disable,
-	.is_enabled = cdns_torrent_refclk_driver_is_enabled,
+static const struct clk_ops tp_refclk_driver_ops = {
+	.enable = tp_refclk_driver_enable,
+	.disable = tp_refclk_driver_disable,
+	.is_enabled = tp_refclk_driver_is_enabled,
 	.determine_rate = __clk_mux_determine_rate,
-	.set_parent = cdns_torrent_refclk_driver_set_parent,
-	.get_parent = cdns_torrent_refclk_driver_get_parent,
+	.set_parent = tp_refclk_driver_set_parent,
+	.get_parent = tp_refclk_driver_get_parent,
 };
 
-static int cdns_torrent_refclk_driver_register(struct cdns_torrent_phy *cdns_phy)
+static int tp_refclk_driver_register(struct tp_phy *tp_phy)
 {
-	struct cdns_torrent_refclk_driver *refclk_driver;
-	struct device *dev = cdns_phy->dev;
-	struct regmap_field *field;
-	struct clk_init_data *init;
-	const char **parent_names;
-	unsigned int num_parents;
-	struct regmap *regmap;
+	struct tp_refclk_driver *refclk_drv;
+	struct clk_init_data init_data = { .flags = 0 };
+	struct device *dev = tp_phy->dev;
+	const char *parent_names[ARRAY_SIZE(tp_refclk_driver_parent_idx)];
+	u32 num_parents;
 	char clk_name[100];
 	struct clk_hw *hw;
-	int i, ret;
+	int ret;
 
-	refclk_driver = devm_kzalloc_obj(dev, *refclk_driver);
-	if (!refclk_driver)
-		return -ENOMEM;
-
-	num_parents = ARRAY_SIZE(refclk_driver_parent_index);
-	parent_names = devm_kzalloc(dev, (sizeof(char *) * num_parents), GFP_KERNEL);
-	if (!parent_names)
-		return -ENOMEM;
-
-	for (i = 0; i < num_parents; i++) {
-		hw = cdns_phy->clk_hw_data->hws[refclk_driver_parent_index[i]];
+	num_parents = ARRAY_SIZE(tp_refclk_driver_parent_idx);
+	for (u32 i = 0; i < num_parents; ++i) {
+		hw = tp_phy->clk_hw_data->hws[tp_refclk_driver_parent_idx[i]];
 		if (IS_ERR_OR_NULL(hw)) {
 			dev_err(dev, "No parent clock for refclk driver clock\n");
 			return IS_ERR(hw) ? PTR_ERR(hw) : -ENOENT;
@@ -2072,682 +4218,95 @@ static int cdns_torrent_refclk_driver_register(struct cdns_torrent_phy *cdns_phy
 	}
 
 	snprintf(clk_name, sizeof(clk_name), "%s_%s", dev_name(dev),
-		 clk_names[CDNS_TORRENT_REFCLK_DRIVER]);
+		 tp_clk_names[CDNS_TORRENT_REFCLK_DRIVER]);
 
-	init = &refclk_driver->clk_data;
+	init_data.ops = &tp_refclk_driver_ops;
+	init_data.flags = CLK_SET_RATE_NO_REPARENT;
+	init_data.parent_names = parent_names;
+	init_data.num_parents = num_parents;
+	init_data.name = clk_name;
 
-	init->ops = &cdns_torrent_refclk_driver_ops;
-	init->flags = CLK_SET_RATE_NO_REPARENT;
-	init->parent_names = parent_names;
-	init->num_parents = num_parents;
-	init->name = clk_name;
-
-	regmap = cdns_phy->regmap_common_cdb;
-
-	for (i = 0; i < REFCLK_OUT_NUM_CMN_CONFIG; i++) {
-		field = devm_regmap_field_alloc(dev, regmap, refclk_out_cmn_cfg[i]);
-		if (IS_ERR(field)) {
-			dev_err(dev, "Refclk driver CMN reg field init failed\n");
-			return PTR_ERR(field);
-		}
-		refclk_driver->cmn_fields[i] = field;
-	}
+	refclk_drv = &tp_phy->refclk_driver;
 
 	/* Enable Derived reference clock as default */
-	regmap_field_write(refclk_driver->cmn_fields[CMN_CDIAG_REFCLK_DRV0_CTRL_4], 1);
+	tp_reg_field_write(&refclk_drv->fields[CMN_CDIAG_REFCLK_DRV0_CTRL_4], 1);
 
-	refclk_driver->hw.init = init;
+	refclk_drv->hw.init = &init_data;
 
-	hw = &refclk_driver->hw;
+	hw = &refclk_drv->hw;
 	ret = devm_clk_hw_register(dev, hw);
 	if (ret)
 		return ret;
 
-	cdns_phy->clk_hw_data->hws[CDNS_TORRENT_REFCLK_DRIVER] = hw;
+	tp_phy->clk_hw_data->hws[CDNS_TORRENT_REFCLK_DRIVER] = hw;
 
 	return 0;
 }
 
-static struct regmap *cdns_regmap_init(struct device *dev, void __iomem *base,
-				       u32 block_offset,
-				       u8 reg_offset_shift,
-				       const struct regmap_config *config)
+static void tp_reg_fields_init(struct tp_phy *tp_phy)
 {
-	struct cdns_regmap_cdb_context *ctx;
+	tp_reg_field_init(&tp_phy->reg_phy_pcs_common_cdb, PHY_PLL_CFG, GENMASK_U16(1, 0),
+			  &tp_phy->phy_pll_cfg);
 
-	ctx = devm_kzalloc_obj(dev, *ctx);
-	if (!ctx)
-		return ERR_PTR(-ENOMEM);
+	tp_reg_field_init(&tp_phy->reg_phy_pcs_common_cdb, PHY_PIPE_CMN_CTRL1,
+			  GENMASK_U16(0, 0), &tp_phy->phy_pipe_cmn_ctrl1_0);
 
-	ctx->dev = dev;
-	ctx->base = base + block_offset;
-	ctx->reg_offset_shift = reg_offset_shift;
+	tp_reg_field_init(&tp_phy->reg_common_cdb, CMN_CDIAG_REFCLK_OVRD, GENMASK_U16(4, 4),
+			  &tp_phy->cmn_cdiag_refclk_ovrd_4);
 
-	return devm_regmap_init(dev, NULL, ctx, config);
-}
-
-static int cdns_torrent_dp_regfield_init(struct cdns_torrent_phy *cdns_phy)
-{
-	struct device *dev = cdns_phy->dev;
-	struct regmap_field *field;
-	struct regmap *regmap;
-
-	regmap = cdns_phy->regmap_dptx_phy_reg;
-	field = devm_regmap_field_alloc(dev, regmap, phy_reset_ctrl);
-	if (IS_ERR(field)) {
-		dev_err(dev, "PHY_RESET reg field init failed\n");
-		return PTR_ERR(field);
-	}
-	cdns_phy->phy_reset_ctrl = field;
-
-	return 0;
-}
-
-static int cdns_torrent_regfield_init(struct cdns_torrent_phy *cdns_phy)
-{
-	struct device *dev = cdns_phy->dev;
-	struct regmap_field *field;
-	struct regmap *regmap;
-	int i;
-
-	regmap = cdns_phy->regmap_phy_pcs_common_cdb;
-	field = devm_regmap_field_alloc(dev, regmap, phy_pll_cfg);
-	if (IS_ERR(field)) {
-		dev_err(dev, "PHY_PLL_CFG reg field init failed\n");
-		return PTR_ERR(field);
-	}
-	cdns_phy->phy_pll_cfg = field;
-
-	regmap = cdns_phy->regmap_phy_pcs_common_cdb;
-	field = devm_regmap_field_alloc(dev, regmap, phy_pipe_cmn_ctrl1_0);
-	if (IS_ERR(field)) {
-		dev_err(dev, "phy_pipe_cmn_ctrl1_0 reg field init failed\n");
-		return PTR_ERR(field);
-	}
-	cdns_phy->phy_pipe_cmn_ctrl1_0 = field;
-
-	regmap = cdns_phy->regmap_common_cdb;
-	field = devm_regmap_field_alloc(dev, regmap, cmn_cdiag_refclk_ovrd_4);
-	if (IS_ERR(field)) {
-		dev_err(dev, "cmn_cdiag_refclk_ovrd_4 reg field init failed\n");
-		return PTR_ERR(field);
-	}
-	cdns_phy->cmn_cdiag_refclk_ovrd_4 = field;
-
-	regmap = cdns_phy->regmap_phy_pma_common_cdb;
-	field = devm_regmap_field_alloc(dev, regmap, phy_pma_cmn_ctrl_1);
-	if (IS_ERR(field)) {
-		dev_err(dev, "PHY_PMA_CMN_CTRL1 reg field init failed\n");
-		return PTR_ERR(field);
-	}
-	cdns_phy->phy_pma_cmn_ctrl_1 = field;
-
-	regmap = cdns_phy->regmap_phy_pma_common_cdb;
-	field = devm_regmap_field_alloc(dev, regmap, phy_pma_cmn_ctrl_2);
-	if (IS_ERR(field)) {
-		dev_err(dev, "PHY_PMA_CMN_CTRL2 reg field init failed\n");
-		return PTR_ERR(field);
-	}
-	cdns_phy->phy_pma_cmn_ctrl_2 = field;
-
-	regmap = cdns_phy->regmap_phy_pma_common_cdb;
-	field = devm_regmap_field_alloc(dev, regmap, phy_pma_pll_raw_ctrl);
-	if (IS_ERR(field)) {
-		dev_err(dev, "PHY_PMA_PLL_RAW_CTRL reg field init failed\n");
-		return PTR_ERR(field);
-	}
-	cdns_phy->phy_pma_pll_raw_ctrl = field;
-
-	for (i = 0; i < MAX_NUM_LANES; i++) {
-		regmap = cdns_phy->regmap_phy_pcs_lane_cdb[i];
-		field = devm_regmap_field_alloc(dev, regmap, phy_pcs_iso_link_ctrl_1);
-		if (IS_ERR(field)) {
-			dev_err(dev, "PHY_PCS_ISO_LINK_CTRL reg field init for ln %d failed\n", i);
-			return PTR_ERR(field);
-		}
-		cdns_phy->phy_pcs_iso_link_ctrl_1[i] = field;
-	}
+	tp_reg_field_init(&tp_phy->reg_common_cdb, CMN_CDIAG_REFCLK_DRV0_CTRL,
+			  GENMASK_U16(1, 1),
+			  &tp_phy->refclk_driver.fields[CMN_CDIAG_REFCLK_DRV0_CTRL_1]);
 
-	return 0;
-}
-
-static int cdns_torrent_dp_regmap_init(struct cdns_torrent_phy *cdns_phy)
-{
-	void __iomem *base = cdns_phy->base;
-	struct device *dev = cdns_phy->dev;
-	struct regmap *regmap;
-	u8 reg_offset_shift;
-	u32 block_offset;
-
-	reg_offset_shift = cdns_phy->init_data->reg_offset_shift;
+	tp_reg_field_init(&tp_phy->reg_common_cdb, CMN_CDIAG_REFCLK_DRV0_CTRL,
+			  GENMASK_U16(4, 4),
+			  &tp_phy->refclk_driver.fields[CMN_CDIAG_REFCLK_DRV0_CTRL_4]);
 
-	block_offset = TORRENT_DPTX_PHY_OFFSET;
-	regmap = cdns_regmap_init(dev, base, block_offset,
-				  reg_offset_shift,
-				  &cdns_torrent_dptx_phy_config);
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "Failed to init DPTX PHY regmap\n");
-		return PTR_ERR(regmap);
-	}
-	cdns_phy->regmap_dptx_phy_reg = regmap;
+	tp_reg_field_init(&tp_phy->reg_common_cdb, CMN_CDIAG_REFCLK_DRV0_CTRL,
+			  GENMASK_U16(5, 5),
+			  &tp_phy->refclk_driver.fields[CMN_CDIAG_REFCLK_DRV0_CTRL_5]);
 
-	return 0;
+	tp_reg_field_init(&tp_phy->reg_common_cdb, CMN_CDIAG_REFCLK_DRV0_CTRL,
+			  GENMASK_U16(6, 6),
+			  &tp_phy->refclk_driver.fields[CMN_CDIAG_REFCLK_DRV0_CTRL_6]);
 }
 
-static int cdns_torrent_regmap_init(struct cdns_torrent_phy *cdns_phy)
+static void tp_reg_bases_init(struct tp_phy *tp_phy)
 {
-	void __iomem *sd_base = cdns_phy->sd_base;
-	u8 block_offset_shift, reg_offset_shift;
-	struct device *dev = cdns_phy->dev;
-	struct regmap *regmap;
 	u32 block_offset;
-	int i;
-
-	block_offset_shift = cdns_phy->init_data->block_offset_shift;
-	reg_offset_shift = cdns_phy->init_data->reg_offset_shift;
-
-	for (i = 0; i < MAX_NUM_LANES; i++) {
-		block_offset = TORRENT_TX_LANE_CDB_OFFSET(i, block_offset_shift,
-							  reg_offset_shift);
-		regmap = cdns_regmap_init(dev, sd_base, block_offset,
-					  reg_offset_shift,
-					  &cdns_torrent_tx_lane_cdb_config[i]);
-		if (IS_ERR(regmap)) {
-			dev_err(dev, "Failed to init tx lane CDB regmap\n");
-			return PTR_ERR(regmap);
-		}
-		cdns_phy->regmap_tx_lane_cdb[i] = regmap;
-
-		block_offset = TORRENT_RX_LANE_CDB_OFFSET(i, block_offset_shift,
-							  reg_offset_shift);
-		regmap = cdns_regmap_init(dev, sd_base, block_offset,
-					  reg_offset_shift,
-					  &cdns_torrent_rx_lane_cdb_config[i]);
-		if (IS_ERR(regmap)) {
-			dev_err(dev, "Failed to init rx lane CDB regmap\n");
-			return PTR_ERR(regmap);
-		}
-		cdns_phy->regmap_rx_lane_cdb[i] = regmap;
-
-		block_offset = TORRENT_PHY_PCS_LANE_CDB_OFFSET(i, block_offset_shift,
-							       reg_offset_shift);
-		regmap = cdns_regmap_init(dev, sd_base, block_offset,
-					  reg_offset_shift,
-					  &cdns_torrent_phy_pcs_lane_cdb_config[i]);
-		if (IS_ERR(regmap)) {
-			dev_err(dev, "Failed to init PHY PCS lane CDB regmap\n");
-			return PTR_ERR(regmap);
-		}
-		cdns_phy->regmap_phy_pcs_lane_cdb[i] = regmap;
-	}
-
-	block_offset = TORRENT_COMMON_CDB_OFFSET;
-	regmap = cdns_regmap_init(dev, sd_base, block_offset,
-				  reg_offset_shift,
-				  &cdns_torrent_common_cdb_config);
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "Failed to init common CDB regmap\n");
-		return PTR_ERR(regmap);
-	}
-	cdns_phy->regmap_common_cdb = regmap;
-
-	block_offset = TORRENT_PHY_PCS_COMMON_OFFSET(block_offset_shift);
-	regmap = cdns_regmap_init(dev, sd_base, block_offset,
-				  reg_offset_shift,
-				  &cdns_torrent_phy_pcs_cmn_cdb_config);
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "Failed to init PHY PCS common CDB regmap\n");
-		return PTR_ERR(regmap);
-	}
-	cdns_phy->regmap_phy_pcs_common_cdb = regmap;
-
-	block_offset = TORRENT_PHY_PMA_COMMON_OFFSET(block_offset_shift);
-	regmap = cdns_regmap_init(dev, sd_base, block_offset,
-				  reg_offset_shift,
-				  &cdns_torrent_phy_pma_cmn_cdb_config);
-	if (IS_ERR(regmap)) {
-		dev_err(dev, "Failed to init PHY PMA common CDB regmap\n");
-		return PTR_ERR(regmap);
-	}
-	cdns_phy->regmap_phy_pma_common_cdb = regmap;
-
-	return 0;
-}
+	u8 block_shift = tp_phy->init_data->block_offset_shift;
+	u8 reg_shift = tp_phy->init_data->reg_offset_shift;
 
-static int cdns_torrent_phy_init(struct phy *phy)
-{
-	struct cdns_torrent_phy *cdns_phy = dev_get_drvdata(phy->dev.parent);
-	const struct cdns_torrent_vals *cmn_vals, *tx_ln_vals, *rx_ln_vals;
-	const struct cdns_torrent_data *init_data = cdns_phy->init_data;
-	const struct cdns_torrent_vals *link_cmn_vals, *xcvr_diag_vals;
-	enum cdns_torrent_ref_clk ref_clk = cdns_phy->ref_clk_rate;
-	struct cdns_torrent_inst *inst = phy_get_drvdata(phy);
-	enum cdns_torrent_phy_type phy_type = inst->phy_type;
-	const struct cdns_torrent_vals *phy_pma_cmn_vals;
-	enum cdns_torrent_ssc_mode ssc = inst->ssc_mode;
-	const struct cdns_torrent_vals *pcs_cmn_vals;
-	const struct cdns_reg_pairs *reg_pairs;
-	struct regmap *regmap;
-	u32 num_regs;
-	int i, j;
+	for (u32 i = 0; i < MAX_NUM_LANES; ++i) {
+		block_offset = TORRENT_TX_LANE_CDB_OFFSET(i, block_shift, reg_shift);
+		tp_reg_base_init(tp_phy, block_offset, &tp_phy->reg_tx_lane_cdb[i]);
 
-	if (cdns_phy->already_configured)
-		return 0;
+		block_offset = TORRENT_RX_LANE_CDB_OFFSET(i, block_shift, reg_shift);
+		tp_reg_base_init(tp_phy, block_offset, &tp_phy->reg_rx_lane_cdb[i]);
 
-	if (cdns_phy->nsubnodes > 1) {
-		if (phy_type == TYPE_DP)
-			return cdns_torrent_dp_multilink_init(cdns_phy, inst, phy);
-		return 0;
+		block_offset = TORRENT_PHY_PCS_LANE_CDB_OFFSET(i, block_shift, reg_shift);
+		tp_reg_base_init(tp_phy, block_offset, &tp_phy->reg_phy_pcs_lane_cdb[i]);
 	}
 
-	/**
-	 * Spread spectrum generation is not required or supported
-	 * for SGMII/QSGMII/USXGMII
-	 */
-	if (phy_type == TYPE_SGMII || phy_type == TYPE_QSGMII || phy_type == TYPE_USXGMII)
-		ssc = NO_SSC;
-
-	/* PHY configuration specific registers for single link */
-	link_cmn_vals = cdns_torrent_get_tbl_vals(&init_data->link_cmn_vals_tbl,
-						  CLK_ANY, CLK_ANY,
-						  phy_type, TYPE_NONE,
-						  ANY_SSC);
-	if (link_cmn_vals) {
-		reg_pairs = link_cmn_vals->reg_pairs;
-		num_regs = link_cmn_vals->num_regs;
-		regmap = cdns_phy->regmap_common_cdb;
+	tp_reg_base_init(tp_phy, TORRENT_COMMON_CDB_OFFSET, &tp_phy->reg_common_cdb);
 
-		/**
-		 * First array value in link_cmn_vals must be of
-		 * PHY_PLL_CFG register
-		 */
-		regmap_field_write(cdns_phy->phy_pll_cfg, reg_pairs[0].val);
+	block_offset = TORRENT_PHY_PCS_COMMON_OFFSET(block_shift);
+	tp_reg_base_init(tp_phy, block_offset, &tp_phy->reg_phy_pcs_common_cdb);
 
-		for (i = 1; i < num_regs; i++)
-			regmap_write(regmap, reg_pairs[i].off,
-				     reg_pairs[i].val);
-	}
-
-	xcvr_diag_vals = cdns_torrent_get_tbl_vals(&init_data->xcvr_diag_vals_tbl,
-						   CLK_ANY, CLK_ANY,
-						   phy_type, TYPE_NONE,
-						   ANY_SSC);
-	if (xcvr_diag_vals) {
-		reg_pairs = xcvr_diag_vals->reg_pairs;
-		num_regs = xcvr_diag_vals->num_regs;
-		for (i = 0; i < inst->num_lanes; i++) {
-			regmap = cdns_phy->regmap_tx_lane_cdb[i + inst->mlane];
-			for (j = 0; j < num_regs; j++)
-				regmap_write(regmap, reg_pairs[j].off,
-					     reg_pairs[j].val);
-		}
-	}
-
-	/* PHY PCS common registers configurations */
-	pcs_cmn_vals = cdns_torrent_get_tbl_vals(&init_data->pcs_cmn_vals_tbl,
-						 CLK_ANY, CLK_ANY,
-						 phy_type, TYPE_NONE,
-						 ANY_SSC);
-	if (pcs_cmn_vals) {
-		reg_pairs = pcs_cmn_vals->reg_pairs;
-		num_regs = pcs_cmn_vals->num_regs;
-		regmap = cdns_phy->regmap_phy_pcs_common_cdb;
-		for (i = 0; i < num_regs; i++)
-			regmap_write(regmap, reg_pairs[i].off,
-				     reg_pairs[i].val);
-	}
-
-	/* PHY PMA common registers configurations */
-	phy_pma_cmn_vals = cdns_torrent_get_tbl_vals(&init_data->phy_pma_cmn_vals_tbl,
-						     CLK_ANY, CLK_ANY,
-						     phy_type, TYPE_NONE,
-						     ANY_SSC);
-	if (phy_pma_cmn_vals) {
-		reg_pairs = phy_pma_cmn_vals->reg_pairs;
-		num_regs = phy_pma_cmn_vals->num_regs;
-		regmap = cdns_phy->regmap_phy_pma_common_cdb;
-		for (i = 0; i < num_regs; i++)
-			regmap_write(regmap, reg_pairs[i].off,
-				     reg_pairs[i].val);
-	}
-
-	/* PMA common registers configurations */
-	cmn_vals = cdns_torrent_get_tbl_vals(&init_data->cmn_vals_tbl,
-					     ref_clk, ref_clk,
-					     phy_type, TYPE_NONE,
-					     ssc);
-	if (cmn_vals) {
-		reg_pairs = cmn_vals->reg_pairs;
-		num_regs = cmn_vals->num_regs;
-		regmap = cdns_phy->regmap_common_cdb;
-		for (i = 0; i < num_regs; i++)
-			regmap_write(regmap, reg_pairs[i].off,
-				     reg_pairs[i].val);
-	}
-
-	/* PMA TX lane registers configurations */
-	tx_ln_vals = cdns_torrent_get_tbl_vals(&init_data->tx_ln_vals_tbl,
-					       ref_clk, ref_clk,
-					       phy_type, TYPE_NONE,
-					       ssc);
-	if (tx_ln_vals) {
-		reg_pairs = tx_ln_vals->reg_pairs;
-		num_regs = tx_ln_vals->num_regs;
-		for (i = 0; i < inst->num_lanes; i++) {
-			regmap = cdns_phy->regmap_tx_lane_cdb[i + inst->mlane];
-			for (j = 0; j < num_regs; j++)
-				regmap_write(regmap, reg_pairs[j].off,
-					     reg_pairs[j].val);
-		}
-	}
-
-	/* PMA RX lane registers configurations */
-	rx_ln_vals = cdns_torrent_get_tbl_vals(&init_data->rx_ln_vals_tbl,
-					       ref_clk, ref_clk,
-					       phy_type, TYPE_NONE,
-					       ssc);
-	if (rx_ln_vals) {
-		reg_pairs = rx_ln_vals->reg_pairs;
-		num_regs = rx_ln_vals->num_regs;
-		for (i = 0; i < inst->num_lanes; i++) {
-			regmap = cdns_phy->regmap_rx_lane_cdb[i + inst->mlane];
-			for (j = 0; j < num_regs; j++)
-				regmap_write(regmap, reg_pairs[j].off,
-					     reg_pairs[j].val);
-		}
-	}
-
-	if (phy_type == TYPE_DP)
-		return cdns_torrent_dp_init(phy);
-
-	return 0;
-}
-
-static const struct phy_ops cdns_torrent_phy_ops = {
-	.init		= cdns_torrent_phy_init,
-	.configure	= cdns_torrent_dp_configure,
-	.power_on	= cdns_torrent_phy_on,
-	.power_off	= cdns_torrent_phy_off,
-	.owner		= THIS_MODULE,
-};
-
-static
-int cdns_torrent_phy_configure_multilink(struct cdns_torrent_phy *cdns_phy)
-{
-	const struct cdns_torrent_vals *cmn_vals, *tx_ln_vals, *rx_ln_vals;
-	const struct cdns_torrent_data *init_data = cdns_phy->init_data;
-	const struct cdns_torrent_vals *link_cmn_vals, *xcvr_diag_vals;
-	enum cdns_torrent_ref_clk ref_clk1 = cdns_phy->ref_clk1_rate;
-	enum cdns_torrent_ref_clk ref_clk = cdns_phy->ref_clk_rate;
-	const struct cdns_torrent_vals *phy_pma_cmn_vals;
-	const struct cdns_torrent_vals *pcs_cmn_vals;
-	enum cdns_torrent_phy_type phy_t1, phy_t2;
-	const struct cdns_reg_pairs *reg_pairs;
-	int i, j, node, mlane, num_lanes, ret;
-	struct device *dev = cdns_phy->dev;
-	enum cdns_torrent_ssc_mode ssc;
-	struct regmap *regmap;
-	u32 num_regs, num_protocols, protocol;
-	u32 num_pcie_links = 0;
-
-	num_protocols = hweight32(cdns_phy->protocol_bitmask);
-	/* Maximum 2 protocols are supported */
-	if (num_protocols > 2) {
-		dev_err(dev, "at most 2 protocols are supported\n");
-		return -EINVAL;
-	}
-
-
-	/**
-	 * Get PHY types directly from subnodes if only 2 subnodes exist.
-	 * It is possible for phy_t1 to be the same as phy_t2 for special
-	 * configurations such as PCIe Multilink.
-	 */
-	if (cdns_phy->nsubnodes == 2) {
-		phy_t1 = cdns_phy->phys[0].phy_type;
-		phy_t2 = cdns_phy->phys[1].phy_type;
-	} else {
-		/**
-		 * Both PHY types / protocols should be unique.
-		 * If they are the same, it should be expressed with either
-		 * a) Single-Link (1 Sub-node) - handled via PHY APIs
-		 * OR
-		 * b) Double-Link (2 Sub-nodes) - handled above
-		 */
-		if (num_protocols != 2) {
-			dev_err(dev, "incorrect representation of link\n");
-			return -EINVAL;
-		}
-
-		phy_t1 = fns(cdns_phy->protocol_bitmask, 0);
-		phy_t2 = fns(cdns_phy->protocol_bitmask, 1);
-
-		/*
-		 * PCIe Multilink configuration can be supported along with a
-		 * non-PCIe protocol. The existing limitation associated with
-		 * the standalone PCIe Multilink configuration still remains,
-		 * implying that there can be only two links (subnodes) of the
-		 * PHY type PCIe which constitute the PCIe Multilink.
-		 *
-		 * Such configurations are handled by introducing a new protocol
-		 * namely TYPE_PCIE_ML. Both of the PCIe links which have the
-		 * protocol as TYPE_PCIE shall be treated as though the protocol
-		 * corresponding to them is TYPE_PCIE_ML only for the sake of
-		 * configuring the SERDES.
-		 *
-		 * PCIe Multilink configuration can be identified by checking if
-		 * there are exactly two links with phy_type set to TYPE_PCIE.
-		 * phy_t1 and phy_t2 are modified in such cases to support the
-		 * PCIe Multilink configuration with a non-PCIe protocol.
-		 */
-		for (node = 0; node < cdns_phy->nsubnodes; node++) {
-			if (cdns_phy->phys[node].phy_type == TYPE_PCIE)
-				num_pcie_links++;
-		}
-
-		if (num_pcie_links > 2) {
-			dev_err(dev, "cannot support PCIe Multilink with %u PCIe links\n",
-				num_pcie_links);
-			return -EINVAL;
-		} else if (num_pcie_links == 2) {
-			phy_t1 = TYPE_PCIE_ML;
-			for (node = 0; node < cdns_phy->nsubnodes; node++) {
-				if (cdns_phy->phys[node].phy_type == TYPE_PCIE) {
-					cdns_phy->phys[node].phy_type = TYPE_PCIE_ML;
-					continue;
-				}
-				phy_t2 = cdns_phy->phys[node].phy_type;
-			}
-		}
-	}
-
-	/**
-	 * Configure all links with the protocol phy_t1 first followed by
-	 * configuring all links with the protocol phy_t2.
-	 *
-	 * When phy_t1 = phy_t2, it is a single protocol and configuration
-	 * is performed with a single iteration of the protocol and multiple
-	 * iterations over the sub-nodes (links).
-	 *
-	 * When phy_t1 != phy_t2, there are two protocols and configuration
-	 * is performed by iterating over all sub-nodes matching the first
-	 * protocol and configuring them first, followed by iterating over
-	 * all sub-nodes matching the second protocol and configuring them
-	 * next.
-	 */
-	for (protocol = 0; protocol < num_protocols; protocol++) {
-		/**
-		 * For the case where num_protocols is 1,
-		 * phy_t1 = phy_t2 and the swap is unnecessary.
-		 *
-		 * Swapping phy_t1 and phy_t2 is only required when the
-		 * number of protocols is 2 and there are 2 or more links.
-		 */
-		if (protocol == 1) {
-			/**
-			 * If first protocol with phy_t1 is configured, then
-			 * configure the PHY for second protocol with phy_t2.
-			 * Get the array values as [phy_t2][phy_t1][ssc].
-			 */
-			swap(phy_t1, phy_t2);
-			swap(ref_clk, ref_clk1);
-		}
-
-		for (node = 0; node < cdns_phy->nsubnodes; node++) {
-			if (cdns_phy->phys[node].phy_type != phy_t1)
-				continue;
-
-			mlane = cdns_phy->phys[node].mlane;
-			ssc = cdns_phy->phys[node].ssc_mode;
-			num_lanes = cdns_phy->phys[node].num_lanes;
-
-			/**
-			 * PHY configuration specific registers:
-			 * link_cmn_vals depend on combination of PHY types being
-			 * configured and are common for both PHY types, so array
-			 * values should be same for [phy_t1][phy_t2][ssc] and
-			 * [phy_t2][phy_t1][ssc].
-			 * xcvr_diag_vals also depend on combination of PHY types
-			 * being configured, but these can be different for particular
-			 * PHY type and are per lane.
-			 */
-			link_cmn_vals = cdns_torrent_get_tbl_vals(&init_data->link_cmn_vals_tbl,
-								  CLK_ANY, CLK_ANY,
-								  phy_t1, phy_t2, ANY_SSC);
-			if (link_cmn_vals) {
-				reg_pairs = link_cmn_vals->reg_pairs;
-				num_regs = link_cmn_vals->num_regs;
-				regmap = cdns_phy->regmap_common_cdb;
-
-				/**
-				 * First array value in link_cmn_vals must be of
-				 * PHY_PLL_CFG register
-				 */
-				regmap_field_write(cdns_phy->phy_pll_cfg,
-						   reg_pairs[0].val);
-
-				for (i = 1; i < num_regs; i++)
-					regmap_write(regmap, reg_pairs[i].off,
-						     reg_pairs[i].val);
-			}
-
-			xcvr_diag_vals = cdns_torrent_get_tbl_vals(&init_data->xcvr_diag_vals_tbl,
-								   CLK_ANY, CLK_ANY,
-								   phy_t1, phy_t2, ANY_SSC);
-			if (xcvr_diag_vals) {
-				reg_pairs = xcvr_diag_vals->reg_pairs;
-				num_regs = xcvr_diag_vals->num_regs;
-				for (i = 0; i < num_lanes; i++) {
-					regmap = cdns_phy->regmap_tx_lane_cdb[i + mlane];
-					for (j = 0; j < num_regs; j++)
-						regmap_write(regmap, reg_pairs[j].off,
-							     reg_pairs[j].val);
-				}
-			}
-
-			/* PHY PCS common registers configurations */
-			pcs_cmn_vals = cdns_torrent_get_tbl_vals(&init_data->pcs_cmn_vals_tbl,
-								 CLK_ANY, CLK_ANY,
-								 phy_t1, phy_t2, ANY_SSC);
-			if (pcs_cmn_vals) {
-				reg_pairs = pcs_cmn_vals->reg_pairs;
-				num_regs = pcs_cmn_vals->num_regs;
-				regmap = cdns_phy->regmap_phy_pcs_common_cdb;
-				for (i = 0; i < num_regs; i++)
-					regmap_write(regmap, reg_pairs[i].off,
-						     reg_pairs[i].val);
-			}
-
-			/* PHY PMA common registers configurations */
-			phy_pma_cmn_vals =
-				cdns_torrent_get_tbl_vals(&init_data->phy_pma_cmn_vals_tbl,
-							  CLK_ANY, CLK_ANY, phy_t1, phy_t2,
-							  ANY_SSC);
-			if (phy_pma_cmn_vals) {
-				reg_pairs = phy_pma_cmn_vals->reg_pairs;
-				num_regs = phy_pma_cmn_vals->num_regs;
-				regmap = cdns_phy->regmap_phy_pma_common_cdb;
-				for (i = 0; i < num_regs; i++)
-					regmap_write(regmap, reg_pairs[i].off,
-						     reg_pairs[i].val);
-			}
-
-			/* PMA common registers configurations */
-			cmn_vals = cdns_torrent_get_tbl_vals(&init_data->cmn_vals_tbl,
-							     ref_clk, ref_clk1,
-							     phy_t1, phy_t2, ssc);
-			if (cmn_vals) {
-				reg_pairs = cmn_vals->reg_pairs;
-				num_regs = cmn_vals->num_regs;
-				regmap = cdns_phy->regmap_common_cdb;
-				for (i = 0; i < num_regs; i++)
-					regmap_write(regmap, reg_pairs[i].off,
-						     reg_pairs[i].val);
-			}
-
-			/* PMA TX lane registers configurations */
-			tx_ln_vals = cdns_torrent_get_tbl_vals(&init_data->tx_ln_vals_tbl,
-							       ref_clk, ref_clk1,
-							       phy_t1, phy_t2, ssc);
-			if (tx_ln_vals) {
-				reg_pairs = tx_ln_vals->reg_pairs;
-				num_regs = tx_ln_vals->num_regs;
-				for (i = 0; i < num_lanes; i++) {
-					regmap = cdns_phy->regmap_tx_lane_cdb[i + mlane];
-					for (j = 0; j < num_regs; j++)
-						regmap_write(regmap, reg_pairs[j].off,
-							     reg_pairs[j].val);
-				}
-			}
-
-			/* PMA RX lane registers configurations */
-			rx_ln_vals = cdns_torrent_get_tbl_vals(&init_data->rx_ln_vals_tbl,
-							       ref_clk, ref_clk1,
-							       phy_t1, phy_t2, ssc);
-			if (rx_ln_vals) {
-				reg_pairs = rx_ln_vals->reg_pairs;
-				num_regs = rx_ln_vals->num_regs;
-				for (i = 0; i < num_lanes; i++) {
-					regmap = cdns_phy->regmap_rx_lane_cdb[i + mlane];
-					for (j = 0; j < num_regs; j++)
-						regmap_write(regmap, reg_pairs[j].off,
-							     reg_pairs[j].val);
-				}
-			}
-
-			if (phy_t1 == TYPE_DP) {
-				ret = cdns_torrent_dp_get_pll(cdns_phy, phy_t2);
-				if (ret)
-					return ret;
-			}
-
-			reset_control_deassert(cdns_phy->phys[node].lnk_rst);
-		}
-	}
-
-	/* Restore TYPE_PCIE_ML to TYPE_PCIE to be compatible with suspend-resume */
-	for (node = 0; node < cdns_phy->nsubnodes; node++)
-		if (cdns_phy->phys[node].phy_type == TYPE_PCIE_ML)
-			cdns_phy->phys[node].phy_type = TYPE_PCIE;
-
-	/* Take the PHY out of reset */
-	ret = reset_control_deassert(cdns_phy->phy_rst);
-	if (ret)
-		return ret;
-
-	return 0;
+	block_offset = TORRENT_PHY_PMA_COMMON_OFFSET(block_shift);
+	tp_reg_base_init(tp_phy, block_offset, &tp_phy->reg_phy_pma_common_cdb);
 }
 
-static void cdns_torrent_clk_cleanup(struct cdns_torrent_phy *cdns_phy)
+static void tp_clk_cleanup(const struct tp_phy *tp_phy)
 {
-	struct device *dev = cdns_phy->dev;
+	struct device *dev = tp_phy->dev;
 
 	of_clk_del_provider(dev->of_node);
 }
 
-static int cdns_torrent_clk_register(struct cdns_torrent_phy *cdns_phy)
+static int tp_clk_register(struct tp_phy *tp_phy)
 {
-	struct device *dev = cdns_phy->dev;
+	struct device *dev = tp_phy->dev;
 	struct device_node *node = dev->of_node;
 	struct clk_hw_onecell_data *data;
 	int ret;
@@ -2757,21 +4316,21 @@ static int cdns_torrent_clk_register(struct cdns_torrent_phy *cdns_phy)
 		return -ENOMEM;
 
 	data->num = CDNS_TORRENT_OUTPUT_CLOCKS;
-	cdns_phy->clk_hw_data = data;
+	tp_phy->clk_hw_data = data;
 
-	ret = cdns_torrent_derived_refclk_register(cdns_phy);
+	ret = tp_derived_refclk_register(tp_phy);
 	if (ret) {
 		dev_err(dev, "failed to register derived refclk\n");
 		return ret;
 	}
 
-	ret = cdns_torrent_received_refclk_register(cdns_phy);
+	ret = tp_received_refclk_register(tp_phy);
 	if (ret) {
 		dev_err(dev, "failed to register received refclk\n");
 		return ret;
 	}
 
-	ret = cdns_torrent_refclk_driver_register(cdns_phy);
+	ret = tp_refclk_driver_register(tp_phy);
 	if (ret) {
 		dev_err(dev, "failed to register refclk driver\n");
 		return ret;
@@ -2786,3061 +4345,799 @@ static int cdns_torrent_clk_register(struct cdns_torrent_phy *cdns_phy)
 	return 0;
 }
 
-static int cdns_torrent_of_get_reset(struct cdns_torrent_phy *cdns_phy)
+static int tp_of_get_reset(struct tp_phy *tp_phy)
 {
-	struct device *dev = cdns_phy->dev;
+	struct device *dev = tp_phy->dev;
+	struct reset_control *rst;
 
-	cdns_phy->phy_rst = devm_reset_control_get_exclusive_by_index(dev, 0);
-	if (IS_ERR(cdns_phy->phy_rst)) {
-		dev_err(dev, "%s: failed to get reset\n",
-			dev->of_node->full_name);
-		return PTR_ERR(cdns_phy->phy_rst);
+	rst = devm_reset_control_get_exclusive_by_index(dev, 0);
+	if (IS_ERR(rst)) {
+		dev_err(dev, "%s: failed to get reset\n", dev->of_node->full_name);
+		return PTR_ERR(rst);
 	}
+	tp_phy->phy_rst = rst;
 
-	cdns_phy->apb_rst = devm_reset_control_get_optional_exclusive(dev, "torrent_apb");
-	if (IS_ERR(cdns_phy->apb_rst)) {
-		dev_err(dev, "%s: failed to get apb reset\n",
-			dev->of_node->full_name);
-		return PTR_ERR(cdns_phy->apb_rst);
+	rst = devm_reset_control_get_optional_exclusive(dev, "torrent_apb");
+	if (IS_ERR(rst)) {
+		dev_err(dev, "%s: failed to get apb reset\n", dev->of_node->full_name);
+		return PTR_ERR(rst);
 	}
-
+	tp_phy->apb_rst = rst;
 	return 0;
 }
 
-static int cdns_torrent_of_get_clk(struct cdns_torrent_phy *cdns_phy)
+static int tp_of_get_clk(struct tp_phy *tp_phy)
 {
+	struct device *dev = tp_phy->dev;
+	struct clk *clk;
+
 	/* refclk: Input reference clock for PLL0 */
-	cdns_phy->clk = devm_clk_get(cdns_phy->dev, "refclk");
-	if (IS_ERR(cdns_phy->clk))
-		return dev_err_probe(cdns_phy->dev, PTR_ERR(cdns_phy->clk),
-				     "phy ref clock not found\n");
+	clk = devm_clk_get(dev, "refclk");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "phy ref clock not found\n");
+
+	tp_phy->clk = clk;
 
 	/* refclk1: Input reference clock for PLL1 */
-	cdns_phy->clk1 = devm_clk_get_optional(cdns_phy->dev, "pll1_refclk");
-	if (IS_ERR(cdns_phy->clk1))
-		return dev_err_probe(cdns_phy->dev, PTR_ERR(cdns_phy->clk1),
-				     "phy PLL1 ref clock not found\n");
+	clk = devm_clk_get_optional(dev, "pll1_refclk");
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "phy PLL1 ref clock not found\n");
 
+	tp_phy->clk1 = clk;
 	return 0;
 }
 
-static int cdns_torrent_clk(struct cdns_torrent_phy *cdns_phy)
+static bool tp_is_ref_freq_supported(enum tp_std_type std_type, u32 ref_clk_hz)
 {
-	unsigned long ref_clk1_rate;
-	unsigned long ref_clk_rate;
+	static const u32 freq_set1[] = { 19200000, 20000000, 24000000,	25000000,  26000000,
+					 27000000, 60000000, 100000000, 156250000, 0 };
+
+	static const u32 freq_set2[] = { 19200000, 20000000,  24000000,	 25000000, 26000000,
+					 27000000, 100000000, 156250000, 0 };
+
+	static const u32 freq_set3[] = { 19200000,  20000000,  24000000, 25000000,
+					 26000000,  27000000,  60000000, 100000000,
+					 125000000, 156250000, 0 };
+
+	static const u32 freq_set4[] = { 19200000,  20000000,  24000000, 25000000,
+					 26000000,  27000000,  37500000, 75000000,
+					 100000000, 150000000, 0 };
+
+	const u32 *freq_list;
+
+	switch (std_type) {
+	case STD_TYPE_PCIE:
+	case STD_TYPE_USXGMII:
+		freq_list = freq_set1;
+		break;
+
+	case STD_TYPE_USB_TXRX:
+	case STD_TYPE_DP:
+	case STD_TYPE_XAUI:
+		freq_list = freq_set2;
+		break;
+
+	case STD_TYPE_SGMII:
+		freq_list = freq_set3;
+		break;
+
+	case STD_TYPE_SATA:
+		freq_list = freq_set4;
+		break;
+	default:
+		return false;
+	}
+
+	for (const u32 *p_freq = freq_list; *p_freq; ++p_freq) {
+		if (ref_clk_hz == *p_freq)
+			return true;
+	}
+	return false;
+}
+
+static int tp_ref_clk_init(const struct tp_phy *tp_phy, struct clk *clk, const char *name,
+			   u32 *p_ref_clk_khz)
+{
+	struct device *dev = tp_phy->dev;
+	u32 ref_clk_rate;
 	int ret;
 
-	ret = clk_prepare_enable(cdns_phy->clk);
+	ret = clk_prepare_enable(clk);
 	if (ret) {
-		dev_err(cdns_phy->dev, "Failed to prepare ref clock: %d\n", ret);
+		dev_err(dev, "Failed to prepare %s ref clock: %d\n", name, ret);
 		return ret;
 	}
 
-	ref_clk_rate = clk_get_rate(cdns_phy->clk);
+	ref_clk_rate = clk_get_rate(clk);
 	if (!ref_clk_rate) {
-		dev_err(cdns_phy->dev, "Failed to get ref clock rate\n");
+		dev_err(dev, "Failed to get %s ref clock rate\n", name);
 		ret = -EINVAL;
 		goto disable_clk;
 	}
 
-	switch (ref_clk_rate) {
-	case REF_CLK_19_2MHZ:
-		cdns_phy->ref_clk_rate = CLK_19_2_MHZ;
-		break;
-	case REF_CLK_25MHZ:
-		cdns_phy->ref_clk_rate = CLK_25_MHZ;
-		break;
-	case REF_CLK_100MHZ:
-		cdns_phy->ref_clk_rate = CLK_100_MHZ;
-		break;
-	case REF_CLK_156_25MHZ:
-		cdns_phy->ref_clk_rate = CLK_156_25_MHZ;
-		break;
-	default:
-		dev_err(cdns_phy->dev, "Invalid ref clock rate\n");
-		ret = -EINVAL;
-		goto disable_clk;
-	}
-
-	if (cdns_phy->clk1) {
-		ret = clk_prepare_enable(cdns_phy->clk1);
-		if (ret) {
-			dev_err(cdns_phy->dev, "Failed to prepare PLL1 ref clock: %d\n", ret);
+	for (u8 i = 0; i < tp_phy->nb_links; ++i) {
+		if (!tp_is_ref_freq_supported(tp_phy->links[i].type, ref_clk_rate)) {
+			dev_err(dev, "Invalid ref clock rate: %u Hz\n", ref_clk_rate);
+			ret = -EINVAL;
 			goto disable_clk;
 		}
-
-		ref_clk1_rate = clk_get_rate(cdns_phy->clk1);
-		if (!ref_clk1_rate) {
-			dev_err(cdns_phy->dev, "Failed to get PLL1 ref clock rate\n");
-			ret = -EINVAL;
-			goto disable_clk1;
-		}
-
-		switch (ref_clk1_rate) {
-		case REF_CLK_19_2MHZ:
-			cdns_phy->ref_clk1_rate = CLK_19_2_MHZ;
-			break;
-		case REF_CLK_25MHZ:
-			cdns_phy->ref_clk1_rate = CLK_25_MHZ;
-			break;
-		case REF_CLK_100MHZ:
-			cdns_phy->ref_clk1_rate = CLK_100_MHZ;
-			break;
-		case REF_CLK_156_25MHZ:
-			cdns_phy->ref_clk1_rate = CLK_156_25_MHZ;
-			break;
-		default:
-			dev_err(cdns_phy->dev, "Invalid PLL1 ref clock rate\n");
-			ret = -EINVAL;
-			goto disable_clk1;
-		}
-	} else {
-		cdns_phy->ref_clk1_rate = cdns_phy->ref_clk_rate;
 	}
 
+	*p_ref_clk_khz = ref_clk_rate / 1000U;
 	return 0;
 
-disable_clk1:
-	clk_disable_unprepare(cdns_phy->clk1);
 disable_clk:
-	clk_disable_unprepare(cdns_phy->clk);
+	clk_disable_unprepare(clk);
 	return ret;
 }
 
+static int tp_ref_clks_init(struct tp_phy *tp_phy)
+{
+	int ret;
+
+	ret = tp_ref_clk_init(tp_phy, tp_phy->clk, "main", &tp_phy->ref_clk_khz);
+	if (ret)
+		return ret;
+
+	if (!tp_phy->clk1) {
+		tp_phy->ref_clk1_khz = tp_phy->ref_clk_khz;
+		return 0;
+	}
+
+	ret = tp_ref_clk_init(tp_phy, tp_phy->clk1, "PLL1", &tp_phy->ref_clk1_khz);
+	if (ret)
+		clk_disable_unprepare(tp_phy->clk);
+
+	return ret;
+}
+
+static int tp_read_techno_revision(struct tp_phy *tp_phy)
+{
+	struct tp_reg_base *reg_base = &tp_phy->reg_common_cdb;
+	u16 techno_node;
+	u16 techno_mfg;
+
+	if (tp_reg_read(reg_base, CMN_PID_TYPE) != 0x7364)
+		return -ENODEV;
+
+	switch (tp_reg_read(reg_base, CMN_PID_REV)) {
+	case 0x100:
+		tp_phy->rev = REV_R100;
+		break;
+	case 0x110:
+		tp_phy->rev = REV_R110;
+		break;
+	case 0x120:
+		tp_phy->rev = REV_R120;
+		break;
+	case 0x130:
+		tp_phy->rev = REV_R130;
+		break;
+	case 0x140:
+		tp_phy->rev = REV_R140;
+		break;
+	case 0x150:
+		tp_phy->rev = REV_R150;
+		break;
+	case 0x200:
+		tp_phy->rev = REV_R200;
+		break;
+	case 0x210:
+		tp_phy->rev = REV_R210;
+		break;
+	case 0x220:
+		tp_phy->rev = REV_R220;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	techno_mfg = tp_reg_read(reg_base, CMN_PID_MFG);
+	techno_node = tp_reg_read(reg_base, CMN_PID_NODE);
+
+	if (techno_mfg == 't') {
+		u16 product_num = tp_reg_read(reg_base, CMN_PID_NUM);
+
+		switch (techno_node) {
+		case 0x16:
+			tp_phy->tech_tag = (product_num == 0x0805) ?
+				TECH_TSMC_16_0805 : TECH_TSMC_16;
+			break;
+		case 0x12:
+			tp_phy->tech_tag = TECH_TSMC_12;
+			break;
+		case 0x07:
+			tp_phy->tech_tag = TECH_TSMC_7;
+			break;
+		case 0x05:
+			tp_phy->tech_tag = TECH_TSMC_5;
+			break;
+		default:
+			return -EINVAL;
+		}
+	} else if (techno_mfg == 's') {
+		switch (techno_node) {
+		case 0x07:
+			tp_phy->tech_tag = TECH_SS_7;
+			break;
+		case 0x05:
+			tp_phy->tech_tag = TECH_SS_5;
+			break;
+		default:
+			return -EINVAL;
+		}
+	} else {
+		return -EINVAL;
+	}
+
+	dev_dbg(tp_phy->dev, "Revision: %s, tech: %s\n", tp_get_revision_desc(tp_phy->rev),
+		tp_get_tech_desc(tp_phy->tech_tag));
+	return 0;
+}
+
+static int tp_set_used_lanes(struct tp_phy *tp_phy, u32 mlane, u32 num_lanes)
+{
+	u8 mask_available_lanes;
+	u8 mask_lanes;
+
+	if (((mlane + num_lanes) > MAX_NUM_LANES) || num_lanes == 0)
+		goto invalid_lanes;
+
+	mask_lanes = GENMASK_U8(mlane + num_lanes - 1, mlane);
+	mask_available_lanes = tp_phy->init_data->mask_available_lanes;
+
+	if ((mask_lanes & mask_available_lanes) != mask_lanes)
+		goto invalid_lanes;
+
+	if (mask_lanes & tp_phy->mask_used_lanes)
+		goto invalid_lanes;
+
+	tp_phy->mask_used_lanes |= mask_lanes;
+	return 0;
+
+invalid_lanes:
+	dev_err(tp_phy->dev, "Invalid lane configuration\n");
+	return -EINVAL;
+}
+
+static bool tp_link_can_share_std(const struct tp_standard *std, enum tp_std_type std_type,
+				  u32 std_flags)
+{
+	if (std_type == STD_TYPE_DP || std_type == STD_TYPE_XAUI)
+		return false;
+
+	return (std->type == std_type) && (std->flags == std_flags);
+}
+
+static int tp_add_phy_from_of_subnode(struct tp_phy *tp_phy, struct device_node *child)
+{
+	enum tp_std_type std_type = STD_TYPE_NONE;
+	struct tp_standard *standard = NULL;
+	u32 ssc_mode = CDNS_SERDES_NO_SSC;
+	struct device *dev = tp_phy->dev;
+	struct tp_link *link = NULL;
+	struct reset_control *lnk_rst;
+	u32 link_flags = STD_FLAG_NONE;
+	u32 supported_flags = 0;
+	u32 phy_type = PHY_NONE;
+	u32 num_lanes = 0;
+	int ret = -EINVAL;
+	struct phy *gphy;
+	u8 std_idx = 0;
+	u32 mlane = 0;
+	u32 std_flags;
+
+	/* First check the master lane and the number of lanes */
+	if (of_property_read_u32(child, "reg", &mlane)) {
+		dev_err(dev, "%s: No \"reg\"-property.\n", child->full_name);
+		return -EINVAL;
+	}
+
+	if (of_property_read_u32(child, "cdns,num-lanes", &num_lanes)) {
+		dev_err(dev, "%s: No \"cdns,num-lanes\"-property.\n", child->full_name);
+		return -EINVAL;
+	}
+
+	ret = tp_set_used_lanes(tp_phy, mlane, num_lanes);
+	if (ret)
+		return ret;
+
+	/* Then retrieve associated standard */
+	if (of_property_read_u32(child, "cdns,phy-type", &phy_type)) {
+		dev_err(dev, "%s: No \"cdns,phy-type\"-property.\n", child->full_name);
+		return -EINVAL;
+	}
+
+	/* Get optional mode */
+	of_property_read_u32(child, "cdns,phy-mode", &link_flags);
+
+	/* Get SSC mode */
+	of_property_read_u32(child, "cdns,ssc-mode", &ssc_mode);
+
+	switch (phy_type) {
+	case PHY_TYPE_PCIE:
+		std_type = STD_TYPE_PCIE;
+		break;
+	case PHY_TYPE_USB3:
+		std_type = STD_TYPE_USB_TXRX;
+		supported_flags = CDNS_TORRENT_MODE_USB_G1 | CDNS_TORRENT_MODE_USB_IO_11V;
+		break;
+	case PHY_TYPE_DP:
+		std_type = STD_TYPE_DP;
+		break;
+	case PHY_TYPE_XAUI:
+		std_type = STD_TYPE_XAUI;
+		supported_flags = CDNS_TORRENT_MODE_XAUI_LP;
+		break;
+	case PHY_TYPE_SGMII:
+		std_type = STD_TYPE_SGMII;
+		supported_flags = CDNS_TORRENT_MODE_2500_BASEX | CDNS_TORRENT_MODE_QSGMII;
+		break;
+	case PHY_TYPE_QSGMII:
+		std_type = STD_TYPE_SGMII;
+		link_flags |= CDNS_TORRENT_MODE_QSGMII;
+		supported_flags = CDNS_TORRENT_MODE_QSGMII;
+		break;
+	case PHY_TYPE_SATA:
+		std_type = STD_TYPE_SATA;
+		supported_flags = CDNS_TORRENT_MODE_SATA_LP;
+		break;
+	case PHY_TYPE_USXGMII:
+		std_type = STD_TYPE_USXGMII;
+		break;
+	default:
+		dev_err(dev, "Unsupported protocol: %u\n", phy_type);
+		return -EINVAL;
+	}
+
+	if (link_flags & ~supported_flags) {
+		dev_err(dev, "Unsupported modes 0x%X for this PHY type %u\n",
+			link_flags, std_type);
+		return -EINVAL;
+	}
+
+	/* Remove link specific flags */
+	std_flags = link_flags & (~STD_FLAG_QSGMII);
+
+	for (u8 i = 0; i < MAX_NUM_STANDARDS; ++i) {
+		struct tp_standard *std = &tp_phy->standards[i];
+
+		if (std->type == STD_TYPE_NONE) {
+			std->type = std_type;
+			std->flags = std_flags;
+			std->ssc_mode = ssc_mode;
+			standard = std;
+			std_idx = i;
+			break;
+
+		} else if (tp_link_can_share_std(std, std_type, std_flags)) {
+			standard = std;
+			std_idx = i;
+			break;
+		}
+	}
+
+	if (!standard) {
+		dev_err(dev, "%s: Cannot declare more than 2 standards.\n", child->full_name);
+		return -EINVAL;
+	}
+
+	if (standard->ssc_mode != ssc_mode) {
+		dev_err(dev, "%s: PHY sharing the same standard must share the same SSC.\n",
+			child->full_name);
+		return -EINVAL;
+	}
+
+	if (tp_phy->nb_links >= MAX_NUM_LANES)
+		return -EINVAL;
+
+	/* Get the PHY instance */
+	link = &tp_phy->links[tp_phy->nb_links];
+	tp_phy->nb_links += 1;
+
+	lnk_rst = of_reset_control_array_get_exclusive(child);
+	if (IS_ERR(lnk_rst)) {
+		dev_err(dev, "%s: failed to get reset\n", child->full_name);
+		return PTR_ERR(lnk_rst);
+	}
+
+	link->lnk_rst = lnk_rst;
+	link->type = std_type;
+	link->flags = link_flags;
+	link->std_idx = std_idx;
+	link->mlane = mlane;
+	link->num_lanes = num_lanes;
+	link->max_lanes = num_lanes;
+
+	gphy = devm_phy_create(dev, child, &cdns_torrent_phy_ops);
+	if (IS_ERR(gphy))
+		return PTR_ERR(gphy);
+
+	if (phy_type == PHY_TYPE_DP) {
+		u32 max_bit_rate = DEFAULT_MAX_BIT_RATE;
+
+		switch (num_lanes) {
+		case 1:
+		case 2:
+		case 4:
+			/* valid number of lanes */
+			break;
+		default:
+			dev_err(dev, "unsupported number of lanes: %u\n", num_lanes);
+			return -EINVAL;
+		}
+
+		of_property_read_u32(child, "cdns,max-bit-rate", &max_bit_rate);
+		if (tp_dp_pll_freq_from_bit_rate(max_bit_rate) == 0) {
+			dev_err(dev, "unsupported max bit rate: %u Mbps\n", max_bit_rate);
+			return -EINVAL;
+		}
+
+		link->max_bit_rate = max_bit_rate;
+		gphy->attrs.bus_width = num_lanes;
+		gphy->attrs.max_link_rate = max_bit_rate;
+		gphy->attrs.mode = PHY_MODE_DP;
+	}
+
+	link->phy = gphy;
+	phy_set_drvdata(gphy, link);
+
+	return 0;
+}
+
+static void tp_check_multiple_pcie_links(struct tp_phy *tp_phy)
+{
+	struct tp_standard *std0 = &tp_phy->standards[0];
+	u32 num_pcie_links = 0;
+
+	/* First check if the first standard is PCIe */
+	if (std0->type != STD_TYPE_PCIE)
+		return;
+
+	/* Count the number of links with PCIe protocol. */
+	for (u8 i = 0; i < tp_phy->nb_links; ++i) {
+		if (tp_phy->links[i].type == STD_TYPE_PCIE)
+			num_pcie_links++;
+	}
+
+	/* PCIe Multilink configuration can be supported along with a non-PCIe protocol.
+	 * Such configurations are handled by adding a flag named STD_FLAG_PCIE_ML
+	 */
+	if (num_pcie_links > 1)
+		std0->flags |= STD_FLAG_PCIE_ML;
+}
+
+static bool tp_find_link_cfg_is_same_std(const struct tp_standard *std, u32 std_id)
+{
+	u32 cfg_flags = STD_FLAGS_FROM_ID(std_id);
+	enum tp_std_type cfg_std_type = STD_TYPE_FROM_ID(std_id);
+
+	return (std->type == cfg_std_type) &&
+	       ((std->flags & STD_FLAG_FIND_CFG_MASK) == (cfg_flags & STD_FLAG_FIND_CFG_MASK));
+}
+
+static const struct tp_link_cfg *tp_find_link_cfg_from_standards(const struct tp_standard *std0,
+								 const struct tp_standard *std1)
+{
+	for (u32 i = 0; i < ARRAY_SIZE(tp_link_cfgs); ++i) {
+		const struct tp_link_cfg *link_cfg = &tp_link_cfgs[i];
+
+		if (tp_find_link_cfg_is_same_std(std0, link_cfg->std0) &&
+		    tp_find_link_cfg_is_same_std(std1, link_cfg->std1))
+			return link_cfg;
+	}
+
+	return NULL;
+}
+
+static int tp_find_link_cfg(struct tp_phy *tp_phy)
+{
+	const struct tp_link_cfg *link_cfg;
+	struct device *dev = tp_phy->dev;
+	struct tp_standard *std0 = &tp_phy->standards[0];
+	struct tp_standard *std1 = &tp_phy->standards[1];
+
+	/* Verify the validity of standard index in links */
+	for (u8 i = 0; i < tp_phy->nb_links; ++i) {
+		const struct tp_link *link = &tp_phy->links[i];
+
+		if (WARN_ON(link->std_idx >= MAX_NUM_STANDARDS))
+			return -EINVAL;
+	}
+
+	link_cfg = tp_find_link_cfg_from_standards(std0, std1);
+
+	/* Only swap the two standards if PLL1 has no dedicated reference clock */
+	if (!link_cfg && !tp_phy->clk1) {
+		link_cfg = tp_find_link_cfg_from_standards(std1, std0);
+		if (link_cfg) {
+			/* Swap the 2 standards */
+			swap(tp_phy->standards[0], tp_phy->standards[1]);
+
+			for (u8 i = 0; i < tp_phy->nb_links; ++i)
+				tp_phy->links[i].std_idx ^= 1;
+		}
+	}
+
+	if (!link_cfg) {
+		dev_err(dev, "configuration with %s and %s is not supported\n",
+			tp_get_std_name(std0->type, std0->flags),
+			tp_get_std_name(std1->type, std1->flags));
+		return -EINVAL;
+	}
+
+	/* Add flags from link configuration */
+	std0->flags |= STD_FLAGS_FROM_ID(link_cfg->std0);
+	std1->flags |= STD_FLAGS_FROM_ID(link_cfg->std1);
+
+	for (u8 i = 0; i < tp_phy->nb_links; ++i) {
+		struct tp_link *link = &tp_phy->links[i];
+
+		link->flags |= tp_phy->standards[link->std_idx].flags;
+	}
+
+	tp_phy->link_cfg = link_cfg;
+	return 0;
+}
+
+static int tp_dp_reg_base_init(struct platform_device *pdev, struct tp_phy *tp_phy)
+{
+	bool has_dp = false;
+
+	for (u8 i = 0; i < tp_phy->nb_links; ++i) {
+		if (tp_phy->links[i].type == STD_TYPE_DP) {
+			has_dp = true;
+			break;
+		}
+	}
+
+	if (has_dp) {
+		/* DPTX registers */
+		void __iomem *base = devm_platform_ioremap_resource(pdev, 1);
+
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		tp_phy->base = base;
+	}
+
+	return 0;
+}
+
+static void tp_phy_cleanup(const struct tp_phy *tp_phy)
+{
+	reset_control_assert(tp_phy->phy_rst);
+	reset_control_assert(tp_phy->apb_rst);
+
+	for (u8 i = 0; i < tp_phy->nb_links; ++i) {
+		reset_control_assert(tp_phy->links[i].lnk_rst);
+		reset_control_put(tp_phy->links[i].lnk_rst);
+	}
+
+	clk_disable_unprepare(tp_phy->clk1);
+	clk_disable_unprepare(tp_phy->clk);
+	tp_clk_cleanup(tp_phy);
+}
+
+static bool tp_is_already_configured(const struct tp_phy *tp_phy)
+{
+	u16 val = tp_reg_read(&tp_phy->reg_phy_pma_common_cdb, PHY_PMA_CMN_CTRL1);
+
+	return (val & 0x0001) != 0;
+}
+
+static void tp_refclk_driver_suspend(struct tp_phy *tp_phy)
+{
+	struct clk_hw *hw = tp_phy->clk_hw_data->hws[CDNS_TORRENT_REFCLK_DRIVER];
+	struct tp_refclk_driver *refclk = tp_to_refclk_driver(hw);
+
+	refclk->parent_index = tp_refclk_driver_get_parent(hw);
+}
+
+static int tp_refclk_driver_resume(const struct tp_phy *tp_phy)
+{
+	struct clk_hw *hw = tp_phy->clk_hw_data->hws[CDNS_TORRENT_REFCLK_DRIVER];
+	struct tp_refclk_driver *refclk = tp_to_refclk_driver(hw);
+
+	return tp_refclk_driver_set_parent(hw, refclk->parent_index);
+}
+
+static int tp_suspend_noirq(struct device *dev)
+{
+	struct tp_phy *tp_phy = dev_get_drvdata(dev);
+
+	tp_refclk_driver_suspend(tp_phy);
+
+	for (u8 i = 0; i < tp_phy->nb_links; ++i)
+		reset_control_assert(tp_phy->links[i].lnk_rst);
+
+	reset_control_assert(tp_phy->phy_rst);
+	reset_control_assert(tp_phy->apb_rst);
+
+	if (tp_phy->already_configured) {
+		tp_phy->already_configured = false;
+	} else {
+		clk_disable_unprepare(tp_phy->clk1);
+		clk_disable_unprepare(tp_phy->clk);
+	}
+
+	return 0;
+}
+
+static int tp_resume_noirq(struct device *dev)
+{
+	int ret;
+	struct tp_phy *tp_phy = dev_get_drvdata(dev);
+
+	ret = tp_refclk_driver_resume(tp_phy);
+	if (ret)
+		return ret;
+
+	ret = tp_ref_clks_init(tp_phy);
+	if (ret)
+		return ret;
+
+	/* Enable APB */
+	reset_control_deassert(tp_phy->apb_rst);
+
+	ret = tp_configure_links(tp_phy);
+	if (ret)
+		goto put_lnk_rst;
+
+	return 0;
+
+put_lnk_rst:
+
+	for (u8 i = 0; i < tp_phy->nb_links; ++i)
+		reset_control_assert(tp_phy->links[i].lnk_rst);
+
+	reset_control_assert(tp_phy->apb_rst);
+	reset_control_assert(tp_phy->phy_rst);
+
+	clk_disable_unprepare(tp_phy->clk1);
+	clk_disable_unprepare(tp_phy->clk);
+
+	return ret;
+}
+
+static DEFINE_NOIRQ_DEV_PM_OPS(tp_pm_ops, tp_suspend_noirq, tp_resume_noirq);
+
 static int cdns_torrent_phy_probe(struct platform_device *pdev)
 {
-	struct cdns_torrent_phy *cdns_phy;
+	struct tp_phy *tp_phy;
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
-	const struct cdns_torrent_data *data;
-	struct device_node *child;
-	int ret, subnodes, node = 0, i;
-	u32 total_num_lanes = 0;
-	u8 init_dp_regmap = 0;
-	u32 phy_type;
+	const struct tp_init_data *init_data;
+	struct device_node *child = NULL;
+	int ret;
 
 	/* Get init data for this PHY */
-	data = of_device_get_match_data(dev);
-	if (!data)
+	init_data = of_device_get_match_data(dev);
+	if (!init_data)
 		return -EINVAL;
 
-	cdns_phy = devm_kzalloc_obj(dev, *cdns_phy);
-	if (!cdns_phy)
+	tp_phy = devm_kzalloc_obj(dev, *tp_phy);
+	if (!tp_phy)
 		return -ENOMEM;
 
-	dev_set_drvdata(dev, cdns_phy);
-	cdns_phy->dev = dev;
-	cdns_phy->init_data = data;
-	cdns_phy->protocol_bitmask = 0;
+	dev_set_drvdata(dev, tp_phy);
+	mutex_init(&tp_phy->lock);
+	tp_phy->dev = dev;
+	tp_phy->init_data = init_data;
 
-	cdns_phy->sd_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(cdns_phy->sd_base))
-		return PTR_ERR(cdns_phy->sd_base);
+	tp_phy->sd_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(tp_phy->sd_base))
+		return PTR_ERR(tp_phy->sd_base);
 
-	subnodes = of_get_available_child_count(dev->of_node);
-	if (subnodes == 0) {
+	ret = of_get_available_child_count(dev->of_node);
+	if (ret == 0) {
 		dev_err(dev, "No available link subnodes found\n");
 		return -EINVAL;
 	}
 
-	ret = cdns_torrent_regmap_init(cdns_phy);
-	if (ret)
-		return ret;
+	tp_reg_bases_init(tp_phy);
+	tp_reg_fields_init(tp_phy);
 
-	ret = cdns_torrent_regfield_init(cdns_phy);
+	ret = tp_read_techno_revision(tp_phy);
 	if (ret)
 		return ret;
 
-	ret = cdns_torrent_clk_register(cdns_phy);
+	ret = tp_clk_register(tp_phy);
 	if (ret)
 		return ret;
 
-	ret = cdns_torrent_of_get_reset(cdns_phy);
+	ret = tp_of_get_reset(tp_phy);
 	if (ret)
-		goto clk_cleanup;
+		goto cleanup;
 
-	ret = cdns_torrent_of_get_clk(cdns_phy);
+	ret = tp_of_get_clk(tp_phy);
 	if (ret)
-		goto clk_cleanup;
-
-	regmap_field_read(cdns_phy->phy_pma_cmn_ctrl_1, &cdns_phy->already_configured);
+		goto cleanup;
 
-	if (!cdns_phy->already_configured) {
-		ret = cdns_torrent_clk(cdns_phy);
+	tp_phy->already_configured = tp_is_already_configured(tp_phy);
+	if (!tp_phy->already_configured) {
+		ret = tp_ref_clks_init(tp_phy);
 		if (ret)
-			goto clk_cleanup;
+			goto cleanup;
 
 		/* Enable APB */
-		reset_control_deassert(cdns_phy->apb_rst);
+		reset_control_deassert(tp_phy->apb_rst);
 	}
 
 	for_each_available_child_of_node(dev->of_node, child) {
-		struct phy *gphy;
-
 		/* PHY subnode name must be 'phy'. */
-		if (!(of_node_name_eq(child, "phy")))
+		if (!of_node_name_eq(child, "phy"))
 			continue;
 
-		cdns_phy->phys[node].lnk_rst =
-				of_reset_control_array_get_exclusive(child);
-		if (IS_ERR(cdns_phy->phys[node].lnk_rst)) {
-			dev_err(dev, "%s: failed to get reset\n",
-				child->full_name);
-			ret = PTR_ERR(cdns_phy->phys[node].lnk_rst);
-			goto put_lnk_rst;
-		}
-
-		if (of_property_read_u32(child, "reg",
-					 &cdns_phy->phys[node].mlane)) {
-			dev_err(dev, "%s: No \"reg\"-property.\n",
-				child->full_name);
-			ret = -EINVAL;
-			goto put_child;
-		}
-
-		if (of_property_read_u32(child, "cdns,phy-type", &phy_type)) {
-			dev_err(dev, "%s: No \"cdns,phy-type\"-property.\n",
-				child->full_name);
-			ret = -EINVAL;
-			goto put_child;
-		}
-
-		switch (phy_type) {
-		case PHY_TYPE_PCIE:
-			cdns_phy->phys[node].phy_type = TYPE_PCIE;
-			break;
-		case PHY_TYPE_DP:
-			cdns_phy->phys[node].phy_type = TYPE_DP;
-			break;
-		case PHY_TYPE_SGMII:
-			cdns_phy->phys[node].phy_type = TYPE_SGMII;
-			break;
-		case PHY_TYPE_QSGMII:
-			cdns_phy->phys[node].phy_type = TYPE_QSGMII;
-			break;
-		case PHY_TYPE_USB3:
-			cdns_phy->phys[node].phy_type = TYPE_USB;
-			break;
-		case PHY_TYPE_USXGMII:
-			cdns_phy->phys[node].phy_type = TYPE_USXGMII;
-			break;
-		case PHY_TYPE_XAUI:
-			cdns_phy->phys[node].phy_type = TYPE_XAUI;
-			break;
-		default:
-			dev_err(dev, "Unsupported protocol\n");
-			ret = -EINVAL;
-			goto put_child;
-		}
-
-		if (of_property_read_u32(child, "cdns,num-lanes",
-					 &cdns_phy->phys[node].num_lanes)) {
-			dev_err(dev, "%s: No \"cdns,num-lanes\"-property.\n",
-				child->full_name);
-			ret = -EINVAL;
-			goto put_child;
-		}
-
-		total_num_lanes += cdns_phy->phys[node].num_lanes;
-
-		/* Get SSC mode */
-		cdns_phy->phys[node].ssc_mode = NO_SSC;
-		of_property_read_u32(child, "cdns,ssc-mode",
-				     &cdns_phy->phys[node].ssc_mode);
-
-		gphy = devm_phy_create(dev, child, &cdns_torrent_phy_ops);
-		if (IS_ERR(gphy)) {
-			ret = PTR_ERR(gphy);
-			goto put_child;
-		}
-
-		if (cdns_phy->phys[node].phy_type == TYPE_DP) {
-			switch (cdns_phy->phys[node].num_lanes) {
-			case 1:
-			case 2:
-			case 4:
-			/* valid number of lanes */
-				break;
-			default:
-				dev_err(dev, "unsupported number of lanes: %d\n",
-					cdns_phy->phys[node].num_lanes);
-				ret = -EINVAL;
-				goto put_child;
-			}
-
-			cdns_phy->max_bit_rate = DEFAULT_MAX_BIT_RATE;
-			of_property_read_u32(child, "cdns,max-bit-rate",
-					     &cdns_phy->max_bit_rate);
-
-			switch (cdns_phy->max_bit_rate) {
-			case 1620:
-			case 2160:
-			case 2430:
-			case 2700:
-			case 3240:
-			case 4320:
-			case 5400:
-			case 8100:
-			/* valid bit rate */
-				break;
-			default:
-				dev_err(dev, "unsupported max bit rate: %dMbps\n",
-					cdns_phy->max_bit_rate);
-				ret = -EINVAL;
-				goto put_child;
-			}
-
-			/* DPTX registers */
-			cdns_phy->base = devm_platform_ioremap_resource(pdev, 1);
-			if (IS_ERR(cdns_phy->base)) {
-				ret = PTR_ERR(cdns_phy->base);
-				goto put_child;
-			}
-
-			if (!init_dp_regmap) {
-				ret = cdns_torrent_dp_regmap_init(cdns_phy);
-				if (ret)
-					goto put_child;
-
-				ret = cdns_torrent_dp_regfield_init(cdns_phy);
-				if (ret)
-					goto put_child;
-
-				init_dp_regmap++;
-			}
-
-			dev_dbg(dev, "DP max bit rate %d.%03d Gbps\n",
-				cdns_phy->max_bit_rate / 1000,
-				cdns_phy->max_bit_rate % 1000);
+		ret = tp_add_phy_from_of_subnode(tp_phy, child);
+		if (ret)
+			goto cleanup;
+	}
+	child = NULL;
 
-			gphy->attrs.bus_width = cdns_phy->phys[node].num_lanes;
-			gphy->attrs.max_link_rate = cdns_phy->max_bit_rate;
-			gphy->attrs.mode = PHY_MODE_DP;
-		}
+	if (tp_phy->nb_links == 0) {
+		ret = -ENODEV;
+		goto cleanup;
+	}
 
-		cdns_phy->phys[node].phy = gphy;
-		cdns_phy->protocol_bitmask |= BIT(cdns_phy->phys[node].phy_type);
-		phy_set_drvdata(gphy, &cdns_phy->phys[node]);
+	tp_check_multiple_pcie_links(tp_phy);
 
-		node++;
-	}
-	cdns_phy->nsubnodes = node;
+	ret = tp_find_link_cfg(tp_phy);
+	if (ret)
+		goto cleanup;
 
-	if (total_num_lanes > MAX_NUM_LANES) {
-		dev_err(dev, "Invalid lane configuration\n");
-		ret = -EINVAL;
-		goto put_lnk_rst;
-	}
+	ret = tp_dp_reg_base_init(pdev, tp_phy);
+	if (ret)
+		goto cleanup;
 
-	if (cdns_phy->nsubnodes > 1 && !cdns_phy->already_configured) {
-		ret = cdns_torrent_phy_configure_multilink(cdns_phy);
+	if (!tp_phy->already_configured) {
+		ret = tp_configure_links(tp_phy);
 		if (ret)
-			goto put_lnk_rst;
+			goto cleanup;
 	}
 
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 	if (IS_ERR(phy_provider)) {
 		ret = PTR_ERR(phy_provider);
-		goto put_lnk_rst;
+		goto cleanup;
 	}
 
-	if (cdns_phy->nsubnodes > 1)
-		dev_dbg(dev, "Multi link configuration:\n");
-	else
-		dev_dbg(dev, "Single link configuration:\n");
+	for (u8 i = 0; i < tp_phy->nb_links; ++i) {
+		const struct tp_link *link = &tp_phy->links[i];
+		const char *name = tp_get_std_name(link->type, link->flags);
 
-	for (i = 0; i < cdns_phy->nsubnodes; i++)
-		dev_dbg(dev, "%s (%d lanes)",
-			cdns_torrent_get_phy_type(cdns_phy->phys[i].phy_type),
-			cdns_phy->phys[i].num_lanes);
+		dev_dbg(dev, "- %s (%d lanes)", name, link->num_lanes);
+	}
 
 	return 0;
 
-put_child:
-	node++;
-put_lnk_rst:
-	for (i = 0; i < node; i++)
-		reset_control_put(cdns_phy->phys[i].lnk_rst);
-	of_node_put(child);
-	reset_control_assert(cdns_phy->apb_rst);
-	clk_disable_unprepare(cdns_phy->clk1);
-	clk_disable_unprepare(cdns_phy->clk);
-clk_cleanup:
-	cdns_torrent_clk_cleanup(cdns_phy);
+cleanup:
+	if (child)
+		of_node_put(child);
+
+	tp_phy_cleanup(tp_phy);
 	return ret;
 }
 
 static void cdns_torrent_phy_remove(struct platform_device *pdev)
 {
-	struct cdns_torrent_phy *cdns_phy = platform_get_drvdata(pdev);
-	int i;
+	struct tp_phy *tp_phy = platform_get_drvdata(pdev);
 
-	reset_control_assert(cdns_phy->phy_rst);
-	reset_control_assert(cdns_phy->apb_rst);
-	for (i = 0; i < cdns_phy->nsubnodes; i++) {
-		reset_control_assert(cdns_phy->phys[i].lnk_rst);
-		reset_control_put(cdns_phy->phys[i].lnk_rst);
-	}
-
-	clk_disable_unprepare(cdns_phy->clk1);
-	clk_disable_unprepare(cdns_phy->clk);
-	cdns_torrent_clk_cleanup(cdns_phy);
+	tp_phy_cleanup(tp_phy);
 }
 
-/* Multilink PCIe and USB Same SSC link configuration */
-static const struct cdns_reg_pairs ml_pcie_usb_link_cmn_regs[] = {
-	{0x0002, PHY_PLL_CFG},
-	{0x8600, CMN_PDIAG_PLL0_CLK_SEL_M0}
-};
-
-static const struct cdns_reg_pairs ml_pcie_usb_xcvr_diag_ln_regs[] = {
-	{0x0100, XCVR_DIAG_HSCLK_SEL},
-	{0x0013, XCVR_DIAG_HSCLK_DIV},
-	{0x0812, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_reg_pairs usb_ml_pcie_xcvr_diag_ln_regs[] = {
-	{0x0041, XCVR_DIAG_PLLDRC_CTRL},
-};
-
-static const struct cdns_torrent_vals ml_pcie_usb_link_cmn_vals = {
-	.reg_pairs = ml_pcie_usb_link_cmn_regs,
-	.num_regs = ARRAY_SIZE(ml_pcie_usb_link_cmn_regs),
-};
-
-static const struct cdns_torrent_vals ml_pcie_usb_xcvr_diag_ln_vals = {
-	.reg_pairs = ml_pcie_usb_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(ml_pcie_usb_xcvr_diag_ln_regs),
-};
-
-static const struct cdns_torrent_vals usb_ml_pcie_xcvr_diag_ln_vals = {
-	.reg_pairs = usb_ml_pcie_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(usb_ml_pcie_xcvr_diag_ln_regs),
-};
-
-/* Multi link PCIe configuration */
-static const struct cdns_reg_pairs ml_pcie_link_cmn_regs[] = {
-	{0x0002, PHY_PLL_CFG},
-	{0x0601, CMN_PDIAG_PLL0_CLK_SEL_M0}
-};
-
-static const struct cdns_reg_pairs ml_pcie_xcvr_diag_ln_regs[] = {
-	{0x0100, XCVR_DIAG_HSCLK_SEL},
-	{0x0001, XCVR_DIAG_HSCLK_DIV},
-	{0x0812, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_torrent_vals ml_pcie_link_cmn_vals = {
-	.reg_pairs = ml_pcie_link_cmn_regs,
-	.num_regs = ARRAY_SIZE(ml_pcie_link_cmn_regs),
-};
-
-static const struct cdns_torrent_vals ml_pcie_xcvr_diag_ln_vals = {
-	.reg_pairs = ml_pcie_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(ml_pcie_xcvr_diag_ln_regs),
-};
-
-/* Multi link PCIe, 100 MHz Ref clk, no SSC */
-static const struct cdns_reg_pairs ml_pcie_100_no_ssc_cmn_regs[] = {
-	{0x0003, CMN_PLL0_VCOCAL_TCTRL},
-	{0x0003, CMN_PLL1_VCOCAL_TCTRL}
-};
-
-static const struct cdns_reg_pairs ml_pcie_100_no_ssc_rx_ln_regs[] = {
-	{0x0019, RX_REE_TAP1_CLIP},
-	{0x0019, RX_REE_TAP2TON_CLIP},
-	{0x0008, RX_REE_PEAK_UTHR},
-	{0x018E, RX_CDRLF_CNFG},
-	{0x2E33, RX_CDRLF_CNFG2},
-	{0x0001, RX_DIAG_ACYA},
-	{0x0C21, RX_DIAG_DFE_AMP_TUNE_2},
-	{0x0002, RX_DIAG_DFE_AMP_TUNE_3},
-	{0x0005, RX_DIAG_REE_DAC_CTRL}
-};
-
-static const struct cdns_torrent_vals ml_pcie_100_no_ssc_cmn_vals = {
-	.reg_pairs = ml_pcie_100_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(ml_pcie_100_no_ssc_cmn_regs),
-};
-
-static const struct cdns_torrent_vals ml_pcie_100_no_ssc_rx_ln_vals = {
-	.reg_pairs = ml_pcie_100_no_ssc_rx_ln_regs,
-	.num_regs = ARRAY_SIZE(ml_pcie_100_no_ssc_rx_ln_regs),
-};
-
-/* Multi link PCIe, 100 MHz Ref clk, internal SSC */
-static const struct cdns_reg_pairs ml_pcie_100_int_ssc_cmn_regs[] = {
-	{0x0004, CMN_PLL0_DSM_DIAG_M0},
-	{0x0004, CMN_PLL1_DSM_DIAG_M0},
-	{0x0509, CMN_PDIAG_PLL0_CP_PADJ_M0},
-	{0x0509, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL0_CP_IADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL1_CP_IADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL0_FILT_PADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL1_FILT_PADJ_M0},
-	{0x0064, CMN_PLL0_INTDIV_M0},
-	{0x0050, CMN_PLL1_INTDIV_M0},
-	{0x0002, CMN_PLL0_FRACDIVH_M0},
-	{0x0002, CMN_PLL1_FRACDIVH_M0},
-	{0x0044, CMN_PLL0_HIGH_THR_M0},
-	{0x0036, CMN_PLL1_HIGH_THR_M0},
-	{0x0002, CMN_PDIAG_PLL0_CTRL_M0},
-	{0x0002, CMN_PDIAG_PLL1_CTRL_M0},
-	{0x0001, CMN_PLL0_SS_CTRL1_M0},
-	{0x0001, CMN_PLL1_SS_CTRL1_M0},
-	{0x011B, CMN_PLL0_SS_CTRL2_M0},
-	{0x011B, CMN_PLL1_SS_CTRL2_M0},
-	{0x006E, CMN_PLL0_SS_CTRL3_M0},
-	{0x0058, CMN_PLL1_SS_CTRL3_M0},
-	{0x000E, CMN_PLL0_SS_CTRL4_M0},
-	{0x0012, CMN_PLL1_SS_CTRL4_M0},
-	{0x0C5E, CMN_PLL0_VCOCAL_REFTIM_START},
-	{0x0C5E, CMN_PLL1_VCOCAL_REFTIM_START},
-	{0x0C56, CMN_PLL0_VCOCAL_PLLCNT_START},
-	{0x0C56, CMN_PLL1_VCOCAL_PLLCNT_START},
-	{0x0003, CMN_PLL0_VCOCAL_TCTRL},
-	{0x0003, CMN_PLL1_VCOCAL_TCTRL},
-	{0x00C7, CMN_PLL0_LOCK_REFCNT_START},
-	{0x00C7, CMN_PLL1_LOCK_REFCNT_START},
-	{0x00C7, CMN_PLL0_LOCK_PLLCNT_START},
-	{0x00C7, CMN_PLL1_LOCK_PLLCNT_START},
-	{0x0005, CMN_PLL0_LOCK_PLLCNT_THR},
-	{0x0005, CMN_PLL1_LOCK_PLLCNT_THR}
-};
-
-static const struct cdns_torrent_vals ml_pcie_100_int_ssc_cmn_vals = {
-	.reg_pairs = ml_pcie_100_int_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(ml_pcie_100_int_ssc_cmn_regs),
-};
-
-/* SGMII and QSGMII link configuration */
-static const struct cdns_reg_pairs sgmii_qsgmii_link_cmn_regs[] = {
-	{0x0002, PHY_PLL_CFG}
-};
-
-static const struct cdns_reg_pairs sgmii_qsgmii_xcvr_diag_ln_regs[] = {
-	{0x0003, XCVR_DIAG_HSCLK_DIV},
-	{0x0113, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_torrent_vals sgmii_qsgmii_link_cmn_vals = {
-	.reg_pairs = sgmii_qsgmii_link_cmn_regs,
-	.num_regs = ARRAY_SIZE(sgmii_qsgmii_link_cmn_regs),
-};
-
-static const struct cdns_torrent_vals sgmii_qsgmii_xcvr_diag_ln_vals = {
-	.reg_pairs = sgmii_qsgmii_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(sgmii_qsgmii_xcvr_diag_ln_regs),
-};
-
-static void cdns_torrent_refclk_driver_suspend(struct cdns_torrent_phy *cdns_phy)
-{
-	struct clk_hw *hw = cdns_phy->clk_hw_data->hws[CDNS_TORRENT_REFCLK_DRIVER];
-	struct cdns_torrent_refclk_driver *refclk_driver = to_cdns_torrent_refclk_driver(hw);
-
-	refclk_driver->parent_index = cdns_torrent_refclk_driver_get_parent(hw);
-}
-
-static int cdns_torrent_refclk_driver_resume(struct cdns_torrent_phy *cdns_phy)
-{
-	struct clk_hw *hw = cdns_phy->clk_hw_data->hws[CDNS_TORRENT_REFCLK_DRIVER];
-	struct cdns_torrent_refclk_driver *refclk_driver = to_cdns_torrent_refclk_driver(hw);
-
-	return cdns_torrent_refclk_driver_set_parent(hw, refclk_driver->parent_index);
-}
-
-static int cdns_torrent_phy_suspend_noirq(struct device *dev)
-{
-	struct cdns_torrent_phy *cdns_phy = dev_get_drvdata(dev);
-	int i;
-
-	cdns_torrent_refclk_driver_suspend(cdns_phy);
-
-	reset_control_assert(cdns_phy->phy_rst);
-	reset_control_assert(cdns_phy->apb_rst);
-	for (i = 0; i < cdns_phy->nsubnodes; i++)
-		reset_control_assert(cdns_phy->phys[i].lnk_rst);
-
-	if (cdns_phy->already_configured)
-		cdns_phy->already_configured = 0;
-	else {
-		clk_disable_unprepare(cdns_phy->clk1);
-		clk_disable_unprepare(cdns_phy->clk);
-	}
-
-	return 0;
-}
-
-static int cdns_torrent_phy_resume_noirq(struct device *dev)
-{
-	struct cdns_torrent_phy *cdns_phy = dev_get_drvdata(dev);
-	int node = cdns_phy->nsubnodes;
-	int ret, i;
-
-	ret = cdns_torrent_refclk_driver_resume(cdns_phy);
-	if (ret)
-		return ret;
-
-	ret = cdns_torrent_clk(cdns_phy);
-	if (ret)
-		return ret;
-
-	/* Enable APB */
-	reset_control_deassert(cdns_phy->apb_rst);
-
-	if (cdns_phy->nsubnodes > 1) {
-		ret = cdns_torrent_phy_configure_multilink(cdns_phy);
-		if (ret)
-			goto put_lnk_rst;
-	}
-
-	return 0;
-
-put_lnk_rst:
-	for (i = 0; i < node; i++)
-		reset_control_assert(cdns_phy->phys[i].lnk_rst);
-	reset_control_assert(cdns_phy->apb_rst);
-
-	clk_disable_unprepare(cdns_phy->clk1);
-	clk_disable_unprepare(cdns_phy->clk);
-
-	return ret;
-}
-
-static DEFINE_NOIRQ_DEV_PM_OPS(cdns_torrent_phy_pm_ops,
-			       cdns_torrent_phy_suspend_noirq,
-			       cdns_torrent_phy_resume_noirq);
-
-/* PCIe and XAUI link configuration */
-static const struct cdns_reg_pairs pcie_xaui_link_cmn_regs[] = {
-	{0x0003, PHY_PLL_CFG},
-	{0x0600, CMN_PDIAG_PLL1_CLK_SEL_M0}
-};
-
-static const struct cdns_reg_pairs xaui_pcie_xcvr_diag_ln_regs[] = {
-	{0x0011, XCVR_DIAG_HSCLK_SEL},
-	{0x0089, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_torrent_vals pcie_xaui_link_cmn_vals = {
-	.reg_pairs = pcie_xaui_link_cmn_regs,
-	.num_regs = ARRAY_SIZE(pcie_xaui_link_cmn_regs),
-};
-
-static const struct cdns_torrent_vals xaui_pcie_xcvr_diag_ln_vals = {
-	.reg_pairs = xaui_pcie_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(xaui_pcie_xcvr_diag_ln_regs),
-};
-
-/* XAUI 100 MHz Ref clk, no SSC */
-static const struct cdns_reg_pairs xaui_100_no_ssc_cmn_regs[] = {
-	{0x0004, CMN_PLL1_DSM_DIAG_M0},
-	{0x0B17, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x0E01, CMN_PDIAG_PLL1_CP_IADJ_M0},
-	{0x0D05, CMN_PDIAG_PLL1_FILT_PADJ_M0},
-	{0x003E, CMN_PLL1_INTDIV_M0},
-	{0x8000, CMN_PLL1_FRACDIVL_M0},
-	{0x0002, CMN_PLL1_FRACDIVH_M0},
-	{0x002A, CMN_PLL1_HIGH_THR_M0},
-	{0x3102, CMN_PDIAG_PLL1_CTRL_M0},
-	{0x007F, CMN_TXPUCAL_TUNE},
-	{0x007F, CMN_TXPDCAL_TUNE}
-};
-
-static const struct cdns_reg_pairs xaui_100_no_ssc_tx_ln_regs[] = {
-	{0x00F3, TX_PSC_A0},
-	{0x04A2, TX_PSC_A2},
-	{0x04A2, TX_PSC_A3 },
-	{0x0000, TX_TXCC_CPOST_MULT_00}
-};
-
-static const struct cdns_reg_pairs ti_xaui_100_no_ssc_tx_ln_regs[] = {
-	{0x00F3, TX_PSC_A0},
-	{0x04A2, TX_PSC_A2},
-	{0x04A2, TX_PSC_A3 },
-	{0x0000, TX_TXCC_CPOST_MULT_00},
-	{0x4000, XCVR_DIAG_RXCLK_CTRL}
-};
-
-static const struct cdns_reg_pairs xaui_100_no_ssc_rx_ln_regs[] = {
-	{0x091D, RX_PSC_A0},
-	{0x0900, RX_PSC_A2},
-	{0x0100, RX_PSC_A3},
-	{0x03C7, RX_REE_GCSM1_EQENM_PH1},
-	{0x01C7, RX_REE_GCSM1_EQENM_PH2},
-	{0x0000, RX_DIAG_DFE_CTRL},
-	{0x0019, RX_REE_TAP1_CLIP},
-	{0x0019, RX_REE_TAP2TON_CLIP},
-	{0x0098, RX_DIAG_NQST_CTRL},
-	{0x0C01, RX_DIAG_DFE_AMP_TUNE_2},
-	{0x0000, RX_DIAG_DFE_AMP_TUNE_3},
-	{0x0000, RX_DIAG_PI_CAP},
-	{0x0031, RX_DIAG_PI_RATE},
-	{0x0001, RX_DIAG_ACYA},
-	{0x018C, RX_CDRLF_CNFG},
-};
-
-static const struct cdns_torrent_vals xaui_100_no_ssc_cmn_vals = {
-	.reg_pairs = xaui_100_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(xaui_100_no_ssc_cmn_regs),
-};
-
-static const struct cdns_torrent_vals xaui_100_no_ssc_tx_ln_vals = {
-	.reg_pairs = xaui_100_no_ssc_tx_ln_regs,
-	.num_regs = ARRAY_SIZE(xaui_100_no_ssc_tx_ln_regs),
-};
-
-static const struct cdns_torrent_vals ti_xaui_100_no_ssc_tx_ln_vals = {
-	.reg_pairs = ti_xaui_100_no_ssc_tx_ln_regs,
-	.num_regs = ARRAY_SIZE(ti_xaui_100_no_ssc_tx_ln_regs),
-};
-
-static const struct cdns_torrent_vals xaui_100_no_ssc_rx_ln_vals = {
-	.reg_pairs = xaui_100_no_ssc_rx_ln_regs,
-	.num_regs = ARRAY_SIZE(xaui_100_no_ssc_rx_ln_regs),
-};
-
-/* USB and DP link configuration */
-static const struct cdns_reg_pairs usb_dp_link_cmn_regs[] = {
-	{0x0002, PHY_PLL_CFG},
-	{0x8600, CMN_PDIAG_PLL0_CLK_SEL_M0}
-};
-
-static const struct cdns_reg_pairs usb_dp_xcvr_diag_ln_regs[] = {
-	{0x0000, XCVR_DIAG_HSCLK_SEL},
-	{0x0001, XCVR_DIAG_HSCLK_DIV},
-	{0x0041, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_reg_pairs dp_usb_xcvr_diag_ln_regs[] = {
-	{0x0001, XCVR_DIAG_HSCLK_SEL},
-	{0x0009, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_torrent_vals usb_dp_link_cmn_vals = {
-	.reg_pairs = usb_dp_link_cmn_regs,
-	.num_regs = ARRAY_SIZE(usb_dp_link_cmn_regs),
-};
-
-static const struct cdns_torrent_vals usb_dp_xcvr_diag_ln_vals = {
-	.reg_pairs = usb_dp_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(usb_dp_xcvr_diag_ln_regs),
-};
-
-static const struct cdns_torrent_vals dp_usb_xcvr_diag_ln_vals = {
-	.reg_pairs = dp_usb_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(dp_usb_xcvr_diag_ln_regs),
-};
-
-/* USXGMII and SGMII/QSGMII link configuration */
-static const struct cdns_reg_pairs usxgmii_sgmii_link_cmn_regs[] = {
-	{0x0002, PHY_PLL_CFG},
-	{0x0400, CMN_PDIAG_PLL0_CLK_SEL_M0},
-	{0x0601, CMN_PDIAG_PLL1_CLK_SEL_M0}
-};
-
-static const struct cdns_reg_pairs usxgmii_sgmii_xcvr_diag_ln_regs[] = {
-	{0x0000, XCVR_DIAG_HSCLK_SEL},
-	{0x0001, XCVR_DIAG_HSCLK_DIV},
-	{0x0001, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_reg_pairs sgmii_usxgmii_xcvr_diag_ln_regs[] = {
-	{0x0111, XCVR_DIAG_HSCLK_SEL},
-	{0x0103, XCVR_DIAG_HSCLK_DIV},
-	{0x0A9B, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_torrent_vals usxgmii_sgmii_link_cmn_vals = {
-	.reg_pairs = usxgmii_sgmii_link_cmn_regs,
-	.num_regs = ARRAY_SIZE(usxgmii_sgmii_link_cmn_regs),
-};
-
-static const struct cdns_torrent_vals usxgmii_sgmii_xcvr_diag_ln_vals = {
-	.reg_pairs = usxgmii_sgmii_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(usxgmii_sgmii_xcvr_diag_ln_regs),
-};
-
-static const struct cdns_torrent_vals sgmii_usxgmii_xcvr_diag_ln_vals = {
-	.reg_pairs = sgmii_usxgmii_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(sgmii_usxgmii_xcvr_diag_ln_regs),
-};
-
-/* Multilink USXGMII, using PLL0, 156.25 MHz Ref clk, no SSC */
-static const struct cdns_reg_pairs ml_usxgmii_pll0_156_25_no_ssc_cmn_regs[] = {
-	{0x0014, CMN_PLL0_DSM_FBH_OVRD_M0},
-	{0x0005, CMN_PLL0_DSM_FBL_OVRD_M0},
-	{0x061B, CMN_PLL0_VCOCAL_INIT_TMR},
-	{0x0019, CMN_PLL0_VCOCAL_ITER_TMR},
-	{0x1354, CMN_PLL0_VCOCAL_REFTIM_START},
-	{0x1354, CMN_PLL0_VCOCAL_PLLCNT_START},
-	{0x0003, CMN_PLL0_VCOCAL_TCTRL},
-	{0x0138, CMN_PLL0_LOCK_REFCNT_START},
-	{0x0138, CMN_PLL0_LOCK_PLLCNT_START}
-};
-
-static const struct cdns_torrent_vals ml_usxgmii_pll0_156_25_no_ssc_cmn_vals = {
-	.reg_pairs = ml_usxgmii_pll0_156_25_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(ml_usxgmii_pll0_156_25_no_ssc_cmn_regs),
-};
-
-/* Multilink SGMII/QSGMII, using PLL1, 100 MHz Ref clk, no SSC */
-static const struct cdns_reg_pairs ml_sgmii_pll1_100_no_ssc_cmn_regs[] = {
-	{0x0028, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x001E, CMN_PLL1_DSM_FBH_OVRD_M0},
-	{0x000C, CMN_PLL1_DSM_FBL_OVRD_M0},
-	{0x0003, CMN_PLL1_VCOCAL_TCTRL},
-	{0x007F, CMN_TXPUCAL_TUNE},
-	{0x007F, CMN_TXPDCAL_TUNE}
-};
-
-static const struct cdns_torrent_vals ml_sgmii_pll1_100_no_ssc_cmn_vals = {
-	.reg_pairs = ml_sgmii_pll1_100_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(ml_sgmii_pll1_100_no_ssc_cmn_regs),
-};
-
-/* TI J7200, Multilink USXGMII, using PLL0, 156.25 MHz Ref clk, no SSC */
-static const struct cdns_reg_pairs j7200_ml_usxgmii_pll0_156_25_no_ssc_cmn_regs[] = {
-	{0x0014, CMN_SSM_BIAS_TMR},
-	{0x0028, CMN_PLLSM0_PLLPRE_TMR},
-	{0x00A4, CMN_PLLSM0_PLLLOCK_TMR},
-	{0x0062, CMN_BGCAL_INIT_TMR},
-	{0x0062, CMN_BGCAL_ITER_TMR},
-	{0x0014, CMN_IBCAL_INIT_TMR},
-	{0x0018, CMN_TXPUCAL_INIT_TMR},
-	{0x0005, CMN_TXPUCAL_ITER_TMR},
-	{0x0018, CMN_TXPDCAL_INIT_TMR},
-	{0x0005, CMN_TXPDCAL_ITER_TMR},
-	{0x024A, CMN_RXCAL_INIT_TMR},
-	{0x0005, CMN_RXCAL_ITER_TMR},
-	{0x000B, CMN_SD_CAL_REFTIM_START},
-	{0x0132, CMN_SD_CAL_PLLCNT_START},
-	{0x0014, CMN_PLL0_DSM_FBH_OVRD_M0},
-	{0x0005, CMN_PLL0_DSM_FBL_OVRD_M0},
-	{0x061B, CMN_PLL0_VCOCAL_INIT_TMR},
-	{0x0019, CMN_PLL0_VCOCAL_ITER_TMR},
-	{0x1354, CMN_PLL0_VCOCAL_REFTIM_START},
-	{0x1354, CMN_PLL0_VCOCAL_PLLCNT_START},
-	{0x0003, CMN_PLL0_VCOCAL_TCTRL},
-	{0x0138, CMN_PLL0_LOCK_REFCNT_START},
-	{0x0138, CMN_PLL0_LOCK_PLLCNT_START}
-};
-
-static const struct cdns_torrent_vals j7200_ml_usxgmii_pll0_156_25_no_ssc_cmn_vals = {
-	.reg_pairs = j7200_ml_usxgmii_pll0_156_25_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(j7200_ml_usxgmii_pll0_156_25_no_ssc_cmn_regs),
-};
-
-/* TI J7200, Multilink SGMII/QSGMII, using PLL1, 100 MHz Ref clk, no SSC */
-static const struct cdns_reg_pairs j7200_ml_sgmii_pll1_100_no_ssc_cmn_regs[] = {
-	{0x0028, CMN_PLLSM1_PLLPRE_TMR},
-	{0x00A4, CMN_PLLSM1_PLLLOCK_TMR},
-	{0x0028, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x001E, CMN_PLL1_DSM_FBH_OVRD_M0},
-	{0x000C, CMN_PLL1_DSM_FBL_OVRD_M0},
-	{0x0003, CMN_PLL1_VCOCAL_TCTRL},
-	{0x007F, CMN_TXPUCAL_TUNE},
-	{0x007F, CMN_TXPDCAL_TUNE}
-};
-
-static const struct cdns_torrent_vals j7200_ml_sgmii_pll1_100_no_ssc_cmn_vals = {
-	.reg_pairs = j7200_ml_sgmii_pll1_100_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(j7200_ml_sgmii_pll1_100_no_ssc_cmn_regs),
-};
-
-/* PCIe and USXGMII link configuration */
-static const struct cdns_reg_pairs pcie_usxgmii_link_cmn_regs[] = {
-	{0x0003, PHY_PLL_CFG},
-	{0x0601, CMN_PDIAG_PLL0_CLK_SEL_M0},
-	{0x0400, CMN_PDIAG_PLL0_CLK_SEL_M1},
-	{0x0400, CMN_PDIAG_PLL1_CLK_SEL_M0}
-};
-
-static const struct cdns_reg_pairs pcie_usxgmii_xcvr_diag_ln_regs[] = {
-	{0x0000, XCVR_DIAG_HSCLK_SEL},
-	{0x0001, XCVR_DIAG_HSCLK_DIV},
-	{0x0012, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_reg_pairs usxgmii_pcie_xcvr_diag_ln_regs[] = {
-	{0x0011, XCVR_DIAG_HSCLK_SEL},
-	{0x0001, XCVR_DIAG_HSCLK_DIV},
-	{0x0089, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_torrent_vals pcie_usxgmii_link_cmn_vals = {
-	.reg_pairs = pcie_usxgmii_link_cmn_regs,
-	.num_regs = ARRAY_SIZE(pcie_usxgmii_link_cmn_regs),
-};
-
-static const struct cdns_torrent_vals pcie_usxgmii_xcvr_diag_ln_vals = {
-	.reg_pairs = pcie_usxgmii_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(pcie_usxgmii_xcvr_diag_ln_regs),
-};
-
-static const struct cdns_torrent_vals usxgmii_pcie_xcvr_diag_ln_vals = {
-	.reg_pairs = usxgmii_pcie_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(usxgmii_pcie_xcvr_diag_ln_regs),
-};
-
-/*
- * Multilink USXGMII, using PLL1, 156.25 MHz Ref clk, no SSC
- */
-static const struct cdns_reg_pairs ml_usxgmii_pll1_156_25_no_ssc_cmn_regs[] = {
-	{0x0028, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x0014, CMN_PLL1_DSM_FBH_OVRD_M0},
-	{0x0005, CMN_PLL1_DSM_FBL_OVRD_M0},
-	{0x061B, CMN_PLL1_VCOCAL_INIT_TMR},
-	{0x0019, CMN_PLL1_VCOCAL_ITER_TMR},
-	{0x1354, CMN_PLL1_VCOCAL_REFTIM_START},
-	{0x1354, CMN_PLL1_VCOCAL_PLLCNT_START},
-	{0x0003, CMN_PLL1_VCOCAL_TCTRL},
-	{0x0138, CMN_PLL1_LOCK_REFCNT_START},
-	{0x0138, CMN_PLL1_LOCK_PLLCNT_START},
-	{0x007F, CMN_TXPUCAL_TUNE},
-	{0x007F, CMN_TXPDCAL_TUNE}
-};
-
-static const struct cdns_reg_pairs ml_usxgmii_156_25_no_ssc_tx_ln_regs[] = {
-	{0x00F3, TX_PSC_A0},
-	{0x04A2, TX_PSC_A2},
-	{0x04A2, TX_PSC_A3 },
-	{0x0000, TX_TXCC_CPOST_MULT_00},
-	{0x0000, XCVR_DIAG_PSC_OVRD}
-};
-
-static const struct cdns_reg_pairs ml_usxgmii_156_25_no_ssc_rx_ln_regs[] = {
-	{0x091D, RX_PSC_A0},
-	{0x0900, RX_PSC_A2},
-	{0x0100, RX_PSC_A3},
-	{0x0030, RX_REE_SMGM_CTRL1},
-	{0x03C7, RX_REE_GCSM1_EQENM_PH1},
-	{0x01C7, RX_REE_GCSM1_EQENM_PH2},
-	{0x0000, RX_DIAG_DFE_CTRL},
-	{0x0019, RX_REE_TAP1_CLIP},
-	{0x0019, RX_REE_TAP2TON_CLIP},
-	{0x00B9, RX_DIAG_NQST_CTRL},
-	{0x0C21, RX_DIAG_DFE_AMP_TUNE_2},
-	{0x0002, RX_DIAG_DFE_AMP_TUNE_3},
-	{0x0033, RX_DIAG_PI_RATE},
-	{0x0001, RX_DIAG_ACYA},
-	{0x018C, RX_CDRLF_CNFG}
-};
-
-static const struct cdns_torrent_vals ml_usxgmii_pll1_156_25_no_ssc_cmn_vals = {
-	.reg_pairs = ml_usxgmii_pll1_156_25_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(ml_usxgmii_pll1_156_25_no_ssc_cmn_regs),
-};
-
-static const struct cdns_torrent_vals ml_usxgmii_156_25_no_ssc_tx_ln_vals = {
-	.reg_pairs = ml_usxgmii_156_25_no_ssc_tx_ln_regs,
-	.num_regs = ARRAY_SIZE(ml_usxgmii_156_25_no_ssc_tx_ln_regs),
-};
-
-static const struct cdns_torrent_vals ml_usxgmii_156_25_no_ssc_rx_ln_vals = {
-	.reg_pairs = ml_usxgmii_156_25_no_ssc_rx_ln_regs,
-	.num_regs = ARRAY_SIZE(ml_usxgmii_156_25_no_ssc_rx_ln_regs),
-};
-
-/* TI USXGMII configuration: Enable cmn_refclk_rcv_out_en */
-static const struct cdns_reg_pairs ti_usxgmii_phy_pma_cmn_regs[] = {
-	{0x0040, PHY_PMA_CMN_CTRL1},
-};
-
-static const struct cdns_torrent_vals ti_usxgmii_phy_pma_cmn_vals = {
-	.reg_pairs = ti_usxgmii_phy_pma_cmn_regs,
-	.num_regs = ARRAY_SIZE(ti_usxgmii_phy_pma_cmn_regs),
-};
-
-/* Single USXGMII link configuration */
-static const struct cdns_reg_pairs sl_usxgmii_link_cmn_regs[] = {
-	{0x0000, PHY_PLL_CFG},
-	{0x0400, CMN_PDIAG_PLL0_CLK_SEL_M0}
-};
-
-static const struct cdns_reg_pairs sl_usxgmii_xcvr_diag_ln_regs[] = {
-	{0x0000, XCVR_DIAG_HSCLK_SEL},
-	{0x0001, XCVR_DIAG_HSCLK_DIV},
-	{0x0001, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_torrent_vals sl_usxgmii_link_cmn_vals = {
-	.reg_pairs = sl_usxgmii_link_cmn_regs,
-	.num_regs = ARRAY_SIZE(sl_usxgmii_link_cmn_regs),
-};
-
-static const struct cdns_torrent_vals sl_usxgmii_xcvr_diag_ln_vals = {
-	.reg_pairs = sl_usxgmii_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(sl_usxgmii_xcvr_diag_ln_regs),
-};
-
-/* Single link USXGMII, 156.25 MHz Ref clk, no SSC */
-static const struct cdns_reg_pairs sl_usxgmii_156_25_no_ssc_cmn_regs[] = {
-	{0x0014, CMN_SSM_BIAS_TMR},
-	{0x0028, CMN_PLLSM0_PLLPRE_TMR},
-	{0x00A4, CMN_PLLSM0_PLLLOCK_TMR},
-	{0x0028, CMN_PLLSM1_PLLPRE_TMR},
-	{0x00A4, CMN_PLLSM1_PLLLOCK_TMR},
-	{0x0062, CMN_BGCAL_INIT_TMR},
-	{0x0062, CMN_BGCAL_ITER_TMR},
-	{0x0014, CMN_IBCAL_INIT_TMR},
-	{0x0018, CMN_TXPUCAL_INIT_TMR},
-	{0x0005, CMN_TXPUCAL_ITER_TMR},
-	{0x0018, CMN_TXPDCAL_INIT_TMR},
-	{0x0005, CMN_TXPDCAL_ITER_TMR},
-	{0x024A, CMN_RXCAL_INIT_TMR},
-	{0x0005, CMN_RXCAL_ITER_TMR},
-	{0x000B, CMN_SD_CAL_REFTIM_START},
-	{0x0132, CMN_SD_CAL_PLLCNT_START},
-	{0x0028, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x0014, CMN_PLL0_DSM_FBH_OVRD_M0},
-	{0x0014, CMN_PLL1_DSM_FBH_OVRD_M0},
-	{0x0005, CMN_PLL0_DSM_FBL_OVRD_M0},
-	{0x0005, CMN_PLL1_DSM_FBL_OVRD_M0},
-	{0x061B, CMN_PLL0_VCOCAL_INIT_TMR},
-	{0x061B, CMN_PLL1_VCOCAL_INIT_TMR},
-	{0x0019, CMN_PLL0_VCOCAL_ITER_TMR},
-	{0x0019, CMN_PLL1_VCOCAL_ITER_TMR},
-	{0x1354, CMN_PLL0_VCOCAL_REFTIM_START},
-	{0x1354, CMN_PLL1_VCOCAL_REFTIM_START},
-	{0x1354, CMN_PLL0_VCOCAL_PLLCNT_START},
-	{0x1354, CMN_PLL1_VCOCAL_PLLCNT_START},
-	{0x0003, CMN_PLL0_VCOCAL_TCTRL},
-	{0x0003, CMN_PLL1_VCOCAL_TCTRL},
-	{0x0138, CMN_PLL0_LOCK_REFCNT_START},
-	{0x0138, CMN_PLL1_LOCK_REFCNT_START},
-	{0x0138, CMN_PLL0_LOCK_PLLCNT_START},
-	{0x0138, CMN_PLL1_LOCK_PLLCNT_START}
-};
-
-static const struct cdns_reg_pairs usxgmii_156_25_no_ssc_tx_ln_regs[] = {
-	{0x07A2, TX_RCVDET_ST_TMR},
-	{0x00F3, TX_PSC_A0},
-	{0x04A2, TX_PSC_A2},
-	{0x04A2, TX_PSC_A3},
-	{0x0000, TX_TXCC_CPOST_MULT_00},
-	{0x0000, XCVR_DIAG_PSC_OVRD}
-};
-
-static const struct cdns_reg_pairs usxgmii_156_25_no_ssc_rx_ln_regs[] = {
-	{0x0014, RX_SDCAL0_INIT_TMR},
-	{0x0062, RX_SDCAL0_ITER_TMR},
-	{0x0014, RX_SDCAL1_INIT_TMR},
-	{0x0062, RX_SDCAL1_ITER_TMR},
-	{0x091D, RX_PSC_A0},
-	{0x0900, RX_PSC_A2},
-	{0x0100, RX_PSC_A3},
-	{0x0030, RX_REE_SMGM_CTRL1},
-	{0x03C7, RX_REE_GCSM1_EQENM_PH1},
-	{0x01C7, RX_REE_GCSM1_EQENM_PH2},
-	{0x0000, RX_DIAG_DFE_CTRL},
-	{0x0019, RX_REE_TAP1_CLIP},
-	{0x0019, RX_REE_TAP2TON_CLIP},
-	{0x00B9, RX_DIAG_NQST_CTRL},
-	{0x0C21, RX_DIAG_DFE_AMP_TUNE_2},
-	{0x0002, RX_DIAG_DFE_AMP_TUNE_3},
-	{0x0033, RX_DIAG_PI_RATE},
-	{0x0001, RX_DIAG_ACYA},
-	{0x018C, RX_CDRLF_CNFG}
-};
-
-static const struct cdns_torrent_vals sl_usxgmii_156_25_no_ssc_cmn_vals = {
-	.reg_pairs = sl_usxgmii_156_25_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(sl_usxgmii_156_25_no_ssc_cmn_regs),
-};
-
-static const struct cdns_torrent_vals usxgmii_156_25_no_ssc_tx_ln_vals = {
-	.reg_pairs = usxgmii_156_25_no_ssc_tx_ln_regs,
-	.num_regs = ARRAY_SIZE(usxgmii_156_25_no_ssc_tx_ln_regs),
-};
-
-static const struct cdns_torrent_vals usxgmii_156_25_no_ssc_rx_ln_vals = {
-	.reg_pairs = usxgmii_156_25_no_ssc_rx_ln_regs,
-	.num_regs = ARRAY_SIZE(usxgmii_156_25_no_ssc_rx_ln_regs),
-};
-
-/* PCIe and DP link configuration */
-static const struct cdns_reg_pairs pcie_dp_link_cmn_regs[] = {
-	{0x0003, PHY_PLL_CFG},
-	{0x0601, CMN_PDIAG_PLL0_CLK_SEL_M0},
-	{0x0400, CMN_PDIAG_PLL0_CLK_SEL_M1}
-};
-
-static const struct cdns_reg_pairs pcie_dp_xcvr_diag_ln_regs[] = {
-	{0x0000, XCVR_DIAG_HSCLK_SEL},
-	{0x0001, XCVR_DIAG_HSCLK_DIV},
-	{0x0012, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_reg_pairs dp_pcie_xcvr_diag_ln_regs[] = {
-	{0x0001, XCVR_DIAG_HSCLK_SEL},
-	{0x0009, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_torrent_vals pcie_dp_link_cmn_vals = {
-	.reg_pairs = pcie_dp_link_cmn_regs,
-	.num_regs = ARRAY_SIZE(pcie_dp_link_cmn_regs),
-};
-
-static const struct cdns_torrent_vals pcie_dp_xcvr_diag_ln_vals = {
-	.reg_pairs = pcie_dp_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(pcie_dp_xcvr_diag_ln_regs),
-};
-
-static const struct cdns_torrent_vals dp_pcie_xcvr_diag_ln_vals = {
-	.reg_pairs = dp_pcie_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(dp_pcie_xcvr_diag_ln_regs),
-};
-
-/* DP Multilink, 100 MHz Ref clk, no SSC */
-static const struct cdns_reg_pairs dp_100_no_ssc_cmn_regs[] = {
-	{0x007F, CMN_TXPUCAL_TUNE},
-	{0x007F, CMN_TXPDCAL_TUNE}
-};
-
-static const struct cdns_reg_pairs dp_100_no_ssc_tx_ln_regs[] = {
-	{0x00FB, TX_PSC_A0},
-	{0x04AA, TX_PSC_A2},
-	{0x04AA, TX_PSC_A3},
-	{0x000F, XCVR_DIAG_BIDI_CTRL}
-};
-
-static const struct cdns_reg_pairs dp_100_no_ssc_rx_ln_regs[] = {
-	{0x0000, RX_PSC_A0},
-	{0x0000, RX_PSC_A2},
-	{0x0000, RX_PSC_A3},
-	{0x0000, RX_PSC_CAL},
-	{0x0000, RX_REE_GCSM1_CTRL},
-	{0x0000, RX_REE_GCSM2_CTRL},
-	{0x0000, RX_REE_PERGCSM_CTRL}
-};
-
-static const struct cdns_torrent_vals dp_100_no_ssc_cmn_vals = {
-	.reg_pairs = dp_100_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(dp_100_no_ssc_cmn_regs),
-};
-
-static const struct cdns_torrent_vals dp_100_no_ssc_tx_ln_vals = {
-	.reg_pairs = dp_100_no_ssc_tx_ln_regs,
-	.num_regs = ARRAY_SIZE(dp_100_no_ssc_tx_ln_regs),
-};
-
-static const struct cdns_torrent_vals dp_100_no_ssc_rx_ln_vals = {
-	.reg_pairs = dp_100_no_ssc_rx_ln_regs,
-	.num_regs = ARRAY_SIZE(dp_100_no_ssc_rx_ln_regs),
-};
-
-/* Single DisplayPort(DP) link configuration */
-static const struct cdns_reg_pairs sl_dp_link_cmn_regs[] = {
-	{0x0000, PHY_PLL_CFG},
-};
-
-static const struct cdns_reg_pairs sl_dp_xcvr_diag_ln_regs[] = {
-	{0x0000, XCVR_DIAG_HSCLK_SEL},
-	{0x0001, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_torrent_vals sl_dp_link_cmn_vals = {
-	.reg_pairs = sl_dp_link_cmn_regs,
-	.num_regs = ARRAY_SIZE(sl_dp_link_cmn_regs),
-};
-
-static const struct cdns_torrent_vals sl_dp_xcvr_diag_ln_vals = {
-	.reg_pairs = sl_dp_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(sl_dp_xcvr_diag_ln_regs),
-};
-
-/* Single DP, 19.2 MHz Ref clk, no SSC */
-static const struct cdns_reg_pairs sl_dp_19_2_no_ssc_cmn_regs[] = {
-	{0x0014, CMN_SSM_BIAS_TMR},
-	{0x0027, CMN_PLLSM0_PLLPRE_TMR},
-	{0x00A1, CMN_PLLSM0_PLLLOCK_TMR},
-	{0x0027, CMN_PLLSM1_PLLPRE_TMR},
-	{0x00A1, CMN_PLLSM1_PLLLOCK_TMR},
-	{0x0060, CMN_BGCAL_INIT_TMR},
-	{0x0060, CMN_BGCAL_ITER_TMR},
-	{0x0014, CMN_IBCAL_INIT_TMR},
-	{0x0018, CMN_TXPUCAL_INIT_TMR},
-	{0x0005, CMN_TXPUCAL_ITER_TMR},
-	{0x0018, CMN_TXPDCAL_INIT_TMR},
-	{0x0005, CMN_TXPDCAL_ITER_TMR},
-	{0x0240, CMN_RXCAL_INIT_TMR},
-	{0x0005, CMN_RXCAL_ITER_TMR},
-	{0x0002, CMN_SD_CAL_INIT_TMR},
-	{0x0002, CMN_SD_CAL_ITER_TMR},
-	{0x000B, CMN_SD_CAL_REFTIM_START},
-	{0x0137, CMN_SD_CAL_PLLCNT_START},
-	{0x0509, CMN_PDIAG_PLL0_CP_PADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL0_CP_IADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL0_FILT_PADJ_M0},
-	{0x0004, CMN_PLL0_DSM_DIAG_M0},
-	{0x0509, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL1_CP_IADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL1_FILT_PADJ_M0},
-	{0x0004, CMN_PLL1_DSM_DIAG_M0},
-	{0x00C0, CMN_PLL0_VCOCAL_INIT_TMR},
-	{0x0004, CMN_PLL0_VCOCAL_ITER_TMR},
-	{0x00C0, CMN_PLL1_VCOCAL_INIT_TMR},
-	{0x0004, CMN_PLL1_VCOCAL_ITER_TMR},
-	{0x0260, CMN_PLL0_VCOCAL_REFTIM_START},
-	{0x0003, CMN_PLL0_VCOCAL_TCTRL},
-	{0x0260, CMN_PLL1_VCOCAL_REFTIM_START},
-	{0x0003, CMN_PLL1_VCOCAL_TCTRL}
-};
-
-static const struct cdns_reg_pairs sl_dp_19_2_no_ssc_tx_ln_regs[] = {
-	{0x0780, TX_RCVDET_ST_TMR},
-	{0x00FB, TX_PSC_A0},
-	{0x04AA, TX_PSC_A2},
-	{0x04AA, TX_PSC_A3},
-	{0x000F, XCVR_DIAG_BIDI_CTRL}
-};
-
-static const struct cdns_reg_pairs sl_dp_19_2_no_ssc_rx_ln_regs[] = {
-	{0x0000, RX_PSC_A0},
-	{0x0000, RX_PSC_A2},
-	{0x0000, RX_PSC_A3},
-	{0x0000, RX_PSC_CAL},
-	{0x0000, RX_REE_GCSM1_CTRL},
-	{0x0000, RX_REE_GCSM2_CTRL},
-	{0x0000, RX_REE_PERGCSM_CTRL}
-};
-
-static const struct cdns_torrent_vals sl_dp_19_2_no_ssc_cmn_vals = {
-	.reg_pairs = sl_dp_19_2_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(sl_dp_19_2_no_ssc_cmn_regs),
-};
-
-static const struct cdns_torrent_vals sl_dp_19_2_no_ssc_tx_ln_vals = {
-	.reg_pairs = sl_dp_19_2_no_ssc_tx_ln_regs,
-	.num_regs = ARRAY_SIZE(sl_dp_19_2_no_ssc_tx_ln_regs),
-};
-
-static const struct cdns_torrent_vals sl_dp_19_2_no_ssc_rx_ln_vals = {
-	.reg_pairs = sl_dp_19_2_no_ssc_rx_ln_regs,
-	.num_regs = ARRAY_SIZE(sl_dp_19_2_no_ssc_rx_ln_regs),
-};
-
-/* Single DP, 25 MHz Ref clk, no SSC */
-static const struct cdns_reg_pairs sl_dp_25_no_ssc_cmn_regs[] = {
-	{0x0019, CMN_SSM_BIAS_TMR},
-	{0x0032, CMN_PLLSM0_PLLPRE_TMR},
-	{0x00D1, CMN_PLLSM0_PLLLOCK_TMR},
-	{0x0032, CMN_PLLSM1_PLLPRE_TMR},
-	{0x00D1, CMN_PLLSM1_PLLLOCK_TMR},
-	{0x007D, CMN_BGCAL_INIT_TMR},
-	{0x007D, CMN_BGCAL_ITER_TMR},
-	{0x0019, CMN_IBCAL_INIT_TMR},
-	{0x001E, CMN_TXPUCAL_INIT_TMR},
-	{0x0006, CMN_TXPUCAL_ITER_TMR},
-	{0x001E, CMN_TXPDCAL_INIT_TMR},
-	{0x0006, CMN_TXPDCAL_ITER_TMR},
-	{0x02EE, CMN_RXCAL_INIT_TMR},
-	{0x0006, CMN_RXCAL_ITER_TMR},
-	{0x0002, CMN_SD_CAL_INIT_TMR},
-	{0x0002, CMN_SD_CAL_ITER_TMR},
-	{0x000E, CMN_SD_CAL_REFTIM_START},
-	{0x012B, CMN_SD_CAL_PLLCNT_START},
-	{0x0509, CMN_PDIAG_PLL0_CP_PADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL0_CP_IADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL0_FILT_PADJ_M0},
-	{0x0004, CMN_PLL0_DSM_DIAG_M0},
-	{0x0509, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL1_CP_IADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL1_FILT_PADJ_M0},
-	{0x0004, CMN_PLL1_DSM_DIAG_M0},
-	{0x00FA, CMN_PLL0_VCOCAL_INIT_TMR},
-	{0x0004, CMN_PLL0_VCOCAL_ITER_TMR},
-	{0x00FA, CMN_PLL1_VCOCAL_INIT_TMR},
-	{0x0004, CMN_PLL1_VCOCAL_ITER_TMR},
-	{0x0317, CMN_PLL0_VCOCAL_REFTIM_START},
-	{0x0003, CMN_PLL0_VCOCAL_TCTRL},
-	{0x0317, CMN_PLL1_VCOCAL_REFTIM_START},
-	{0x0003, CMN_PLL1_VCOCAL_TCTRL}
-};
-
-static const struct cdns_reg_pairs sl_dp_25_no_ssc_tx_ln_regs[] = {
-	{0x09C4, TX_RCVDET_ST_TMR},
-	{0x00FB, TX_PSC_A0},
-	{0x04AA, TX_PSC_A2},
-	{0x04AA, TX_PSC_A3},
-	{0x000F, XCVR_DIAG_BIDI_CTRL}
-};
-
-static const struct cdns_reg_pairs sl_dp_25_no_ssc_rx_ln_regs[] = {
-	{0x0000, RX_PSC_A0},
-	{0x0000, RX_PSC_A2},
-	{0x0000, RX_PSC_A3},
-	{0x0000, RX_PSC_CAL},
-	{0x0000, RX_REE_GCSM1_CTRL},
-	{0x0000, RX_REE_GCSM2_CTRL},
-	{0x0000, RX_REE_PERGCSM_CTRL}
-};
-
-static const struct cdns_torrent_vals sl_dp_25_no_ssc_cmn_vals = {
-	.reg_pairs = sl_dp_25_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(sl_dp_25_no_ssc_cmn_regs),
-};
-
-static const struct cdns_torrent_vals sl_dp_25_no_ssc_tx_ln_vals = {
-	.reg_pairs = sl_dp_25_no_ssc_tx_ln_regs,
-	.num_regs = ARRAY_SIZE(sl_dp_25_no_ssc_tx_ln_regs),
-};
-
-static const struct cdns_torrent_vals sl_dp_25_no_ssc_rx_ln_vals = {
-	.reg_pairs = sl_dp_25_no_ssc_rx_ln_regs,
-	.num_regs = ARRAY_SIZE(sl_dp_25_no_ssc_rx_ln_regs),
-};
-
-/* Single DP, 100 MHz Ref clk, no SSC */
-static const struct cdns_reg_pairs sl_dp_100_no_ssc_cmn_regs[] = {
-	{0x0003, CMN_PLL0_VCOCAL_TCTRL},
-	{0x0003, CMN_PLL1_VCOCAL_TCTRL}
-};
-
-static const struct cdns_reg_pairs sl_dp_100_no_ssc_tx_ln_regs[] = {
-	{0x00FB, TX_PSC_A0},
-	{0x04AA, TX_PSC_A2},
-	{0x04AA, TX_PSC_A3},
-	{0x000F, XCVR_DIAG_BIDI_CTRL}
-};
-
-static const struct cdns_reg_pairs sl_dp_100_no_ssc_rx_ln_regs[] = {
-	{0x0000, RX_PSC_A0},
-	{0x0000, RX_PSC_A2},
-	{0x0000, RX_PSC_A3},
-	{0x0000, RX_PSC_CAL},
-	{0x0000, RX_REE_GCSM1_CTRL},
-	{0x0000, RX_REE_GCSM2_CTRL},
-	{0x0000, RX_REE_PERGCSM_CTRL}
-};
-
-static const struct cdns_torrent_vals sl_dp_100_no_ssc_cmn_vals = {
-	.reg_pairs = sl_dp_100_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(sl_dp_100_no_ssc_cmn_regs),
-};
-
-static const struct cdns_torrent_vals sl_dp_100_no_ssc_tx_ln_vals = {
-	.reg_pairs = sl_dp_100_no_ssc_tx_ln_regs,
-	.num_regs = ARRAY_SIZE(sl_dp_100_no_ssc_tx_ln_regs),
-};
-
-static const struct cdns_torrent_vals sl_dp_100_no_ssc_rx_ln_vals = {
-	.reg_pairs = sl_dp_100_no_ssc_rx_ln_regs,
-	.num_regs = ARRAY_SIZE(sl_dp_100_no_ssc_rx_ln_regs),
-};
-
-/* USB and SGMII/QSGMII link configuration */
-static const struct cdns_reg_pairs usb_sgmii_link_cmn_regs[] = {
-	{0x0002, PHY_PLL_CFG},
-	{0x8600, CMN_PDIAG_PLL0_CLK_SEL_M0},
-	{0x0601, CMN_PDIAG_PLL1_CLK_SEL_M0}
-};
-
-static const struct cdns_reg_pairs usb_sgmii_xcvr_diag_ln_regs[] = {
-	{0x0000, XCVR_DIAG_HSCLK_SEL},
-	{0x0001, XCVR_DIAG_HSCLK_DIV},
-	{0x0041, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_reg_pairs sgmii_usb_xcvr_diag_ln_regs[] = {
-	{0x0011, XCVR_DIAG_HSCLK_SEL},
-	{0x0003, XCVR_DIAG_HSCLK_DIV},
-	{0x009B, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_torrent_vals usb_sgmii_link_cmn_vals = {
-	.reg_pairs = usb_sgmii_link_cmn_regs,
-	.num_regs = ARRAY_SIZE(usb_sgmii_link_cmn_regs),
-};
-
-static const struct cdns_torrent_vals usb_sgmii_xcvr_diag_ln_vals = {
-	.reg_pairs = usb_sgmii_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(usb_sgmii_xcvr_diag_ln_regs),
-};
-
-static const struct cdns_torrent_vals sgmii_usb_xcvr_diag_ln_vals = {
-	.reg_pairs = sgmii_usb_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(sgmii_usb_xcvr_diag_ln_regs),
-};
-
-/* PCIe and USB Unique SSC link configuration */
-static const struct cdns_reg_pairs pcie_usb_link_cmn_regs[] = {
-	{0x0003, PHY_PLL_CFG},
-	{0x0601, CMN_PDIAG_PLL0_CLK_SEL_M0},
-	{0x0400, CMN_PDIAG_PLL0_CLK_SEL_M1},
-	{0x8600, CMN_PDIAG_PLL1_CLK_SEL_M0}
-};
-
-static const struct cdns_reg_pairs pcie_usb_xcvr_diag_ln_regs[] = {
-	{0x0000, XCVR_DIAG_HSCLK_SEL},
-	{0x0001, XCVR_DIAG_HSCLK_DIV},
-	{0x0012, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_reg_pairs usb_pcie_xcvr_diag_ln_regs[] = {
-	{0x0011, XCVR_DIAG_HSCLK_SEL},
-	{0x0001, XCVR_DIAG_HSCLK_DIV},
-	{0x00C9, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_torrent_vals pcie_usb_link_cmn_vals = {
-	.reg_pairs = pcie_usb_link_cmn_regs,
-	.num_regs = ARRAY_SIZE(pcie_usb_link_cmn_regs),
-};
-
-static const struct cdns_torrent_vals pcie_usb_xcvr_diag_ln_vals = {
-	.reg_pairs = pcie_usb_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(pcie_usb_xcvr_diag_ln_regs),
-};
-
-static const struct cdns_torrent_vals usb_pcie_xcvr_diag_ln_vals = {
-	.reg_pairs = usb_pcie_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(usb_pcie_xcvr_diag_ln_regs),
-};
-
-/* USB 100 MHz Ref clk, internal SSC */
-static const struct cdns_reg_pairs usb_100_int_ssc_cmn_regs[] = {
-	{0x0004, CMN_PLL0_DSM_DIAG_M0},
-	{0x0004, CMN_PLL0_DSM_DIAG_M1},
-	{0x0004, CMN_PLL1_DSM_DIAG_M0},
-	{0x0509, CMN_PDIAG_PLL0_CP_PADJ_M0},
-	{0x0509, CMN_PDIAG_PLL0_CP_PADJ_M1},
-	{0x0509, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL0_CP_IADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL0_CP_IADJ_M1},
-	{0x0F00, CMN_PDIAG_PLL1_CP_IADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL0_FILT_PADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL0_FILT_PADJ_M1},
-	{0x0F08, CMN_PDIAG_PLL1_FILT_PADJ_M0},
-	{0x0064, CMN_PLL0_INTDIV_M0},
-	{0x0050, CMN_PLL0_INTDIV_M1},
-	{0x0064, CMN_PLL1_INTDIV_M0},
-	{0x0002, CMN_PLL0_FRACDIVH_M0},
-	{0x0002, CMN_PLL0_FRACDIVH_M1},
-	{0x0002, CMN_PLL1_FRACDIVH_M0},
-	{0x0044, CMN_PLL0_HIGH_THR_M0},
-	{0x0036, CMN_PLL0_HIGH_THR_M1},
-	{0x0044, CMN_PLL1_HIGH_THR_M0},
-	{0x0002, CMN_PDIAG_PLL0_CTRL_M0},
-	{0x0002, CMN_PDIAG_PLL0_CTRL_M1},
-	{0x0002, CMN_PDIAG_PLL1_CTRL_M0},
-	{0x0001, CMN_PLL0_SS_CTRL1_M0},
-	{0x0001, CMN_PLL0_SS_CTRL1_M1},
-	{0x0001, CMN_PLL1_SS_CTRL1_M0},
-	{0x011B, CMN_PLL0_SS_CTRL2_M0},
-	{0x011B, CMN_PLL0_SS_CTRL2_M1},
-	{0x011B, CMN_PLL1_SS_CTRL2_M0},
-	{0x006E, CMN_PLL0_SS_CTRL3_M0},
-	{0x0058, CMN_PLL0_SS_CTRL3_M1},
-	{0x006E, CMN_PLL1_SS_CTRL3_M0},
-	{0x000E, CMN_PLL0_SS_CTRL4_M0},
-	{0x0012, CMN_PLL0_SS_CTRL4_M1},
-	{0x000E, CMN_PLL1_SS_CTRL4_M0},
-	{0x0C5E, CMN_PLL0_VCOCAL_REFTIM_START},
-	{0x0C5E, CMN_PLL1_VCOCAL_REFTIM_START},
-	{0x0C56, CMN_PLL0_VCOCAL_PLLCNT_START},
-	{0x0C56, CMN_PLL1_VCOCAL_PLLCNT_START},
-	{0x00C7, CMN_PLL0_LOCK_REFCNT_START},
-	{0x00C7, CMN_PLL1_LOCK_REFCNT_START},
-	{0x00C7, CMN_PLL0_LOCK_PLLCNT_START},
-	{0x00C7, CMN_PLL1_LOCK_PLLCNT_START},
-	{0x0005, CMN_PLL0_LOCK_PLLCNT_THR},
-	{0x0005, CMN_PLL1_LOCK_PLLCNT_THR},
-	{0x8200, CMN_CDIAG_CDB_PWRI_OVRD},
-	{0x8200, CMN_CDIAG_XCVRC_PWRI_OVRD},
-	{0x007F, CMN_TXPUCAL_TUNE},
-	{0x007F, CMN_TXPDCAL_TUNE}
-};
-
-static const struct cdns_torrent_vals usb_100_int_ssc_cmn_vals = {
-	.reg_pairs = usb_100_int_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(usb_100_int_ssc_cmn_regs),
-};
-
-/* Single USB link configuration */
-static const struct cdns_reg_pairs sl_usb_link_cmn_regs[] = {
-	{0x0000, PHY_PLL_CFG},
-	{0x8600, CMN_PDIAG_PLL0_CLK_SEL_M0}
-};
-
-static const struct cdns_reg_pairs sl_usb_xcvr_diag_ln_regs[] = {
-	{0x0000, XCVR_DIAG_HSCLK_SEL},
-	{0x0001, XCVR_DIAG_HSCLK_DIV},
-	{0x0041, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_torrent_vals sl_usb_link_cmn_vals = {
-	.reg_pairs = sl_usb_link_cmn_regs,
-	.num_regs = ARRAY_SIZE(sl_usb_link_cmn_regs),
-};
-
-static const struct cdns_torrent_vals sl_usb_xcvr_diag_ln_vals = {
-	.reg_pairs = sl_usb_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(sl_usb_xcvr_diag_ln_regs),
-};
-
-/* USB PHY PCS common configuration */
-static const struct cdns_reg_pairs usb_phy_pcs_cmn_regs[] = {
-	{0x0A0A, PHY_PIPE_USB3_GEN2_PRE_CFG0},
-	{0x1000, PHY_PIPE_USB3_GEN2_POST_CFG0},
-	{0x0010, PHY_PIPE_USB3_GEN2_POST_CFG1}
-};
-
-static const struct cdns_torrent_vals usb_phy_pcs_cmn_vals = {
-	.reg_pairs = usb_phy_pcs_cmn_regs,
-	.num_regs = ARRAY_SIZE(usb_phy_pcs_cmn_regs),
-};
-
-/* USB 100 MHz Ref clk, no SSC */
-static const struct cdns_reg_pairs sl_usb_100_no_ssc_cmn_regs[] = {
-	{0x0028, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x001E, CMN_PLL1_DSM_FBH_OVRD_M0},
-	{0x000C, CMN_PLL1_DSM_FBL_OVRD_M0},
-	{0x0003, CMN_PLL0_VCOCAL_TCTRL},
-	{0x0003, CMN_PLL1_VCOCAL_TCTRL},
-	{0x8200, CMN_CDIAG_CDB_PWRI_OVRD},
-	{0x8200, CMN_CDIAG_XCVRC_PWRI_OVRD}
-};
-
-static const struct cdns_torrent_vals sl_usb_100_no_ssc_cmn_vals = {
-	.reg_pairs = sl_usb_100_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(sl_usb_100_no_ssc_cmn_regs),
-};
-
-static const struct cdns_reg_pairs usb_100_no_ssc_cmn_regs[] = {
-	{0x8200, CMN_CDIAG_CDB_PWRI_OVRD},
-	{0x8200, CMN_CDIAG_XCVRC_PWRI_OVRD},
-	{0x007F, CMN_TXPUCAL_TUNE},
-	{0x007F, CMN_TXPDCAL_TUNE}
-};
-
-static const struct cdns_reg_pairs usb_100_no_ssc_tx_ln_regs[] = {
-	{0x02FF, TX_PSC_A0},
-	{0x06AF, TX_PSC_A1},
-	{0x06AE, TX_PSC_A2},
-	{0x06AE, TX_PSC_A3},
-	{0x2A82, TX_TXCC_CTRL},
-	{0x0014, TX_TXCC_CPOST_MULT_01},
-	{0x0003, XCVR_DIAG_PSC_OVRD}
-};
-
-static const struct cdns_reg_pairs usb_100_no_ssc_rx_ln_regs[] = {
-	{0x0D1D, RX_PSC_A0},
-	{0x0D1D, RX_PSC_A1},
-	{0x0D00, RX_PSC_A2},
-	{0x0500, RX_PSC_A3},
-	{0x0013, RX_SIGDET_HL_FILT_TMR},
-	{0x0000, RX_REE_GCSM1_CTRL},
-	{0x0C02, RX_REE_ATTEN_THR},
-	{0x0330, RX_REE_SMGM_CTRL1},
-	{0x0300, RX_REE_SMGM_CTRL2},
-	{0x0000, RX_REE_PEAK_UTHR},
-	{0x01F5, RX_REE_PEAK_LTHR},
-	{0x0019, RX_REE_TAP1_CLIP},
-	{0x0019, RX_REE_TAP2TON_CLIP},
-	{0x1004, RX_DIAG_SIGDET_TUNE},
-	{0x00F9, RX_DIAG_NQST_CTRL},
-	{0x0C01, RX_DIAG_DFE_AMP_TUNE_2},
-	{0x0002, RX_DIAG_DFE_AMP_TUNE_3},
-	{0x0000, RX_DIAG_PI_CAP},
-	{0x0031, RX_DIAG_PI_RATE},
-	{0x0001, RX_DIAG_ACYA},
-	{0x018C, RX_CDRLF_CNFG},
-	{0x0003, RX_CDRLF_CNFG3}
-};
-
-static const struct cdns_torrent_vals usb_100_no_ssc_cmn_vals = {
-	.reg_pairs = usb_100_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(usb_100_no_ssc_cmn_regs),
-};
-
-static const struct cdns_torrent_vals usb_100_no_ssc_tx_ln_vals = {
-	.reg_pairs = usb_100_no_ssc_tx_ln_regs,
-	.num_regs = ARRAY_SIZE(usb_100_no_ssc_tx_ln_regs),
-};
-
-static const struct cdns_torrent_vals usb_100_no_ssc_rx_ln_vals = {
-	.reg_pairs = usb_100_no_ssc_rx_ln_regs,
-	.num_regs = ARRAY_SIZE(usb_100_no_ssc_rx_ln_regs),
-};
-
-/* Single link USB, 100 MHz Ref clk, internal SSC */
-static const struct cdns_reg_pairs sl_usb_100_int_ssc_cmn_regs[] = {
-	{0x0004, CMN_PLL0_DSM_DIAG_M0},
-	{0x0004, CMN_PLL1_DSM_DIAG_M0},
-	{0x0509, CMN_PDIAG_PLL0_CP_PADJ_M0},
-	{0x0509, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL0_CP_IADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL1_CP_IADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL0_FILT_PADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL1_FILT_PADJ_M0},
-	{0x0064, CMN_PLL0_INTDIV_M0},
-	{0x0064, CMN_PLL1_INTDIV_M0},
-	{0x0002, CMN_PLL0_FRACDIVH_M0},
-	{0x0002, CMN_PLL1_FRACDIVH_M0},
-	{0x0044, CMN_PLL0_HIGH_THR_M0},
-	{0x0044, CMN_PLL1_HIGH_THR_M0},
-	{0x0002, CMN_PDIAG_PLL0_CTRL_M0},
-	{0x0002, CMN_PDIAG_PLL1_CTRL_M0},
-	{0x0001, CMN_PLL0_SS_CTRL1_M0},
-	{0x0001, CMN_PLL1_SS_CTRL1_M0},
-	{0x011B, CMN_PLL0_SS_CTRL2_M0},
-	{0x011B, CMN_PLL1_SS_CTRL2_M0},
-	{0x006E, CMN_PLL0_SS_CTRL3_M0},
-	{0x006E, CMN_PLL1_SS_CTRL3_M0},
-	{0x000E, CMN_PLL0_SS_CTRL4_M0},
-	{0x000E, CMN_PLL1_SS_CTRL4_M0},
-	{0x0C5E, CMN_PLL0_VCOCAL_REFTIM_START},
-	{0x0C5E, CMN_PLL1_VCOCAL_REFTIM_START},
-	{0x0C56, CMN_PLL0_VCOCAL_PLLCNT_START},
-	{0x0C56, CMN_PLL1_VCOCAL_PLLCNT_START},
-	{0x0003, CMN_PLL0_VCOCAL_TCTRL},
-	{0x0003, CMN_PLL1_VCOCAL_TCTRL},
-	{0x00C7, CMN_PLL0_LOCK_REFCNT_START},
-	{0x00C7, CMN_PLL1_LOCK_REFCNT_START},
-	{0x00C7, CMN_PLL0_LOCK_PLLCNT_START},
-	{0x00C7, CMN_PLL1_LOCK_PLLCNT_START},
-	{0x0005, CMN_PLL0_LOCK_PLLCNT_THR},
-	{0x0005, CMN_PLL1_LOCK_PLLCNT_THR},
-	{0x8200, CMN_CDIAG_CDB_PWRI_OVRD},
-	{0x8200, CMN_CDIAG_XCVRC_PWRI_OVRD}
-};
-
-static const struct cdns_torrent_vals sl_usb_100_int_ssc_cmn_vals = {
-	.reg_pairs = sl_usb_100_int_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(sl_usb_100_int_ssc_cmn_regs),
-};
-
-/* PCIe and SGMII/QSGMII Unique SSC link configuration */
-static const struct cdns_reg_pairs pcie_sgmii_link_cmn_regs[] = {
-	{0x0003, PHY_PLL_CFG},
-	{0x0601, CMN_PDIAG_PLL0_CLK_SEL_M0},
-	{0x0400, CMN_PDIAG_PLL0_CLK_SEL_M1},
-	{0x0601, CMN_PDIAG_PLL1_CLK_SEL_M0}
-};
-
-static const struct cdns_reg_pairs pcie_sgmii_xcvr_diag_ln_regs[] = {
-	{0x0000, XCVR_DIAG_HSCLK_SEL},
-	{0x0001, XCVR_DIAG_HSCLK_DIV},
-	{0x0012, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_reg_pairs sgmii_pcie_xcvr_diag_ln_regs[] = {
-	{0x0011, XCVR_DIAG_HSCLK_SEL},
-	{0x0003, XCVR_DIAG_HSCLK_DIV},
-	{0x009B, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_torrent_vals pcie_sgmii_link_cmn_vals = {
-	.reg_pairs = pcie_sgmii_link_cmn_regs,
-	.num_regs = ARRAY_SIZE(pcie_sgmii_link_cmn_regs),
-};
-
-static const struct cdns_torrent_vals pcie_sgmii_xcvr_diag_ln_vals = {
-	.reg_pairs = pcie_sgmii_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(pcie_sgmii_xcvr_diag_ln_regs),
-};
-
-static const struct cdns_torrent_vals sgmii_pcie_xcvr_diag_ln_vals = {
-	.reg_pairs = sgmii_pcie_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(sgmii_pcie_xcvr_diag_ln_regs),
-};
-
-/* SGMII 100 MHz Ref clk, no SSC */
-static const struct cdns_reg_pairs sl_sgmii_100_no_ssc_cmn_regs[] = {
-	{0x0028, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x001E, CMN_PLL1_DSM_FBH_OVRD_M0},
-	{0x000C, CMN_PLL1_DSM_FBL_OVRD_M0},
-	{0x0003, CMN_PLL0_VCOCAL_TCTRL},
-	{0x0003, CMN_PLL1_VCOCAL_TCTRL}
-};
-
-static const struct cdns_torrent_vals sl_sgmii_100_no_ssc_cmn_vals = {
-	.reg_pairs = sl_sgmii_100_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(sl_sgmii_100_no_ssc_cmn_regs),
-};
-
-static const struct cdns_reg_pairs sgmii_100_no_ssc_cmn_regs[] = {
-	{0x007F, CMN_TXPUCAL_TUNE},
-	{0x007F, CMN_TXPDCAL_TUNE}
-};
-
-static const struct cdns_reg_pairs sgmii_100_no_ssc_tx_ln_regs[] = {
-	{0x00F3, TX_PSC_A0},
-	{0x04A2, TX_PSC_A2},
-	{0x04A2, TX_PSC_A3},
-	{0x0000, TX_TXCC_CPOST_MULT_00},
-	{0x00B3, DRV_DIAG_TX_DRV},
-	{0x0002, XCVR_DIAG_PSC_OVRD}
-};
-
-static const struct cdns_reg_pairs ti_sgmii_100_no_ssc_tx_ln_regs[] = {
-	{0x00F3, TX_PSC_A0},
-	{0x04A2, TX_PSC_A2},
-	{0x04A2, TX_PSC_A3},
-	{0x0000, TX_TXCC_CPOST_MULT_00},
-	{0x00B3, DRV_DIAG_TX_DRV},
-	{0x0002, XCVR_DIAG_PSC_OVRD},
-	{0x4000, XCVR_DIAG_RXCLK_CTRL}
-};
-
-static const struct cdns_reg_pairs sgmii_100_no_ssc_rx_ln_regs[] = {
-	{0x091D, RX_PSC_A0},
-	{0x0900, RX_PSC_A2},
-	{0x0100, RX_PSC_A3},
-	{0x03C7, RX_REE_GCSM1_EQENM_PH1},
-	{0x01C7, RX_REE_GCSM1_EQENM_PH2},
-	{0x0000, RX_DIAG_DFE_CTRL},
-	{0x0019, RX_REE_TAP1_CLIP},
-	{0x0019, RX_REE_TAP2TON_CLIP},
-	{0x0098, RX_DIAG_NQST_CTRL},
-	{0x0C01, RX_DIAG_DFE_AMP_TUNE_2},
-	{0x0000, RX_DIAG_DFE_AMP_TUNE_3},
-	{0x0000, RX_DIAG_PI_CAP},
-	{0x0010, RX_DIAG_PI_RATE},
-	{0x0001, RX_DIAG_ACYA},
-	{0x018C, RX_CDRLF_CNFG},
-};
-
-static const struct cdns_torrent_vals sgmii_100_no_ssc_cmn_vals = {
-	.reg_pairs = sgmii_100_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(sgmii_100_no_ssc_cmn_regs),
-};
-
-static const struct cdns_torrent_vals sgmii_100_no_ssc_tx_ln_vals = {
-	.reg_pairs = sgmii_100_no_ssc_tx_ln_regs,
-	.num_regs = ARRAY_SIZE(sgmii_100_no_ssc_tx_ln_regs),
-};
-
-static const struct cdns_torrent_vals ti_sgmii_100_no_ssc_tx_ln_vals = {
-	.reg_pairs = ti_sgmii_100_no_ssc_tx_ln_regs,
-	.num_regs = ARRAY_SIZE(ti_sgmii_100_no_ssc_tx_ln_regs),
-};
-
-static const struct cdns_torrent_vals sgmii_100_no_ssc_rx_ln_vals = {
-	.reg_pairs = sgmii_100_no_ssc_rx_ln_regs,
-	.num_regs = ARRAY_SIZE(sgmii_100_no_ssc_rx_ln_regs),
-};
-
-/* TI J7200, multilink SGMII */
-static const struct cdns_reg_pairs j7200_sgmii_100_no_ssc_tx_ln_regs[] = {
-	{0x07A2, TX_RCVDET_ST_TMR},
-	{0x00F3, TX_PSC_A0},
-	{0x04A2, TX_PSC_A2},
-	{0x04A2, TX_PSC_A3 },
-	{0x0000, TX_TXCC_CPOST_MULT_00},
-	{0x00B3, DRV_DIAG_TX_DRV},
-	{0x0002, XCVR_DIAG_PSC_OVRD},
-	{0x4000, XCVR_DIAG_RXCLK_CTRL}
-};
-
-static const struct cdns_torrent_vals j7200_sgmii_100_no_ssc_tx_ln_vals = {
-	.reg_pairs = j7200_sgmii_100_no_ssc_tx_ln_regs,
-	.num_regs = ARRAY_SIZE(j7200_sgmii_100_no_ssc_tx_ln_regs),
-};
-
-static const struct cdns_reg_pairs j7200_sgmii_100_no_ssc_rx_ln_regs[] = {
-	{0x0014, RX_SDCAL0_INIT_TMR},
-	{0x0062, RX_SDCAL0_ITER_TMR},
-	{0x0014, RX_SDCAL1_INIT_TMR},
-	{0x0062, RX_SDCAL1_ITER_TMR},
-	{0x091D, RX_PSC_A0},
-	{0x0900, RX_PSC_A2},
-	{0x0100, RX_PSC_A3},
-	{0x03C7, RX_REE_GCSM1_EQENM_PH1},
-	{0x01C7, RX_REE_GCSM1_EQENM_PH2},
-	{0x0000, RX_DIAG_DFE_CTRL},
-	{0x0019, RX_REE_TAP1_CLIP},
-	{0x0019, RX_REE_TAP2TON_CLIP},
-	{0x0098, RX_DIAG_NQST_CTRL},
-	{0x0C01, RX_DIAG_DFE_AMP_TUNE_2},
-	{0x0000, RX_DIAG_DFE_AMP_TUNE_3},
-	{0x0000, RX_DIAG_PI_CAP},
-	{0x0010, RX_DIAG_PI_RATE},
-	{0x0001, RX_DIAG_ACYA},
-	{0x018C, RX_CDRLF_CNFG}
-};
-
-static const struct cdns_torrent_vals j7200_sgmii_100_no_ssc_rx_ln_vals = {
-	.reg_pairs = j7200_sgmii_100_no_ssc_rx_ln_regs,
-	.num_regs = ARRAY_SIZE(j7200_sgmii_100_no_ssc_rx_ln_regs),
-};
-
-/* SGMII 100 MHz Ref clk, internal SSC */
-static const struct cdns_reg_pairs sgmii_100_int_ssc_cmn_regs[] = {
-	{0x0004, CMN_PLL0_DSM_DIAG_M0},
-	{0x0004, CMN_PLL0_DSM_DIAG_M1},
-	{0x0004, CMN_PLL1_DSM_DIAG_M0},
-	{0x0509, CMN_PDIAG_PLL0_CP_PADJ_M0},
-	{0x0509, CMN_PDIAG_PLL0_CP_PADJ_M1},
-	{0x0509, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL0_CP_IADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL0_CP_IADJ_M1},
-	{0x0F00, CMN_PDIAG_PLL1_CP_IADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL0_FILT_PADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL0_FILT_PADJ_M1},
-	{0x0F08, CMN_PDIAG_PLL1_FILT_PADJ_M0},
-	{0x0064, CMN_PLL0_INTDIV_M0},
-	{0x0050, CMN_PLL0_INTDIV_M1},
-	{0x0064, CMN_PLL1_INTDIV_M0},
-	{0x0002, CMN_PLL0_FRACDIVH_M0},
-	{0x0002, CMN_PLL0_FRACDIVH_M1},
-	{0x0002, CMN_PLL1_FRACDIVH_M0},
-	{0x0044, CMN_PLL0_HIGH_THR_M0},
-	{0x0036, CMN_PLL0_HIGH_THR_M1},
-	{0x0044, CMN_PLL1_HIGH_THR_M0},
-	{0x0002, CMN_PDIAG_PLL0_CTRL_M0},
-	{0x0002, CMN_PDIAG_PLL0_CTRL_M1},
-	{0x0002, CMN_PDIAG_PLL1_CTRL_M0},
-	{0x0001, CMN_PLL0_SS_CTRL1_M0},
-	{0x0001, CMN_PLL0_SS_CTRL1_M1},
-	{0x0001, CMN_PLL1_SS_CTRL1_M0},
-	{0x011B, CMN_PLL0_SS_CTRL2_M0},
-	{0x011B, CMN_PLL0_SS_CTRL2_M1},
-	{0x011B, CMN_PLL1_SS_CTRL2_M0},
-	{0x006E, CMN_PLL0_SS_CTRL3_M0},
-	{0x0058, CMN_PLL0_SS_CTRL3_M1},
-	{0x006E, CMN_PLL1_SS_CTRL3_M0},
-	{0x000E, CMN_PLL0_SS_CTRL4_M0},
-	{0x0012, CMN_PLL0_SS_CTRL4_M1},
-	{0x000E, CMN_PLL1_SS_CTRL4_M0},
-	{0x0C5E, CMN_PLL0_VCOCAL_REFTIM_START},
-	{0x0C5E, CMN_PLL1_VCOCAL_REFTIM_START},
-	{0x0C56, CMN_PLL0_VCOCAL_PLLCNT_START},
-	{0x0C56, CMN_PLL1_VCOCAL_PLLCNT_START},
-	{0x00C7, CMN_PLL0_LOCK_REFCNT_START},
-	{0x00C7, CMN_PLL1_LOCK_REFCNT_START},
-	{0x00C7, CMN_PLL0_LOCK_PLLCNT_START},
-	{0x00C7, CMN_PLL1_LOCK_PLLCNT_START},
-	{0x0005, CMN_PLL0_LOCK_PLLCNT_THR},
-	{0x0005, CMN_PLL1_LOCK_PLLCNT_THR},
-	{0x007F, CMN_TXPUCAL_TUNE},
-	{0x007F, CMN_TXPDCAL_TUNE}
-};
-
-static const struct cdns_torrent_vals sgmii_100_int_ssc_cmn_vals = {
-	.reg_pairs = sgmii_100_int_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(sgmii_100_int_ssc_cmn_regs),
-};
-
-/* QSGMII 100 MHz Ref clk, no SSC */
-static const struct cdns_reg_pairs sl_qsgmii_100_no_ssc_cmn_regs[] = {
-	{0x0028, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x001E, CMN_PLL1_DSM_FBH_OVRD_M0},
-	{0x000C, CMN_PLL1_DSM_FBL_OVRD_M0},
-	{0x0003, CMN_PLL0_VCOCAL_TCTRL},
-	{0x0003, CMN_PLL1_VCOCAL_TCTRL}
-};
-
-static const struct cdns_torrent_vals sl_qsgmii_100_no_ssc_cmn_vals = {
-	.reg_pairs = sl_qsgmii_100_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(sl_qsgmii_100_no_ssc_cmn_regs),
-};
-
-static const struct cdns_reg_pairs qsgmii_100_no_ssc_cmn_regs[] = {
-	{0x007F, CMN_TXPUCAL_TUNE},
-	{0x007F, CMN_TXPDCAL_TUNE}
-};
-
-static const struct cdns_reg_pairs qsgmii_100_no_ssc_tx_ln_regs[] = {
-	{0x00F3, TX_PSC_A0},
-	{0x04A2, TX_PSC_A2},
-	{0x04A2, TX_PSC_A3},
-	{0x0000, TX_TXCC_CPOST_MULT_00},
-	{0x0011, TX_TXCC_MGNFS_MULT_100},
-	{0x0003, DRV_DIAG_TX_DRV},
-	{0x0002, XCVR_DIAG_PSC_OVRD}
-};
-
-static const struct cdns_reg_pairs ti_qsgmii_100_no_ssc_tx_ln_regs[] = {
-	{0x00F3, TX_PSC_A0},
-	{0x04A2, TX_PSC_A2},
-	{0x04A2, TX_PSC_A3},
-	{0x0000, TX_TXCC_CPOST_MULT_00},
-	{0x0011, TX_TXCC_MGNFS_MULT_100},
-	{0x0003, DRV_DIAG_TX_DRV},
-	{0x0002, XCVR_DIAG_PSC_OVRD},
-	{0x4000, XCVR_DIAG_RXCLK_CTRL}
-};
-
-static const struct cdns_reg_pairs qsgmii_100_no_ssc_rx_ln_regs[] = {
-	{0x091D, RX_PSC_A0},
-	{0x0900, RX_PSC_A2},
-	{0x0100, RX_PSC_A3},
-	{0x03C7, RX_REE_GCSM1_EQENM_PH1},
-	{0x01C7, RX_REE_GCSM1_EQENM_PH2},
-	{0x0000, RX_DIAG_DFE_CTRL},
-	{0x0019, RX_REE_TAP1_CLIP},
-	{0x0019, RX_REE_TAP2TON_CLIP},
-	{0x0098, RX_DIAG_NQST_CTRL},
-	{0x0C01, RX_DIAG_DFE_AMP_TUNE_2},
-	{0x0000, RX_DIAG_DFE_AMP_TUNE_3},
-	{0x0000, RX_DIAG_PI_CAP},
-	{0x0010, RX_DIAG_PI_RATE},
-	{0x0001, RX_DIAG_ACYA},
-	{0x018C, RX_CDRLF_CNFG},
-};
-
-static const struct cdns_torrent_vals qsgmii_100_no_ssc_cmn_vals = {
-	.reg_pairs = qsgmii_100_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(qsgmii_100_no_ssc_cmn_regs),
-};
-
-static const struct cdns_torrent_vals qsgmii_100_no_ssc_tx_ln_vals = {
-	.reg_pairs = qsgmii_100_no_ssc_tx_ln_regs,
-	.num_regs = ARRAY_SIZE(qsgmii_100_no_ssc_tx_ln_regs),
-};
-
-static const struct cdns_torrent_vals ti_qsgmii_100_no_ssc_tx_ln_vals = {
-	.reg_pairs = ti_qsgmii_100_no_ssc_tx_ln_regs,
-	.num_regs = ARRAY_SIZE(ti_qsgmii_100_no_ssc_tx_ln_regs),
-};
-
-static const struct cdns_torrent_vals qsgmii_100_no_ssc_rx_ln_vals = {
-	.reg_pairs = qsgmii_100_no_ssc_rx_ln_regs,
-	.num_regs = ARRAY_SIZE(qsgmii_100_no_ssc_rx_ln_regs),
-};
-
-/* TI J7200, multilink QSGMII */
-static const struct cdns_reg_pairs j7200_qsgmii_100_no_ssc_tx_ln_regs[] = {
-	{0x07A2, TX_RCVDET_ST_TMR},
-	{0x00F3, TX_PSC_A0},
-	{0x04A2, TX_PSC_A2},
-	{0x04A2, TX_PSC_A3 },
-	{0x0000, TX_TXCC_CPOST_MULT_00},
-	{0x0011, TX_TXCC_MGNFS_MULT_100},
-	{0x0003, DRV_DIAG_TX_DRV},
-	{0x0002, XCVR_DIAG_PSC_OVRD},
-	{0x4000, XCVR_DIAG_RXCLK_CTRL}
-};
-
-static const struct cdns_torrent_vals j7200_qsgmii_100_no_ssc_tx_ln_vals = {
-	.reg_pairs = j7200_qsgmii_100_no_ssc_tx_ln_regs,
-	.num_regs = ARRAY_SIZE(j7200_qsgmii_100_no_ssc_tx_ln_regs),
-};
-
-static const struct cdns_reg_pairs j7200_qsgmii_100_no_ssc_rx_ln_regs[] = {
-	{0x0014, RX_SDCAL0_INIT_TMR},
-	{0x0062, RX_SDCAL0_ITER_TMR},
-	{0x0014, RX_SDCAL1_INIT_TMR},
-	{0x0062, RX_SDCAL1_ITER_TMR},
-	{0x091D, RX_PSC_A0},
-	{0x0900, RX_PSC_A2},
-	{0x0100, RX_PSC_A3},
-	{0x03C7, RX_REE_GCSM1_EQENM_PH1},
-	{0x01C7, RX_REE_GCSM1_EQENM_PH2},
-	{0x0000, RX_DIAG_DFE_CTRL},
-	{0x0019, RX_REE_TAP1_CLIP},
-	{0x0019, RX_REE_TAP2TON_CLIP},
-	{0x0098, RX_DIAG_NQST_CTRL},
-	{0x0C01, RX_DIAG_DFE_AMP_TUNE_2},
-	{0x0000, RX_DIAG_DFE_AMP_TUNE_3},
-	{0x0000, RX_DIAG_PI_CAP},
-	{0x0010, RX_DIAG_PI_RATE},
-	{0x0001, RX_DIAG_ACYA},
-	{0x018C, RX_CDRLF_CNFG}
-};
-
-static const struct cdns_torrent_vals j7200_qsgmii_100_no_ssc_rx_ln_vals = {
-	.reg_pairs = j7200_qsgmii_100_no_ssc_rx_ln_regs,
-	.num_regs = ARRAY_SIZE(j7200_qsgmii_100_no_ssc_rx_ln_regs),
-};
-
-/* QSGMII 100 MHz Ref clk, internal SSC */
-static const struct cdns_reg_pairs qsgmii_100_int_ssc_cmn_regs[] = {
-	{0x0004, CMN_PLL0_DSM_DIAG_M0},
-	{0x0004, CMN_PLL0_DSM_DIAG_M1},
-	{0x0004, CMN_PLL1_DSM_DIAG_M0},
-	{0x0509, CMN_PDIAG_PLL0_CP_PADJ_M0},
-	{0x0509, CMN_PDIAG_PLL0_CP_PADJ_M1},
-	{0x0509, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL0_CP_IADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL0_CP_IADJ_M1},
-	{0x0F00, CMN_PDIAG_PLL1_CP_IADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL0_FILT_PADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL0_FILT_PADJ_M1},
-	{0x0F08, CMN_PDIAG_PLL1_FILT_PADJ_M0},
-	{0x0064, CMN_PLL0_INTDIV_M0},
-	{0x0050, CMN_PLL0_INTDIV_M1},
-	{0x0064, CMN_PLL1_INTDIV_M0},
-	{0x0002, CMN_PLL0_FRACDIVH_M0},
-	{0x0002, CMN_PLL0_FRACDIVH_M1},
-	{0x0002, CMN_PLL1_FRACDIVH_M0},
-	{0x0044, CMN_PLL0_HIGH_THR_M0},
-	{0x0036, CMN_PLL0_HIGH_THR_M1},
-	{0x0044, CMN_PLL1_HIGH_THR_M0},
-	{0x0002, CMN_PDIAG_PLL0_CTRL_M0},
-	{0x0002, CMN_PDIAG_PLL0_CTRL_M1},
-	{0x0002, CMN_PDIAG_PLL1_CTRL_M0},
-	{0x0001, CMN_PLL0_SS_CTRL1_M0},
-	{0x0001, CMN_PLL0_SS_CTRL1_M1},
-	{0x0001, CMN_PLL1_SS_CTRL1_M0},
-	{0x011B, CMN_PLL0_SS_CTRL2_M0},
-	{0x011B, CMN_PLL0_SS_CTRL2_M1},
-	{0x011B, CMN_PLL1_SS_CTRL2_M0},
-	{0x006E, CMN_PLL0_SS_CTRL3_M0},
-	{0x0058, CMN_PLL0_SS_CTRL3_M1},
-	{0x006E, CMN_PLL1_SS_CTRL3_M0},
-	{0x000E, CMN_PLL0_SS_CTRL4_M0},
-	{0x0012, CMN_PLL0_SS_CTRL4_M1},
-	{0x000E, CMN_PLL1_SS_CTRL4_M0},
-	{0x0C5E, CMN_PLL0_VCOCAL_REFTIM_START},
-	{0x0C5E, CMN_PLL1_VCOCAL_REFTIM_START},
-	{0x0C56, CMN_PLL0_VCOCAL_PLLCNT_START},
-	{0x0C56, CMN_PLL1_VCOCAL_PLLCNT_START},
-	{0x00C7, CMN_PLL0_LOCK_REFCNT_START},
-	{0x00C7, CMN_PLL1_LOCK_REFCNT_START},
-	{0x00C7, CMN_PLL0_LOCK_PLLCNT_START},
-	{0x00C7, CMN_PLL1_LOCK_PLLCNT_START},
-	{0x0005, CMN_PLL0_LOCK_PLLCNT_THR},
-	{0x0005, CMN_PLL1_LOCK_PLLCNT_THR},
-	{0x007F, CMN_TXPUCAL_TUNE},
-	{0x007F, CMN_TXPDCAL_TUNE}
-};
-
-static const struct cdns_torrent_vals qsgmii_100_int_ssc_cmn_vals = {
-	.reg_pairs = qsgmii_100_int_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(qsgmii_100_int_ssc_cmn_regs),
-};
-
-/* Single SGMII/QSGMII link configuration */
-static const struct cdns_reg_pairs sl_sgmii_link_cmn_regs[] = {
-	{0x0000, PHY_PLL_CFG},
-	{0x0601, CMN_PDIAG_PLL0_CLK_SEL_M0}
-};
-
-static const struct cdns_reg_pairs sl_sgmii_xcvr_diag_ln_regs[] = {
-	{0x0000, XCVR_DIAG_HSCLK_SEL},
-	{0x0003, XCVR_DIAG_HSCLK_DIV},
-	{0x0013, XCVR_DIAG_PLLDRC_CTRL}
-};
-
-static const struct cdns_torrent_vals sl_sgmii_link_cmn_vals = {
-	.reg_pairs = sl_sgmii_link_cmn_regs,
-	.num_regs = ARRAY_SIZE(sl_sgmii_link_cmn_regs),
-};
-
-static const struct cdns_torrent_vals sl_sgmii_xcvr_diag_ln_vals = {
-	.reg_pairs = sl_sgmii_xcvr_diag_ln_regs,
-	.num_regs = ARRAY_SIZE(sl_sgmii_xcvr_diag_ln_regs),
-};
-
-/* For PCIe (with some other protocol), 100 MHz Ref clk, internal SSC */
-static const struct cdns_reg_pairs pcie_100_int_ssc_cmn_regs[] = {
-	{0x0004, CMN_PLL0_DSM_DIAG_M0},
-	{0x0004, CMN_PLL0_DSM_DIAG_M1},
-	{0x0004, CMN_PLL1_DSM_DIAG_M0},
-	{0x0509, CMN_PDIAG_PLL0_CP_PADJ_M0},
-	{0x0509, CMN_PDIAG_PLL0_CP_PADJ_M1},
-	{0x0509, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL0_CP_IADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL0_CP_IADJ_M1},
-	{0x0F00, CMN_PDIAG_PLL1_CP_IADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL0_FILT_PADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL0_FILT_PADJ_M1},
-	{0x0F08, CMN_PDIAG_PLL1_FILT_PADJ_M0},
-	{0x0064, CMN_PLL0_INTDIV_M0},
-	{0x0050, CMN_PLL0_INTDIV_M1},
-	{0x0064, CMN_PLL1_INTDIV_M0},
-	{0x0002, CMN_PLL0_FRACDIVH_M0},
-	{0x0002, CMN_PLL0_FRACDIVH_M1},
-	{0x0002, CMN_PLL1_FRACDIVH_M0},
-	{0x0044, CMN_PLL0_HIGH_THR_M0},
-	{0x0036, CMN_PLL0_HIGH_THR_M1},
-	{0x0044, CMN_PLL1_HIGH_THR_M0},
-	{0x0002, CMN_PDIAG_PLL0_CTRL_M0},
-	{0x0002, CMN_PDIAG_PLL0_CTRL_M1},
-	{0x0002, CMN_PDIAG_PLL1_CTRL_M0},
-	{0x0001, CMN_PLL0_SS_CTRL1_M0},
-	{0x0001, CMN_PLL0_SS_CTRL1_M1},
-	{0x0001, CMN_PLL1_SS_CTRL1_M0},
-	{0x011B, CMN_PLL0_SS_CTRL2_M0},
-	{0x011B, CMN_PLL0_SS_CTRL2_M1},
-	{0x011B, CMN_PLL1_SS_CTRL2_M0},
-	{0x006E, CMN_PLL0_SS_CTRL3_M0},
-	{0x0058, CMN_PLL0_SS_CTRL3_M1},
-	{0x006E, CMN_PLL1_SS_CTRL3_M0},
-	{0x000E, CMN_PLL0_SS_CTRL4_M0},
-	{0x0012, CMN_PLL0_SS_CTRL4_M1},
-	{0x000E, CMN_PLL1_SS_CTRL4_M0},
-	{0x0C5E, CMN_PLL0_VCOCAL_REFTIM_START},
-	{0x0C5E, CMN_PLL1_VCOCAL_REFTIM_START},
-	{0x0C56, CMN_PLL0_VCOCAL_PLLCNT_START},
-	{0x0C56, CMN_PLL1_VCOCAL_PLLCNT_START},
-	{0x00C7, CMN_PLL0_LOCK_REFCNT_START},
-	{0x00C7, CMN_PLL1_LOCK_REFCNT_START},
-	{0x00C7, CMN_PLL0_LOCK_PLLCNT_START},
-	{0x00C7, CMN_PLL1_LOCK_PLLCNT_START},
-	{0x0005, CMN_PLL0_LOCK_PLLCNT_THR},
-	{0x0005, CMN_PLL1_LOCK_PLLCNT_THR}
-};
-
-static const struct cdns_torrent_vals pcie_100_int_ssc_cmn_vals = {
-	.reg_pairs = pcie_100_int_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(pcie_100_int_ssc_cmn_regs),
-};
-
-/* Single link PCIe, 100 MHz Ref clk, internal SSC */
-static const struct cdns_reg_pairs sl_pcie_100_int_ssc_cmn_regs[] = {
-	{0x0004, CMN_PLL0_DSM_DIAG_M0},
-	{0x0004, CMN_PLL0_DSM_DIAG_M1},
-	{0x0004, CMN_PLL1_DSM_DIAG_M0},
-	{0x0509, CMN_PDIAG_PLL0_CP_PADJ_M0},
-	{0x0509, CMN_PDIAG_PLL0_CP_PADJ_M1},
-	{0x0509, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL0_CP_IADJ_M0},
-	{0x0F00, CMN_PDIAG_PLL0_CP_IADJ_M1},
-	{0x0F00, CMN_PDIAG_PLL1_CP_IADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL0_FILT_PADJ_M0},
-	{0x0F08, CMN_PDIAG_PLL0_FILT_PADJ_M1},
-	{0x0F08, CMN_PDIAG_PLL1_FILT_PADJ_M0},
-	{0x0064, CMN_PLL0_INTDIV_M0},
-	{0x0050, CMN_PLL0_INTDIV_M1},
-	{0x0050, CMN_PLL1_INTDIV_M0},
-	{0x0002, CMN_PLL0_FRACDIVH_M0},
-	{0x0002, CMN_PLL0_FRACDIVH_M1},
-	{0x0002, CMN_PLL1_FRACDIVH_M0},
-	{0x0044, CMN_PLL0_HIGH_THR_M0},
-	{0x0036, CMN_PLL0_HIGH_THR_M1},
-	{0x0036, CMN_PLL1_HIGH_THR_M0},
-	{0x0002, CMN_PDIAG_PLL0_CTRL_M0},
-	{0x0002, CMN_PDIAG_PLL0_CTRL_M1},
-	{0x0002, CMN_PDIAG_PLL1_CTRL_M0},
-	{0x0001, CMN_PLL0_SS_CTRL1_M0},
-	{0x0001, CMN_PLL0_SS_CTRL1_M1},
-	{0x0001, CMN_PLL1_SS_CTRL1_M0},
-	{0x011B, CMN_PLL0_SS_CTRL2_M0},
-	{0x011B, CMN_PLL0_SS_CTRL2_M1},
-	{0x011B, CMN_PLL1_SS_CTRL2_M0},
-	{0x006E, CMN_PLL0_SS_CTRL3_M0},
-	{0x0058, CMN_PLL0_SS_CTRL3_M1},
-	{0x0058, CMN_PLL1_SS_CTRL3_M0},
-	{0x000E, CMN_PLL0_SS_CTRL4_M0},
-	{0x0012, CMN_PLL0_SS_CTRL4_M1},
-	{0x0012, CMN_PLL1_SS_CTRL4_M0},
-	{0x0C5E, CMN_PLL0_VCOCAL_REFTIM_START},
-	{0x0C5E, CMN_PLL1_VCOCAL_REFTIM_START},
-	{0x0C56, CMN_PLL0_VCOCAL_PLLCNT_START},
-	{0x0C56, CMN_PLL1_VCOCAL_PLLCNT_START},
-	{0x00C7, CMN_PLL0_LOCK_REFCNT_START},
-	{0x00C7, CMN_PLL1_LOCK_REFCNT_START},
-	{0x00C7, CMN_PLL0_LOCK_PLLCNT_START},
-	{0x00C7, CMN_PLL1_LOCK_PLLCNT_START},
-	{0x0005, CMN_PLL0_LOCK_PLLCNT_THR},
-	{0x0005, CMN_PLL1_LOCK_PLLCNT_THR}
-};
-
-static const struct cdns_torrent_vals sl_pcie_100_int_ssc_cmn_vals = {
-	.reg_pairs = sl_pcie_100_int_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(sl_pcie_100_int_ssc_cmn_regs),
-};
-
-/* PCIe, 100 MHz Ref clk, no SSC & external SSC */
-static const struct cdns_reg_pairs pcie_100_ext_no_ssc_cmn_regs[] = {
-	{0x0028, CMN_PDIAG_PLL1_CP_PADJ_M0},
-	{0x001E, CMN_PLL1_DSM_FBH_OVRD_M0},
-	{0x000C, CMN_PLL1_DSM_FBL_OVRD_M0}
-};
-
-static const struct cdns_reg_pairs pcie_100_ext_no_ssc_rx_ln_regs[] = {
-	{0x0019, RX_REE_TAP1_CLIP},
-	{0x0019, RX_REE_TAP2TON_CLIP},
-	{0x0001, RX_DIAG_ACYA}
-};
-
-static const struct cdns_torrent_vals pcie_100_no_ssc_cmn_vals = {
-	.reg_pairs = pcie_100_ext_no_ssc_cmn_regs,
-	.num_regs = ARRAY_SIZE(pcie_100_ext_no_ssc_cmn_regs),
-};
-
-static const struct cdns_torrent_vals pcie_100_no_ssc_rx_ln_vals = {
-	.reg_pairs = pcie_100_ext_no_ssc_rx_ln_regs,
-	.num_regs = ARRAY_SIZE(pcie_100_ext_no_ssc_rx_ln_regs),
-};
-
-static const struct cdns_torrent_vals_entry link_cmn_vals_entries[] = {
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_DP, TYPE_NONE), &sl_dp_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_DP, TYPE_PCIE), &pcie_dp_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_DP, TYPE_USB), &usb_dp_link_cmn_vals},
-
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_NONE), NULL},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_PCIE), &ml_pcie_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_SGMII), &pcie_sgmii_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_QSGMII), &pcie_sgmii_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_USB), &pcie_usb_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_DP), &pcie_dp_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_USXGMII), &pcie_usxgmii_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_XAUI), &pcie_xaui_link_cmn_vals},
-
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE_ML, TYPE_USB), &ml_pcie_usb_link_cmn_vals},
-
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_SGMII, TYPE_NONE), &sl_sgmii_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_SGMII, TYPE_PCIE), &pcie_sgmii_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_SGMII, TYPE_QSGMII), &sgmii_qsgmii_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_SGMII, TYPE_USB), &usb_sgmii_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_SGMII, TYPE_USXGMII), &usxgmii_sgmii_link_cmn_vals},
-
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_QSGMII, TYPE_NONE), &sl_sgmii_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_QSGMII, TYPE_PCIE), &pcie_sgmii_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_QSGMII, TYPE_SGMII), &sgmii_qsgmii_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_QSGMII, TYPE_USB), &usb_sgmii_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_QSGMII, TYPE_USXGMII), &usxgmii_sgmii_link_cmn_vals},
-
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_NONE), &sl_usb_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_PCIE), &pcie_usb_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_PCIE_ML), &ml_pcie_usb_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_SGMII), &usb_sgmii_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_QSGMII), &usb_sgmii_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_DP), &usb_dp_link_cmn_vals},
-
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_NONE), &sl_usxgmii_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_PCIE), &pcie_usxgmii_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_SGMII), &usxgmii_sgmii_link_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_QSGMII), &usxgmii_sgmii_link_cmn_vals},
-
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_XAUI, TYPE_PCIE), &pcie_xaui_link_cmn_vals},
-};
-
-static const struct cdns_torrent_vals_entry xcvr_diag_vals_entries[] = {
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_DP, TYPE_NONE), &sl_dp_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_DP, TYPE_PCIE), &dp_pcie_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_DP, TYPE_USB), &dp_usb_xcvr_diag_ln_vals},
-
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_NONE), NULL},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_PCIE), &ml_pcie_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_SGMII), &pcie_sgmii_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_QSGMII), &pcie_sgmii_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_USB), &pcie_usb_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_DP), &pcie_dp_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_USXGMII), &pcie_usxgmii_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE, TYPE_XAUI), NULL},
-
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_PCIE_ML, TYPE_USB), &ml_pcie_usb_xcvr_diag_ln_vals},
-
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_SGMII, TYPE_NONE), &sl_sgmii_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_SGMII, TYPE_PCIE), &sgmii_pcie_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_SGMII, TYPE_QSGMII), &sgmii_qsgmii_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_SGMII, TYPE_USB), &sgmii_usb_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_SGMII, TYPE_USXGMII), &sgmii_usxgmii_xcvr_diag_ln_vals},
-
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_QSGMII, TYPE_NONE), &sl_sgmii_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_QSGMII, TYPE_PCIE), &sgmii_pcie_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_QSGMII, TYPE_SGMII), &sgmii_qsgmii_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_QSGMII, TYPE_USB), &sgmii_usb_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_QSGMII, TYPE_USXGMII), &sgmii_usxgmii_xcvr_diag_ln_vals},
-
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_NONE), &sl_usb_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_PCIE), &usb_pcie_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_PCIE_ML), &usb_ml_pcie_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_SGMII), &usb_sgmii_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_QSGMII), &usb_sgmii_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_DP), &usb_dp_xcvr_diag_ln_vals},
-
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_NONE), &sl_usxgmii_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_PCIE), &usxgmii_pcie_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_SGMII), &usxgmii_sgmii_xcvr_diag_ln_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_QSGMII), &usxgmii_sgmii_xcvr_diag_ln_vals},
-
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_XAUI, TYPE_PCIE), &xaui_pcie_xcvr_diag_ln_vals},
-};
-
-static const struct cdns_torrent_vals_entry pcs_cmn_vals_entries[] = {
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_NONE), &usb_phy_pcs_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_PCIE), &usb_phy_pcs_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_PCIE_ML), &usb_phy_pcs_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_SGMII), &usb_phy_pcs_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_QSGMII), &usb_phy_pcs_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USB, TYPE_DP), &usb_phy_pcs_cmn_vals},
-};
-
-static const struct cdns_torrent_vals_entry cmn_vals_entries[] = {
-	{CDNS_TORRENT_KEY(CLK_19_2_MHZ, CLK_19_2_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_19_2_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_25_MHZ, CLK_25_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_25_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_PCIE, NO_SSC), &dp_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_USB, NO_SSC), &sl_dp_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, INTERNAL_SSC), &sl_pcie_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, NO_SSC), &ml_pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, EXTERNAL_SSC), &ml_pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, INTERNAL_SSC), &ml_pcie_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, NO_SSC), &pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, EXTERNAL_SSC), &pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, INTERNAL_SSC), &pcie_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, NO_SSC), &pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, EXTERNAL_SSC), &pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, INTERNAL_SSC), &pcie_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, NO_SSC), &pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, EXTERNAL_SSC), &pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, INTERNAL_SSC), &pcie_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), &ml_pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), &ml_pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), &ml_pcie_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_NONE, NO_SSC), &sl_sgmii_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, NO_SSC), &sgmii_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, EXTERNAL_SSC), &sgmii_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, INTERNAL_SSC), &sgmii_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_QSGMII, NO_SSC), &sl_sgmii_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, NO_SSC), &sgmii_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, EXTERNAL_SSC), &sgmii_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, INTERNAL_SSC), &sgmii_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_NONE, NO_SSC), &sl_qsgmii_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, NO_SSC), &qsgmii_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, EXTERNAL_SSC), &qsgmii_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, INTERNAL_SSC), &qsgmii_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_SGMII, NO_SSC), &sl_qsgmii_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, NO_SSC), &qsgmii_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, EXTERNAL_SSC), &qsgmii_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, INTERNAL_SSC), &qsgmii_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, NO_SSC), &sl_usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, EXTERNAL_SSC), &sl_usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, INTERNAL_SSC), &sl_usb_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, NO_SSC), &usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, EXTERNAL_SSC), &usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, INTERNAL_SSC), &usb_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, NO_SSC), &usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, EXTERNAL_SSC), &usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, INTERNAL_SSC), &usb_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, NO_SSC), &sl_usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, EXTERNAL_SSC), &sl_usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, INTERNAL_SSC), &sl_usb_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, NO_SSC), &sl_usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, EXTERNAL_SSC), &sl_usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, INTERNAL_SSC), &sl_usb_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &xaui_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &sl_usxgmii_156_25_no_ssc_cmn_vals},
-
-	/* Dual refclk */
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_PCIE, TYPE_USXGMII, NO_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_SGMII, TYPE_USXGMII, NO_SSC), &ml_sgmii_pll1_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_QSGMII, TYPE_USXGMII, NO_SSC), &ml_sgmii_pll1_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_PCIE, NO_SSC), &ml_usxgmii_pll1_156_25_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_SGMII, NO_SSC), &ml_usxgmii_pll0_156_25_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_QSGMII, NO_SSC), &ml_usxgmii_pll0_156_25_no_ssc_cmn_vals},
-};
-
-static const struct cdns_torrent_vals_entry cdns_tx_ln_vals_entries[] = {
-	{CDNS_TORRENT_KEY(CLK_19_2_MHZ, CLK_19_2_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_19_2_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_25_MHZ, CLK_25_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_25_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_PCIE, NO_SSC), &dp_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_USB, NO_SSC), &dp_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_NONE, NO_SSC), &sgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, NO_SSC), &sgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, EXTERNAL_SSC), &sgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, INTERNAL_SSC), &sgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_QSGMII, NO_SSC), &sgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, NO_SSC), &sgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, EXTERNAL_SSC), &sgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, INTERNAL_SSC), &sgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_NONE, NO_SSC), &qsgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, NO_SSC), &qsgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, EXTERNAL_SSC), &qsgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, INTERNAL_SSC), &qsgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_SGMII, NO_SSC), &qsgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, NO_SSC), &qsgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, EXTERNAL_SSC), &qsgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, INTERNAL_SSC), &qsgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &xaui_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &usxgmii_156_25_no_ssc_tx_ln_vals},
-
-	/* Dual refclk */
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_PCIE, TYPE_USXGMII, NO_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_SGMII, TYPE_USXGMII, NO_SSC), &sgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_QSGMII, TYPE_USXGMII, NO_SSC), &qsgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_PCIE, NO_SSC), &ml_usxgmii_156_25_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_SGMII, NO_SSC), &ml_usxgmii_156_25_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_QSGMII, NO_SSC), &ml_usxgmii_156_25_no_ssc_tx_ln_vals},
-};
-
-static const struct cdns_torrent_vals_entry cdns_rx_ln_vals_entries[] = {
-	{CDNS_TORRENT_KEY(CLK_19_2_MHZ, CLK_19_2_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_19_2_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_25_MHZ, CLK_25_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_25_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_PCIE, NO_SSC), &dp_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_USB, NO_SSC), &dp_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, NO_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, EXTERNAL_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, INTERNAL_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), &ml_pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_NONE, NO_SSC), &sgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, NO_SSC), &sgmii_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, EXTERNAL_SSC), &sgmii_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, INTERNAL_SSC), &sgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_QSGMII, NO_SSC), &sgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, NO_SSC), &sgmii_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, EXTERNAL_SSC), &sgmii_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, INTERNAL_SSC), &sgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_NONE, NO_SSC), &qsgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, NO_SSC), &qsgmii_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, EXTERNAL_SSC), &qsgmii_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, INTERNAL_SSC), &qsgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_SGMII, NO_SSC), &qsgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, NO_SSC), &qsgmii_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, EXTERNAL_SSC), &qsgmii_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, INTERNAL_SSC), &qsgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, EXTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, INTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, EXTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, INTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, EXTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, INTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, EXTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, INTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, EXTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, INTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &xaui_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &usxgmii_156_25_no_ssc_rx_ln_vals},
-
-	/* Dual refclk */
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_PCIE, TYPE_USXGMII, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_SGMII, TYPE_USXGMII, NO_SSC), &sgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_QSGMII, TYPE_USXGMII, NO_SSC), &qsgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_PCIE, NO_SSC), &ml_usxgmii_156_25_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_SGMII, NO_SSC), &ml_usxgmii_156_25_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_QSGMII, NO_SSC), &ml_usxgmii_156_25_no_ssc_rx_ln_vals},
-};
-
-static const struct cdns_torrent_data cdns_map_torrent = {
+static const struct tp_init_data cdns_map_torrent = {
 	.block_offset_shift = 0x2,
 	.reg_offset_shift = 0x2,
-	.link_cmn_vals_tbl = {
-		.entries = link_cmn_vals_entries,
-		.num_entries = ARRAY_SIZE(link_cmn_vals_entries),
-	},
-	.xcvr_diag_vals_tbl = {
-		.entries = xcvr_diag_vals_entries,
-		.num_entries = ARRAY_SIZE(xcvr_diag_vals_entries),
-	},
-	.pcs_cmn_vals_tbl = {
-		.entries = pcs_cmn_vals_entries,
-		.num_entries = ARRAY_SIZE(pcs_cmn_vals_entries),
-	},
-	.cmn_vals_tbl = {
-		.entries = cmn_vals_entries,
-		.num_entries = ARRAY_SIZE(cmn_vals_entries),
-	},
-	.tx_ln_vals_tbl = {
-		.entries = cdns_tx_ln_vals_entries,
-		.num_entries = ARRAY_SIZE(cdns_tx_ln_vals_entries),
-	},
-	.rx_ln_vals_tbl = {
-		.entries = cdns_rx_ln_vals_entries,
-		.num_entries = ARRAY_SIZE(cdns_rx_ln_vals_entries),
-	},
+	.mask_available_lanes = 0x0F,
 };
 
-static const struct cdns_torrent_vals_entry j721e_phy_pma_cmn_vals_entries[] = {
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_NONE), &ti_usxgmii_phy_pma_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_PCIE), &ti_usxgmii_phy_pma_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_SGMII), &ti_usxgmii_phy_pma_cmn_vals},
-	{CDNS_TORRENT_KEY_ANYCLK(TYPE_USXGMII, TYPE_QSGMII), &ti_usxgmii_phy_pma_cmn_vals},
-};
-
-static const struct cdns_torrent_vals_entry ti_tx_ln_vals_entries[] = {
-	{CDNS_TORRENT_KEY(CLK_19_2_MHZ, CLK_19_2_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_19_2_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_25_MHZ, CLK_25_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_25_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_PCIE, NO_SSC), &dp_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_USB, NO_SSC), &dp_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_NONE, NO_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, NO_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, EXTERNAL_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, INTERNAL_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_QSGMII, NO_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, NO_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, EXTERNAL_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, INTERNAL_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_NONE, NO_SSC), &ti_qsgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, NO_SSC), &ti_qsgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, EXTERNAL_SSC), &ti_qsgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, INTERNAL_SSC), &ti_qsgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_SGMII, NO_SSC), &ti_qsgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, NO_SSC), &ti_qsgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, EXTERNAL_SSC), &ti_qsgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, INTERNAL_SSC), &ti_qsgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &ti_xaui_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &usxgmii_156_25_no_ssc_tx_ln_vals},
-
-	/* Dual refclk */
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_PCIE, TYPE_USXGMII, NO_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_SGMII, TYPE_USXGMII, NO_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_QSGMII, TYPE_USXGMII, NO_SSC), &ti_qsgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_PCIE, NO_SSC), &ml_usxgmii_156_25_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_SGMII, NO_SSC), &ml_usxgmii_156_25_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_QSGMII, NO_SSC), &ml_usxgmii_156_25_no_ssc_tx_ln_vals},
-};
-
-static const struct cdns_torrent_data ti_j721e_map_torrent = {
-	.block_offset_shift = 0x0,
-	.reg_offset_shift = 0x1,
-	.link_cmn_vals_tbl = {
-		.entries = link_cmn_vals_entries,
-		.num_entries = ARRAY_SIZE(link_cmn_vals_entries),
-	},
-	.xcvr_diag_vals_tbl = {
-		.entries = xcvr_diag_vals_entries,
-		.num_entries = ARRAY_SIZE(xcvr_diag_vals_entries),
-	},
-	.pcs_cmn_vals_tbl = {
-		.entries = pcs_cmn_vals_entries,
-		.num_entries = ARRAY_SIZE(pcs_cmn_vals_entries),
-	},
-	.phy_pma_cmn_vals_tbl = {
-		.entries = j721e_phy_pma_cmn_vals_entries,
-		.num_entries = ARRAY_SIZE(j721e_phy_pma_cmn_vals_entries),
-	},
-	.cmn_vals_tbl = {
-		.entries = cmn_vals_entries,
-		.num_entries = ARRAY_SIZE(cmn_vals_entries),
-	},
-	.tx_ln_vals_tbl = {
-		.entries = ti_tx_ln_vals_entries,
-		.num_entries = ARRAY_SIZE(ti_tx_ln_vals_entries),
-	},
-	.rx_ln_vals_tbl = {
-		.entries = cdns_rx_ln_vals_entries,
-		.num_entries = ARRAY_SIZE(cdns_rx_ln_vals_entries),
-	},
-};
-
-/* TI J7200 (Torrent SD0805) */
-static const struct cdns_torrent_vals_entry ti_j7200_cmn_vals_entries[] = {
-	{CDNS_TORRENT_KEY(CLK_19_2_MHZ, CLK_19_2_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_19_2_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_25_MHZ, CLK_25_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_25_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_PCIE, NO_SSC), &dp_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_USB, NO_SSC), &sl_dp_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, INTERNAL_SSC), &sl_pcie_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, NO_SSC), &ml_pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, EXTERNAL_SSC), &ml_pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, INTERNAL_SSC), &ml_pcie_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, NO_SSC), &pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, EXTERNAL_SSC), &pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, INTERNAL_SSC), &pcie_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, NO_SSC), &pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, EXTERNAL_SSC), &pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, INTERNAL_SSC), &pcie_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, NO_SSC), &pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, EXTERNAL_SSC), &pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, INTERNAL_SSC), &pcie_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), &ml_pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), &ml_pcie_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), &ml_pcie_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_NONE, NO_SSC), &sl_sgmii_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, NO_SSC), &sgmii_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, EXTERNAL_SSC), &sgmii_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, INTERNAL_SSC), &sgmii_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_QSGMII, NO_SSC), &sl_sgmii_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, NO_SSC), &sgmii_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, EXTERNAL_SSC), &sgmii_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, INTERNAL_SSC), &sgmii_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_NONE, NO_SSC), &sl_qsgmii_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, NO_SSC), &qsgmii_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, EXTERNAL_SSC), &qsgmii_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, INTERNAL_SSC), &qsgmii_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_SGMII, NO_SSC), &sl_qsgmii_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, NO_SSC), &qsgmii_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, EXTERNAL_SSC), &qsgmii_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, INTERNAL_SSC), &qsgmii_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, NO_SSC), &sl_usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, EXTERNAL_SSC), &sl_usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, INTERNAL_SSC), &sl_usb_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, NO_SSC), &usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, EXTERNAL_SSC), &usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, INTERNAL_SSC), &usb_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, NO_SSC), &usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, EXTERNAL_SSC), &usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, INTERNAL_SSC), &usb_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, NO_SSC), &sl_usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, EXTERNAL_SSC), &sl_usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, INTERNAL_SSC), &sl_usb_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, NO_SSC), &sl_usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, EXTERNAL_SSC), &sl_usb_100_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, INTERNAL_SSC), &sl_usb_100_int_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &xaui_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &sl_usxgmii_156_25_no_ssc_cmn_vals},
-
-	/* Dual refclk */
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_PCIE, TYPE_USXGMII, NO_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_SGMII, TYPE_USXGMII, NO_SSC), &j7200_ml_sgmii_pll1_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_QSGMII, TYPE_USXGMII, NO_SSC), &j7200_ml_sgmii_pll1_100_no_ssc_cmn_vals},
-
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_PCIE, NO_SSC), &ml_usxgmii_pll1_156_25_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_SGMII, NO_SSC), &j7200_ml_usxgmii_pll0_156_25_no_ssc_cmn_vals},
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_QSGMII, NO_SSC), &j7200_ml_usxgmii_pll0_156_25_no_ssc_cmn_vals},
-};
-
-static const struct cdns_torrent_vals_entry ti_j7200_tx_ln_vals_entries[] = {
-	{CDNS_TORRENT_KEY(CLK_19_2_MHZ, CLK_19_2_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_19_2_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_25_MHZ, CLK_25_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_25_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_PCIE, NO_SSC), &dp_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_USB, NO_SSC), &dp_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), NULL},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_NONE, NO_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, NO_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, EXTERNAL_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, INTERNAL_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_QSGMII, NO_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, NO_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, EXTERNAL_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, INTERNAL_SSC), &ti_sgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_NONE, NO_SSC), &ti_qsgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, NO_SSC), &ti_qsgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, EXTERNAL_SSC), &ti_qsgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, INTERNAL_SSC), &ti_qsgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_SGMII, NO_SSC), &ti_qsgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, NO_SSC), &ti_qsgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, EXTERNAL_SSC), &ti_qsgmii_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, INTERNAL_SSC), &ti_qsgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, EXTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, INTERNAL_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &ti_xaui_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &usxgmii_156_25_no_ssc_tx_ln_vals},
-
-	/* Dual refclk */
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_PCIE, TYPE_USXGMII, NO_SSC), NULL},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_SGMII, TYPE_USXGMII, NO_SSC), &j7200_sgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_QSGMII, TYPE_USXGMII, NO_SSC), &j7200_qsgmii_100_no_ssc_tx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_PCIE, NO_SSC), &ml_usxgmii_156_25_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_SGMII, NO_SSC), &usxgmii_156_25_no_ssc_tx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_QSGMII, NO_SSC), &usxgmii_156_25_no_ssc_tx_ln_vals},
-};
-
-static const struct cdns_torrent_vals_entry ti_j7200_rx_ln_vals_entries[] = {
-	{CDNS_TORRENT_KEY(CLK_19_2_MHZ, CLK_19_2_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_19_2_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_25_MHZ, CLK_25_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_25_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_NONE, NO_SSC), &sl_dp_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_PCIE, NO_SSC), &dp_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_DP, TYPE_USB, NO_SSC), &dp_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_NONE, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_PCIE, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_SGMII, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_QSGMII, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_USB, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_DP, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE, TYPE_XAUI, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, EXTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_PCIE_ML, TYPE_USB, INTERNAL_SSC), &pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_NONE, NO_SSC), &sgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, NO_SSC), &sgmii_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, EXTERNAL_SSC), &sgmii_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_PCIE, INTERNAL_SSC), &sgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_QSGMII, NO_SSC), &sgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, NO_SSC), &sgmii_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, EXTERNAL_SSC), &sgmii_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_SGMII, TYPE_USB, INTERNAL_SSC), &sgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_NONE, NO_SSC), &qsgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, NO_SSC), &qsgmii_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, EXTERNAL_SSC), &qsgmii_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_PCIE, INTERNAL_SSC), &qsgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_SGMII, NO_SSC), &qsgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, NO_SSC), &qsgmii_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, EXTERNAL_SSC), &qsgmii_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_QSGMII, TYPE_USB, INTERNAL_SSC), &qsgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, EXTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_NONE, INTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, EXTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE, INTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, EXTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_PCIE_ML, INTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, EXTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_SGMII, INTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, EXTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_QSGMII, INTERNAL_SSC), &usb_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_USB, TYPE_DP, NO_SSC), &usb_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_100_MHZ, TYPE_XAUI, TYPE_PCIE, NO_SSC), &xaui_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_156_25_MHZ, TYPE_USXGMII, TYPE_NONE, NO_SSC), &usxgmii_156_25_no_ssc_rx_ln_vals},
-
-	/* Dual refclk */
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_PCIE, TYPE_USXGMII, NO_SSC), &pcie_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_SGMII, TYPE_USXGMII, NO_SSC), &j7200_sgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_100_MHZ, CLK_156_25_MHZ, TYPE_QSGMII, TYPE_USXGMII, NO_SSC), &j7200_qsgmii_100_no_ssc_rx_ln_vals},
-
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_PCIE, NO_SSC), &ml_usxgmii_156_25_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_SGMII, NO_SSC), &usxgmii_156_25_no_ssc_rx_ln_vals},
-	{CDNS_TORRENT_KEY(CLK_156_25_MHZ, CLK_100_MHZ, TYPE_USXGMII, TYPE_QSGMII, NO_SSC), &usxgmii_156_25_no_ssc_rx_ln_vals},
-};
-
-static const struct cdns_torrent_data ti_j7200_map_torrent = {
+static const struct tp_init_data ti_j72xx_map_torrent = {
 	.block_offset_shift = 0x0,
 	.reg_offset_shift = 0x1,
-	.link_cmn_vals_tbl = {
-		.entries = link_cmn_vals_entries,
-		.num_entries = ARRAY_SIZE(link_cmn_vals_entries),
-	},
-	.xcvr_diag_vals_tbl = {
-		.entries = xcvr_diag_vals_entries,
-		.num_entries = ARRAY_SIZE(xcvr_diag_vals_entries),
-	},
-	.pcs_cmn_vals_tbl = {
-		.entries = pcs_cmn_vals_entries,
-		.num_entries = ARRAY_SIZE(pcs_cmn_vals_entries),
-	},
-	.phy_pma_cmn_vals_tbl = {
-		.entries = j721e_phy_pma_cmn_vals_entries,
-		.num_entries = ARRAY_SIZE(j721e_phy_pma_cmn_vals_entries),
-	},
-	.cmn_vals_tbl = {
-		.entries = ti_j7200_cmn_vals_entries,
-		.num_entries = ARRAY_SIZE(ti_j7200_cmn_vals_entries),
-	},
-	.tx_ln_vals_tbl = {
-		.entries = ti_j7200_tx_ln_vals_entries,
-		.num_entries = ARRAY_SIZE(ti_j7200_tx_ln_vals_entries),
-	},
-	.rx_ln_vals_tbl = {
-		.entries = ti_j7200_rx_ln_vals_entries,
-		.num_entries = ARRAY_SIZE(ti_j7200_rx_ln_vals_entries),
-	},
+	.mask_available_lanes = 0x0F,
+	.usxgmii_refclk_rcv_out_en = true,
+	.rxda_des_clk_2x_en = true,
 };
 
 static const struct of_device_id cdns_torrent_phy_of_match[] = {
@@ -5850,11 +5147,11 @@ static const struct of_device_id cdns_torrent_phy_of_match[] = {
 	},
 	{
 		.compatible = "ti,j721e-serdes-10g",
-		.data = &ti_j721e_map_torrent,
+		.data = &ti_j72xx_map_torrent,
 	},
 	{
 		.compatible = "ti,j7200-serdes-10g",
-		.data = &ti_j7200_map_torrent,
+		.data = &ti_j72xx_map_torrent,
 	},
 	{}
 };
@@ -5866,11 +5163,11 @@ static struct platform_driver cdns_torrent_phy_driver = {
 	.driver	= {
 		.name	= "cdns-torrent-phy",
 		.of_match_table	= cdns_torrent_phy_of_match,
-		.pm	= pm_sleep_ptr(&cdns_torrent_phy_pm_ops),
+		.pm	= pm_sleep_ptr(&tp_pm_ops),
 	}
 };
 module_platform_driver(cdns_torrent_phy_driver);
 
-MODULE_AUTHOR("Cadence Design Systems, Inc.");
+MODULE_AUTHOR("Benjamin Robin <benjamin.robin@bootlin.com>");
 MODULE_DESCRIPTION("Cadence Torrent PHY driver");
-MODULE_LICENSE("GPL v2");
+MODULE_LICENSE("GPL");

-- 
2.56.1

