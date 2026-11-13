Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572339;
	b=o29fGIGG5zxufb8VdXq4EKJ73o8dE/eJ9tC2YD1Eyc82StpY8ybKDUlB5Of+f1xHwMvE
	 Aaqpbveff7D6RMPmHhH3Dpfu1GWrSGJu+l6IoOyH8cHoWF7Z90AY/yjVRXxxHdi/mCuaa
	 aGGycq6J95i8szz6uK8s/OTkmZdyZx7tU+E8OMwudHYdPHQwn/BIKGYTLSvlyV/7fmCEk
	 5sCxxX5Y/wVQZwiUaVHSIvLjQta2XWfY/riCj9y8rmlTVYdKioozOnLJLSweNzfDly23K
	 BJcM9M54ymLoDv7/+fWHyrpoQPWFqNnhUVDRN9sUJr5PaEnU3uqOFlud3RKBL0sxVpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572339;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tO+egXWm6JoZZG/jdjtdaE5a20hm/Ptu/AmJt75eDBE=;
	b=JZgbPo1lWjK9yCWX7zldOGfyBHkjf64BTEcG3GJ0PrAGaj8gCETkdhnzAdXK9aKYu0mu
	 tyTnx68fYjzBthbiAqKSt2Aik2STSyqtnNG27jyVm6AY1dM1PISiWV7BzXS7dfuSMusSK
	 nbE2VF80a1ZnwbkgIAky2Hjre7CT1yYQdXD0PVVLUDcy4uTGVEs+s3/36WKY5Ubq7GRck
	 MT3p+mh6Qt+RrEXjqkOFz95BwEkjoglqTcB4XqlmCN+aN439vK70ATQNNT7aPhl946wdy
	 Na4h3bAw+VDDkMWIMOzIH50sfBDC14f3x5/px4m9RfTLs2g/+aNVQouZ9JOcAPNl41g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31FA2606A8BF
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31FA2606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-492f563d1c6so605972f8f.3
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:18:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572337; x=1795177137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tO+egXWm6JoZZG/jdjtdaE5a20hm/Ptu/AmJt75eDBE=;
        b=2kdFtUspOCZe028SjtaTgWrdKjPk5ZWIgmHMCyItv7iZJYRwdPNOkBNPbe6WASnhw0
         iWbJ7xJhJydH6H+C0NPIuFH2ka6Pqr5sPk5Xbb+JKQCgCAVaj30EanW6n0HyJHrE+5J2
         lx5cYLx0J+y3iqWAq9I8ouObWj4DE1F1wkGb5ZDEvLukDPLN87QxiWH+9x05YF090CWv
         iCB6/pccxLN99xu7JqJSCnOhDLoHo2MHcWgImEyw73etKyCg54r9n0KhDt5DK39j7sMI
         ++ygH8/Gc/9kfAfhM/nnl0joswVAk4j58ODEvI7C/tYEnkKXOmkIpa4gLc0DAFZ+MvT4
         Kcpg==
X-Forwarded-Encrypted: i=1; AL+hErGkrMzgTcUqDZAKjiOLkBXGFXMpbxtpmtk8f2LXBnlILC8+WDbhMZryfwOZJVeZ09EnY9pgE7JtPlIF@vger.kernel.org
X-Gm-Message-State: APuU4Z+ffOJys2GfGx3Pvsoy0t6qY3y2e1i/PzKFaZ+Hkiji4/JxCrXx
	d0H+HBV1IvKbnpz9cS+iYpSqXi5zVvbleRCxdu8LOtcmjkk87hhW9sgl
X-Gm-Gg: AYBFou2S/Rmox8obAc4/ctgQsBkh4O9z5S4GKAcEompeOhnphote8eSgQMFgs5Cm7FT
	fAEWBNtlKOa2FTAN2wB8AEHiO460PKPs6cpKakS8L9IkObzts2EEzo6CVq4aA2J/9ZS1m/vexxO
	9EetlUmA5CCLdgIdeOXO/0PIuML2VM4e/p+2Nlv4g7OF520eCrgeud1gjnS5HuVM8W4qJqHYsz8
	GA2iF/csILDmuHYLnuJ/W32blhhJj+yHFWlq53nb7AuRt5qRwuEIKNXOQ/mbzlzFD6dTiOR70NP
	KSea4OcL7q+HVwP5pz8W1/dHRpE61DnHR5bEkEzKkEksOYLsmNWPb3VNN0sTXJ/KdlbXj+NTjBG
	BqNboCJlsJUx4znqmRjfhaJCu508re92V779ChxV2zbri+5HAfJCdv2ESe6WI4NvZ5kZQhFvJkk
	nar2K7dCAdTljvlnJgoAWA3CUPDyW1d95DNxSwaevu99oDOVoKXS5TtJQTodV5UdJtf2mI4gmQo
	KPTm+6VEzkk6rm9MShEiYI7H4atKvYGV6xnNJhAno+zBX/QfYc5kDUhoFm2/I1ezdkqaaTOvwZR
	MrQQapc9ukWikmI5idlEW2eBPuwMtCEj3/QORSg2cMeGnSouca9118eo8/SxknCDg/12NpsTDa5
	4dgXmKiSN2pPmzmTQX7PiUN4X
X-Received: by 2002:a05:6000:29ce:b0:48f:bb92:c5a7 with SMTP id ffacd0b85a97d-49c70ed9029mr3869206f8f.9.1794572337361;
        Fri, 13 Nov 2026 04:18:57 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:56 -0800 (PST)
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
	linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>
Subject: [PATCH v7 4/7] net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on the T7
Date: Fri, 13 Nov 2026 12:18:49 +0000
Message-ID: <20261113121852.334604-5-tanure@linux.com>
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../ethernet/stmicro/stmmac/dwmac-meson8b.c   | 42 ++++++++++++++++++-
 1 file changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index ad30730db57f..d8c23b280b59 100644
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
2.56.1

