Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080772;
	b=ighRbQTjmbP/71mxNm/mwpvV3f625WgAF1MJHN3cvqVmNryvhA69eyMOUKYeKvr3Lhyu
	 Vc7ufrB781MXNNsT2+2Iz/wnYICE1QfZVcF6OJlirEdbVo+elqEkPiXmBr36Ho7G/rZi3
	 u/P6O0JnPht1bsKA+/7nEaWIJeAkGLQvRinT7lSVdBqZUkuR/YQ7cwLAoTveXPwigaabW
	 W4B7gl1PFj6iiyVONyHQZo9DjDjzMrGkXBfiMyVMBk36milZ/VSVAZsw0vLh6vednwPLl
	 SFto6A3U55WVDOSFpjfQH+5TlU9OHks0/A2syCg7oSqxKVOWdwhFyI4AkCIrGc4L53g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080772;
	h=DMARC-Filter:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=AwHc+ndn/oysQVWVndGRb3Cr63wvdmsQpBTORe0DyXs=;
	b=q2xaMf+QPtAmih9UPLfHFAMZASi9OPoxTcG758UP8BCk18hVBwDg5jHbWxUW5fYW3rms
	 3OIkDvF8E+jYkV4ptMGX+rpe80z4jOjzY1EI2JcbPlP8OXop1hCg4BXjwxP0sLEVH7zIr
	 l3qeG2oGvcRBqV/a3401weXCYVBtgKE0xDR2dQqDHGSu69AWiEyvancOtBsCHAKjjTPWK
	 rhILfg480M0RxE0xcD9yuNh6bc/VLWqjmKWORLJ1209gbGSJMiaWC/sD9iANrR8o5V/Z7
	 KMsmJps1AgTeAE7YWGzLP4JitnyTv6sLjIBSATKF/IQMGLsgnX2vDaFdUZcrfTSbl/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47EA7606A32A;
	Thu, 19 Nov 2026 09:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47EA7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Thu, 19 Nov
 2026 17:32:41 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.39 via Frontend
 Transport; Thu, 19 Nov 2026 17:32:41 +0800
From: Jacky Chou <jacky_chou@aspeedtech.com>
Date: Thu, 19 Nov 2026 17:32:37 +0800
Subject: [PATCH net-next v7 4/7] net: ftgmac100: Enable AST2700 RMII
 support
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
Message-ID: <20261119-support_ast2700-v7-4-33c8ca2d0dd7@aspeedtech.com>
References: <20261119-support_ast2700-v7-0-33c8ca2d0dd7@aspeedtech.com>
In-Reply-To: <20261119-support_ast2700-v7-0-33c8ca2d0dd7@aspeedtech.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Po-Yu Chuang
	<ratbert@faraday-tech.com>, Eric Dumazet <edumazet@kernel.org>, "Heiner
 Kallweit" <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, "Eric
 Dumazet" <edumazet@kernel.org>
CC: <netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795080760; l=4258;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=QOof8Ln5197tONi246cNMG5Jj+NA5lrKsaTcXlkqcQ8=;
 b=0p51ysF0QwxrPR7UCb2Qaj6eWIgFfwqwCts27d3Z0q4+fcYvIb2rI5I4Gfyfz9hM9ovD89ovB
 AqQJk+/kyvzA1IuobrCF0qQbm+cKMx38i0HYKhjr5LJisfWJOC2MV4K
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=

Set the RMII enable bit when an AST2700 port uses RMII so the MAC is
programmed for the selected interface mode. Describe the requirement as
a match-data quirk instead of checking the MAC generation in the data
path, allowing later compatible controllers to opt into the behavior.

phydev is always populated by the time this runs: ftgmac100_start_hw()
is only reached once the device has been opened, and
ftgmac100_probe_dt() always attaches a phy_device before
register_netdev() can succeed -- via a discrete PHY ("phy-handle"), a
"fixed-link" node, or NC-SI's internal fixed 100Mbit PHY
(ftgmac100_probe_ncsi()). Any failure in that setup aborts probe before
register_netdev(), so an opened AST2700 netdev always has phydev set.
This mirrors the same assumption ftgmac100_reset_and_config_mac()
already makes for every Aspeed SoC earlier in the open path.

Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 21 +++++++++++++++++++--
 drivers/net/ethernet/faraday/ftgmac100.h |  1 +
 2 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 67b1fa464a42..9b7becb01726 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -41,8 +41,11 @@ enum ftgmac100_mac_id {
 	FTGMAC100_AST2700
 };
 
+#define FTGMAC100_QUIRK_RMII_ENABLE	BIT(0)
+
 struct ftgmac100_match_data {
 	enum ftgmac100_mac_id mac_id;
+	u32 quirks;
 };
 
 /* Arbitrary values, I am not sure the HW has limits */
@@ -79,6 +82,7 @@ struct ftgmac100 {
 	void __iomem *base;
 
 	enum ftgmac100_mac_id mac_id;
+	u32 quirks;
 
 	/* Rx ring */
 	unsigned int rx_q_entries;
@@ -355,6 +359,12 @@ static void ftgmac100_init_hw(struct ftgmac100 *priv)
 static void ftgmac100_start_hw(struct ftgmac100 *priv)
 {
 	u32 maccr = ioread32(priv->base + FTGMAC100_OFFSET_MACCR);
+	/*
+	 * Only reached once the device is open, so a phy_device is already
+	 * attached: a discrete PHY via "phy-handle", a "fixed-link" node, or
+	 * NC-SI's internal fixed 100M PHY.
+	 */
+	struct phy_device *phydev = priv->netdev->phydev;
 
 	/* Keep the original GMAC and FAST bits */
 	maccr &= (FTGMAC100_MACCR_FAST_MODE | FTGMAC100_MACCR_GIGA_MODE);
@@ -383,6 +393,11 @@ static void ftgmac100_start_hw(struct ftgmac100 *priv)
 	if (priv->netdev->features & NETIF_F_HW_VLAN_CTAG_RX)
 		maccr |= FTGMAC100_MACCR_RM_VLAN;
 
+	if ((priv->quirks & FTGMAC100_QUIRK_RMII_ENABLE) &&
+	    phydev->interface == PHY_INTERFACE_MODE_RMII) {
+		maccr |= FTGMAC100_MACCR_RMII_ENABLE;
+	}
+
 	/* Hit the HW */
 	iowrite32(maccr, priv->base + FTGMAC100_OFFSET_MACCR);
 }
@@ -1942,7 +1957,7 @@ static int ftgmac100_probe_dt(struct net_device *netdev,
 
 static int ftgmac100_probe(struct platform_device *pdev)
 {
-	const struct ftgmac100_match_data *match_data;
+	const struct ftgmac100_match_data *match_data = NULL;
 	enum ftgmac100_mac_id mac_id;
 	struct resource *res;
 	int irq;
@@ -1987,6 +2002,7 @@ static int ftgmac100_probe(struct platform_device *pdev)
 	priv->netdev = netdev;
 	priv->dev = &pdev->dev;
 	priv->mac_id = mac_id;
+	priv->quirks = match_data ? match_data->quirks : 0;
 	INIT_WORK(&priv->reset_task, ftgmac100_reset_task);
 
 	/* map io memory */
@@ -2134,7 +2150,8 @@ static const struct ftgmac100_match_data ftgmac100_match_data_ast2600 = {
 };
 
 static const struct ftgmac100_match_data ftgmac100_match_data_ast2700 = {
-	.mac_id = FTGMAC100_AST2700
+	.mac_id = FTGMAC100_AST2700,
+	.quirks = FTGMAC100_QUIRK_RMII_ENABLE,
 };
 
 static const struct ftgmac100_match_data ftgmac100_match_data_faraday = {
diff --git a/drivers/net/ethernet/faraday/ftgmac100.h b/drivers/net/ethernet/faraday/ftgmac100.h
index 4968f6f0bdbc..8c35c895b146 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.h
+++ b/drivers/net/ethernet/faraday/ftgmac100.h
@@ -167,6 +167,7 @@
 #define FTGMAC100_MACCR_RX_BROADPKT	(1 << 17)
 #define FTGMAC100_MACCR_DISCARD_CRCERR	(1 << 18)
 #define FTGMAC100_MACCR_FAST_MODE	(1 << 19)
+#define FTGMAC100_MACCR_RMII_ENABLE	BIT(20)
 #define FTGMAC100_MACCR_SW_RST		(1 << 31)
 
 /*

-- 
2.34.1

