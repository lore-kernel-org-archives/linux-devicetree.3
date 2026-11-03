Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793723843;
	b=HT9nrtnARpsNfcxnGIH/d1RWBn4szkpKa1RSZBEqT0C55e79ei9o8jR6Tw8mrpyoBmOd
	 IcG1QlbWmRDcVyMmDH1hQ9eDMvHSVtt19rMMEEU1xy2np7K9Om1E8h7z+rP/zKOQTTKl5
	 KRQqoGJ9l1RVZy1S4Ng90wd+P7Res1oFQ7qgR+SaeVb8KCrLE6HScvsa4QeYCwFxGOIF3
	 KPqnB/ncU2G51WjBHeBKTcDao2hhjghlxgHqNjo8zv+gwfXflgyZN31clJmnvaPY7tjBi
	 76mkD9SbEFNWeu3f0J6ngqpSLexrpFqXWhMixthur7tGrvqtKO99X6BV6QEgleMOU/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793723843;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b7yfUIavlqkZvjW0hdKuc7GNLhU6uDD+OhW8RPwrMQg=;
	b=t9sEHCUXpNoxE4q3E2G6bDaZuT1u/E92TqwCjATNOep9dPwOVXik6JQ08TFwHNlap6To
	 tWjELt4/fHoHKXjV9Rb3YmE4/N0NJ63PrQL5Ssx70iGDMa/KKHgikXGvoo0M8RDTtdF5C
	 zQQ7R/08J3IpT9ot+TEY0SVUL4R76l4HHubPaecR9NyHtO20ebKIY/LUHEibHalDitbVZ
	 C6+1oUtk5Jp3/opMjqo1LOCZJjj3TiPDf0fYczGVGqT9ww6jeFJ03YefRCaB6BOH/UQhM
	 pj5UEDq7leg7s0xa0QnvxcmM5XV9R6NhpLG0Rg4/bYSsqAQF5FJTJVoEBlBLKEL7utQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB569606EE94
	for <devicetree@vger.kernel.org>; Tue,  3 Nov 2026 16:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB569606EE94
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2257585f8f.0
        for <devicetree@vger.kernel.org>; Tue, 03 Nov 2026 08:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793723841; x=1794328641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b7yfUIavlqkZvjW0hdKuc7GNLhU6uDD+OhW8RPwrMQg=;
        b=E9QEIkL3F73eyOWfNnAMqgsAuaybd68WGeKdjGVD81WK8gqgCp451eTfeWiC03tiUV
         NvsdjBKcjNYdp2Mo0wMnIpllyc9V6wbGfQcYQm1Q0veM8m20AOecgXZ8tf/BeLELyBgo
         SnT+7adSuskidxiEML1OTv0wSvV8DHK0kO33UEQqJVq/wS5Htne/Uv2QdVpYaDMizhK5
         6BuCDke+8TbWIgps6UEfzSRY3sAGZdcFFXgAmABDbFHbTjgviRgDvTVRwF+FCwURyOwl
         sd2G3mytfLIg+5DLIr5fS7PL5KqrCdAY3iVHo0ahn3Vn4D2WMXb4N5YfbBSjDTdwXGjg
         EpyQ==
X-Forwarded-Encrypted: i=1; AKwUvByqJEWVi8jFq+FAzjJNeZxmPbobZKQT2Awbs6eo6ErpILLwji6FbXe9MSyFHJrERNCQEWNCbjBNsKgi@vger.kernel.org
X-Gm-Message-State: APuU4Z+LB9VKHVMalAIvyN/AFb/Se+QrXQIJLwAfG5HsUizY9h/VkCDB
	Le2vgprDtL7qwnZ3KAAbP6SUmKqN4HHEltZDmHLYu1etEm71WPMOkFqq
X-Gm-Gg: AYBFou3tbPvbusbjhwRDSIisAlzTOffWKPU9SUw/Sb5WHgrKwA5yaPP7mZwqDiaio1l
	OOaQq0Q0HojIFQrqEDsaXYOjc7BbaQp2wFI93furhPAWd5favu2midGp2O7QlZBroOzIP3yAXYM
	1TaO0MbRibaV86ii5rj/CbbtVEX5wv8sNRUnzaAxR6ahUHVMniR/8465R75IgWRZpbrNeawdvgW
	XdnkIgyZ/K8jlr/dchUq0ukNEmf7FoCrja5qPXoiBB2wqY/xApbMpjeZwTfTf9QLpa7/EKFaj9F
	6wQXfbfLhLdLUEcfOvKL5SbVtkop9LAayU7a7P4ncwC5tuaX5GpLSxhCSZ3w01CWTpovzIVoSN4
	4typKu6mtvOxpUAMI/yt6HF6f75I+2CCeIVSn6M7jo3b9NXXagUQjm5ygT89CGJu4Yt/VzqCz6e
	PuWXwS4lwJO8zb+F8bWXgc7Afzs82MN4sDC0vKb13DEEdXR5v7lWhMajJVwNSxMp63FxxedzDzH
	RuLl+giN/JnKaFfJj3moEOJfxPbxB2pFQFuS7yi7FFx4jNYppE3SA0f44TxhiATT4THve/OIqrS
	iWOpjhX6Tmmgnwz87O1uG66NlYsDsh6+vvt4+wXwJRRECzcPVhKcqRKKNk3elu6N28an71r+CLi
	/VwbLkSCzpOilNZPwLhCqpKgZug==
X-Received: by 2002:a05:6000:41c8:b0:48d:faa6:cedf with SMTP id ffacd0b85a97d-48e6e50645dmr30646945f8f.56.1793723841371;
        Tue, 03 Nov 2026 08:37:21 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3e9sm29044772f8f.6.2026.11.03.08.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 08:37:20 -0800 (PST)
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
Subject: [PATCH v5 4/7] net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on the T7
Date: Tue,  3 Nov 2026 16:37:12 +0000
Message-ID: <20261103163715.385394-5-tanure@linux.com>
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

The delay code reads phy-mode as the list of delays this glue has to
add, falls back to a 2ns transmit delay when no property asks for one,
and takes the vendor delay properties. ethernet-controller.yaml says
the opposite: the PHY adds the 2ns delays, and the MAC properties only
hold small fine tuning added on top. Every board in the tree depends on
the old reading, so it stays as it is.

No T7 board uses this glue yet, so the T7 gets a path of its own that
follows the generic rules: the receive delay line is fine tuning in
200ps steps, and the transmit side, a quarter-period phase step, offers
none, so the transmit property is refused.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 450f7b4b29a6..c8bd15b6780b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -80,6 +80,7 @@ struct meson8b_dwmac;
 
 struct meson8b_dwmac_data {
 	int (*set_phy_mode)(struct meson8b_dwmac *dwmac);
+	int (*init_delays)(struct meson8b_dwmac *dwmac);
 	bool has_prg_eth1_rgmii_rx_delay;
 	bool has_pipeline_clk;
 };
@@ -338,6 +339,41 @@ static int meson8b_init_rgmii_delays(struct meson8b_dwmac *dwmac)
 	return 0;
 }
 
+/*
+ * The T7 follows ethernet-controller.yaml: the PHY adds the 2ns RGMII
+ * delays and this glue only fine tunes the RX clock on top of what
+ * phy-mode describes. Its TX clock has no fine tuning, the only step is
+ * a quarter of the clock period, so the TX property is refused, and so
+ * are the vendor properties of the older SoCs.
+ */
+static int meson_t7_init_delays(struct meson8b_dwmac *dwmac)
+{
+	struct device_node *np = dwmac->dev->of_node;
+	u32 cfg_rxclk_dly = 0;
+
+	if (of_property_present(np, "tx-internal-delay-ps") ||
+	    of_property_present(np, "amlogic,tx-delay-ns") ||
+	    of_property_present(np, "amlogic,rx-delay-ns"))
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "only rx-internal-delay-ps is supported, the PHY adds the RGMII delays\n");
+
+	if (phy_interface_mode_is_rgmii(dwmac->phy_mode))
+		cfg_rxclk_dly = FIELD_PREP(PRG_ETH1_CFG_RXCLK_DLY,
+					   dwmac->rx_delay_ps / 200);
+	else if (dwmac->rx_delay_ps)
+		return dev_err_probe(dwmac->dev, -EINVAL,
+				     "rx-internal-delay-ps needs an RGMII phy-mode\n");
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH0, PRG_ETH0_TXDLY_MASK |
+				PRG_ETH0_ADJ_ENABLE | PRG_ETH0_ADJ_SETUP |
+				PRG_ETH0_ADJ_DELAY | PRG_ETH0_ADJ_SKEW, 0);
+
+	meson8b_dwmac_mask_bits(dwmac, PRG_ETH1, PRG_ETH1_CFG_RXCLK_DLY,
+				cfg_rxclk_dly);
+
+	return 0;
+}
+
 static int meson8b_init_prg_eth(struct meson8b_dwmac *dwmac)
 {
 	int ret;
@@ -452,7 +488,7 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 					     "missing pipeline clock\n");
 	}
 
-	ret = meson8b_init_rgmii_delays(dwmac);
+	ret = dwmac->data->init_delays(dwmac);
 	if (ret)
 		return ret;
 
@@ -475,21 +511,25 @@ static int meson8b_dwmac_probe(struct platform_device *pdev)
 
 static const struct meson8b_dwmac_data meson8b_dwmac_data = {
 	.set_phy_mode = meson8b_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = false,
 };
 
 static const struct meson8b_dwmac_data meson_axg_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = false,
 };
 
 static const struct meson8b_dwmac_data meson_g12a_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
+	.init_delays = meson8b_init_rgmii_delays,
 	.has_prg_eth1_rgmii_rx_delay = true,
 };
 
 static const struct meson8b_dwmac_data meson_t7_dwmac_data = {
 	.set_phy_mode = meson_axg_set_phy_mode,
+	.init_delays = meson_t7_init_delays,
 	.has_prg_eth1_rgmii_rx_delay = true,
 	.has_pipeline_clk = true,
 };
-- 
2.56.0

