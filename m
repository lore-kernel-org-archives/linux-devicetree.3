Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699611;
	b=EymWfgdjkID1nnAqk/Ql+E/FqFB9wWtbZrNYFwaH8IbvPuVOyO/Lj5yygFAWDpSzTU7P
	 5aZwo5yoX+V0JfpqA9E4DjMfMfSOTeAUAJVQRgY+wC6/bCIGCDpKAthWI/ORCLBEZctU6
	 nmmGT54TmYX9S3NAIyQe3dYysLdgCF8/EyexOhi0CRnnDW110+Adr0fh1A3DqU2YvpG+7
	 BNcigeTx5nMi2igXJ73MlRnm8nySLKOh++YFBb9iYvdMBdRZkXrXqZhns38PKoM60WX9i
	 K1bi9ws0gnpBUXhiJJ9ib4/GnDwDxmW+JTtWCu1GqOyBZDvvkR58/IYWHd8nFXTkrNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699611;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=;
	b=X8aSXwKzoC0UtJlNeYmQXbbp5dFQRWzponO29iKsFiPyoMWuZwvWiNXYqofmhS5cyf9z
	 DvxoENoUhARGAuIdit/Kfp9u1IoqdhZqTREvN9LDF7iRYScvWT/MRTlxWs3E0C/stRz21
	 99T3fOyf5saF7liZO3MYZjoqCG6XOozkn+HVkR0mM9blgAoG8vlT7Wstj6sofE8Hdi5Bh
	 ijtDbW8Uh7QavfKK5Hj/TWg7TVGkdYV0lqP55Mn6CZe3JPfcpsgXGeeaae7WfBh1PZzYw
	 OysW9EiZGxj8nmGEBlA2oRJ4uSwGUL5PpJdSkpWVZrXMvQ7ZOFWytI33xLZHMtEq3Aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4A5760A261E
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 20:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4A5760A261E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1df4c0966so648685e9.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 13:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699609; x=1793304409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=puIm5drKvsAtTzpQuwSkW9RuuhHt2CPtr5r817ZaEWU=;
        b=luFsEsJ5xGb53li6gln3XHw5koxrRB6AuK5tu+twVRez6dD5x7odUcMjjtXxxdLDTf
         mnmtB0FkaWt8s8cnevpZJp+auxYq7H473PAn6RJiOr1Nuls6/okTVAEYbl7+zHsxPyxE
         z4d9DArtoNDThPoBkv1cgMWa8KUqQ95afnrueI/5tljuKXg5rWp80SIiG/ba4ge+h8Y6
         Lm9/ljXa+02rX2NsltAsU38O5NA9mbmYeohQayjuWhweuJoymvEN8HQVL9SQwICPJNj3
         UEXFFaYmUNFlvykRvuu2U9WI6FLE7nTqTc+7ygh65LlxjxaavmNAAb1cXLSNOBpFYv4V
         spow==
X-Forwarded-Encrypted: i=1; AKwUvBxGA0FpXMbF71xCz/9qAfy+hR/R06PUh6sNbIvUT7kT7MhV3BaSocudEfSghh8RYZ2bPs2X4g01qU3S@vger.kernel.org
X-Gm-Message-State: AFq9FYJxtTdNgvnpUG77ToPwtqIlY1HaIgywHX+wJNVP8Q0bGKuokRCg
	X9wv53xMlpCpiEJVuyi2aaQ/U4uWzvhmMGMKv9mllt8BzVtRsm35nSvj
X-Gm-Gg: AYBFou18XO4Bu/qR77LuDCTsAvzxjLthLVPR8nHdULeAXnRdEfsQ7uqWCLgtsi2xKjH
	RedXXamBTKZ2Jg40IFMt/49/CkcuERUaO4qMgGa+9Rlxl9hOFuhN2zghcSnnVYTAnhN64Xr172C
	25Ermnpbt/H56+22Gpx4McVX3k9XAO9CwslAmQSfsLgtnfRyrc5yJnZ9Cr72gORMvDM1dOI2yl0
	DLma4X/Im4P7wg5oIKGX/0NbdXqCDrd6sSXtJNpilGG/u2aacwQYnjagMATJBaEuc3IWSXPFYv3
	f5ItEN2170yuBkSvDbLpq7dw11HV47ByE79kJfos6XUAn1Gs1A8CJWAjoyyBDxgKEbmAA7F/tf+
	npUhxvFEL9v0e+LTQ3DnPYLgFh1J5hp++q0ST34eH2pJsvV56xgbsGZ7QzATs/bQ3oKev4llxvU
	/TZTNPIqeey/YqIbYb/c2WRxCfiLsU1SHnzNaRW6OnSiUE4Tg3vc6UwbFROlCLl972vKvULiW+9
	kbklL9Fscp9FQ68wK/7AIVqCplQJB23nyCoROCb0kBt/xXYiN1Hx8D3tUWTWrCZOGvMPfFEAzRA
	P6U5+f+Q4EPDSEw=
X-Received: by 2002:a05:600c:1389:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4a211cac456mr2469675e9.17.1792699609209;
        Thu, 22 Oct 2026 13:06:49 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:48 -0700 (PDT)
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
Subject: [PATCH v4 3/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Thu, 22 Oct 2026 21:06:36 +0100
Message-ID: <20261022200640.3101932-4-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
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

