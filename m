Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=211.20.114.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080772;
	b=T2yjlNW2si27QiU0HsbZZpuxm5+XnOrhKZ6uWRvz2U0Aaynvifd9Ogf8el5iXssZ3Raw
	 UORMPDZSKWOGvQ5hkXQva8A+K+WfPe/OwxNPbSPOb3dmTxITXq5P7OtXeZ5Rk0peESZRR
	 RTvInAOv+yRHgGqJ4CqEqiOWdcrQeTOL7h+XB9b9Bf5z33489lcjTVaMgtUo+SlZiULlq
	 J2zda+aIk6xIXXfQgbre6ZBN6/Kk/KsZ/eOrK1hs8GmGGUKrcoB4uWbzgeR+xFQM/UDoI
	 s1111NZeL+X9dC5hPYyYwUrXn9mgSYFYXpYroFwtFDFJdfD53oULsTqLhsi/zcP2hPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080772;
	h=DMARC-Filter:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-ID:References:
	 In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=LyXFiOgSd/gS7t17gC6C4jnHNJdK0hrmfTDD2nscfFE=;
	b=qgtnW8ayQrkrlpcvce/PW+T/r95mmhjymdI2aIP9abEL/LzIVVlnk7/DkFmSNmbj/plS
	 bBTn7xjLlVWO7RoXUuoC8adO5qaEajvbzQJaliEN3h7IrlnVGPvwje8H1Y+5txF/FbQNu
	 E59nQIFWk2Z7D3lkukzO43rB6D/7KNOuHs13PvZNF7jpmCBkYYEitqn8nCT/L2QfVsQTN
	 2lY0iBxy1O2GXxcFZWj4n+PMmwughogrVny3rWjtFtDc9l248IEfz89ePl6qGBKA1aKfx
	 2WTh2IUKru6BDXARVNQ72VD0s/LyamKBuiDMoY/xSGztMkEG820omnpApL7WoOAJ+fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aspeedtech.com;
	spf=pass smtp.mailfrom=aspeedtech.com;
	arc=none smtp.remote-ip=211.20.114.72
Received: from twmbx01.aspeedtech.com (mail.aspeedtech.com [211.20.114.72])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9337D60A2611;
	Thu, 19 Nov 2026 09:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9337D60A2611
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
Date: Thu, 19 Nov 2026 17:32:36 +0800
Subject: [PATCH net-next v7 3/7] net: ftgmac100: Add AST2700 compatible
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
Message-ID: <20261119-support_ast2700-v7-3-33c8ca2d0dd7@aspeedtech.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795080760; l=2037;
 i=jacky_chou@aspeedtech.com; s=20251031; h=from:subject:message-id;
 bh=Fhi2QQE0gYXCC0ZbXJOZaqvp8cju90o459tkZDIGBG4=;
 b=b+xA25xOF/OudrCqg/v60t8tMcg/cwSIwyVh92cVN0Dt5ZSAkkYWAAv1YmJJEDRh3UHXH6eHw
 cSXXkaJ0fjFCpe/vmN8ZczfhcLJgVoLc1XeDRD5GhtZgoFRM4SPxsjh
X-Developer-Key: i=jacky_chou@aspeedtech.com; a=ed25519;
 pk=8XBx7KFM1drEsfCXTH9QC2lbMlGU4XwJTA6Jt9Mabdo=

Add match data for the Aspeed AST2700 FTGMAC100 controller and wire
its compatible string into the OF match table. This lets AST2700 device
tree nodes bind to the ftgmac100 driver.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jacky Chou <jacky_chou@aspeedtech.com>
---
 drivers/net/ethernet/faraday/ftgmac100.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
index 6d2fe5c2f390..67b1fa464a42 100644
--- a/drivers/net/ethernet/faraday/ftgmac100.c
+++ b/drivers/net/ethernet/faraday/ftgmac100.c
@@ -37,7 +37,8 @@ enum ftgmac100_mac_id {
 	FTGMAC100_FARADAY = 1,
 	FTGMAC100_AST2400,
 	FTGMAC100_AST2500,
-	FTGMAC100_AST2600
+	FTGMAC100_AST2600,
+	FTGMAC100_AST2700
 };
 
 struct ftgmac100_match_data {
@@ -2017,7 +2018,8 @@ static int ftgmac100_probe(struct platform_device *pdev)
 
 	if (priv->mac_id == FTGMAC100_AST2400 ||
 	    priv->mac_id == FTGMAC100_AST2500 ||
-	    priv->mac_id == FTGMAC100_AST2600) {
+	    priv->mac_id == FTGMAC100_AST2600 ||
+	    priv->mac_id == FTGMAC100_AST2700) {
 		priv->rxdes0_edorr_mask = BIT(30);
 		priv->txdes0_edotr_mask = BIT(30);
 		priv->is_aspeed = true;
@@ -2131,6 +2133,10 @@ static const struct ftgmac100_match_data ftgmac100_match_data_ast2600 = {
 	.mac_id = FTGMAC100_AST2600
 };
 
+static const struct ftgmac100_match_data ftgmac100_match_data_ast2700 = {
+	.mac_id = FTGMAC100_AST2700
+};
+
 static const struct ftgmac100_match_data ftgmac100_match_data_faraday = {
 	.mac_id = FTGMAC100_FARADAY
 };
@@ -2142,6 +2148,8 @@ static const struct of_device_id ftgmac100_of_match[] = {
 	  .data = &ftgmac100_match_data_ast2500 },
 	{ .compatible = "aspeed,ast2600-mac",
 	  .data = &ftgmac100_match_data_ast2600 },
+	{ .compatible = "aspeed,ast2700-mac",
+	  .data = &ftgmac100_match_data_ast2700 },
 	{ .compatible = "faraday,ftgmac100",
 	  .data = &ftgmac100_match_data_faraday },
 	{ }

-- 
2.34.1

