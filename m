Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F36A3EF663
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:11:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786007491; cv=none; b=q55ifpkP9Vxdfy2QrO7U8HxxKbDWL71N/O3YvQRFAtBcCwdL2pYpSRtEn08BULEbT2CGLKwu9yU8QiM8ZQTbiL8vmZhO6L8VPn2ExKSth3hvX6xKbgQu6vPMya9RIWVxnQijkhsglL6wKBB4+gfU79i/qjB7Ltuuo+Ru+DuLS+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786007491; c=relaxed/simple;
	bh=jqRhGy7efJmObkdpxb4H8/kUs2ksy+nEB5wWPEvSvls=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fwyDPgX3ao8LBW2UGeWozSKwLQjLvE/8/FPRzKwAj2lcK4BV69gcHzwQrH538EMwodYVWedBIkSmIgQYEogs0ztP3yMQwuc5CMaa5Qr84FA/babaDXZwBPB1p8a4hN7EakPWEI2rquS1ZwR4tx/fFkiNSprT6Vl2sSlAc0554KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=AySUClbV; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="AySUClbV"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49558ce01afso13813945e9.1
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 02:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1786007484; x=1786612284; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tu5iJEo6nOs2XgpyoZ9iLxBXAex16zJHHTE4sswtndw=;
        b=AySUClbV6eWnI8/RE7HU/J3j2CHYig8yM7o3PtuFyXbfyxHV45vxru4MUSEwm1SyP3
         9TxNa/s2pF8QA9sgYUsmI2gjEZUubP11JB+QNoj6/zSbftmZ89aUS7NGgyzfgFhMmcSO
         JPJcHGfCGCUVkDric9JuR34CQDtmEb4bFjEnz+yzVoM+Tin3/ue+o2bGUTz699YBAseA
         g/7NB/Z1dUIMj3xK6W6BzkvrMDXYuAYI7YoPRGoWB1/VoDsU/fgqiU9xdYnH80gzWmq0
         PWolKLPGK5WqaqmhPD/5NfGTh9CkVmdzDd2n8GFoeCdvk4kw195zrabV3Dwdz1432/SK
         f6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786007484; x=1786612284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tu5iJEo6nOs2XgpyoZ9iLxBXAex16zJHHTE4sswtndw=;
        b=WjKVeVhLERy7kz9HU/fbNG1Z8OPTtA4ia37FisENvkiyLJ9Y/o3WCK/FxTHPpybhxl
         iAvJMkxBNqI+iJ5+mK/iOZ7oXr+lkh3O70+xdEd1u5X+gPP8VAfEQqRfXBAMev7CIRxt
         6Yj6m3f0f28xIuvdWtcvoWDs3K1CrLm10Cx8W32I1UdfyqAkp67bLrb5eWoF7Gk7l0UW
         TdMSCDVQobp/vGO62yh73zuS7Ri5h5CnGh7Mk+Nj4gu02y7mqiidgT9KxDzWruKI2Hnc
         CA0Kh/oFn+M1nVPSjdEBHDD5ufakFZ0BuhGZ+eMMtBEhWmKCcMgdZdAX3sLqem6SdkY4
         zb4w==
X-Forwarded-Encrypted: i=1; AHgh+RodC60GNVCfL+i/phjCIeHqe82LKunRjpl+ETrRCz/kxcD9wnBC2MWJPDJOkDYOY1z+JkMLRD13zYvH@vger.kernel.org
X-Gm-Message-State: AOJu0YwI/S7+58k4ZBtGji8+g64v3sNOELDJBt/YIQfEkkFRUnmtllAf
	yTr5N6xKPHBuvXEBfCYcBXcG0WnF90NkKS31tBOfOd7x2tCeJ6C7C4mnVg7Z3iWCb3w=
X-Gm-Gg: AR+sD13tJvusP1v0ugLbJVk6Sh8kCMsSyfrKMuuAyH3a8+L1JwzlmpNvoSYJSZxIqDc
	IscJHaDxxtj8DQ1c+MzbkvfUb2LgO4AqHf5H6nzAwg66YnZuHn/pY1/WNhexDc8nOW66gyAJghz
	Evu0+VoEJnehrj0HmjkYe+CVWKPplSSlFhnr2qFMxF/UpEXQeLt/HK02we46l8XmJ8g1uqKU7bG
	+fsxrtFuWk2+evAZuMO1U6K0fc8V9onc9FTSSz7YOUPU/A8DA1PcPdqYZuSnbbHlfABqKE8zdaa
	AYzENB1rnhkizh82m74lozeloKK296ZLJMzmCtQGvGwtgJHn/FU25u/VZUyfQvUCTfXCDtjyufo
	ufORmG6oCz4EbAJRqlntS+ncxSIZ87PWjtkPRjf2sYxFmamF/rbeHoUg5+Z7zVGt6OAdg4LIRWb
	BGnhBUyRjXF4O3hJyrg/L+3yeyczWSOgjBhIF7/nX2uWsZ8EP6400veP/g8IzVvLLRbv8WEWkwX
	4EObv2+hRU6ZEGGaI0FyVqHCUzELcyNR1hFsIE=
X-Received: by 2002:a05:600c:354a:b0:496:c249:dd9b with SMTP id 5b1f17b1804b1-4994e7c594dmr174612905e9.13.1786007483869;
        Thu, 06 Aug 2026 02:11:23 -0700 (PDT)
Received: from localtoast.corp.sigma-star.at ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ff7b31975sm4035213f8f.33.2026.08.06.02.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:11:23 -0700 (PDT)
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
Subject: [PATCH v2 2/2] phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX mode
Date: Thu,  6 Aug 2026 11:11:12 +0200
Message-ID: <20260806091112.164695-3-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260806091112.164695-1-david.oberhollenzer@sigma-star.at>
References: <20260806091112.164695-1-david.oberhollenzer@sigma-star.at>
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

