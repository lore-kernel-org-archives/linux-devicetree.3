Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873012;
	b=oLXjirKfDCL4Lkt7BK5MxPnOSu/ReTlABo2IA3niQrgORZcUH9He8VakYo/cYt800zlV
	 VJQVunf46E1/kSTRLFqTLUtv5mKljjSmWYS27P71aFT4b0XumP2q6BtoXlHegXSTtH347
	 ZBdVHWjQpPRaI7q3B5J+bo53NWta4rPA4IwpBsnGuvZjrcGr8iFdMLZh4v+FicYC0RgLd
	 pfZi44oAzOCz4SzhtUbbCK+wJt9qHIqh4YQvFuZh3dFcPb03Tvdcvxcx+ucTnvuLaN3zJ
	 4aan6eykXw/06tDnHcZ2sxxTakLxw+LXt7J/AkFB/UTFTmr0NFCZTWiuCpvq4wfcMVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873012;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=b7yfUIavlqkZvjW0hdKuc7GNLhU6uDD+OhW8RPwrMQg=;
	b=OaHrGz21Rof4XK+Hun6Wr1ZtwkD4dlmD44U2nGslWPiuTURJ9bnerOD7b3jeNF/a9Xpb
	 2HCGoP4B2xr/xne9Lop0EwU1j0z131+WRpNuRRNB82moHixrJThln1XYo0MjdIPssVyMV
	 T31DNjSGuTpBmqqYMGGagRO4P9X3eiXtRIXZ7Szg4DoahLZ+V8X2MKJucPrNf2FxKgnX9
	 qDHyNSvBYnGbicIT/Jy0cYkESeoUhMnIIMja0zaJ86gsfDBPSo7kop4P55EoOIzQRjVn6
	 2TQZ7nW8lpo/pB2gJKh29dhK/2celkC6AZr0mNlDIh6948CNKSqLGGpSC9JlxGgAUrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5066C606D82E
	for <devicetree@vger.kernel.org>; Thu,  5 Nov 2026 10:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5066C606D82E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so12826765e9.3
        for <devicetree@vger.kernel.org>; Thu, 05 Nov 2026 02:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873010; x=1794477810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=b7yfUIavlqkZvjW0hdKuc7GNLhU6uDD+OhW8RPwrMQg=;
        b=hli1bof1GhWdtumKZPvJMzN7soMxPUQrVAB/1m+V0Y5KUk0aCC31d9i2rCQpu92Vwv
         fju/Mi9i2qrFcLsQL5Ffy0beUfTrgENnkpn681aQn2y/x9jPBU3hVYYXvBU4wNJFsycy
         SnNm1bt2z7V1YVoiKV2UsEl3PNLF6WnvNC7EOu12M9YEee9fNJlAYBD06ywkxXJVnFQk
         roQPGjxhWFSphSTk6OaPbsGkSj+HvcNp2tDY7mtRrctHGgvql71W4f01ZwjQFwwilne+
         8BlRab9XcYme23irUU8X+rWNcA0ElgS4qvqnfpIl7aXVSFtVF6rYwRicnfAyo0gQb7fn
         JlqQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNac6eqHlh5tfPC/bkPpslt+kXKVQLtKAsjhwkCrIf/6DcIhi/5Q7qcpYz2p5/wZ2gJziSx8ixbRWM@vger.kernel.org
X-Gm-Message-State: APuU4Z/uRNRRMJN5fpKpPep4mtKN6btHgb4ucfzmDH4Xbm7RM/07n+G8
	di32IIATa4T5ielJw58T7FRziqGOplGMKaVeGMKzM2Lhxa8RXQkWaTkq
X-Gm-Gg: AYBFou1P8Hok0lxQeDEb9WWf/HJhmzwcCkzD9T5ugjLjRYJk3evL4Ifk512rFUYyO7W
	hgoTxTp3FBX5mlK+omoHtbRza8zK/Xws6vqSqpDZEBurjcllNoqbs0Ac3zI+iyRjbCeyCIoL4TS
	8najoXLfJCq/K5uJvhLxjCIRcGaSNXnqrNmioR6YTK2kQo4xkXhOIrKrlG8fRyZCBr4s2nZiX5M
	5bzE61WBtBju82gnjPHy9T7Rb4DXNVqkiG9FB0R0wePy/u5Z2kqyWjKsw4tbGUfVrmelwpGQT2V
	dO6M7EWCRhL8O/oaKH75W836hI5dKZ/kcic2ygud+KSqv9Qd+tsE8+AMtr10qANA/p48R2cfO24
	8Fpj4TnJ/HeTkBDtGo/n1DbqshRGEy4sCN6bcFVDp22T200ffPy0AalIGUc6YXGkKWQNA6Ewn7x
	nA5Pca8hBR/wwfAEjj8ijuSnVbaM/VnJWqYL/IQezvKomJmDJ7JGoSbshMUdIDFHYMyb9sbuX5n
	mWeZJzwktq6FkTjdSN5I6dcr6LyMBjjbuN9sgLcwjIzWisUfGSM7LWml2R9P8DFSLhcMO1VTgRf
	39QrrlVV9BsBSpudqfO1uu8NGmAhbzAzpRZ081V9lUSU6lAMqYMX7nGBLEqydMUCcLbfOedwOT9
	m42YA+/NZcNoioBRBOGBQiW+71A==
X-Received: by 2002:a05:600c:871a:b0:4a6:44b:2593 with SMTP id 5b1f17b1804b1-4ac18d68babmr382886655e9.29.1793873010557;
        Thu, 05 Nov 2026 02:03:30 -0800 (PST)
Received: from threads.localdomain ([90.254.187.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b43342773esm53455775e9.4.2026.11.05.02.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:03:30 -0800 (PST)
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
Subject: [PATCH v6 4/7] net: stmmac: dwmac-meson8b: follow the generic RGMII delay rules on the T7
Date: Thu,  5 Nov 2026 10:03:19 +0000
Message-ID: <20261105100322.37816-5-tanure@linux.com>
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

