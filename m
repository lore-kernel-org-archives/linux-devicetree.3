Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981374;
	b=VjMaZqUPFFKiP8iM1hEEqF003pPqpQIN1lHR61pcgQAa1xsVvStjMlVtg1QL4PZydYgh
	 JxMuL4q9IBtyGnxeQQ123G4IbsL1QlwrnlcK2y37M2kHA4G50VNzoCGFyvUU+JSZA/ogr
	 XJzZx2wGeOXqeL5i4KUYoEDkiG972AVMcWlVL58AqddcZtUMQrhDoQFfppyrHOqJbidXz
	 Xmvhm5G2CeC9XnT4iI/1qEeohp/alHILBHGpX5YgP35B0SBS+7txGbNhv/TEnUxo8yHt6
	 4i7JaskbyaetGMffQO/SLvbogRINapEG3KZKRQHW+lkUkZzCy51ZajuMMubU4a13nqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981374;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=btRAcHUeA6n57bmtR6kPYkSdBmN+obmF05HBvyePiOY=;
	b=pxEWLzcnErerz815jVT654trpCiICaFQ0iejm71cMoUMiPXXQwYVviQMRszj0E2keVIf
	 lF+khuG7XoG66Wt2Vkrpyol4f0xFSGM3tQN1+TQfosq1dbLESrwJdgDIFRtiaLgRMJPK9
	 z3lnmWDx5QXe3olQjNah5td5efiU+WG619Dz9feuGYPRCXfU5lM8DFnlB6V1wEonu5vWV
	 W87GGSVaIorA0v0vZHaeIGwfMgWdeJ9lPtC+O62oEMg2kS2Pn3axjz32tMWbEDq11hqD5
	 kpPnmi3Hs720dj0NqNRH5KfLy7DKvdXGqrJHK2tKvqDjgoODCeHdQmgmKIZcU4AL0XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvBab54C;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09632606A33D
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 05:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09632606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SvBab54C
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2eac4936dfdso787675ad.2
        for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 21:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794981372; x=1795586172; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btRAcHUeA6n57bmtR6kPYkSdBmN+obmF05HBvyePiOY=;
        b=SvBab54CdwyeHeoxJV06gudiItTA/4dy9BLZqox8SmOeEwdKvNPmuU3hShfLb1ap8L
         agg4AGDEkBRbLRMUbDz5AvLVm4hHdgNaXbGqjkg/1isKZ8b4Ik8kF/9bsyPak7IfYQn5
         sYUIndI0C/cmw8jTY8P8ValrSFKy4wx9rXhuxbpLPlX1gZ6wZp/JcVH4nxk8snuZ9kwK
         kpbD2isF0BzPs/jH0NL/o/PNQVIn30bEz2sDGuZ+ovf5Y+bS+r9B0LYdp7jdkYZVHul2
         qfhrpWZSUFa1vX6WXV9KLQKHLtgGhK+eoCnvlTi1zhDH4TIWXVriXrvNaYG5RnrnxmiP
         mfZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981372; x=1795586172;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btRAcHUeA6n57bmtR6kPYkSdBmN+obmF05HBvyePiOY=;
        b=2Cr2IdvyD5EXhbXYBlxGqsxfHK2QejWtZqr0aShw00PNCGbOwT45utBEh9jJoeBNZr
         974sUiVjk623zDaxVwZ/Yqmvea09Bv66z8cC9BTU5rRCbcvTE+uAag70rarZiOXUfSeG
         mzGqZyWsjjvbKYZcItWmX0Yw3cEmhAkPNpGgea6MFidYqACFcFxTYmlkeigBWqKrtgH1
         t8VeW4QB2gdD0WRLVObpKeGcvzIAMlzlj+OQyuMPQX5dq/0J0Z58cAjB1XGNSinA2Ntk
         /Nk+1N4gk0HyGuXpHbQpGRvPWsad/2gsoxeOkDLhwyTIgkdmDiglpdQ4Q3xasAblslGf
         Lvrg==
X-Forwarded-Encrypted: i=1; AL+hErFkAQnNOsXx2W7V9z4z7iRBVBbhxQGZuNUHRMchQFQU+EmdYcEfC9SwqGu6fatD2aRBrV/vxsF4WxkU@vger.kernel.org
X-Gm-Message-State: APuU4Z97aRVb+Zwe138TeIdtY7y/YySBE10FB1vukXaiwvBmer79oIeD
	y7ZNrdxEKETKzALowUfhGskY2q6snAUIwgX20hWyPXwnAY26wWFa/ZjG
X-Gm-Gg: AZFdTZdMeCp9BHSqhnbWcS4WGmisWj9wsRUq6Mof7TOh1N7qR7Gt5DNk0+q6nGN3hZr
	4tW7buw6aFeIt7rZsLI+zhBBxM+wgRloH74Fgn9xB3YFjqOzXOSHsCOXMkxKOCyDqoTsiqshiZb
	ZN8bNjlYI/z4mKdTNVlcZI/1ONFAE2NTB7jZ0veaHAfMy8A3r596h17XEp22nyiFUIo61iIpGQK
	aKVYVKnOybXmygFNswzOzHDhh46TS4esIW3yicHURAdsTd3lOTUjWcU+nSf5QYjVm4dbZxHPRf9
	sKb3WUdSdCfZwNfiAnAf5tUCGmuXOVPVpvvQmEW5vT224Dq5Mo2kDUom1/bWjAiQbjDrttx0ykM
	j/9YmH2lGvn7y54Jqwb0RCOMktMat/8llptMJ39gjLFFJU4YBeQLyEQ9IdwiSaRqfbsSsf1had3
	Nsn0A+TRZXg1t/cRGEJCSbGIOODchQ3SWy0qHxiObGLpEBRoVuq3QpHSIBkYASeVco7z7g+mhCE
	N3yhurhfcFNMD3P3PcyifyhTEY2zed7VmQdosqpiLbBGrIdFEsPa68v9MUUVxtnL0q1FFj2vGKj
	vUEvaTchOsMrS9Vgzm2ieW7b59P/4eW50A39qSgiAKjHObob2O+pCjURoECorGeFpyZlplQhx6S
	O8AYwUjbcistNgAKbQUmX
X-Received: by 2002:a17:902:ecc8:b0:2ef:de59:1af9 with SMTP id d9443c01a7336-2eff72e8f80mr25437235ad.2.1794981371982;
        Tue, 17 Nov 2026 21:56:11 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5ca5bf959sm569563b3a.20.2026.11.17.21.56.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 21:56:11 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Wed, 18 Nov 2026 13:55:20 +0800
Subject: [PATCH v7 7/9] phy: rockchip-samsung-dcphy: Support the new
 phy-type and direction binding
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
Message-Id: <20261118-dcphy-rx-v1-v7-7-8de1adac3a74@gmail.com>
References: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
In-Reply-To: <20261118-dcphy-rx-v1-v7-0-8de1adac3a74@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794981338; l=3409;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=v0EnQCVIVEgPp9E4a7EtrkAw5gnRZVFlWGkYOQI4nos=;
 b=Hu6MAklGjeVCpir6ktn95rYPoDSD1n1uj5jiv/hOFAyu+4U60TwODMSVcfBTNTIl9RYzawGr+
 Dz0nfb1zvl2Agytv2YXgVFyTVXlYD4YF+cGciXq0lX0Bim1XPxIKk8h
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=

The binding now selects the PHY with the cell and the mode of the block
with the phy-type property of the provider. Read phy-type in probe,
D-PHY by default.

of_xlate() returns the transmitter for PHY_DIRECTION_TX. The deprecated
PHY_TYPE_DPHY and PHY_TYPE_CPHY select the transmitter as today, so
existing DTs are unaffected.

A phy-type other than D-PHY or C-PHY fails probe. A deprecated cell
value that does not match phy-type gets a warning, and the transmitter
then refuses to power on, as in C-PHY mode today.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Reviewed-by: Michael Riesch <michael.riesch@collabora.com>
Tested-by: Quentin Schulz <quentin.schulz@cherry.de> # RK3588 Tiger CSI1 2-lane IMX219, CSI0 2-lane OV5675+DSI
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 32 ++++++++++++++++++-----
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index 7a62db810d4b..1228bd794759 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -309,6 +309,7 @@ struct samsung_mipi_dcphy {
 	struct reset_control *grf_apb_rst;
 	struct samsung_mipi_phy tx;
 	u8 type;
+	bool legacy_mismatch;
 
 	const struct samsung_mipi_dcphy_plat_data *pdata;
 };
@@ -1384,6 +1385,9 @@ static int samsung_mipi_dcphy_tx_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
+	if (samsung->legacy_mismatch)
+		return -EOPNOTSUPP;
+
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
 		return samsung_mipi_dphy_tx_power_on(samsung);
@@ -1557,13 +1561,21 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (samsung->type != PHY_NONE && samsung->type != args->args[0])
-		dev_warn(dev, "phy type select %d overwriting type %d\n",
-			 args->args[0], samsung->type);
-
-	samsung->type = args->args[0];
-
-	return samsung->tx.phy;
+	switch (args->args[0]) {
+	case PHY_DIRECTION_TX:
+		return samsung->tx.phy;
+	case PHY_TYPE_DPHY:
+	case PHY_TYPE_CPHY:
+		if (args->args[0] != samsung->type) {
+			dev_warn(dev, "unsupported phy cell %u with phy-type %u\n",
+				 args->args[0], samsung->type);
+			samsung->legacy_mismatch = true;
+		}
+		return samsung->tx.phy;
+	default:
+		dev_err(dev, "invalid phy cell %u\n", args->args[0]);
+		return ERR_PTR(-EINVAL);
+	}
 }
 
 static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
@@ -1574,6 +1586,7 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct resource *res;
 	void __iomem *regs;
+	u32 type = PHY_TYPE_DPHY;
 	int ret;
 
 	samsung = devm_kzalloc(dev, sizeof(*samsung), GFP_KERNEL);
@@ -1628,6 +1641,11 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(samsung->grf_apb_rst),
 				     "Failed to get system grf_apb_rst control\n");
 
+	of_property_read_u32(np, "phy-type", &type);
+	if (type != PHY_TYPE_DPHY && type != PHY_TYPE_CPHY)
+		return dev_err_probe(dev, -EINVAL, "unsupported phy-type %u\n", type);
+	samsung->type = type;
+
 	ret = devm_pm_runtime_enable(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");

-- 
2.43.0

