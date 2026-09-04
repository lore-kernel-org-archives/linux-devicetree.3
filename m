Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB93514765
	for <devicetree@vger.kernel.org>; Fri,  4 Sep 2026 19:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788548605; cv=none; b=pupMSchQFbRDlZNtd/nCrymucLgDpq+3CXSOVPRk1hHtCCoYl8jEcGKvsjO0u6NuPkgw1dZ+PGVh2vwH30HYii4MePGA6qeLb0kLykXAAwncsykqjigkpnKZ13TCumINzMVzztKTeVvi6POA30u7bTMJveYs6FFL9V8z1I8cv8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788548605; c=relaxed/simple;
	bh=mzH/5XaUhv6NQCYgufBy5oWC9jpITM+/znfPg5sAlv0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l8ZUGJJi8tahXOswqRXaKCc8Rb6pMx2zVLtpzWKw7DQncty46ifdSGJjnjQtbNnISTIZ8/hf4zIAU/O0Ifw5hZFiomhL00Dtob6q/Cx6pytRbLQQGXkRB210gawc5oCirhV5Wixfvn9Ohl5Y03rOfwNj1yBoyodjo1gxPMXfN0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la; spf=pass smtp.mailfrom=lex.la; dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b=KVKcBtGa; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lex.la
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lex.la
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lex.la header.i=@lex.la header.b="KVKcBtGa"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49cd77e0f95so12409035e9.3
        for <devicetree@vger.kernel.org>; Fri, 04 Sep 2026 12:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lex.la; s=google; t=1788548592; x=1789153392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfiP06w66PJnEqo2UKKQtS6GK/rrfhVqIhL6B6Ho9XA=;
        b=KVKcBtGa7qkMiK+MV4F72Oz3G8+Ner++Con1fulnsUgfrO7Nj4sDQM48QdrFYASgah
         QezFTD8zwvvFXZch1eLMIaS1iBg5ilZobHKrSIKmWkNEobPu4V46Y7hxpGGMniKU8jd4
         8TSbdEuqg8klhPChzKjRGaaAt6VfAUlAT2kkcclHpiWuLwNQTSX3OfKOYKKragH5rC7B
         ja7SFzOjGgMb9NJ8uDjGQtUIEQe9joRTX5uQ/VjRfGBFcTEo8cZgqdsJe3xQimBWyn6I
         Eh6utyplrQ7aThh6/BqXBxIFTm7BJg8qEGwLK779vZeJXz5HMb0gYfpRs7s83egUMrj5
         WjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788548592; x=1789153392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YfiP06w66PJnEqo2UKKQtS6GK/rrfhVqIhL6B6Ho9XA=;
        b=VpGUiuIaLlfE3HtlpsAMQq7xcV4IMriqon09i21oLJSDFowBVJb9XWsl/1AoKGuhAA
         kJ6Wj8wZS0JHCTKbhnqYbssjgyNcovf5yX9RrGJy+vEwY5w4EkLUh6y06y3Q37Nhs8t/
         FVoUn2qNCc76uhl8mHkZapKRUj2hh1t8ywTL2PA3I22qE2pChUjaCdlA4zy2P2ZHon4T
         TtHqftibFC3K9Z/KglDWNE884liKrds+B5PjHfD6KpL18TcYXZzuoWkpMTzOeNWOZayS
         G9mZh2Fs6zwfTY6yDIY1zrfjf+YGpKPxCMPobYC+51xz95NWQwuX8608BXnuepeVWKkT
         L4qw==
X-Forwarded-Encrypted: i=1; AKwUvBy7XyLvXfyzlPit8+hB2/EtFpWM32O47bLN5sWA1/hPgZmP8Mx+PUMFVcHCCIP0DBai91mU0WdNf4rC@vger.kernel.org
X-Gm-Message-State: AFuF++laCb+K6yzNw6dV9Gok2szKF1aIFkbI1CvMclqdJSkvyOY1myU6
	I8NRRAPG2qsX9/T7i8hLF+g+bHx+YKzmF+JmkBByCG6QQIb/k8DU6pu6RGw7fjkIb4Y=
X-Gm-Gg: AYBFou145N13BOUbbCQ8ZU88wuQhvnLot4LaZcpOAzOVFNNF8dq+FawOf5pADlM9Nt/
	hQjoJaDZ4m5HzOeSQpioHN8n1BwM709G/Sq0V1XMKyUT36hX/u+ZPHvlaNc9TrzAjE6eNgNZ3Bo
	F01+DnX/stWbE/QhvK570MfxXTM3XFPyZspIrMqiyORozuEt+eOVrRRu5JTs5cppJ4tRT9ul6Da
	ibZDwO0Sen3g0wfNM7CJV788GIpmztNG7miye81N2VtcHxIpdBN0UnildjFJzkIT0tBF8pxRQUw
	5rKif4I1IoqvDZBei7mB+3jUnmdS7RE5SLtT53BMzvLHETjHaXyIKyCFFjEzQopfzVvhMOoWLKp
	i8TfKHzU/sFu6rAjj5Oi6qszIcWsUGc7/Kn+QGa/diPx1hmZ+bY9skmVTD3AVeZVOYhNIdtwiDi
	94AGjmWoIdgwzCp5IJw2SnOL7o9hrkZeOP0Vy5C0Q9L3/UObFzbw==
X-Received: by 2002:a05:600c:310d:b0:49c:dc14:d681 with SMTP id 5b1f17b1804b1-49cf81e5449mr84605115e9.3.1788548592018;
        Fri, 04 Sep 2026 12:03:12 -0700 (PDT)
Received: from remote-01 ([84.17.55.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee60d8a6sm172195485e9.10.2026.09.04.12.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 12:03:11 -0700 (PDT)
From: Aleksei Sviridkin <f@lex.la>
To: Andrew Lunn <andrew@lunn.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Eric Woudstra <ericwouds@gmail.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH net-next v2 04/10] net: phy: air: type the buckpbus core on the mdio device
Date: Fri,  4 Sep 2026 19:02:58 +0000
Message-ID: <9d88227c618e150dae04c386c0dc05992cf9035f.1788548229.git.f@lex.la>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788548229.git.f@lex.la>
References: <cover.1788548229.git.f@lex.la>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The buckpbus accessors only need an MDIO device, but they take a
phy_device, which ties them to a probed PHY. An upcoming MDIO device
driver needs the same register access before any phy_device exists,
since it runs precisely to make the PHY presentable.

Retype the internal helpers onto an mdio_device and keep the exported
phy_device API as page-selecting wrappers that pass &phydev->mdio. The
EN8811H driver already reaches the AN8811HB pbus through an
mdio_device, so this follows an existing direction rather than opening
a new one.

No functional change.

Assisted-by: LLM
Signed-off-by: Aleksei Sviridkin <f@lex.la>
---
 drivers/net/phy/air_phy_lib.c | 80 ++++++++++++++++++-----------------
 1 file changed, 42 insertions(+), 38 deletions(-)

diff --git a/drivers/net/phy/air_phy_lib.c b/drivers/net/phy/air_phy_lib.c
index 5141db19fa5e..e314717843ae 100644
--- a/drivers/net/phy/air_phy_lib.c
+++ b/drivers/net/phy/air_phy_lib.c
@@ -14,31 +14,32 @@
 
 #include "air_phy_lib.h"
 
-static int __air_buckpbus_reg_read(struct phy_device *phydev,
+static int __air_buckpbus_reg_read(struct mdio_device *mdiodev,
 				   u32 pbus_address, u32 *pbus_data)
 {
 	int pbus_data_low, pbus_data_high;
 	int ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_MODE,
+			      AIR_BPBUS_MODE_ADDR_FIXED);
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_RD_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_RD_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
+	pbus_data_high = __mdiodev_read(mdiodev, AIR_BPBUS_RD_DATA_HIGH);
 	if (pbus_data_high < 0)
 		return pbus_data_high;
 
-	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
+	pbus_data_low = __mdiodev_read(mdiodev, AIR_BPBUS_RD_DATA_LOW);
 	if (pbus_data_low < 0)
 		return pbus_data_low;
 
@@ -46,64 +47,66 @@ static int __air_buckpbus_reg_read(struct phy_device *phydev,
 	return 0;
 }
 
-static int __air_buckpbus_reg_write(struct phy_device *phydev,
+static int __air_buckpbus_reg_write(struct mdio_device *mdiodev,
 				    u32 pbus_address, u32 pbus_data)
 {
 	int ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_MODE,
+			      AIR_BPBUS_MODE_ADDR_FIXED);
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
-			  upper_16_bits(pbus_data));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_DATA_HIGH,
+			      upper_16_bits(pbus_data));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
-			  lower_16_bits(pbus_data));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_DATA_LOW,
+			      lower_16_bits(pbus_data));
 	if (ret < 0)
 		return ret;
 
 	return 0;
 }
 
-static int __air_buckpbus_reg_modify(struct phy_device *phydev,
+static int __air_buckpbus_reg_modify(struct mdio_device *mdiodev,
 				     u32 pbus_address, u32 mask, u32 set)
 {
 	int pbus_data_low, pbus_data_high;
 	u32 pbus_data_old, pbus_data_new;
 	int ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_MODE, AIR_BPBUS_MODE_ADDR_FIXED);
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_MODE,
+			      AIR_BPBUS_MODE_ADDR_FIXED);
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_RD_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_RD_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_RD_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	pbus_data_high = __phy_read(phydev, AIR_BPBUS_RD_DATA_HIGH);
+	pbus_data_high = __mdiodev_read(mdiodev, AIR_BPBUS_RD_DATA_HIGH);
 	if (pbus_data_high < 0)
 		return pbus_data_high;
 
-	pbus_data_low = __phy_read(phydev, AIR_BPBUS_RD_DATA_LOW);
+	pbus_data_low = __mdiodev_read(mdiodev, AIR_BPBUS_RD_DATA_LOW);
 	if (pbus_data_low < 0)
 		return pbus_data_low;
 
@@ -112,23 +115,23 @@ static int __air_buckpbus_reg_modify(struct phy_device *phydev,
 	if (pbus_data_new == pbus_data_old)
 		return 0;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_HIGH,
-			  upper_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_ADDR_HIGH,
+			      upper_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_ADDR_LOW,
-			  lower_16_bits(pbus_address));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_ADDR_LOW,
+			      lower_16_bits(pbus_address));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_HIGH,
-			  upper_16_bits(pbus_data_new));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_DATA_HIGH,
+			      upper_16_bits(pbus_data_new));
 	if (ret < 0)
 		return ret;
 
-	ret = __phy_write(phydev, AIR_BPBUS_WR_DATA_LOW,
-			  lower_16_bits(pbus_data_new));
+	ret = __mdiodev_write(mdiodev, AIR_BPBUS_WR_DATA_LOW,
+			      lower_16_bits(pbus_data_new));
 	if (ret < 0)
 		return ret;
 
@@ -144,7 +147,8 @@ int air_phy_buckpbus_reg_read(struct phy_device *phydev, u32 pbus_address,
 	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
 
 	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_read(phydev, pbus_address, pbus_data);
+		ret = __air_buckpbus_reg_read(&phydev->mdio, pbus_address,
+					      pbus_data);
 		if (ret < 0)
 			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
 				   pbus_address, ret);
@@ -163,7 +167,7 @@ int air_phy_buckpbus_reg_write(struct phy_device *phydev, u32 pbus_address,
 	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
 
 	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_write(phydev, pbus_address,
+		ret = __air_buckpbus_reg_write(&phydev->mdio, pbus_address,
 					       pbus_data);
 		if (ret < 0)
 			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
@@ -183,8 +187,8 @@ int air_phy_buckpbus_reg_modify(struct phy_device *phydev, u32 pbus_address,
 	saved_page = phy_select_page(phydev, AIR_PHY_PAGE_EXTENDED_4);
 
 	if (saved_page >= 0) {
-		ret = __air_buckpbus_reg_modify(phydev, pbus_address, mask,
-						set);
+		ret = __air_buckpbus_reg_modify(&phydev->mdio, pbus_address,
+						mask, set);
 		if (ret < 0)
 			phydev_err(phydev, "%s 0x%08x failed: %d\n", __func__,
 				   pbus_address, ret);
-- 
2.53.0

