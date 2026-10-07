Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BC744C4FD
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 08:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361604; cv=none; b=F3Nl+5gA3UfO1Bz1aRgMc24lMFXJ0Un4UwTPGudWAp9wyY2VsfQJHhC/gapHUPZtZO/H571P+PkgkN7+hxaNUkyzJohlG+LpU+RSieo6REYGoiVAofFFqpizjkTUOiKt5N8Hjy6JXMUREi/3XhwfqISZh7mDmIsQ4ySGAw2BNSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361604; c=relaxed/simple;
	bh=xd2G7R66hpaAeW/MdfLjffNu2Gc+gWu0LmsCFDuAJjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KCnqC0Lh8V8+IfXuB5DvS2dwICMyl2QRY9fK/IksFgQnWv+gHD8xaXOsv2rn8uHV0y1EoYn0iJ+E+RL/mXMowlqjS3L29ibqGX2Rml47ymF/aGROqcoMG2fljPUVA+MxRQZZiao+V0YIlQn1at/ZVDw65m1cD0KRjWAKemQFcyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48b060ec084so1069148f8f.0
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 01:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361592; x=1791966392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMznkgAU7RcKCyo2f/X40iNVhoTQVjtCnARNVdFftYk=;
        b=AAzcgc6aP8HUveFU13AZe2sUccxoUeoy3YFppoZbu/trbiQKJZ83TTGDmi2fe7rv5h
         46jfGEeDqjkzaIU2RLThu0T3SnO2VyQP8RvJKxU/opOQcO/8aj63CZEPecYzNDwYRcS4
         NgZGmL0ApjC+ANVPGqkkpowMYio3tQ0gu5tvVthtm7OrVFyDAuIsGK1jYEp7cRIivxkM
         N68mHEsEBYWz4g+Z8ZnGuPI4OWaOgCCA0844Sd0QUePrFk3dnd8fXf4Mmae+uFb1OEZT
         AeP2Rd0Zd/WEBz/NqMSF+OPqUFm6Eg+kxDwY0zNShkWaUxbiQZA9gIP859SqYHu4DOLK
         6sSg==
X-Forwarded-Encrypted: i=1; AKwUvByPJGfUzjtT2500npkHld/OoHpeYgKqjCw2ISqVn9vS7TZUsxbipdi7VTp/TlM0Nxan8x/64wfyKsi8@vger.kernel.org
X-Gm-Message-State: AFq9FYIr9oUsvQ3i4i4XZDOePlqs0VlIq5lvtryyisxN5yQ37mELr/Yh
	mD8Di24yMw2k8wO1JXWtntZUB7V1xlLJVmUJsoUgLIbVnrb+lj4csuyE
X-Gm-Gg: AYBFou0s4+ur+GsWiXthGWu8MvXZBwWX7odmLsPeEDSPh3VWOPLwj4Y6zwyFIXWz0wN
	8lndWg1BhLOfQ3GMNi/ZF0eLnXwdu0VwNa4VPM8LlmxYmLwjNN9rnCAUPrv6jaNFc07MQz+JZSo
	vXFCK6yi3Y7dscI1kdz5czKRw5GReh3VS2qrklA8YC+gyZOKzl11+WffHeSTC6oKzvOYFjdFIYC
	+pruOMHqnNBr/YMzBlrCByKfgbob4ye2SUi4M8X1f7hq8dIraxs/BB3FscHZ/b9qmEq/vfyFTc5
	FXMwhPq6+Htrd71vGc62et8P8aGYU0ZSAlJSwZmOLhrFET7TyRg7PiP4X5FkKbmiwvNvQyY9Akr
	oCi+Q/jfVkaQURZms4kjr/6zaYcko5kmQaYHaWxdwWSjLYU9eJbJu9LGPcrSjhT7n9Z5+4q6iFX
	u7V7eaWGvMuNrwNFI0JaHxgTbW1cbooB4gx9rDz8zF9OOCC5AVW2UTzmjIvWeSL1f7rCwdi4t7W
	Zm1RMIRsmYMcm8GRFxo0ZfQ8PB3XwgoK10=
X-Received: by 2002:a05:6000:4819:b0:488:80d0:873a with SMTP id ffacd0b85a97d-48c726f19d8mr2561452f8f.5.1791361592372;
        Wed, 07 Oct 2026 01:26:32 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:31 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 4/7] net: stmmac: dwmac-meson8b: add support for the Amlogic T7
Date: Wed,  7 Oct 2026 09:26:24 +0100
Message-ID: <20261007082627.63807-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
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
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index d73dfd0ac167..dd10d719ab84 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -81,6 +81,7 @@ struct meson8b_dwmac;
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
+	bool has_pipeline_clk;
 };
 
 struct meson8b_dwmac {
@@ -402,6 +403,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
 	struct meson8b_dwmac *dwmac;
+	struct clk *pipeline_clk;
 	u32 tx_delay_ps;
 	int ret;
 
@@ -485,6 +487,13 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
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
@@ -521,6 +530,12 @@ static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
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
@@ -542,6 +557,10 @@ static const struct of_device_id meson8b_dwmac_match[] = {
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

