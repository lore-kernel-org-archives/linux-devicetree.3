Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572338;
	b=cxb6/iZ8lETnpxt5ZY0mqSSe2mmrCySO3e2V3ymzPrsuniZwJ+ucsctqDOKSaZTtMUkn
	 HdiyDiJw+3dLFVmf6I2+xo3f8LJWzjhGo10CIoaooB1WVIwkF4bWIUom44m0Na8FBUEEo
	 e0pu38bna2gUawPT08rNL0aYZtvcX7eJVedTRHxkG/hepAlLgroawoTPFuMVGcUxpCNym
	 jx6cixp0f0e4amNoFHFj7fqvfVGqOicIp0rcYtp6hvqEK6HBPWlGxlgDbSANvOPIrZeyx
	 5rQLmFKiJvcehCJ8ZCwVB5F5nZtP3x4MPHbO3ytPAOnn+hNlWaCqSfaV85ck5K6uNFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572338;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Tb6BE0R49kXMcQ/rHy6An/pZJMM7XZOtIB+MBfpG+84=;
	b=cXCwSf4lw8KNHp580F3vGur9i+8EOnHSnaycVkKoyJUbuacL3dOvnKrpHft9cgxjvZgd
	 MvRgDWSh8PzsZI+zAGQjPPljT6HvtoPpsCHLx0htHn+h3e+SiX4lZXffffxvmQ9S9A3/6
	 BRt6a7HlVeW0PdqV4rVgCUBdlb0Om903bXZ2sT+xkr4bZc7gn+ES34aUcWAHKUt30whsv
	 kntxETiF5WfAC8DC9Y1mtHaokAWr3jnxjkiUMVL3Klt/eZqZkvOQAheT4+4yhGOXgqpiJ
	 gatIfYLWl95E0XpNnLlgiWigfMB8XV208wFTFDs9zfk6Nj2kIzH07ciYP1DusEX8xtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0944606A8AA
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:18:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0944606A8AA
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so11263095e9.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:18:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572336; x=1795177136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tb6BE0R49kXMcQ/rHy6An/pZJMM7XZOtIB+MBfpG+84=;
        b=y39+ASpGKrq+HrbscX3f5nmP2p7uQv9qGBuUYJ7OQ6aQzRt1ervhJS/OnB+RQknVI0
         T88C4D1Lk7H2ArWrkwlHTVxzwWKpjOqfch+uDDfkEKFBGwv5E6nH8yoqlU47qDU4S7Ij
         0HX3N9smHqq+qqIhKqm0sY7+b1eHGrLZECAqFwFrwYvUJZ0uY4P/AzURCjyRRaCdha9K
         FcNnxMLEeDmbpGwZS9WuAUNiU5+DwddmHW36MhOAeZ4f0L7WnVwGKmUKYMrNLITWTrU4
         HNrk05G9zYAxWbZMNUq/IxAri36dTbrKM1mMerp95cdpVBnUXOm2ERf9F4aHhMvrEZe0
         uGKA==
X-Forwarded-Encrypted: i=1; AL+hErHWNd5CDb8ZPHRXxrK4GAKlvtWAsU7f6QO1/eEDbB5iXdn0DU0HVZ6EnOVk3D1QGCUi0nYYys1deXAi@vger.kernel.org
X-Gm-Message-State: APuU4Z8e7dmDdZiLmTZtDzEqpg2B+xgJq6gWaBgeryv4Rw20F/0UPQVR
	E7UNiFecF/CIg/zJ9K4qrIrlX6JKDDNVDq7cYCBffKm1b05ugvsq7AJt
X-Gm-Gg: AYBFou1HKAsJ7zv8aaxOExnYmNbZ9iTvIza4iAXMjMFpM8ZA1OawU8DX6CgEl2pjDjX
	h8gcMzpykcyyI4jl2OMPXFm4jHOQ5AECLQYZBrx2ip+ukiNYDarr8G2lVMOTfKKYBmCLHA7Ya2r
	dNmw6Wh+hG0fTZZbAy/b4YMMKzrCyva30dUQQAl1i+9ARtnxl2pl/kY+Qe8XlwYm8AT+Nji3uRh
	fuWSnTi7XBxqJynYmBqkihIfkKg8KgLYe8MCqyj01/1Q1u8cCpdLpEWa/q5ghZAerx9Vtyv9fTq
	MuxQrCApqmRr+hCj1aHOnO949dXut9Z9Sfn+mdlpoz47VBqxnZjntq41XARAR2Md7cZP+1YzmpK
	MOZQ0WHbmRBm1RWdX6jWp/n6kdq2w6u7Yd0LcADCxpJ/V8fy7KUw4RLY56qEnt/tAagUcJfSWQD
	fF5AFMSNeVSecc8uIx9iciVjGnsyRJq/H7fKnGspGlbwUYihf2gTPKqHadCsKouXkIYXwUSQYGN
	dIP02aUup9eD1CjRlLYxjz+uZVLJakIsCMgB8S+SQ9L55+D9g9CznhYIaRg5ROc02825THWzHqx
	JpUSbxW93dIqShph5QHtGoB4wPYzmYtdxPaLK8scZZ2yrt8SmdEYf1+GIDZnnFFDnZh/IIVGz/4
	1tT4Riwo+RdIkPtGY8+EhjV9h
X-Received: by 2002:a7b:cc16:0:b0:4a1:d766:758 with SMTP id 5b1f17b1804b1-4bb4e2fc5eamr105768935e9.16.1794572336252;
        Fri, 13 Nov 2026 04:18:56 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:55 -0800 (PST)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Fri, 13 Nov 2026 12:18:48 +0000
Message-ID: <20261113121852.334604-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The glue registers on the T7 are laid out exactly as the G12A ones, RX
delay field included, so the T7 can reuse the G12A settings.

What it does not share is how the controller reaches memory. That path
runs through a pipeline stage with a gate of its own, and no other
device has any use for that gate. Nothing claims it, so it is switched
off as unused and a transfer that has started can never finish.

Without that gate the controller cannot do DMA at all, so it is
required rather than optional: a clear probe failure beats an
undiagnosable hang later.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 2ad70f0dc4a3..ad30730db57f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -81,6 +81,7 @@ struct meson8b_dwmac;
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
+	bool has_pipeline_clk;
 };
 
 struct meson8b_dwmac {
@@ -384,6 +385,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct meson8b_dwmac *dwmac;
+	struct clk *pipeline_clk;
 	int ret;
 
 	ret = stmmac_get_platform_resources(pdev, &stmmac_res);
@@ -443,6 +445,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(dwmac->timing_adj_clk))
 		return PTR_ERR(dwmac->timing_adj_clk);
 
+	if (dwmac->data->has_pipeline_clk) {
+		pipeline_clk = devm_clk_get_enabled(dwmac->dev, "pipeline");
+		if (IS_ERR(pipeline_clk))
+			return dev_err_probe(dwmac->dev, PTR_ERR(pipeline_clk),
+					     "missing pipeline clock\n");
+	}
+
 	ret = meson8b_init_rgmii_delays(dwmac);
 	if (ret)
 		return ret;
@@ -479,6 +488,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 	.has_prg_eth1_rgmii_rx_delay = true,
 };
 
+static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
+	.set_phy_mode = meson_axg_set_phy_mode,
+	.has_prg_eth1_rgmii_rx_delay = true,
+	.has_pipeline_clk = true,
+};
+
 static const struct of_device_id meson8b_dwmac_match[] = {
 	{
 		.compatible = "amlogic,meson8b-dwmac",
@@ -500,6 +515,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
 		.compatible = "amlogic,meson-g12a-dwmac",
 		.data = &meson_g12a_dwmac_data,
 	},
+	{
+		.compatible = "amlogic,t7-dwmac",
+		.data = &meson_t7_dwmac_data,
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, meson8b_dwmac_match);
-- 
2.56.1

