Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6327339399
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 10:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784716929; cv=none; b=VJDi2AGVF/yqUFQRbKYKC2J6WARX7LC8h8fuadVqc/XhfoQsPilQUZAwulLyNG223Ne9gbLEoQ9+eD5KKp38WAhr0XC9kLPVb5AY864cZ+f+2AQYkOtpQa4ERcdiXpIwMX+4aQ7rDbbaQyar/0NEPW7WGeCf8SRmuahpU44pFsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784716929; c=relaxed/simple;
	bh=QyBt+OTg/8NLfd7Ea1cQ1cz5tIlRNed4uskEPHLjqDI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Jxtl+97Sh2ZCiGOgizLmBEaGNByGaUJie+V6eTpM8e15gEBvBIHxSJr09iojIaYEh/1BF/XhnjgpaeXa6AiyO35aTB+CFePLTZofQiM3hJ09fOwxuyIi0U9i4Oc8S/RzXZBgx3PSdJjSKQ8WHzqUCNPXjozpLa2hTkPhOPy9fsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=prwI7BY8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="prwI7BY8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49548e01d02so24638515e9.0
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 03:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784716926; x=1785321726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EU/+Qn2XRS4DDn4lGHvzZzxZVrDtGY5ngYyeG3iNo5M=;
        b=prwI7BY8a9+gGXmX7ggCR0hSAKcFlFPItsx+dzcCV9lLBCR9SqaU4noTE43wEah3mI
         9U4tM4LpPYGJ82czOlPr5sVThakgAHVO3qWG1dFXgEYF3KRDlvb9bz4IVsiqLrv34d/Q
         ibDWMiQJSplS0GZKUTagGU1w5zXMM1UZ4cq3dU38VLm/Axt57ckZO84AhhC7aNKQGDlM
         DltNweQ2fbXPqieYMg6mixeCYjWE+2dKBLMIWlEygXX4rlqqjmkpo1uCC7zFhmhGB2ls
         yxARC5I8S3WFbAZD4WGTXan60McmUuM6lDaFItTReYvf+yq86GW/14y6Iib/jOggNbhi
         cWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784716926; x=1785321726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EU/+Qn2XRS4DDn4lGHvzZzxZVrDtGY5ngYyeG3iNo5M=;
        b=pcXCAqn/XVakUF6+5HVEI6jUPGB7v4E9ChokqGMhdTDgn+qWZJmox3MzNKKDmgy7Zu
         hZUpQo+MmqHcc1uP7M3oEnCy3oKJ4Dyc71wLJvZiwP1rwixz6b4c6v+VqQYKYQUWeFr6
         hbSuTlXNjPaLst0F4XZT6/TAFk4MhLFm5iS6Sk+iI9M4A992UYeZlKCCbhJF/Z61XmrX
         PKx5IlCUGHSeDjOipvgrGcgEX22SmmAPNmgX4dyhzPFcl+C+WYLXNAfcoAaS5lJfzhoL
         +nO2rHpr5pr3le4gz//M+cWOrtDI/tsLML40jxR28DKRFlZAAW4EO9tHeqnBKBtaPTWG
         256w==
X-Forwarded-Encrypted: i=1; AHgh+RqrD2OAwKuSlzN03jvpp/N3dEr2908ckAIpnGY9gPsHayB/MKTxjyGFOglB+kKfcYAAfTY7uVsdmkEj@vger.kernel.org
X-Gm-Message-State: AOJu0YxSP06TP2lNknq8gC8CaVkgG03cw11fJQFUFHWxdin6bDRgoz7Z
	aXo3GKZYdUqUlJBTiIPYs7GPKx9ZyIVgZ3NDwksYcQ82+q/NbBYbraPj
X-Gm-Gg: AR+sD125ZishkCKEleHVbBdMXRrrseZboZYkoQOFvvmpP8tvPMCF67Bw7U10yn0jEZR
	qEsvl9sSwC7zu1cKjBc17yB2YJ5AWsAPBV4m0cWZwJXR/kpJ8/UEOnjwFhWuh42lO3oKU8ztJc0
	BSBeOMf/JxkA0u9/oXnOCFX6AF9nd7sKkg+cmzhh6LnGkfsXPQZY5lieLAOifzDKAoopgoHqPMp
	59ehVdK/d/qo6HCqWaAJku0ewT+8n0pZ3xwXnd6g0cdJGM9xGvV25FgtDhInk2GtGF1S6IvRUnN
	S/y4aEwsqDu3VlHS8YhHeUBoG/LXZKO8ffrcPB1wa8miXoynzUcgo9MyFzbEKhSrSK5T9tiy9Ws
	GRqwQB8ljNUIMijb+t+g08rMw6esGp+YTgSzimOlmsIhsSzWItigQ5IWzHjoA0XKMwENF+zv8MV
	wBpoZDMx6l2Wakbq7UwpJBiQ42w+u4yX8ukNgy2sWW4DcdVEXo4WblZau61KRfaJNfZufCRS3em
	2KW48CSuPSjXyQ=
X-Received: by 2002:a05:600c:5490:b0:495:6130:7805 with SMTP id 5b1f17b1804b1-49561307a51mr114097015e9.14.1784716925698;
        Wed, 22 Jul 2026 03:42:05 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c98ebsm126602615e9.13.2026.07.22.03.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 03:42:05 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 1/1] arm64: dts: imx8qm-ss-dma: add LPUART4
Date: Wed, 22 Jul 2026 12:42:00 +0200
Message-ID: <20260722104200.17729-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the missing LPUART4 node to the i.MX8QM DMA subsystem description.

The peripheral is present in the SoC and its LPCG clock controller is
already described, but the UART device node is currently missing.
Describe its registers, interrupt, clocks, power domain and eDMA
channels based on the NXP downstream device tree.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
index 974e193f8dcb..25c5e4423163 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-dma.dtsi
@@ -8,6 +8,22 @@
 /delete-node/ &adma_pwm_lpcg;
 
 &dma_subsys {
+	lpuart4: serial@5a0a0000 {
+		compatible = "fsl,imx8qm-lpuart", "fsl,imx8qxp-lpuart";
+		reg = <0x5a0a0000 0x1000>;
+		interrupts = <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-parent = <&gic>;
+		clocks = <&uart4_lpcg 1>, <&uart4_lpcg 0>;
+		clock-names = "ipg", "baud";
+		assigned-clocks = <&clk IMX_SC_R_UART_4 IMX_SC_PM_CLK_PER>;
+		assigned-clock-rates = <80000000>;
+		power-domains = <&pd IMX_SC_R_UART_4>;
+		dma-names = "rx","tx";
+		dmas = <&edma2 20 0 1>,
+		       <&edma2 21 0 0>;
+		status = "disabled";
+	};
+
 	uart4_lpcg: clock-controller@5a4a0000 {
 		compatible = "fsl,imx8qxp-lpcg";
 		reg = <0x5a4a0000 0x10000>;
-- 
2.47.3

