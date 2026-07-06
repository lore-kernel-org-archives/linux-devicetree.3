Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4631E42465B
	for <devicetree@vger.kernel.org>; Mon,  6 Jul 2026 09:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330498; cv=none; b=AurCataYcAjpIQxqh7mhAKrSuUYHjcOTMlWC6NAusCIJZKxbJUeKSq4daPOOaHDO181x96O4cEwF1cdD1/ahF7GFeBWfrBo60f9X0SfsH50I9SRaoaVfrmqb59pF3WjkxoxSeCbCndrbju/ZI87LJKG7fLHEPWANucT+OjXKQOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330498; c=relaxed/simple;
	bh=it0iyHNzGgRXSbIYqOspiD1U5H+0kjcNa5mlHWyzZs0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d+hf1Op5ReuPYxt5ooAIxl+Q8ZCx5deyBXhfKU77YyTSFv6RIHqb51a7ehugRhM3VtRuzgvyixYFBOTfd45WBTgVZx9VUq6WTD+GPonQGojV0R+3vscNNPyWAGsvfwKY59PQGrwqVPyUwBAmOgNa1d0k8mSazdAF00XxO07fHuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qOP6MGvi; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qOP6MGvi"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c2c0b9a8so25264355e9.1
        for <devicetree@vger.kernel.org>; Mon, 06 Jul 2026 02:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330492; x=1783935292; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g/2A7YnOroeJEFO5nPIrjvO/9o42R/QUT3pw+IoCgcU=;
        b=qOP6MGviLc296W7fuUtTrDE8M+bMRdBLznrbI6bSic13EoWDog11HY8pvTFqxkbjAS
         yK/ea0iEebI+RMsvGP232DsnSRvGu+/i19whc27F6LNnxWCXnxSb+bPJmOB/GvKFvLnL
         XwzbQftzy7/wsUzuCcdznUk4yYULPufTRNyJzrQwyQ2+A6/JDvfKimhtNTEE6uJ8WMaW
         NYBfBo1CgnDklcEZCK/LwNbjta7VT2w580BAMLrpj2crpnKeowk9FHu9KbYH55+LcT6N
         q8/4evhijKhOawwGA62lTMr+Y1qgRSm03L60nwXdH8Bj3KAy6YRqGDCTMm4ZCOJF6IlV
         DB/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330492; x=1783935292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g/2A7YnOroeJEFO5nPIrjvO/9o42R/QUT3pw+IoCgcU=;
        b=Kq87ZNAAZ+MZvHVwT8iRvUQoQTUDKTeu+dVBkaxVlz0E+P22rYRY1bfnKbs1wKtn2Y
         uNRFHskL3NG6La78afe22CTi4XqogoJYyjhlOIXTunhJt8JloDjcDLjnSSPAU9rX97Oi
         u+oBepR3MEbtdqQaESCVO1W8k5YVI2zUv67huqwLomGHGxSbCDCKnWiO9wUFtqtLXxy2
         MeQKZ9c2XiGq0Ix5VARj/4p87/2SEtsZI3W1bTmwB+qwzvEb3saK29HRtVlF1azsdHIO
         XRCOMKDwaPaeh7FZlG8jYMRxWt7vmUpcRyCDSwq3BSUN0UH4b2bdkLwYV+Pav/1PLeZH
         NMVQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro72lr39qlXEYQp2b7IB6fceOqZHMqic4iampqOpAee2diGXgWKphJQxxh7QOBUXZe86c86YWwFpL1D@vger.kernel.org
X-Gm-Message-State: AOJu0YxaddEjm0ATXTLulkHRPTJhLEdY7EzYlLvctDfdWccYGHG0LE9M
	GQNnyO0odZ2Ehg4DVVfwDPkdZ2gGsl6kGW6UDTL/K/b/qK7Ug33iEtvv
X-Gm-Gg: AfdE7ckHTyGpDyh2MhtPWLiOk6r/75gcBC/sa19g0iJ6L1/cC2M+4hZ/cT2zQIgJVBQ
	RvpZ5adTwVhyJpIFfiZp+waTlPjj3JK60AQZ/RJwiJvTk0M5W7uZs6gJVBqhxzpTb0C91E5H8nC
	shibKYjpiUvJ0hFljEULfGbgK6rFaida3H3tA1qdwEEaLG+cZxTZzQsNFF2ekPbpg/VPc/oOUch
	sN8YrT/p5mVoo4RcderxEsMkE6hgwqsN5/KZHFsUSQ3fvKS6kx0DCJX8am0vvADCkQXok6dvclB
	6XQ+wF4DWTcQ2uw24nCCd2+xXO+ni2Q2uBa2JDPrXDI1BnUdODOskKwGbYzY/FFUVoWofqE9mVl
	z51KZV0/vy9/QQfUMTNXpL8QKTi4T7jokpao/Qm+vwtjhB93mjyAXQUsOdbfCk1/8qQAtWXkuOU
	/1p85AzsXTzMoXPKuImEJTblkFCkKH06bFIio3Ax5dqSG3YeiLB/tLMlEA4pYqYu3rPu45VpYat
	7xYgctl/AstG3w4YWIQjVh16Q==
X-Received: by 2002:a05:600d:844f:10b0:493:c1bc:79bd with SMTP id 5b1f17b1804b1-493d11f03acmr74713315e9.20.1783330491864;
        Mon, 06 Jul 2026 02:34:51 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:51 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 01/15] arm64: dts: freescale: imx8mn-var-som: Move UART4 description to Symphony
Date: Mon,  6 Jul 2026 11:34:31 +0200
Message-ID: <3ddf65049a048dc4760df1e8ae5af4d3e91ca77f.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The VAR-SOM-MX8MN module does not provide an onboard debug console.
UART4 is routed and exposed only on the Symphony carrier board, while
custom carrier designs may choose to expose a different UART.

Move the UART4 node from the SOM device tree to the
imx8mn-var-som-symphony.dts, keeping the SOM dtsi limited to hardware
present on the module itself.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../dts/freescale/imx8mn-var-som-symphony.dts  | 18 ++++++++++++++++++
 .../boot/dts/freescale/imx8mn-var-som.dtsi     | 18 ------------------
 2 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 3434b189fa58..b07e71d3adee 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -15,6 +15,10 @@ / {
 	model = "Variscite VAR-SOM-MX8MN Symphony evaluation board";
 	compatible = "variscite,var-som-mx8mn-symphony", "variscite,var-som-mx8mn", "fsl,imx8mn";
 
+	chosen {
+		stdout-path = &uart4;
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -171,6 +175,13 @@ &uart3 {
 	status = "okay";
 };
 
+/* Console */
+&uart4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart4>;
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -234,4 +245,11 @@ MX8MN_IOMUXC_UART3_RXD_UART3_DCE_RX	0x140
 			MX8MN_IOMUXC_UART3_TXD_UART3_DCE_TX	0x140
 		>;
 	};
+
+	pinctrl_uart4: uart4grp {
+		fsl,pins = <
+			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
+			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
+		>;
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
index 38ef9e4fdf07..32f101ef2850 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som.dtsi
@@ -11,10 +11,6 @@ / {
 	model = "Variscite VAR-SOM-MX8MN module";
 	compatible = "variscite,var-som-mx8mn", "fsl,imx8mn";
 
-	chosen {
-		stdout-path = &uart4;
-	};
-
 	memory@40000000 {
 		device_type = "memory";
 		reg = <0x0 0x40000000 0 0x40000000>;
@@ -274,13 +270,6 @@ &uart2 {
 	status = "okay";
 };
 
-/* Console */
-&uart4 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&pinctrl_uart4>;
-	status = "okay";
-};
-
 &usbotg1 {
 	dr_mode = "otg";
 	usb-role-switch;
@@ -432,13 +421,6 @@ MX8MN_IOMUXC_SAI3_RXD_UART2_DCE_RTS_B	0x140
 		>;
 	};
 
-	pinctrl_uart4: uart4grp {
-		fsl,pins = <
-			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX	0x140
-			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX	0x140
-		>;
-	};
-
 	pinctrl_usdhc1: usdhc1grp {
 		fsl,pins = <
 			MX8MN_IOMUXC_SD1_CLK_USDHC1_CLK		0x190
-- 
2.47.3

