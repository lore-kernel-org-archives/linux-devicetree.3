Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27F4341DDF8
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 11:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785842348; cv=none; b=mSQvvPJkcpIfEzD1jbCG8dS2j2WWpANgcsr3yyK/7cdQu3WhPx7df2nD9YGHzcFdw+7v3mCHaREjkOQzjEBSfBs2VQJvMtKnQcTYJrLAl73BcjPbdw44KSRoJyN+edJ0wzrAmDbnuyeabRrXQNO0vzT+m5IUORRerPpbwqlA9f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785842348; c=relaxed/simple;
	bh=N5DGAXwhICtq46u8tvnCMV1PzPpSyIoW4nGEFMqBnes=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oqJEqwrVfF9+9PKLFGInBRbwzUQF18fZRzEc2tFzKsP52s28t6IXtJbtJnA9tRi2sQ61Frb+YefnCzAU+CgpU3ZuG1t/WZ8oEDvhq3tlHn1v07V8/y4D3TO6VxmDVizAyr6xrdxbyRsP8ug0N0bSwQajzP1Ac62FgSQmHvzKz+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at; spf=pass smtp.mailfrom=sigma-star.at; dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b=eFnVtflW; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sigma-star.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sigma-star.at header.i=@sigma-star.at header.b="eFnVtflW"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f71156e1aso2237331f8f.3
        for <devicetree@vger.kernel.org>; Tue, 04 Aug 2026 04:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sigma-star.at; s=google; t=1785842345; x=1786447145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2ZghHONKKBi4x/YVb7PG1LTu4YhILxIkRapbWwNntgo=;
        b=eFnVtflWzp/GFNHiWsHhxttcrd5zq6TVM4zWFcfQCp2iUPXMLMmEXk60URqrkcpTxW
         rrfZPTeFFe2LtK/QxgziyU/Xb6RR9CMivDYgmbRRJTGQU1J3o3cZjndX7+i9UqE+FeiX
         Bvr36WfSGV7EE1YFVewgWV/+dPh5iPQM0xZHr0Do0P3Zy0A0jps/ZhGNQRcAGsi0KUn/
         dZUMjAgK2Yiz74fYcMKK4+3jUJR9i7XAY+5lNmIWSMmnJFJdUvPAUwe83HaUIZcfCsNU
         AcwooOBtBUsvCR9ZMZEf2qhmfXg0WJv7gNWdNhKv4t51vXsYUIIZxlvxaLNcxuvxktya
         v4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785842345; x=1786447145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2ZghHONKKBi4x/YVb7PG1LTu4YhILxIkRapbWwNntgo=;
        b=WJeDhNnX7z61G0BVW2jovRO/ZmAd7xEdV/HyoRkhufBbw1oHEGehX5N+aSpzOQK2c5
         WYx5pPSYVeutqnzzvdr+J7EYFD4AuddfmggxfM3KlGcAbcKFQgdyUzrWGX53Go272fMY
         1RkBFUu+CirN7Nw5feliHsYI6XuRVTdgSwaCOgoU2o+Iu9jgao2UZssIGH0PkdrVy/Na
         msSUzLoIrAu5hcmQvs1baUjQoPOJ1EYGdHSn7qZV+Tqb816VD6s0CG1x+vIRXMjGI3gq
         P3uQg2C4uByIxyINFFvHK8zNp1PIdKsyb9vlH/wWBQ7VNAy7ybOSr8g7J2IgCxGqge9d
         WtWw==
X-Forwarded-Encrypted: i=1; AHgh+RpK73ReHITmgoETtb+i11ViMuHUZEFjuZCCNo2mVW7nARFw30w3EDYY22vYl+U5U0oarT2FikLq7N4/@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm/sPndSbj6tP/P07tew7JhI42W+61tWJ9bQtybsibApZHVnNB
	ynmjsuSnQq8zymJmXiMw8ZJs54WvrJXLKuDW0oqDLny14zZat0arZJaAZhqTLV61AVE=
X-Gm-Gg: AR+sD10DK5vT7dQwgHvNTuFFoegSYbyJlbW+tVvOq1FSZAjzRk0afQGEnlmQ8H+MH/2
	GQ/tVqIpeaTQK8IA7g9qW2TNygJqB4FUOH0VPEiXUSYQ8QBp4fL6I2NW5rayJnufVLdX/MB7SAN
	g836puqqJ1lSz/F5u+sd0edYVyO2Z7KiQ9EFVJvjDOuvO8SjgE8itoH/GOdvqRmo8YsT0vgBzCU
	poMYi/ctT0hfVBNS4Lcz4IG1Hx1XsuKRl3YY2jxIHCXiw9YEizVVFnJhFudbBNuN9Ybod6asEeW
	EMFoLFD//2MeUMTdJ33E75Us0vSHBcNbqAyJRF7/VqxYxpB+lnj5lG76KOdXVJwB6pnfD/vnvMx
	Ndu6/hnrEqngOoXBJfivukLCUNjukcXOu/yA0lCWOJkrhzpL7XIaLXxlYnDV2KcskGaq1FFIf18
	UA5zkZGEKnJLaUqWW0abFeb5Z4MiZL5QUqLj/+dnkPufZ4ENIwctxaXeEMOGwiMbJGPUOtN+yln
	f3E6uuq9oq4hGsDpVtu12oCxNy6uF5++pHTHgs=
X-Received: by 2002:a05:6000:41de:b0:47f:25db:8161 with SMTP id ffacd0b85a97d-47fd72fa195mr38835127f8f.28.1785842345442;
        Tue, 04 Aug 2026 04:19:05 -0700 (PDT)
Received: from localtoast.corp.sigma-star.at ([82.150.214.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd458b05fsm44414682f8f.28.2026.08.04.04.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:19:05 -0700 (PDT)
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
Subject: [PATCH 1/2] phy: ti: ti-pipe3: allow configuring ACSPCIe TX/RX mode
Date: Tue,  4 Aug 2026 13:18:48 +0200
Message-ID: <20260804111849.92046-2-david.oberhollenzer@sigma-star.at>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804111849.92046-1-david.oberhollenzer@sigma-star.at>
References: <20260804111849.92046-1-david.oberhollenzer@sigma-star.at>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Besides power control, the PHY control logic in the OMAP PCIe PHY
subsystem has a configurable reference clock selection. It can
either use the ljcb_clkp/ljcb_clkn pin as inputs, recovering the
clock from the bus (RX mode), or generate the reference clock
internally, driving the bus pins as outputs (TX mode).

This patch adds a device tree setting to the PIPE3 PHY, allowing
the syscon node, register offset and RX/TX mode setting to be
attached and set up correctly.

Signed-off-by: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
---
 drivers/phy/ti/phy-ti-pipe3.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/phy/ti/phy-ti-pipe3.c b/drivers/phy/ti/phy-ti-pipe3.c
index b5543b5c674c..801a6239328e 100644
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
+						      "syscon-acspcie-tx-rx",
+						      2, args);
+	if (IS_ERR(regmap)) {
+		dev_warn(phy->dev, "can't get syscon-acspcie-tx-rx\n");
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

