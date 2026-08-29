Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E61282F3F
	for <devicetree@vger.kernel.org>; Sat, 29 Aug 2026 05:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787981164; cv=none; b=eZFnXvUSB4SMabu8O6M5K6Fa6SQorv3JxaX/Uhv02FXbfISYpFZKfhL0k71nH+T7MYN/WipyzmRYkvgFuT1JyS/+UrMKcRiIwNL5q3Zuf1Bizfb6ZDktl3whAnGpraOEbiH8j4h8/R4u0SdMZljvX+ja8j4QnPnbiNLmDtXSgok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787981164; c=relaxed/simple;
	bh=4572s9xTVdwUzbQzLlssFdKtKIqWv8RdY2kJgP8ww1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HWJgowX20lG7zekDuKWvxQRSaV8oubLBik7UnuMclpoLrSVsXZ3w5rSXPB+rHIJyddHjSsrECZ89uhE99D/Sb2W/dGs2LCdHXFlGHUsBiZ2PLgpHDWmiFaMrZpLrKD22c2ZRXWfTEgq5PhERLtjit4/ccF+lLAoiseVhDVFa1VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=P4Wm1mTD; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="P4Wm1mTD"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1c52d920b8so209354066b.2
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 22:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1787981159; x=1788585959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztbe6Uhz7Z72lD3H/7iN0kwRmG9muPWYwtlM3Qzlp7I=;
        b=P4Wm1mTDlCpcdux95bv3Pgjge1uEm+jhDVhd+BG22NooAs/3cVb+C2zRnlAYQujmcC
         psHCLz3WAM/IcQKxe1l9sDTegfvSZ/D1j7wmAQE8nmq7zgQmkWItZCpxKp/an+ahO8I7
         lCc/dsCFuUl7YZF/0KW1K8I+MgWmAD2r+1/lGZJ6BsPRkU3cS9jaiiqufGHzDpDMdsLx
         p524Gsd+VZiHCwUSWQPiEciIg5ye839Yh3VPrtbyx4ap+tDIBW6jdjIP/i/T/kdGEdd/
         7M0+4AAN0jqUMDciYRFLggRzjURO5Q7ruW/A8hHmc8D8/fqFGDFkVuINICutiEAedl+Q
         EMYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787981159; x=1788585959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ztbe6Uhz7Z72lD3H/7iN0kwRmG9muPWYwtlM3Qzlp7I=;
        b=mXmZtl5luvDGv4bMBTbLyygL5SCVflhcCB7XFyYRmkiNCtPlgIldxG5CQzFhBB21c3
         3T+5c/nNGoYzzzSGAQQZgZmq/2AGw4v19vloV5LmSOK16esofB4I8NSgZnLChUUc/FGh
         4JKWeZFo4e8CsIvc5t8sDrzCpdMWxIITlidAzYYRWDTnK76/aCLopwmHUHrGmfXLhQUu
         e99+wVvZaNaymwDkF+ML0eYIx1ineDN5/E8k2EwBHCfF4KIQ722evInIPwX58BFrWlM9
         PiZeyiNLpEYH95mY9cAtp5eD1qStSIBbagoej0cIF88RE6azlhwbxRHy4XsPx9YhhOHT
         xsWg==
X-Forwarded-Encrypted: i=1; AKwUvBz0wSkr+Vdi70rIPB4gXGTEWxEGIpW9HVy9DpuRDlQui9xsPl8tXg8ejQp4R62JEacpOzpeBYWryjuP@vger.kernel.org
X-Gm-Message-State: AFuF++mZMGei/JjTYjHaPX+mBxhc/lsh06uiuPxgpImwYduOrVidCuoz
	34EkTx5N5iQ4SGgjCF8GrqbGnSL/9YcsyMt6WsqQrwlmsbxO8e1jzZ5EigDeoqmNZys=
X-Gm-Gg: AR+sD12wTTVMD+jxwXOMm3/LpxbYCyd/WkX2fP/B5v7p/R3a4z+Xc6DLnnT6Y1pS6qs
	h2e4lpdsO2x44hahNLlhjDV+NGZUWJGxR4rZ/4MDy9Dh3eiE1o5MxcYUeLQGY1OgOnYrUz4tB4i
	BtboXepxvlXy/t+AOxfomLe9JEx6fWv4jQ69gKfRQVsInm1+gdVxKcpSwPu7FOVQ2TP3T0HT2RL
	58H5R2F63u4YoOh+H0iIvtLNlqrjwjjpxr0bRJ8C+9RyWeKlfDFRc2wiDIer2cq7tUWQvtSUc2R
	wNHnn4rLlQ6OexY0UBTgP1VujBb2Psm4DdREZUOoPoWtlUXA/A8Cm/JKQtEMWlaNO2f7tgUh4uu
	z2QMDtkWN8ku0M56WYlEjo7aWCcY7U1cEY270hatvisGkm9jRnP6c9+yDO9/GOu4heOMuZL5IXh
	X04QD5Wtad5+9hd6505MAzmyqQzda8/6wwWaJlLDOR+A==
X-Received: by 2002:a17:907:3e20:b0:c24:d914:6d64 with SMTP id a640c23a62f3a-c255720d399mr799327766b.23.1787981158722;
        Fri, 28 Aug 2026 22:25:58 -0700 (PDT)
Received: from remote-01 ([45.85.105.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee75a36sm163750666b.28.2026.08.28.22.25.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 22:25:58 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aleksei Sviridkin <f@lex.la>
Subject: [RFC PATCH net-next 3/9] net: phy: air: type the buckpbus core on the bus and address
Date: Sat, 29 Aug 2026 05:25:40 +0000
Message-ID: <20260829052546.1152446-4-f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260829052546.1152446-1-f@lex.la>
References: <20260829052546.1152446-1-f@lex.la>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The buckpbus accessors only need an MDIO bus and an address, but they
take a phy_device, which ties them to a probed PHY. An upcoming MDIO
device driver needs the same register access before any phy_device
exists, since it runs precisely to make the PHY presentable.

Retype the internal helpers onto (mii_bus, addr) and keep the exported
phy_device API as page-selecting wrappers around them. The file
already carries an mdio_device-typed accessor for the AN8811HB pbus,
so this follows an existing direction rather than opening a new one.

No functional change.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/phy/air_phy_lib.c | 85 +++++++++++++++++++----------------
 1 file changed, 46 insertions(+), 39 deletions(-)

diff --git a/drivers/net/phy/air_phy_lib.c b/drivers/net/phy/air_phy_lib.c
index 5141db19fa5e..e0fca5f285d2 100644
--- a/drivers/net/phy/air_phy_lib.c
+++ b/drivers/net/phy/air_phy_lib.c
@@ -14,31 +14,32 @@
 
 #include "air_phy_lib.h"
 
-static int __air_buckpbus_reg_read(struct phy_device *phydev,
+static int __air_buckpbus_reg_read(struct mii_bus *bus, int addr,
 				   u32 pbus_address, u32 *pbus_data)
 {
 	int pbus_data_low, pbus_data_high;
 	int ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_MODE,
+			      AIR_BPBUS_MODE_ADDR_FIXED);
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_RD_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_RD_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
+	pbus_data_high = __mdiobus_read(bus, addr, AIR_BPBUS_RD_DATA_HIGH);
 	if (pbus_data_high < 0)
 		return pbus_data_high;
 
-	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
+	pbus_data_low = __mdiobus_read(bus, addr, AIR_BPBUS_RD_DATA_LOW);
 	if (pbus_data_low < 0)
 		return pbus_data_low;
 
@@ -46,64 +47,66 @@ static int __air_buckpbus_reg_read(struct phy_device *phydev,
 	return 0;
 }
 
-static int __air_buckpbus_reg_write(struct phy_device *phydev,
+static int __air_buckpbus_reg_write(struct mii_bus *bus, int addr,
 				    u32 pbus_address, u32 pbus_data)
 {
 	int ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_MODE,
+			      AIR_BPBUS_MODE_ADDR_FIXED);
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_WR_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_WR_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
-			  upper_16_bits(pbus_data));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_WR_DATA_HIGH,
+			      upper_16_bits(pbus_data));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
-			  lower_16_bits(pbus_data));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_WR_DATA_LOW,
+			      lower_16_bits(pbus_data));
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static int __air_buckpbus_reg_modify(struct phy_device *phydev,
+static int __air_buckpbus_reg_modify(struct mii_bus *bus, int addr,
 				     u32 pbus_address, u32 mask, u32 set)
 {
 	int pbus_data_low, pbus_data_high;
 	u32 pbus_data_old, pbus_data_new;
 	int ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_MODE,
+			      AIR_BPBUS_MODE_ADDR_FIXED);
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_RD_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_RD_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
+	pbus_data_high = __mdiobus_read(bus, addr, AIR_BPBUS_RD_DATA_HIGH);
 	if (pbus_data_high < 0)
 		return pbus_data_high;
 
-	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
+	pbus_data_low = __mdiobus_read(bus, addr, AIR_BPBUS_RD_DATA_LOW);
 	if (pbus_data_low < 0)
 		return pbus_data_low;
 
@@ -112,23 +115,23 @@ static int __air_buckpbus_reg_modify(struct phy_device *phydev,
 	if (pbus_data_new == pbus_data_old)
 		return 0;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_WR_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_WR_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
-			  upper_16_bits(pbus_data_new));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_WR_DATA_HIGH,
+			      upper_16_bits(pbus_data_new));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
-			  lower_16_bits(pbus_data_new));
+	ret = __mdiobus_write(bus, addr, AIR_BPBUS_WR_DATA_LOW,
+			      lower_16_bits(pbus_data_new));
 	if (ret < 0)
 		return ret;
 
@@ -144,7 +147,9 @@ int air_phy_buckpbus_reg_read(struct phy_device *phydev, u32 pbus_address,
 	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
 
 	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_read(phydev, pbus_address, pbus_data);
+		ret = __air_buckpbus_reg_read(phydev->mdio.bus,
+					      phydev->mdio.addr,
+					      pbus_address, pbus_data);
 		if (ret < 0)
 			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
 				   pbus_address, ret);
@@ -163,8 +168,9 @@ int air_phy_buckpbus_reg_write(struct phy_device *phydev, u32 pbus_address,
 	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
 
 	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_write(phydev, pbus_address,
-					       pbus_data);
+		ret = __air_buckpbus_reg_write(phydev->mdio.bus,
+					       phydev->mdio.addr,
+					       pbus_address, pbus_data);
 		if (ret < 0)
 			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
 				   pbus_address, ret);
@@ -183,8 +189,9 @@ int air_phy_buckpbus_reg_modify(struct phy_device *phydev, u32 pbus_address,
 	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
 
 	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_modify(phydev, pbus_address, mask,
-						set);
+		ret = __air_buckpbus_reg_modify(phydev->mdio.bus,
+						phydev->mdio.addr,
+						pbus_address, mask, set);
 		if (ret < 0)
 			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
 				   pbus_address, ret);
-- 
2.53.0

