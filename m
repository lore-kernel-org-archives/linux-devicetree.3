Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229C940099C
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 06:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763651; cv=none; b=oIEDM0gQzRfJXeleLslHKlva8kk5F+bRQkEBlfKwO9AZWXsGDceGnXazHoZuvCceBRa/ZERdG8/k1nTLhC8m2JnfLJ0AbWNpPEshcvIn6L0Oek9WibF3T0+lgm8hUESYHwgVARp6nZDPUF5pge/0M/O4yo5M8dG4szfz7T67/8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763651; c=relaxed/simple;
	bh=4oyC3B9YoKBnvhj25xvdbfh1IDoKyEgUX7Ty0r+F0FI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LAxxRBICV4K/WjoRR+GRm2mX3PrmyjeNS/avv3iTqh16SP0s81RPpHP2oiHhmjDUBIKm7IISCG4FfaG6Hdd6w5p9/AZXL6QYacEpppbtyvtt4wmwvrGyFvzfbdHPQq8DjOGDpT1MgG6dVl8JT9yOZNxKKsG8/r75wA4nSO4zRiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gMNklP++; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gMNklP++"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-482e257a23aso2141655f8f.0
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 23:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763648; x=1789368448; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f6pfB+AHXWKtWLZqidHfQCVglH2w9FfX1NUfObO3zo8=;
        b=gMNklP++HYL8Y2H7eWvLgxO4K1kRB7YlOv9tzqfSJxoLz07q2BIDmTaDKtmdPMNG1T
         6i1E+i3gBazhKbcIzbK2YHztJf1wgQc2QvNGKmgRBYd27FIK2ELMnfUqAuLczxfb+pNn
         jLOj5kQCvn1C8qTGJeUeoVY2Nrag1k2F59BbKlmxLxSbW/+lT9enj3XOCeIKnVHyx+Mw
         kgU8LLpVEM4g9gwhpvwwstEbQYP4rN2OiA7/vbNbP4CN9gbtL9eCTGqCTZlcCozkaMqx
         bcqRG7PWe5EwNAzVlEcaXqf2VkOfAUdZ9LquH+PWQNkCFBDgsl4ICf9+qzrw38Msb5fG
         2IcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763648; x=1789368448;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6pfB+AHXWKtWLZqidHfQCVglH2w9FfX1NUfObO3zo8=;
        b=eXUHCNF0oJDJXp1v41YFhiLfXrTvXwEx4yHiFalmmwxf+4UwCMIo2/CqLBBE0K19OY
         /lzoxTBr5TT2FWHAJ9YTMIoX5SMfjTPssxp34wterS2hN56AevNv+YQUUxjk+/SHTjFR
         B4o0eL43TQC/uGjxEebI4aElUzanZayTx1iIS+smezVmq/FDPUCaJcq5ZOKs/kqT9zhk
         0LE9SklvVY/QRRpjKUqUjkme4nJYauuR9wJzpcfUMes6EF8LiSp1IT89wgaJOxmd/HTX
         J+Io3RCqXPQjB73q5AfUck/px1ETKPN7MxGjWbKL3alHDsmWWKhuz8Sq/hPXsrfnDU1C
         MsbQ==
X-Forwarded-Encrypted: i=1; AKwUvByojhmdlWODYFIzR9SMx3AfLiAz8RBxp9Lfy7npruPSxFMyhCkUtNClzayuGBium3ZTVhd/q4TKyiOO@vger.kernel.org
X-Gm-Message-State: AFuF++kRLvwZ2sqkO0mP2rMC4+gUTzbWOvqlSCqMSzEfhvGYS6yTnLo7
	Wjn1HXh2mLSxCHOmqg237kMHSGoVbzAXcnxsFkH7t/zZ/XN7csknI7t8
X-Gm-Gg: AYBFou2enmd12lzmTSCtYfOgpc0jA72SSANW5MLWYA9V4NZFF2B0vnQ+V8TLvu4NMu4
	2ICj1FRN5RdIgVHjCSXiZS/uYHae8gbCtL0d4jOjAosy2qhxsKTANXq/MUAv1MQYpkij6pFT6dk
	3R1lgI72xeCAtuZfZSdhPJ+hHnsjB1hGsBCYCo91Yd3+LdjsBXIBQFxPa5SS2nNzgmAEbU7FO8i
	xiH4gQ7aPOr9r9/Kj4hLzjVgT5/N+v+p35sQkJ0xQjVcwE9Kc21v1VLf3WBJU9fxJGLtDgXqkIC
	NEy2GXGkL4DHp0HE2hyDwUu1nFq6EGUPeYHSChEaQM3F2mIJbreLiDxe3Ikak19H34hyz1fcRKy
	Ei9uKWSd+Jx1ra79WqLnF/SyDNjd1I+/zO4savN3ILrDhdCJHgi/n69wQMkVJpphoB7XFwcIqZq
	zDBjvYEMNGDshew1iSvRZo6j9b9ZRMRXjaVjeg67e5ZZFXLsKHEESfdZOjvlHv9IQ5A+4fyVkCp
	QHhkzoDWvEdC6B9BnQvwbBik++vnaOPkTRz1vN687eJmfUSCEIbSnMklN2bu2XnZuWMku2dC6Te
	elE2iZUVV5k09aobLawyNJ9xFg5SXIxMNiWurrGdDWAL5cIE
X-Received: by 2002:a05:600c:4e45:b0:49c:f504:2af5 with SMTP id 5b1f17b1804b1-49cf81dc3ecmr232937625e9.1.1788763648275;
        Sun, 06 Sep 2026 23:47:28 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm200573845e9.4.2026.09.06.23.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:27 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Mon, 07 Sep 2026 08:47:20 +0200
Subject: [PATCH v2 1/2] arm64: dts: freescale: imx95-toradex-smarc: Add
 ENETC port 2 in SGMII mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-add-enetc-port2-v2-1-e8f1f8b000c0@toradex.com>
References: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
In-Reply-To: <20260907-add-enetc-port2-v2-0-e8f1f8b000c0@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.15.2

From: Franz Schnyder <franz.schnyder@toradex.com>

The SMARC ETH2 uses the ENETC port 2 as a SGMII Ethernet interface.
Enable the required support.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>

---
v2: no changes
v1: https://lore.kernel.org/all/20260903-add-enetc-port2-v1-1-2a21139d7a7c@toradex.com/
---
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts | 8 ++++++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi    | 7 +++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
index 7437e523ff639..ffe537ccd5bd5 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
@@ -64,6 +64,14 @@ &enetc_port1 {
 	status = "okay";
 };
 
+/* SMARC SERDES_0 - ETH2 */
+&enetc_port2 {
+	phy-handle = <&ethphy3>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+	status = "okay";
+};
+
 /* SMARC CAN0 */
 &flexcan1 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index a6c5398a81e3c..27ac9731733ce 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -15,6 +15,7 @@ aliases {
 		can1 = &flexcan2;
 		ethernet0 = &enetc_port0;
 		ethernet1 = &enetc_port1;
+		ethernet2 = &enetc_port2;
 		mmc0 = &usdhc1;
 		mmc1 = &usdhc2;
 		mmc2 = &usdhc3;
@@ -221,6 +222,12 @@ &enetc_port1 {
 	phy-mode = "rgmii-id";
 };
 
+/* SMARC SERDES_0 */
+&enetc_port2 {
+	clocks = <&clk_serdes_eth_ref>;
+	clock-names = "ref";
+};
+
 /* SMARC CAN0 */
 &flexcan1 {
 	pinctrl-names = "default";

-- 
2.43.0

