Received: from mail-wr2-f42.google.com (mail-wr2-f42.google.com [74.125.225.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB9F45516F
	for <devicetree@vger.kernel.org>; Sun,  4 Oct 2026 14:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124855; cv=none; b=DJRospuqc2Gj0mNuv6CsfEdeBCurF3ehi6Fpal47WqO6jPw/+JkobfPfbprD17XsJALKOTodWTRkC9WwATrQCzrvKx2FKBVeD7DZlI0bnwdjKWH2eXTSC2qQ1kIwOsKJnxKTrFGm8LFgporH3WLgruwgLNAO/7pVXD4xGDKsXpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124855; c=relaxed/simple;
	bh=/L6rwePCTb6F8ztmjJ+vFJVUUHSCy1qsPx9CToWB9T8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QUSbmbYe4+JkL4uiw8oTuVDm4IZdWOpe9kbiv6WFYq/XTbVwVes+k41A4Ipfo7iwZvo9S8d3fd4txordFT678NA+38PFJxGCJL18vzADn/jehP9Gt4EQtew71q9TIg/Bn8qRP5v76Qcnsb1kTup9fwIxy5SIKwR1zL0CG/0py8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.225.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr2-f42.google.com with SMTP id ffacd0b85a97d-48b0622cc90so387388f8f.1
        for <devicetree@vger.kernel.org>; Sun, 04 Oct 2026 07:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124851; x=1791729651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HArI0GqWQQ9wXZmElGrKtHu5g8ZbfDICvR7ZMSTUUN0=;
        b=IFU0jwHx7vdv4X5crQpDurU59d2OdnL4FaMqYbDkAVLSj2XXWl4oQ7iz8aiOkPdoXd
         Rc4q9BWdKRSUxOMDcRe32VJU2arZJ3XvZj+qMS+6bC216ixOWxKtPDwUf1nvLwXfCoNq
         PBrHJPjDk1b0X1H8G2/VsR1HxiTrsh5hm0A10MxPirClgP/cBMNK4E8UOh4iRLZFRRod
         rKd5iUNYx1sbvz2JcsPsdRKtNiA2lbCxAGI82GYUn4wFK2YUeSu6zFIHXnt6NxyEZKh+
         Sgf9apxJcTjR+xAzmjugfqF3vPUHMtsgnm8Rq46EncYmHRfqBo1mnq/uFk1bKgk6XSCn
         oa4A==
X-Forwarded-Encrypted: i=1; AKwUvBx8o7kmnoOzDF1eH0sX9rvZUwTLtHr/BJK144FUzx+PLTvE2g81FuQhxk54aXo2b97Q0FY0Jf+ktypL@vger.kernel.org
X-Gm-Message-State: AFuF++l7HtYmSMRS9r8LNAhiKEmNfXzgaw1dTyiHPBDAYsccIMwFSQ/G
	oGuIJN+EDXZtCdDbYaXT7aLgZrQ0VYdXhG7wp2HbJj4232WLgTLD5e3h
X-Gm-Gg: AYBFou2QJoyGB9Cnk7p6xOLDkOhs/pGq/rs88YYKMxt9dtVidGwcf9Znq+YqSeEW7Hm
	VBRRSrHoOa+wRGMpR8cflm62kMuSrI+YFhva9zptNEkkIbhXvia3wVDThZxUM/Zl7IdbyPmvP70
	eb12RsNT2FbM15C4gt+V0JjAxt9ftqIOp7uQEbhS+bftWva6ByjhLI2n+nOWVkloYckpp7mPCEf
	ZM0WopfKyTF5WMtJDgByLnUp2UkYp1WDM3T/Jri93igLSd50/sMGceYQWjL9Q6bbzrpu2ausZkp
	z8SPhZiJGIXVJl8PDekUZLoQHXQZz/VQ++jaw7PzevJKjLt/U9aRkm7arcK+e+6YKoGohY/XQG5
	V31vxEgvHsU8gCxq3efDTxYmQAAqgTfrmKHmGdtgsATiqgNpCIrB8nlQQr9BfIh7m86nhwbhjEu
	7lJUmYqmY2ZQD1gU6CCCBwlk8q3T/ezNTxuGLuht+DpUq3fkA/LCpaT2tmAU4X0/RssCZW+vbpW
	cJ5jy9yfOLaSHxDDYDIVK6+Hw+2gUH0uA==
X-Received: by 2002:a05:600c:c16e:b0:4a0:13ea:2ec3 with SMTP id 5b1f17b1804b1-4a02769ac74mr132090935e9.35.1791124851353;
        Sun, 04 Oct 2026 07:40:51 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:50 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
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
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 3/6] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Sun,  4 Oct 2026 15:40:43 +0100
Message-ID: <20261004144046.391444-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004144046.391444-1-tanure@linux.com>
References: <20261004144046.391444-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The glue registers on the T7 are laid out exactly as the G12A ones, RX
delay field included, so the T7 can reuse the G12A settings.

What the T7 does not share is how the controller reaches DRAM: the bus
path goes through a pipeline stage with a gate of its own, and no device
other than the controller has any use for that gate. Claim it and hold
it enabled for as long as the controller is bound, otherwise it is
switched off as unused and a transfer that has been started can never
complete.

Give the T7 match data of its own so that only it looks the clock up,
and require the clock instead of treating it as optional: the controller
cannot do DMA without it, and failing the probe with a clear message
beats booting and hitting an undiagnosable hang later.

Assisted-by: LLM
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

