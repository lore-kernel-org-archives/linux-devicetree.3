Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492F73A1A48
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 09:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432243; cv=none; b=m+VMmMdUxBhZAnvoXxgHtyEGxW3piYvEq5WxNanS1DQSQvI16/5khQL6tjLXFF/UW5tCcw0AkNth7I0vSS4reMgjzZ2QzfjMtGQYbtw7UOU9NZfuX7MGA0cO+vChXeT898XZcGwj2s74MS0khLox9aKby+lqJ8j886wQvqI6kbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432243; c=relaxed/simple;
	bh=7S2TtGy+pFB82DMt7G19YnjCGJ08Au8tH8VwrKarfG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WNLogPIgjeNqhp+koMw4w4MiXGFvKEJkTY2+LjX+QVmJi+KgIJFgIlmMBfPqh+heLBdU1MBZxqXSqUzWmNxIN3zCuQVa4ZiCMQwdJx/MDIyalOLQSIn3rCDqWuK8PaEpqTRZJyb/aXRoLw1F1gTKgVa8BVT21S2q3oFZXFwbzsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=itsewIPQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itsewIPQ"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso19471525e9.1
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 02:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774432239; x=1775037039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPBXxnt46yKYRfcxb6dOkKkkhDI9ZyG+pcJC//3JKGU=;
        b=itsewIPQqZWfK1liI8j5nMEOCK3vlEAzeTIU+41s+TpempieBBllMTtC8QJEfg+IlN
         M+F4QB1oGKIxw4n4B5HZUfaoh7BDn8sXTsZDdp8KmPOihRx3odO/7AjbCZQrbyBCwx7L
         XB6MDzphcs3iKbUhFuXMPuHq5Zc9yINF2A+VklqaPGhZUpAS753qBaG+Wa7V24hlYmNq
         JbCB8SABkynoVhI46dc2iZKU/S0hEveYS/5vTkMig7QSovcclgs5hTbGLgblwZB09gvZ
         qee/PLtHQkrd3aYoO/zz7MwuomsZQPV/xJsFpj4li00391dh4u5nGJ5Z+o5snqxvATkh
         zJig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774432239; x=1775037039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bPBXxnt46yKYRfcxb6dOkKkkhDI9ZyG+pcJC//3JKGU=;
        b=EMbNu171S22KG+XBAM4sHTi9+jfhRrRDEbzgyaWwqIuf7hhhpx52gv5e+c8XypClgH
         tDQ4f3Z0Otq3oHk92LIDrcgqx9dvP46y8TLdGgMfePwitXw6X4aQlfM1nk05pQS5/V8W
         3YirT1yiIqGEm+GWNo1hHO90MDna4eNK22YUv+eSO7/uhVCj+W55j/2a2gfske13eskq
         QsAPyK8HlvirsuP3xbOee5WcfIrdJpTCBDLz4enWdeDuypWAWEh0RtAQOfistXuE3z6N
         6Ib8je+IKHrK/InSxZedQ781yFr3wFXrPU+Ycfqx+z/htd57NsGhqqddX4vJFdjUM1lg
         JQjw==
X-Gm-Message-State: AOJu0YxYjdPyw1AO2gjpOmaJj4lBKZpdzUuuVkd3EuK33MemE8Uk/FiU
	rrvyahFirDUyAGktXdpBVmtERqX1HwTum3dA5J5CUSKGeTNv73Dl5YPY
X-Gm-Gg: ATEYQzzwvaDReaYeYtJrJi/OgB1XsfUkWzJVX/kBAO0wExodLMVtXZV3aeCGbe83y1A
	P7MmvbR8p1YIUVKe77hHf+qJyyN61JjmGBAnOn/YYzx5AWn+6Nu38ZKTBGeNDpGIerL9XYo4jX3
	8cPv8R6BKGVliSNnIJNcfU/Gg/dy2JUeY8vUM98FRmmUHFiErvT3FVkCv462KqudRSa2e1D6N/D
	o4pysL+ngXGUnqmmvpiEyoyjCEbG8zSHcH6Zbv+70QCrwwsv7+U9sz3AHkKF9PcumGAAnhzDM3d
	tK0XoO3jYyPcuhUttxyr+VJynr5yrJXEzKJpg1iq4WpvKs+4vY1XAR1NdM79oJn5blA+Un6rm0N
	7eOwLaj0JNBVOWEKprNuogz22i0EJqfM19VibV3szlNFTAYYz4UoLjKU3ZQZghmIL06u1RLQIKS
	GlwHuO6eilGYk8T1crMlVagWHbZR634bSyVrj9vLlOA980cdABxoMnrvM8p4N/IBOsrmbZ1/YE0
	cZlylKItdiyPYDZ4spHOXfO+DqQP6EKlCeiBnXNCGVdAWbKcYHe7PqcXwK3Kwn2YsyTrJJy1Jn1
X-Received: by 2002:a05:600c:3b12:b0:471:700:f281 with SMTP id 5b1f17b1804b1-4871607a3c5mr45415425e9.25.1774432238789;
        Wed, 25 Mar 2026 02:50:38 -0700 (PDT)
Received: from [127.0.1.1] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116ee57esm111397755e9.14.2026.03.25.02.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 02:50:38 -0700 (PDT)
From: Franz Schnyder <fra.schnyder@gmail.com>
Date: Wed, 25 Mar 2026 10:50:20 +0100
Subject: [PATCH 1/3] arm64: dts: freescale: imx95-toradex-smarc: Add SER2
 interface
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-mainline-update-imx95-v1-1-b5ebe976655b@toradex.com>
References: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
In-Reply-To: <20260325-mainline-update-imx95-v1-0-b5ebe976655b@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Francesco Dolcini <francesco@dolcini.it>, 
 Franz Schnyder <franz.schnyder@toradex.com>
X-Mailer: b4 0.14.3

From: Franz Schnyder <franz.schnyder@toradex.com>

The Toradex SMARC iMX95 has four exposed serial interfaces, one of these
is SER2, which supports RTS/CTS.

Add UART support for SMARC SER2.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
 .../arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts |  5 +++++
 arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi   | 16 ++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
index 5b05f256fd52..7437e523ff63 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc-dev.dts
@@ -210,6 +210,11 @@ &lpuart3 {
 	status = "okay";
 };
 
+/* SMARC SER2 */
+&lpuart6 {
+	status = "okay";
+};
+
 /* SMARC MDIO, shared between all ethernet ports */
 &netc_emdio {
 	status = "okay";
diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 7a73958f6eec..1d369983cf7d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -22,6 +22,7 @@ aliases {
 		rtc1 = &scmi_bbm;
 		serial0 = &lpuart2;
 		serial1 = &lpuart1;
+		serial2 = &lpuart6;
 		serial3 = &lpuart3;
 	};
 
@@ -615,6 +616,13 @@ &lpuart3 {
 	pinctrl-0 = <&pinctrl_uart3>;
 };
 
+/* SMARC SER2 */
+&lpuart6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart6>;
+	uart-has-rtscts;
+};
+
 &mu7 {
 	status = "okay";
 };
@@ -1105,6 +1113,14 @@ pinctrl_uart3: uart3grp {
 			   <IMX95_PAD_GPIO_IO15__LPUART3_RX	0x31e>; /* SMARC P141 - SER3_RX */
 	};
 
+	/* SMARC SER2 */
+	pinctrl_uart6: uart6grp {
+		fsl,pins = <IMX95_PAD_GPIO_IO34__LPUART6_CTS_B	0x31e>, /* SMARC P139 - SER2_CTS# */
+			   <IMX95_PAD_GPIO_IO07__LPUART6_RTS_B	0x31e>, /* SMARC P138 - SER2_RTS# */
+			   <IMX95_PAD_GPIO_IO05__LPUART6_RX	0x31e>, /* SMARC P137 - SER2_RX   */
+			   <IMX95_PAD_GPIO_IO04__LPUART6_TX	0x31e>; /* SMARC P136 - SER2_TX   */
+	};
+
 	/* On-module eMMC */
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <IMX95_PAD_SD1_CLK__USDHC1_CLK	0x158e>, /* SD1_CLK    */

-- 
2.43.0

