Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080773;
	b=wi2jiJu/LbQ9dr93cmtvKR5OauBiITq+6rgi34GLdliKwhPqXqAwjVNAzRjonCyLSBYn
	 gLV2mfaBBERg4QHAT4262DAww8+2pDawUrB0wWWCwGal+O+9CsTJnjRPBk8JJpCNcJU+G
	 ALsztRPu19qLrox6MA+X69VPakovXh9otEKtdcpbDAW7VKOZJMDh/zGMLpGHI1Uqi+Trg
	 AzNaS4vhBb0GuUzrFAnDfeQmqAHqxw0UQt52HdoZp78XbNA/7PgIcdiN5suWoPkgWGD4V
	 Vuu2DLgprvvd04OriFoqduIXcJi69vDkvnbZpaf421iCS62mDthjduCK8I6+fmoRNsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080773;
	h=DMARC-Filter:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=YgiL9PYeUdMsQQJdZ2R1QPV9MD8KIpSSIKhcXP8qDRU=;
	b=AGCvX+X6jzyDrMKbLhe2bzUgZs7mN079eZeN/d62rqkHpnUd6KR1ELy/SF971Ndh6FpD
	 mNkZtQQnfGE4AD12z8yGKZbnjCLky+C6a+1SAcEcRP8+G7ZN5Z/0rv9nGhYjmSOByYe78
	 RsVFdFTSty9x+1VJxgka/xXnirYFO+MICWZBk2HcerDMoz2squG+xEEpMWk5n8kB2RR2E
	 Lzvgp3l3bsp5zN+rjzBsoD2//yZdZsOXhXs/PbJBo01Hr/Q008KcHmy9q7wcRQckPOr0e
	 l3pQDFDI6wAvnv/fYCcm+NTL4kTa3U+xW8Ll+DQLz33VMZo+JqJmM7J3uQLOPYGarNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AFF60A262C;
	Thu, 19 Nov 2026 09:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2AFF60A262C
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
Date: Thu, 19 Nov 2026 17:32:38 +0800
Subject: [PATCH net-next v7 5/7] net: ftgmac100: Require phy-mode for
 AST2700
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
Message-ID: <20261119-support_ast2700-v7-5-33c8ca2d0dd7@aspeedtech.com>
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
	<linux-kernel@vger.kernel.org>, Jacky Chou <jacky_chou@aspeedtech.com>,
	Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795080760; l=1341;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=1RAjtRaBnlESdbdb4uGZ6kTcr6R3XDz0Y1IoL5YzWHQ=;
 b=Q7tV/O9ieIfTmd06GCxzbsp1JErVikVRfSIQ1AO5rOULSpf2xjdSBoVvloz7sJEeMH8UnCfEI
 v9h+/oI1nMDD4tyiPLtRozIsPT+uDjU/fDjQNQq3EqjbY9/wTKOSFwV
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=

The driver currently defaults to RGMII when the "phy-mode" property
is missing from the device tree. This default is no longer valid for
AST2700, which also supports RMII via FTGMAC100_QUIRK_RMII_ENABLE.

Make "phy-mode" a required property for AST2700 and fail probe with
an error message if it is not specified, instead of silently
defaulting to RGMII.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 9b7becb01726..5a578a62df67 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -1526,8 +1526,13 @@ static int ftgmac100_mii_probe(struct net_device *netdev)
 
 	/* Default to RGMII. It's a gigabit part after all */
 	err = of_get_phy_mode(np, &phy_intf);
-	if (err)
+	if (err) {
+		if (priv->mac_id == FTGMAC100_AST2700) {
+			dev_err(priv->dev, "phy-mode is required for this SoC\n");
+			return -EINVAL;
+		}
 		phy_intf = PHY_INTERFACE_MODE_RGMII;
+	}
 
 	/* Aspeed only supports these. I don't know about other IP
 	 * block vendors so I'm going to just let them through for

-- 
2.34.1

