Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0CD1ADC97
	for <devicetree@vger.kernel.org>; Sat,  5 Sep 2026 21:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788642971; cv=none; b=aa9ZrbZY99lmju50erYk2tNa2o0tm5cBHAOqP4G7avC8GCbxy7hynVDpli8xrfgjhZE0CyYPR5XLKFBj+GQZbcrzX8vJiRp0DLek2QhKjABzZfsA7oKXQuiPjkHriH3RVwAt5WumSkymuMtDHlTUTAP15ZJyQibb5HuJkUtt9BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788642971; c=relaxed/simple;
	bh=jqRhGy7efJmObkdpxb4H8/kUs2ksy+nEB5wWPEvSvls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b7cm/cFBp6mscuPC6ehpcSA+JiPLJi2Cd/Nz2X5Y1TFRcnbD7PkHQZ800GRN4iNkooS2VdW1bBhDcJc6Mr1UE5TgS6lOB4ER4+7rHNU/SC2Y+d4AHSrVZ0F8zeOiub2SIfSCjsirM8GFcJiLVLXrecmp1iAerv+Fw7NqAzONXUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=O/b68k5S; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="O/b68k5S"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so28331315e9.0
        for <devicetree@vger.kernel.org>; Sat, 05 Sep 2026 14:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1788642967; x=1789247767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tu5iJEo6nOs2XgpyoZ9iLxBXAex16zJHHTE4sswtndw=;
        b=O/b68k5SdKo0mmzflaNJti44D9VE/8UKLNWMI+J+JmzWON+TcOSs2uZmoHyNdv/LYY
         PM+faMsB41qF4YnOJ4LidZGOSOpQ+bvtT5PK+AegW33JLfLRhw0+8gc47dgUjeUWeTDX
         qzxZOQtmwr+04kCfr8JLZFSrx1ghghzQGVuwkv9wEJjbrnJdZ931/5ywgKCnj6kY4Vmd
         N4kU0Yhxti6obqpaBljFHq4KtdLjcvQLHX5+SJnn6sCCrv5+qqeUt6ZoNrh3hDpAG9x7
         X3cwWmNFxEAPv7UiRXj9C78uslzFmrPja4IM9vG2JGZzvH/1ftp7Y4bswrMidNarjkra
         +K3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788642967; x=1789247767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tu5iJEo6nOs2XgpyoZ9iLxBXAex16zJHHTE4sswtndw=;
        b=RU2BMD3tsfsv8Duzb1IT9dvzDNWfY7SXQdycjpiTrkdBtiooTljqveRdd516aT3UIQ
         jnvlhHjbv4o9jWcSk8pPNk7xsIoigybcG2xfWSh0i7xjSKIAQK+/OexWFLQ2GzVOTBg2
         nayI+utCyaFlbBk1g2YiLhUPgN+JTe3pgfz9DvnIl6cCoQe3sY8bJXnHi9I7uoyfVDEt
         RI4QxVqDquZQmY2Je9o51cbe8vMf+yODpNDwaUsPykfGGH9CiFo5O9yxx/JY0geMPj3+
         CtXjJddswLmGEbKWqlEVezAMOhdH2BO3N8qUa35qA3OseieyKnFcARMRXW6oPXO1YxTU
         TrYw==
X-Forwarded-Encrypted: i=1; AKwUvBz0JQaC3pCRg+AnEytOaQblNBBSeQ/VPDgMm17yROpqf/PJM+KDgbALEtiGkFCE30wRsviqG919qIcv@vger.kernel.org
X-Gm-Message-State: AFuF++nxHM36ZME3/uUR04TZYmCO4jz4VNfAUBStWNgMm2eWrpOL9zJT
	LEDUKlAvNCk2bkymyPU6ljgUZmB5Zxig0pr2xQxGbhf5vunKNwhIKRuq87fzcnHsbQVarNiqib9
	mflGSXmCM4A==
X-Gm-Gg: AYBFou1Dvkqfkw007tMm5/Es6s1qk8Bk0xq4fZkv6CojIe//HUm4vhIF6jv2ckBZXxa
	NLo+kfxWDehiDel6aIyVa+4SyK8sQuwJZouCpYRXFaKOar1H04wezFe9GAYjbntXQ9duyt7ZXsc
	BWv7AM7SwbclqzVs19jC+FdAgo+AbS/BD41dPE76t00Src3JKPHK0JoX45NqPodycp6jYY4HhH6
	umerhUni7q6hO3+pgvP2eKyw/8bMIOOuzBSvQI0B5f/kJubY65elU8dm57T3Tx3uqxGTv8yC6et
	SbwJtCCRhvqkUZZwf9iFtDiZYaBAnsrgtdnzk/hthRAvA9PMlymCDjcSK98JLNffvocrgNYfnY9
	BHDRRcZGt1TUotUob4dWL4gFwFWJjJ/wRHII7bBalFHj+bPhKMy57ZVS/ThYUqOdjGRWhy6tkLi
	6Knzg4fL8d979nRP8yIXr7Dqjz9Wq+MoUwyV4el/iaOjHLT3prQEzhbmrb6j3xdeqUwcp+dOqBK
	kfIfdzimlZ7ALx9wDQBhMOgRl+yF+iRGan8IoVTD0E=
X-Received: by 2002:a05:600c:1c24:b0:498:952:e276 with SMTP id 5b1f17b1804b1-49cf824894cmr159819725e9.8.1788642967596;
        Sat, 05 Sep 2026 14:16:07 -0700 (PDT)
Received: from localtoast.fritz.box (clnet-p04-043.ikbnet.co.at. [83.175.81.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5952560sm261416695e9.3.2026.09.05.14.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 14:16:07 -0700 (PDT)
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
To: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	vkoul@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	johan@kernel.org,
	rogerq@ti.com
Cc: Julian.FRIEDRICH@frequentis.com,
	upstream+omap@sigma-star.at,
	David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Subject: [PATCH v3 2/2] phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX mode
Date: Sat,  5 Sep 2026 23:15:55 +0200
Message-ID: <20260905211555.15944-3-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260905211555.15944-1-david.oberhollenzer@sigma-star.at>
References: <20260905211555.15944-1-david.oberhollenzer@sigma-star.at>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the PCIe PHYs, read the property from the device tree and
update the RX/TX mode selection bits in the specified syscon
register.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 drivers/phy/ti/phy-ti-pipe3.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/phy/ti/phy-ti-pipe3.c b/drivers/phy/ti/phy-ti-pipe3.c
index b5543b5c674c..bc02010dadb7 100644
--- a/drivers/phy/ti/phy-ti-pipe3.c
+++ b/drivers/phy/ti/phy-ti-pipe3.c
@@ -115,6 +115,9 @@
 #define MEM_CDR_LOS_SOURCE_MASK		GENMASK(10, 9)
 #define MEM_CDR_LOS_SOURCE_SHIFT	9
 
+#define PCIE_TX_RX_CTRL_MASK		GENMASK(17, 16)
+#define PCIE_TX_RX_CTRL_SHIFT		16
+
 /*
  * This is an Empirical value that works, need to confirm the actual
  * value required for the PIPE3PHY_PLL_CONFIGURATION2.PLL_IDLE status
@@ -785,6 +788,24 @@ static int ti_pipe3_get_pll_base(struct ti_pipe3 *phy)
 	return PTR_ERR_OR_ZERO(phy->pll_ctrl_base);
 }
 
+static int ti_pipe3_acspcie_tx_rx_mode(struct ti_pipe3 *phy)
+{
+	struct device_node *np = phy->dev->of_node;
+	struct regmap *regmap;
+	unsigned int args[2];
+
+	regmap = syscon_regmap_lookup_by_phandle_args(np,
+						      "ti,syscon-acspcie-tx-rx",
+						      2, args);
+	if (IS_ERR(regmap)) {
+		dev_warn(phy->dev, "can't get ti,syscon-acspcie-tx-rx\n");
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(regmap, args[0], PCIE_TX_RX_CTRL_MASK,
+				  args[1] << PCIE_TX_RX_CTRL_SHIFT);
+}
+
 static int ti_pipe3_probe(struct platform_device *pdev)
 {
 	struct ti_pipe3 *phy;
@@ -807,6 +828,12 @@ static int ti_pipe3_probe(struct platform_device *pdev)
 	phy->dpll_map = data->dpll_map;
 	phy->settings = data->settings;
 
+	if (phy->mode == PIPE3_MODE_PCIE) {
+		ret = ti_pipe3_acspcie_tx_rx_mode(phy);
+		if (ret)
+			dev_warn(dev, "failed to set ACSPCIe TX/RX mode\n");
+	}
+
 	ret = ti_pipe3_get_pll_base(phy);
 	if (ret)
 		return ret;
-- 
2.55.0

