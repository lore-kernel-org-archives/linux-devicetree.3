Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794298728;
	b=vXxHZy48CqUnH3y+m26hdFynEij1hz04l8NTgq7g/eV8+yS7E1DdR2mIEX/mVqZqXOQd
	 bZ4OltrCtZ0CTgxxN8L97goCuqYlbgTKtqs/aCbiARX0P/PMYEeedtgEZhyWj6Pj7Gc0+
	 1x2OdW2zxMMjgHVvpL7xHVLp9vHPYdRW2ZlPOAq3TC8NZV3mEMi2Gi7wPNJXlV+8AanYh
	 kE8MlpnRygYFfVa9gho5u0syVkwA4f1xpoecBwRiXiXzRvZ0twC9qyjaZj+9Ij4Rgh+V4
	 tPwljvFgL0mpTIvOJviFozKVGD8ZfGAlyeGnaKpmMVS2NMkh4nGzpb4vdGtXQrkSK7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794298728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=jXCW++VVO806qSYM/VOtniyWY+nkvvMGcOGUW1ghuaM=;
	b=3cj+LyGhj0Otu82Vp19X7gjt2ApWeVnDxNSggCqhmJFT/xR3Uk0orpp0gIJk80ZIix7j
	 080JZt4U1BrCjD5FqNoNk7AqQks+i+VhfTjuPmxsFDJWfeGSVIWS8LdZN6DKvQr8SwQzV
	 5h8Jw0SVpaRmZ5HK9g2GaJM15idzPirH3PQsq0br7IF3fEUwKowAcXuLdV89u46k8MZ66
	 ++TO6s5gZm/bEqQ1w0QdPiF5aDxtAdh9FxNuuY56+YL9WhRZfQgOO83ijxqk7CBp6zpVp
	 D5lW0ePsO+sPj0qxgtZRkGVfsAzfT0KEB5UfB/jr3OYse3s5hmQNlbDgTxKsRDEDBgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QJYEtkEi;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FD260A2621
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4FD260A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QJYEtkEi
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36ca32a0faeso160702eec.1
        for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 00:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794298727; x=1794903527; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jXCW++VVO806qSYM/VOtniyWY+nkvvMGcOGUW1ghuaM=;
        b=QJYEtkEiKtmq2GEeZvBTGRWBvgjLbbOWmlitgLMK12B50B4dxaiK47EndQlLbxv+6y
         bIMXCLP2rAxXFmhc+18bPCoLbIYG/5RmmJh5IDb5hyVFI+ev2yoDuFKuompGSZJka8NR
         0C3ltVQlyjafi8hUGqUF5E7DiuYOwC/e/c6EUA7DnuwPpY6GCBpy286NoflMeHbYfb+4
         ioRcwGjxFvTqFp8JBN6L12rEbLHgpIxYLKlWnzQHlwmWPjPhHqAQzqVyxGUML3Er4lc9
         aRvWC5v11c937ulccLPkWpMAsnOXTRmT1J3DV5QsxBG6dQ7zE3vMJK5Jm1avXzvt2DlY
         7WHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794298727; x=1794903527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jXCW++VVO806qSYM/VOtniyWY+nkvvMGcOGUW1ghuaM=;
        b=w5verZyO6UKiUfxnPzJ/UTDC733mLc0xi/FvTRfUQyb7rQeCIvizXNwYSUEoHEwzfl
         PRsBD3k5xxEi89N7NEh76vZ1EfIxMgbiCB6vxH1qNHfV/vk17f0eUR57oxJ6NBwbDgtZ
         4ikUxha4XocC6opK/rNMxuTgyYtQbaHJZKNqoWwBZYbB/E6hrqfBeKCqaTJ3vBFjU//z
         /JLMBGIMOJ6MkmJQ8WKCm/UPBt1rzzrj0y9eDNpc4r0lsP21KQzjlewQWi5g7ONLnsb/
         MbnyswqE/4mzAZgcGsWGnAjlyeh0Unj6Hd9oyCCm5qMTsWOMTkzxuh4tqTKgmEElZnOb
         bRNg==
X-Forwarded-Encrypted: i=1; AL+hErGCQmGZ7sf28fzt3mZ2GKDV0poi1Q+afUWleRn5+x/cduGS4BLGN+FmzLY1zqb0CjNJTobqpTg6HtRl@vger.kernel.org
X-Gm-Message-State: APuU4Z8xGXyECHKAHbPfA4gIdkT5aI0oC632qT7VF/MVIrlgpJnLV1yI
	UTDcRBjX4p7dIgreAozWd1Vh1ZCmDcJEsnunPZZBtMlE6njRFOEuiev3nmGfYQEDQxA=
X-Gm-Gg: AYBFou3jVC7gAyKydtk8NEkjyBpuLcoLEqRUS9Zv0jFDjguKa4HWXpGi54EzqvbvymA
	2KD58Ej2EraWa1pILFc/ZgSGb0GptX7tIOh8MFPUTI7H+jL+MkBJkeGg6eDrTzSQ5kpDETnVE2Y
	kHS52lHwcscHf7MhTpT1YBC8GnAAba1For8gQhVpEWMAz54b9hVopzjrCyjs3LEMKBoUy0kD663
	fDPSqNYVwmINdMFvoZiRbdKaLLB9eWuOylHc0Mm6yKmhDl8BjgJ+OZSRBubGL5b9mhfnBn60EZD
	YqqqGjfXvJP5H/vfN+XylJzl+dq0syShfnoOO0vpMrwQF8A/pQ4Op5A9y9w4BM3vHqnH4qpJo3/
	7cQy/JbqrJ7Zjfn3ISEjTvXE+g9jXsEKnmTMBlLMSWjgILPmzATSdLGXMHgxdC3yMOXHljp51Yx
	ZZVfYx+z4TOml+5e4qcRtdyP4IKoqPymwbWsFMnA8B5pPHcCxV80pWkF18fVZLdR0mxRGBAGbc2
	Yz2+ZSTjOf4eWORTTrm/RYO2Lf4llkIQE2dRwGJ0i2AJMKvmRsiQw3J2grGaE0N59+HwILmrPq7
	5ePaJEq+3xDoXLpkCrYQ9j3wsKnaCgFneZWJYmYsveIRSASRXp81bGliwsh0
X-Received: by 2002:a05:7022:f502:b0:17f:641e:7f6b with SMTP id a92af1059eb24-1b3b5fbb37bmr3714465c88.1.1794298726441;
        Tue, 10 Nov 2026 00:18:46 -0800 (PST)
Received: from [127.0.1.1] (211-23-39-77.hinet-ip.hinet.net. [211.23.39.77])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc14sm5236759c88.12.2026.11.10.00.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 00:18:45 -0800 (PST)
From: Jason Yang <jason98166@gmail.com>
Date: Tue, 10 Nov 2026 16:18:10 +0800
Subject: [PATCH v6 7/9] phy: rockchip-samsung-dcphy: Support the new
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
Message-Id: <20261110-dcphy-rx-v1-v6-7-d681ba20b36a@gmail.com>
References: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
In-Reply-To: <20261110-dcphy-rx-v1-v6-0-d681ba20b36a@gmail.com>
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
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794298692; l=3244;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=MPlZcYdBOTjm8N+T+zD2aiKGVlTXPixFaSZAXRG0uQg=;
 b=XVX/t4VGDXdsU4HAGnmDCJBr3P5Q0oy9IN4FMcahsrkLVyV+WADTyFODqoZvgPE50AThjSsY1
 ikf+XRGvmjbDHUXbklTj1jfDUcwtwaj85cfRiGe8zNBMKCeJSDQxIOb
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
---
 drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 32 ++++++++++++++++++-----
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
index c40c84791eca..e8e229fc4856 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
@@ -297,6 +297,7 @@ struct samsung_mipi_dcphy {
 	struct reset_control *grf_apb_rst;
 	struct samsung_mipi_phy tx;
 	u8 type;
+	bool legacy_mismatch;
 
 	const struct samsung_mipi_dcphy_plat_data *pdata;
 	struct {
@@ -1376,6 +1377,9 @@ static int samsung_mipi_dcphy_tx_power_on(struct phy *phy)
 {
 	struct samsung_mipi_dcphy *samsung = phy_get_drvdata(phy);
 
+	if (samsung->legacy_mismatch)
+		return -EOPNOTSUPP;
+
 	switch (samsung->type) {
 	case PHY_TYPE_DPHY:
 		return samsung_mipi_dphy_tx_power_on(samsung);
@@ -1549,13 +1553,21 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
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
@@ -1566,6 +1578,7 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
 	struct phy_provider *phy_provider;
 	struct resource *res;
 	void __iomem *regs;
+	u32 type = PHY_TYPE_DPHY;
 	int ret;
 
 	samsung = devm_kzalloc(dev, sizeof(*samsung), GFP_KERNEL);
@@ -1620,6 +1633,11 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
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

