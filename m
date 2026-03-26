Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953A537F8BA
	for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774535857; cv=none; b=QJ4WdZsqjRiNXHCzz3Bg4+NS9EWqsYEG8EJKccPuoCS4qOZYqaTnH2iLgRrC43fwlm8io6PA/ceO+qq6QzqYCxoBEhDNx6jDfN7FWcy0tjMyw2qI3jNiIBp4Vo+RbW8Cfo/XKvCTjHCXlb3wnnh7cF8n9TUfRNiZiIANDaAU1as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774535857; c=relaxed/simple;
	bh=tyKrl5KgYZLqKWTOXsIiUa4cYnc+3JmgWjtQ8z4GHtk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o1cIgtkc1v7AM32K432ila/sahb6B+L1VkEcWaWcfBCj2ajwayfsxMYFabz6gnMQ0W/Vf5PozYDzHKCVNEMG9OjkhI0I2WuH/7cpAO6MfWKOyfIOjSv70JCUQLO5/r0wJwI6GvaJf4QenGHsxVQy9yus5Kzt+VhCOXNy/ZKqXeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHgIeBxM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHgIeBxM"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so8845145e9.0
        for <devicetree@vger.kernel.org>; Thu, 26 Mar 2026 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535854; x=1775140654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/jbxR9OjY5SiCxmkdnQnFn66JvcHpYqliCfFxb1VJog=;
        b=SHgIeBxMa5AoYCSdfiyfJcEg0q6S8fFbx6phGNLXynHix17ekkSVMnOcLKAg3c6neU
         MYnYKhrtPv2J5CY1lhqxlXDO9JRNHDGpJfFARj2qBtoX8xtXVKgSnONEUttLpxvOBKZj
         oAm059BzrSUs7syVyMOI/4n5uNoYjXU1HyaUXeFtqA2DLP2SAZm+htKxQBPy7DvQtABU
         5cxB4vN8EkpjHaaxuQqKC/8bo+/JwT9kxiDHUqCrpWOIFcOklmFRctlAYZcD6m7era8T
         MC9oHA+7m0Rw2PQUj6d+n9MbbdmTHJkZQgzQ103uKs+qp+M4jrwPwo0sUOQQVKj3CDjV
         OgXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535854; x=1775140654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/jbxR9OjY5SiCxmkdnQnFn66JvcHpYqliCfFxb1VJog=;
        b=hNdxb1tYdD6x/LkECZ0rSKJk7RXN12SNK//9AxnmGItUzl1i7qpm4qbJqJTb+15stw
         nDrNAsSv1w9rSZ419TQ0jX9a64DTK3yCj0WNryJM7sIRN4+6OoTRVix3oXiLdB4fEl79
         IoBv7Jjm8GvlZxJefgfrswinj9tJEYfWSvHF6a+n9nDCQ8PgZZ+J7LvxXOidvtHSsYXT
         KRBCPMKFbNxOt3KWwTIlp/kdcBDkcafLHp7tkoTJYqnaulbDWI1ThhOLCwGcR8bimojD
         spV4YXV0HkfrZXGDNmTP3UdmyG6cSTPJUIDMawB8T9TWZAYidqBlgYxHHNBxqFr37YBJ
         Fiuw==
X-Forwarded-Encrypted: i=1; AJvYcCUS2jpVY622b4wOKzKIzyIjS84cLYXSOhvoZdf33u4MmvxufiM9IZdQIcczXfxsrZcHk5nUtT5hhZuc@vger.kernel.org
X-Gm-Message-State: AOJu0YxQxQGE+gKvkBJRnGd6klgM5Axr32hXIxiKwdZj155uDCnd81KS
	CYkXhUS/0dpQFg4Qg3V5LHetP43hcIUuP39hbdGoa5x5Z4Gysk1M7Clt
X-Gm-Gg: ATEYQzw55Vo05D+SkOxVb9s4rnBP5Cj8OPPaWQUUrqN1ZiAb/Kd6axiBi2DHN+0YFYB
	awDELVix+K1+h58h1LFdSJRLjAU9gZ6dYf2D5A1FgGshqVD+3SAyVrBUnqjooNOwHnQNkyHDEGW
	KPCV8/bjK6YPUWA5CquTzEry8ZcTHGmJD1ujFNRnIAi48Y97353Rov8e+/QvPVdb41e5PX77dXr
	xNrDBsNogciReydsYnj4ZYG/HlDXZVlPUFM9DyiRlLXhsU9NBT6AJ7a5B9Fih1gwfdbHHrb28Wm
	7LmkWhajIZFgJWmK096d+rDVUAxhtSkPWSRJyJ8PdEm3uQvc59M+jESkGGe91mLF9lBFxhnAl9R
	NsUS4dZl/hXrGTEUkeYNQtbIJWvnD5bezM3uUzY6B0RYOjqvsiM5LjAdiPu7HMo3d4PN94NW52p
	kui21b/5kFG6B1ApTx61yOfTWkrhGfmj8rK5xddMtr9ek5Sj9iTyvW4EAW9fMR6eoX/7tI8gF04
	9JUBIRkzQSAO8HVfKzKYvQuLEB3WnGIhNveHxz+R56QIdUxNcE/GsiKOzwb0zj5ZsUrrnMQlGIt
	O6wX3W2kWRmL+rbcR5Bb
X-Received: by 2002:a05:600c:1f8e:b0:485:4006:960c with SMTP id 5b1f17b1804b1-4871605aa53mr122496665e9.16.1774535853676;
        Thu, 26 Mar 2026 07:37:33 -0700 (PDT)
Received: from franzs-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722cb5845sm34024185e9.15.2026.03.26.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:37:33 -0700 (PDT)
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
Subject: [PATCH v2 1/3] arm64: dts: freescale: imx95-toradex-smarc: Add SER2 interface
Date: Thu, 26 Mar 2026 15:37:04 +0100
Message-ID: <20260326143711.143462-2-fra.schnyder@gmail.com>
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

The Toradex SMARC iMX95 has four exposed serial interfaces, one of these
is SER2, which supports RTS/CTS.

Add UART support for SMARC SER2.

Signed-off-by: Franz Schnyder <franz.schnyder@toradex.com>
---
v2: no changes
---
 .../dts/freescale/imx95-toradex-smarc-dev.dts    |  5 +++++
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi  | 16 ++++++++++++++++
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

