Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765697;
	b=0uHiV3HwPaRUoLnvdSX/6oz0t8MGjBvbCvbCNkdtZgX3JsydpjLQU0eWfguNN5ppyg+n
	 CgaShUvguofKrpFYJh7j9iu3WrvKz2MFVvDzRHvDG/uoIAYhjcfOh+ZTln8/XAuVFnUoL
	 q/zVQtKYwtAyukl24z1l/COKNdOf1Dgf6HKodoT9U5mqBGgqS5dZlB+2fgbpc3B1bfh2J
	 xoFOfxdjNRjdDEe1tbfiOVgQ7FHlAA5wVJIwkTU5b9jGBSzIEi8uhSPjRuywnG9O3ysi+
	 kxczDwWbP1Wyz0SG0jI9oAfHDqfkw4bHMAMRVZYNh7Y3OyVQJf59dBq3h3BFJXeZbPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765697;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=btRAcHUeA6n57bmtR6kPYkSdBmN+obmF05HBvyePiOY=;
	b=jBBUalGx5pzM83qhJSHOhvYcivWUguDN2Yg8Qnrq08JDqcpEjDLK18VLTXAhqj84ZW0p
	 U2QgGjhjroHB+QxWOln3MzoSa10R1BoVlabfA2alKVVWwQulauluPOORswhynTZQZuZzE
	 +NZLSD3bBhokqyqIw1Dqash7hJN0d8mvo8g7Wo2ohA+MCEZMa9BLnDwVQuSX+SCaImrMu
	 oiWs4MqZVJsEzkAuZtX9ExJSYmDLb1QxkqHww1CWRPFMaUGhEOdC6Z/Vfv6kColjdp/+m
	 70U8/e3YsUBS4vZeBBTJOf1YZfinCtMC3ptVcH/65D0gk77Amu2Elv9Zyzd7dz5WqZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TEIhaed5;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D690A606A324
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 07:48:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D690A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TEIhaed5
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-386c337edfeso653949eec.1
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 23:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795765696; x=1796370496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=btRAcHUeA6n57bmtR6kPYkSdBmN+obmF05HBvyePiOY=;
        b=TEIhaed5BUkue3nSzhfFP7rpywvO2ZleBMubiW3WoLdr5UUQafAPZomLZDasx63b0M
         7RHCXO5sXXC1UmgjDw7lAeXUR1q1CKzlu8xNb6Xazm+cfpr2/8LsHRwlPYzLIJCzaDkQ
         erNiWJz6aWClDioqGNFEsAdyz9Tri7MGj3igrxyspOZGH99Gztb5nlSeGG33b6cMPoeF
         IK2Bhspdv1HvRU0J0sdR9OLYkq8fbuw12ho1pgj/xcSh7qfzuPqhhnMJshx9UtQIUf3x
         BewXDGsMLQ0cTZ0DGT6CjY/6tOyIIlUGGrMvxmFMx5gm62Y3CNzH45XaT3S+hvgFLTxF
         50uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795765696; x=1796370496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btRAcHUeA6n57bmtR6kPYkSdBmN+obmF05HBvyePiOY=;
        b=ZEEabo0au6dq4Qo7Q0uFOppFxZ5zx4jYCEH9GojlX0vBbVL00+JLgQBsIBjLxDcZM3
         3lg9l2e2BohsTLyLQp6Zebk5+gDEIdtQBDzOCNgwN9RHkLusor3HwVPFFtcMp6/Rqerw
         HJxg+s8+uEXMviwLEZCkTHNgFZpt9MMvzyqulkIgECfNW1j7prPdZ3FI3eTAh14gt4c1
         UVPRb7k0P1r2bqb9Fq42hAveM2ICeToxTb40vFsp/DMbVDMPyqWma9+1dvCMpjyRmIHV
         DDb2l2NAqEEXYlhX1Dty/tZLXa5sAd75V76x0ZXyflWHYu+6rHOxao8wlW07ft+KHQML
         eiIg==
X-Forwarded-Encrypted: i=1; AL+hErFhA5IkOHsmW3Zi5/i7C8xLOQv7Gwg6sL/g4aFURaQZ69gZSlTZ2d4ov07T4Z9yahNWii/WEd8+UB08@vger.kernel.org
X-Gm-Message-State: APuU4Z+OSFv0j5OYlpXLFPeGELK6xEIEgWtULks2IdLLkN73BPD1aFl6
	acM0tQFE6xQCOru/ZwuRiMGTE7IZWFjKDaARELYsK0Fh1Dx9S9hCiTnj
X-Gm-Gg: AZFdTZe5qPtCLkckWJVRwDZ0XHcl6Wk/M7a44b+a0KApmDbFKwZlHAUPOIWJX48DRks
	OnnZUA29nI5R9RIs54qJKmSRK86jUXi4oASId6Gr5JCKEdJgU8ocf9D8YhcgzJ+bwLv7Riv2i4b
	tVvpQUk4tfWCThhVyiOL1eK7Z3wZGgN+TwLp9OgqARsC13hpWJgriGKjG0uMIx1blD2YjOnDbQQ
	4r08L62NbcCdnqARFIwsCSIFEdlZ7RulL3dO36FkibH/CGImdoaVV2dphWQjySo8DvXRiIkDLU5
	7WFIU9qhjDPpn8sjgjCNm9uJ3xg+mWRLfqI6ZcIXVxWDGRkGz4M5rsXSpjPK+3d2mAfjDB4fZ4l
	pe4KrhBNZvwOSH3PyrfTZFeC1D4Q/5pf1naUibVCQOgldaTRs37DYoZUW+qWuVlTs50hEsMVsLp
	yhOYG+FpkOvLox1/lZ8eXemMMdwXocyMa6Kj9EWLGW3ZB+G1a2ZezuTCEdg2a/BbKNfo2yAOV2c
	JcHKht4R8kmSew0ShHQIAUPEOlHCHcmAYGf8LaIe41x/YtKOYEwf/rJgjtuHORN3p/9e8ucnc7v
	d+ZHjOnqxr3iuzgyRNgQGIm7BdYhAJdmNRlEgtnwjVQYmviRm/rMdScCUNNYhrTd7Kee1Lf/moE
	3hl1LMJQB4zLwydBAqKWI
X-Received: by 2002:a05:7300:1c24:b0:384:a0cb:a6d0 with SMTP id 5a478bee46e88-3856de58f7fmr38385259eec.1.1795765695496;
        Thu, 26 Nov 2026 23:48:15 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm68098252eec.15.2026.11.26.23.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:48:15 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Fri, 27 Nov 2026 15:47:43 +0800
Subject: [PATCH v8 7/9] phy: rockchip-samsung-dcphy: Support the new
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
Message-Id: <20261127-dcphy-rx-v1-v8-7-9ddfef99221d@gmail.com>
References: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
In-Reply-To: <20261127-dcphy-rx-v1-v8-0-9ddfef99221d@gmail.com>
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
 Quentin Schulz <quentin.schulz@cherry.de>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795765664; l=3409;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=v0EnQCVIVEgPp9E4a7EtrkAw5gnRZVFlWGkYOQI4nos=;
 b=XiX5z22zG63/plqtYdcSm4E2TGg/Wou7ui0q1v7PAXRCBGrd6wMD6SQdncjXk67WIz/1fFgAc
 GUjFYosi5NGAUuUppRZIHdIe39iOkjV7zHhyzD5BQKdlCRokfAjYp6v
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

