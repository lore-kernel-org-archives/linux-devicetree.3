Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E6C3C6616
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 14:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535857; cv=none; b=Fvz7dRbOcsBpNwWv/DKPK9dcxI5Q0+orMDYc4k7lVUQDie914hetv3oWNUSa0y1Fu0RDOdxFXykhn8++MYgKQUJTBk6Z8bTok+GuELeAeF3Mv721Zej3ckkiwczd8HCf+xVR+QUXc0i5GGssA914TH5mAa046tL8FBrKCpfPp1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535857; c=relaxed/simple;
	bh=PmwkNaFjVaL9qgALK2SBvk6jTjb2dAHKjczGO3oQ4Eg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZxaehuJp3QQmDVw/vcdDAhHlDG6e8JtJgoid2dGVhPe05unxayLzFtjhDd5idTPatcaPjN3xpvtKguNNb60tVElZaA8IpDl9iBRzIpgadY9aiTHYwKNFVA16OvZXGnpW6vG3lNcZJXPXx4+1UxSOwW4HOrQyTnPDGnFoNmAxCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gwZ7PRKu; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gwZ7PRKu"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so10921055e9.2
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 07:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535855; x=1775140655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voyTd2jlBJQRP74fcWPlpmyrOn7UyuGjlvcgxGUNLvA=;
        b=gwZ7PRKuveurPN6/1EOIKzuztHa5ljXElz93b3My53BCUtESWbKgJcgPQdGQ2LjDzV
         N6vTApdbYkd4FXJFas888ojbEOGZpmVLmyooFrZr/DMp3FFmWaZZ683Y6KC6vf7dBNjL
         bJC3/AFkVawSVf1Aw30vk9Vh8MwKHQ/nJ2LUL38S/xMZNz5Zv0L4hp7QO8QypgfOwB/O
         1rkhtsh+WtwlR549Z9Rb+VdEQfF0wIDW/ecreKCapAfIhkRq9UgFDOYkMuVKawp95Mu5
         o47+d/ZSvdOLkP8BjXU5PhlXotkqxcXDnkAbqz2BoK6lcOU+PalYzfsIoeAKgzZuFsVs
         WO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535855; x=1775140655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=voyTd2jlBJQRP74fcWPlpmyrOn7UyuGjlvcgxGUNLvA=;
        b=BBNl8OZ7FppTVjd6i+TRliKVoHhlY/QX4JnXitPKGg9BqRltZfNpbqYQ9yWuUFxWxM
         stJts/PHi9TOo9nQMgDG9KvOJvoxPWT9+4FtBaztMAnA5wnQL3rkREb6FRBeT13A/v0o
         T7A7re29Lpt/aGyrOMyGRaHQ95toTE7rw0jt5pBnlf63LLLjDnhunb2sS99s+oYqcGHz
         r22eeXStRRJ4QOOJ/vJ9KgbD2hs7MT4JARfxIRFcNLWSQxof7vZJqshjpcSZURdqcAUA
         OgQjeTgqcMTZu1PvDqxQ4sVs9rBmF/MMa78u2iVlpTypiFm5e51eI+zi2rSDLPkknKO9
         m2+w==
X-Forwarded-Encrypted: i=1; AJvYcCUt7Xbizfb7l6uQZvyby9K9J3zHugxkxYdB6eiVD20tAqr0W1ZegheTmPZFaHiWYl/40mvjU+8JvwWf@vger.kernel.org
X-Gm-Message-State: AOJu0YzXPkvjRX/SWdToRiVm7LGSfx9dWcl15M9yqVYlyDyMW3WJ4zZi
	tWpahjx+YyCJUDfPpYScZj+0avQVyJs1mZF8ritsZvElRWcWHaW2H8YH
X-Gm-Gg: ATEYQzztJEVgMaZkXpVXXRdh2zlFHzysMT/i7O6cxC5LF13f90wyWx+sZJSJ9cNDgZy
	hHZR+nueVt2Gusme5aNxjWNfyt8SIpP6lyUx0fMRDb5wHgw0l5Hk1gwIz2zwpgsILEytbrJRzVm
	8x8jNrbiPlsYToJk34QI1QLsToSn0ite48a0TJk5i4M/IvgTn+k30SR8qOf7bizDffCGhkJhZUy
	zrIbT+GTxW9pW0F07XkEF2tr0TuKsgJ3bEO20YF27/bxclDHiBP7Tc1RAM4ggkSNmQuL8f1FNXw
	MngYTbqxpmFMK9z3dD7nneGxRJFT4UT5PGbaFSxFGAkzrVnyCF+svCOZQWxDXrEMEGL3Jg0f3qC
	3uEYk50MvyKlzr+6jlRrpLLpDG8JMMhp6Ych/bVr23q83ZxgkCLOIYR+/zitST2l67ET1XvwzdA
	00g+xwctBjAWDk2eWPNidDPEy2D+UUOwthnG7RcfTM6CxPCNQjIWLZcmSOgjYRBYMg8zyz/ws7k
	D1c12Xmp/i3O2H/CcbPVCUlnbDDKMjUzhDatLBUo5XgG2u0DhWRBNVFA/Bl1pwgCumiga2ia3w+
	xAIsJXY2UzhJ7QEXOaXH
X-Received: by 2002:a05:600c:3516:b0:485:3bc7:a231 with SMTP id 5b1f17b1804b1-48716084829mr125286925e9.29.1774535854830;
        Thu, 26 Mar 2026 07:37:34 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722cb5845sm34024185e9.15.2026.03.26.07.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:37:34 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Franz Schnyder <franz.schnyder@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco@dolcini.it>
Subject: [PATCH v2 2/3] arm64: dts: freescale: imx95-toradex-smarc: Enable bluetooth on lpuart5
Date: Thu, 26 Mar 2026 15:37:05 +0100
Message-ID: <20260326143711.143462-3-fra.schnyder@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260326143711.143462-1-fra.schnyder@gmail.com>
References: <20260326143711.143462-1-fra.schnyder@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Franz Schnyder <franz.schnyder@toradex.com>

The Toradex SMARC iMX95 uses the MAYA-W260 WiFi/Bluetooth module, which
uses the UART interface for Bluetooth.

Add UART support to enable bluetooth functionality on the MAYA-W260.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
Although Documentation/devicetree/bindings/dts-coding-style.rst
recommends an empty line between status and latest property, leave it
unchanged for consistency with the rest of the file.
v2: no changes
---
 .../dts/freescale/imx95-toradex-smarc.dtsi    | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 1d369983cf7d..a90edefc5197 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -616,6 +616,19 @@ &lpuart3 {
 	pinctrl-0 = <&pinctrl_uart3>;
 };
 
+/* On-module Bluetooth */
+&lpuart5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_bt_uart>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+		fw-init-baudrate = <3000000>;
+	};
+};
+
 /* SMARC SER2 */
 &lpuart6 {
 	pinctrl-names = "default";
@@ -830,6 +843,14 @@ &wdog3 {
 };
 
 &scmi_iomuxc {
+	/* On-module Bluetooth, UART pins shared with JTAG */
+	pinctrl_bt_uart: btuartgrp {
+		fsl,pins = <IMX95_PAD_DAP_TDO_TRACESWO__LPUART5_TX	0x31e>, /* WiFI_UART_RXD */
+			   <IMX95_PAD_DAP_TDI__LPUART5_RX		0x31e>, /* WiFI_UART_TXD */
+			   <IMX95_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B	0x31e>, /* WiFI_UART_RTS# */
+			   <IMX95_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B	0x31e>; /* WiFI_UART_CTS# */
+	};
+
 	/* SMARC CAM_MCK */
 	pinctrl_cam_mck: cammckgrp {
 		fsl,pins = <IMX95_PAD_CCM_CLKO1__CCMSRCGPCMIX_TOP_CLKO_1	0x51e>; /* SMARC S6 - CAM_MCK */
-- 
2.43.0

