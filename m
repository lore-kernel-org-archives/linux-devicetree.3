Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EADE3AE184
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 06:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763653; cv=none; b=ihN+IjeVCO9ZhnzzruZFckTzJZJxtl58kn1Cshh2//YkKByjtAsb8qcPCgnOd4xKd8dKyyp0j/WZInAFdJ7l/pdbApdMFOwIsdX2iL3jbNwD4Q13hdPOUGDHPswoM3BPY0pJtMLrgCcgd0B/4WV5exr9kkwV82hhsQBiXYgtHHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763653; c=relaxed/simple;
	bh=CBpkefT6kA0aU/ombsftRXwKkJ0HPgG1+oGWWpNYeDk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tyJ7pbadmlDnq/NAvCejoJYrTtpR9UOQqwRhf01r7TdZQ4rltbaBviXj7873nUhg8ptNDdXl0cMJP1hC8X75YLqm0z6kpP/vUEv9dgB0QXkPtiRbYhl5gN4AU6G81ya38s0QVGkm8eQ91d1HNI2NRW9mbguqg6T/IZCrpVMpDHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hTn9rgIx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hTn9rgIx"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49954b88fffso23246675e9.0
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 23:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763649; x=1789368449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RzP0LsnGrws9thQnaQ+phibnlayThrz2CWlymXMJV4Y=;
        b=hTn9rgIxUAWErO+b789SRDcZ3jZKO344L7f3U1btQIqHhqlv/Hj+QeAc1kRDnxHufh
         wpvsJ9Lq0Owy/m+VONPaeOex/F+GyWYczKGXp3txRrF1JIIOkYg0gAaXsWlr+1RVQKuA
         F8tr6SROcefq6OZlfBMwC8gAtSAkhR0d25rYP/stzioqwrtNkevBmE1Q+wqUwP4sZoFw
         jAYzrZzarZfkPK4+ol/sW8Xrv//AGFu5SOV5PxrJXG+1Btk4V5xWDf9aPfW9s6yo+1Xj
         YaH+ROLgnS1GpxpiTEtJI9rnb9vMUNYoLK7gaYP6PTMWuWwcEYoDPX1+gBN8SPzec6lx
         07Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763649; x=1789368449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RzP0LsnGrws9thQnaQ+phibnlayThrz2CWlymXMJV4Y=;
        b=ax52wh76XbCd6yPBQS2JYTszhd7arZiPr5zD1HyeYk7gvhy/7hEZdT4HpoUTwyCO+g
         SuHlfVVK/BITMVVx0M79sWI4v9Rsuqh4sUbbNg89G5tgo4EF08luapGl96F67XLKFB9y
         Mpl7nqtM6Wt6CSWrrjaL+62g+07WVViHji6SH+BlIKQLyY0skeD6TP/NAt/5vN0w+lFO
         2aB3DcVLb50qVx7wMOQOrfKAip0xn3xiw8sg04qIkWbUIAAEABYvmwp3sa9ms+ZBoZNM
         5fyLSb1L9AA8JsmcloxgCZmhN/TH3O61tXx+Vb5kHOv+v+Pgn/xG9fCkYkyspaKxIHJ1
         Emcw==
X-Forwarded-Encrypted: i=1; AKwUvBzzO0MPQSx2xWymfOyTagSZSerZxULYmyD5jYxr+E2tTK8Kb/vQY+r5lrxBDqgvfu55R7RSGls30NmH@vger.kernel.org
X-Gm-Message-State: AFuF++lDVgPFuidAa546rOwAO/zxPFIZ45cZObpqvmR2fHIVvG4YXUcc
	bWh22ojkIcCl/cRbZMhJ8cBL1K5qaPeDDyyw3kFQaSaUzM9q9x8RsPU+
X-Gm-Gg: AYBFou1hATkM0JaRCxhuYAxyPMjvuRUFJZqdbObnMIagY3dUg6I4jU3wK51Iv1+OkYo
	Cn/XZplVZUDmHRFEXjREKpwqZ3B/97a2pqW1S+X1+2waKK0TZLd7XudsDq+xah7xOPTPy8/m846
	01BU8g0wQl22ryb+90VWEuJSi7XjOPz6pI6aIxs4ui8a8WVXbV1oeTeSR6iy0j8ExnK1pxrIKoR
	BGbS2cFWNPDwoSMTpdxGHkk5BvqH3lIGqLhVbRwHzbK4HjHLNWTQ/fT8lxMiIDfOLorb0gBXWcO
	Lk62c4uoAoWOyOK6PAYREU2EU1aFsthT7m96pmzouTrfQJm/QeiGDu/SW3ismsm8KsBwMiCaiHE
	TvHvAx2w9ZDdlfFfRpQrMPkAOdgM+HM/gNaR5ascrP6MmKGkkkMKF0Ctqb7gR9SyRu40wVYgIzI
	gOweTWwEGvtzOhEHrOr/bbpx2lBKw8dThJpX4o1wtJmMoKMsDonz4sKY8jnCrIXcF5dUEuoVu/6
	nD7oywt/QSAUh/s+4W44Le+G/T3prtKd4iIhhg5kH0QaHUE8BE7TQP4o+OvVx30WJWBDUn1CFy7
	h90AcwfUbGaMMp0JdiCRHMnIUwl5f2iqTRFxDQ==
X-Received: by 2002:a05:600c:34d5:b0:49c:fc6c:bdfe with SMTP id 5b1f17b1804b1-49cfc6cc085mr168152725e9.21.1788763649151;
        Sun, 06 Sep 2026 23:47:29 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm200573845e9.4.2026.09.06.23.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:47:28 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Mon, 07 Sep 2026 08:47:21 +0200
Subject: [PATCH v2 2/2] arm64: dts: freescale: imx95-aquila: Add ENETC port
 2 in SGMII mode
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-add-enetc-port2-v2-2-e8f1f8b000c0@toradex.com>
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

The Aquila ETH_2 uses the ENETC port 2 as a SGMII Ethernet interface
on the Development and Clover carrier board.
Enable the required support.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v2: fix node order
v1: https://lore.kernel.org/all/20260903-add-enetc-port2-v1-2-2a21139d7a7c@toradex.com/
---
 arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts    | 18 ++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-aquila.dtsi       |  7 +++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
index fd93043314466..365bce73eddd3 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-clover.dts
@@ -67,6 +67,15 @@ &enetc_port0 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+
+	status = "okay";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	status = "okay";
@@ -227,6 +236,15 @@ &lpuart7 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII_MDIO, shared between all ethernet ports */
+&netc_emdio {
+	ethphy2: ethernet-phy@4 {
+		reg = <4>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 /* Aquila PCIE_1 */
 &pcie0 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
index 3df17700b632f..7698ef44095cf 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila-dev.dts
@@ -104,6 +104,15 @@ &enetc_port0 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "sgmii";
+	managed = "in-band-status";
+
+	status = "okay";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	status = "okay";
@@ -326,6 +335,15 @@ &lpuart7 {
 	status = "okay";
 };
 
+/* Aquila ETH_2_XGMII_MDIO, shared between all ethernet ports */
+&netc_emdio {
+	ethphy2: ethernet-phy@4 {
+		reg = <4>;
+		interrupt-parent = <&som_gpio_expander_1>;
+		interrupts = <8 IRQ_TYPE_EDGE_FALLING>;
+	};
+};
+
 /* Aquila PCIE_1 */
 &pcie0 {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
index 69dc962a24a1d..f930965cb341f 100644
--- a/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-aquila.dtsi
@@ -16,6 +16,7 @@ aliases {
 		can3 = &flexcan4;
 		eeprom0 = &som_eeprom;
 		ethernet0 = &enetc_port0;
+		ethernet1 = &enetc_port2;
 		i2c0 = &lpi2c3;
 		i2c1 = &lpi2c2;
 		i2c2 = &i3c2;
@@ -209,6 +210,12 @@ &enetc_port0 {
 	phy-mode = "rgmii-id";
 };
 
+/* Aquila ETH_2_XGMII */
+&enetc_port2 {
+	clocks = <&clk_serdes_eth_ref>;
+	clock-names = "ref";
+};
+
 /* Aquila CAN_1 */
 &flexcan1 {
 	pinctrl-names = "default";

-- 
2.43.0

