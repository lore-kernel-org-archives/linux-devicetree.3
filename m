Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723842;
	b=3nE4KJPjXhup+VEyBrEoi4YpalQU6lqIJ4TKM2aNWP9yV/6pCDZA8aplzMJ4E0/L4k2x
	 ioFPk8EGCVvpT/NKcc6RjeIu3h3jpbqhLfpmRmcHDklYRryUUZo60EqkxKzdp2qAIjj6w
	 HLQf6pC6aHl+F1HR6SbpttnLNbcbCb01srr8UQtsB36c4vaqKRhN9XVCkQnMe1XN0IcvI
	 tfjUJDiMeaBLwaO6+1Z1b4ek3RUzNBc63eU3m73Fm2ua/gpjVZLELZHiJ62qKCAUvawG2
	 RBZ9/sU9Un5X++dT6X5bH1R6UJRurvJaWG+32rVCSi+pKkrIHjuhFpm+PTFv03wLoOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723842;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=;
	b=DpwLQAQRMagCre/3YjoW8xvMv0wQuOvlCAcHYFUm6PZi5fqaYpq683T1B89nLElhMsST
	 jq4Zei0lIz4rYDTUEJBCh7cCzEXm93Er/+BYcGYSZC9J3TaBYeiYkG+0JCIcAzKYH8pjw
	 07K6xmAHd5gWnfyxxvwh8mcgF+pAMunKxg4ejRLdIibl35c0bB2Gnh11vIR5d6ADz/UD/
	 87fdYS1FVLeZhFPLRwzW8T3BKX6cvHS/SDNEmE9Ut0FJEjwJXNfm14iuzdT7o7EIgfgmi
	 EDJJ0Z8G9QxH4oZznkWIFql1vAB57k6e+pSLLeOSGFwXunJQSAk43gBB6I2U1kcVCRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 031C4606D838
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 031C4606D838
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48e20edd106so3369834f8f.1
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:37:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723840; x=1794328640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=;
        b=hj8TMm5RPWYFP5ABUbwa8GJHjo+GjR9VwzUo1ztdyyQimfeLMEXlWy139okoosmO6L
         2FP9J27wuldxmWuREvajqxKyaz3zDOMFKw2WnNiePOul57bLmGOWf1EDZUil0/eP3KDN
         hNIWwu/nnsDFZkfekQ3aZ+S82DANN57hamg0YyPQH4sLq9RFq6zANSmCTBJKEZNlRCgf
         IOzmfBYVEJXGomu4gmb1+IwBjlp13cQvOpogr++SUEKBKXa1qLZ5j+pN6hkptcB7XFJO
         PNj90xxrr30ob2fccP3ZnO2xps6Hj6PP/33Sl6mRrfyVjtfCmE+vgqoKJUHwo7jdpWDg
         YSJQ==
X-Forwarded-Encrypted: i=1; AKwUvByr2WIY1Bu0mX8lA+sHJThI8/xxPUse2EXJcyGKa7QK+Jp+3BXivHEhzRGFcVN/6qzEf/Wk0KF2z6x5@vger.kernel.org
X-Gm-Message-State: APuU4Z8wCXvzqvXhH/JYl16HGTbMV5+/RjdqTEY7gsgWXli+zab4cFiE
	iSdtLaivdkkSH6lADRzrvvaWq1jFBIj4VtFsQBK5XTPvm9Mv9QePhObz
X-Gm-Gg: AYBFou3AhpT+Ye6BQrLxISUNYO2Y3PV5HnlRVCfBp+GmoajcN4z8o7ESAbQotLuPIkw
	odeLNkjK9KJEdbovR4vn2o7hXio82VoaGZlra/zUgHr0jut78tzn71EujFq4TMv8PNTvtzAHVD0
	G01WbqYxo/LYfsV9Vk9R00gg8h4Ybj8jrNulP1/MaQXt+OgA4rFh0I/246sqDolzcxYFcIA88MZ
	Kf1xu0OCoR0wI5q3a2pEVaBcJJQmxe+XLuyyZ8UkkU4jUiG1u29D/s7hGvax5eresrOFg+w+dar
	EpiMeq4WR9i0jcejEJ1ZW5Esvva1cfYB38uZfXzOW44Tt0c4Vra4A2AA+kfSyLyfLSeOfg8QNVZ
	shJ77JM5IEIxpkC+HHy33r4RFLsosOTYzGRR+NEshfO3bWQK4GwnG4rVYUMKzeE9Ao0TC+Mo3FF
	N+Jao+x1U+73fmn8QYqfdYSkVR2Bjo/pj7FhWKQE4q7O89O8zrTWEsWLSZpEhbzRvs+PcVGkeO4
	6evDqQtN3ihavxjR1WXWvFBtsLWdLirbYNWiIbaY1lRgEOI0cfc9NvY5Tmhu8kEJYg8ktV7gSOo
	ZOZrdng8bW0pmhF6CTD2mfAAjurmLK+FeWopMPtjZPS/KU5pUIXg9QzSJ2MHf4nMiadfje/vIKE
	Bj/ZhQqqW+8zjzKgcWT1iwesi1g==
X-Received: by 2002:a05:6000:2213:b0:48c:7f18:c85e with SMTP id ffacd0b85a97d-48e6e3042d5mr30563697f8f.45.1793723840170;
        Tue, 03 Nov 2026 08:37:20 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:19 -0800 (PST)
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
Subject: [PATCH v5 3/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Tue,  3 Nov 2026 16:37:11 +0000
Message-ID: <20261103163715.385394-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103163715.385394-1-tanure@linux.com>
References: <20261103163715.385394-1-tanure@linux.com>
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

