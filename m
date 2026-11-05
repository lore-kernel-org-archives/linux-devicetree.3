Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873011;
	b=JtcXoX4lQK6Z42TbCBCx5qgMHp21sKCTKu0RahdDYPzWXFCuLPKZYqzB9ZCJqzV+aj9H
	 hRbYYL8K3RNV/dQyITWYi/vcLFnDzFGSKNxVRWkll6KKRZngLE4UFMBP+zxEfgZUvY8Gx
	 N2KTn0JYOG1IyRpJhzStlah2g+HdWSvhdnqOBuiyWH24/c+bbDuUSeiN4gkGhm8UOCwpv
	 FxgzP2ldJ5egoErSmWuhzKN2WDYhj221tI1T7vwuyi6+JomOnS8tn2Aa3eEuY0Ws6GlCf
	 WoBhN5RnZNO1hVRWtNTRZA1sFLIWs8z0tntAj5cjGBo2MgJY5dV9FVh3rulYWucQTcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873011;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=;
	b=crsp4aRoyVro0OxXFNF6LWbLWIdYXVBTsQvEcAroPXk2xXvuP+qHEDBnGwqHiN3UpTob
	 SEKL8QXIur/2llWIDJxdJbAeYompoas9tVhPXJ18BPOIwm2aK6GkwD313cYkhniF4X/Gn
	 DwZtDWRgqyvo01WzJ3sRafogealt2ZFMtCrkNCdMsaahZ43+rbcfPqhUYSM26xQ+4W1l7
	 sTqLRw0KjjWjqJxuzQyX8Z+26X+59B331KJalDrQPbOOrjvXb4BdLsCXfxSCV5vRmTd8f
	 EGzuSuvmPa87BjgBgrmbR297/RUcP2NnPIvE5MM2R3iLtJLs8NJLjT6xM5JViSbV/GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B180606D820
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B180606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a208d93758so18663635e9.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873010; x=1794477810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=;
        b=E6q6wi8EJSw41b8l3FMf8VOABBwKE1jQvRR8EBHg+yNBt+kBSGSGCZtXV24hCjqoUA
         rMTjERHU/xOLY2sOBmbUPqa1qVuD/ueXHtwotd4HBcs4ttRLzEn2qLQC8212dianfgWl
         kWIcT51pp/zMbyKnXuEds0paYcXPJhkGxViIAIwSOU2PodpqkaUJAqKwvSDCvie/KhhV
         8NVsmtccm66E9Mc0VHW3VjNiJTk/WVNN0oFArUrHSkItIlfZc7ohhoViPB7WDyL49Kmq
         pjRpqyfrNU3PA6Cw3G4yOoAHkrATECDLo8lj5SnxwOopqQ4wAh0sZ4ugMSdruOxV+NYu
         tv4Q==
X-Forwarded-Encrypted: i=1; AKwUvBwaKghIL5CaLi0KE/2J9l/lZd2U+6hee/rMFFXMtTLk81zmlSBkjS+DmiSb7B8gFORr67BxOYZHgoox@vger.kernel.org
X-Gm-Message-State: APuU4Z86EL5gNAvOYGXQViKn3m16hiCKbvhxjlOGuyXWE4X4HZp5vgo9
	rZe8kXaNxEVSEwFsSrDEILb/bxkgixDZNJs6F+EjEvmeZW529yk80Ryh
X-Gm-Gg: AYBFou3DRKl8eetcKxHcQI2b9SyymBPK4vX/4jdzgg2ExAZgQxUOz/Bx0FymhBat2xK
	OuKxYWZ0AVNHXrB99oMl8eBNNvX5QPlG356X0jrlCzur0uwfeondwk83UCiWCUCt+lusBBn+AXg
	aHuy/Pbw/+hYFVuXBIMV3rzKptAH4mDiH9cIXhq1eKAgmctml8AghVNR1R8aLxZVjh+zp5l6XX3
	6sf67Vkh+FK/MqDQeikFuv14Nzubk4+P9YbvScE6BEpXH7yJi36/Dc+E7STJDspkT0u/6n0frfv
	FMTdwzjYjPjhJb9FJlrF3Sop0u630ICuS76AVObKnKgLNGmw59dk+Y9tUqt1wIPCnEF8pKkHctw
	NlYk8oW5xfKAXMcIMb0vcJlRRJLapQwCSgczANikn5Z+N06obvLQFLLquti1vcDXnRxZlzzJjj3
	6WLRP8C5hrHfWWV64rQ+G+QXJBRDq8q2XiX7N++irAMIDJiac5MSy7+REAm0RRuEoFvd5xmeLeg
	DjnAd3Xu53k6xQMCnv19chxLpsdUKlqBSoGBZsct7kV4nCxH4k+nR+EsNoijOfI9KVZk8C4/HFL
	Ygf6vaCjcB2ORfcNVcCfB2cwDZnXiWXawl5ai5HNmVoF5GY+iS4r445Fv0E+wi29F/+9BTAi/qq
	0fO8FJo8VopEX0e37HwKT7dT/ag==
X-Received: by 2002:a05:600c:34d4:b0:4a2:d7e:5ccb with SMTP id 5b1f17b1804b1-4ac182dca99mr455243555e9.15.1793873009584;
        Thu, 05 Nov 2026 02:03:29 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:28 -0800 (PST)
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
Subject: [PATCH v6 3/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Thu,  5 Nov 2026 10:03:18 +0000
Message-ID: <20261105100322.37816-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261105100322.37816-1-tanure@linux.com>
References: <20261105100322.37816-1-tanure@linux.com>
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

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index e4d5c41294f4..450f7b4b29a6 100644
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
2.56.0

