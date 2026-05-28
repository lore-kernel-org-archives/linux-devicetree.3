Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 977733E9F95
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 16:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779984254; cv=none; b=ZwDjMpC+0fmyVG82CYwb4DYYFFkuqVhZukUHNRqrdNXXuUnAHiYz/zNm3DGn61GcsSNtpLK74/NsMXQwy+VyBNSVp92G6p/w9SYStaQYLtB+JEZhYOb3RWGwq4jO4DiU9yLO7rOEtQaCDHPVyMfuOeAQ5vAEKRymn05WOvtqZTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779984254; c=relaxed/simple;
	bh=K1bvRYc9rbfL8YZFGffVYMdywl1qHroIrZdxg0Pfm+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MefoNCfV/H7+4F+0nPDZvMFogbylMm9LPWgSDqIuFg//csTBWhH9I2z8rMyHnlNvI4cdF8EODAlG6F2pktTL26ITSt1JaX1B40IWRtIe0U5Z6LGnNNRAs1uD2zuR+LnBHeIPLivgmrBE1ljtXdOHaDGIZkjne6d5BYz+8OEwvzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NB5Mr2e0; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NB5Mr2e0"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49041fb8c23so53255055e9.0
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 09:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779984251; x=1780589051; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1nqRvMLH1H04JcRW0z+OzS66kEwfQAxvc1wieYDRlYE=;
        b=NB5Mr2e0PTWpmSYDUb7DCQCDSM1ctiu0hyYlYJVZsdYqhof9A4XIh/PaTsL4pnA5LH
         SD51MuHyK2QfEbWGZRxhsa0HUzkJpe6FonwQGJM9678DcMRCS7TsIm/vKMMUohJGroDm
         OdLiHDGQmYWFFlR0aEvm21afshpPZ1OtAoHVPwJAu8T38r5M+uTnVm7HkkA7zGCIeXGe
         FFpsrJyQEml5LSq3f1rw0crWvidu6p1JXSfBpQc9siaOa+IPOFCn8q2m0T8ysdnmRvKK
         /YkEkISfhRLl3gEgo6y0yEug1yzy1UoPO/+8gGfAAJMyx5tFri/W7EjmOvUzO+H9Mufm
         6OOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779984251; x=1780589051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nqRvMLH1H04JcRW0z+OzS66kEwfQAxvc1wieYDRlYE=;
        b=joRqapf+sodkB/qhx/MctjRUROshYIwzeh3qKruEPkDCfOXiL/URX/8qILVrr23eLg
         IMmf3SzdTP7jDfQV5zauxrIgN3uWNr2aIos042/tnjbBEFBD5b8RCWTf4UTHc4oLSISk
         gE7fENHodP9XU3TBtRUKdtKEIqPu3x0NBrX29m1Zdlz9Mhm2hu/UdFuskp/+JC/J8DZO
         g5bPdb3JKAXEuyQMz5pYchIuCeLDXg8yjQtpoVLr23ghTxYFZwYcg5hv1VM/soxtpbKY
         6lBRMz/fD34/ptrCcVRVaJCG0Jy+KsoqIXpBhZOr4ON0OmwmorCo67nTQjfeR/ido+dE
         Kc1A==
X-Forwarded-Encrypted: i=1; AFNElJ+CTahZaF/kuTHAYt1SA2k51jAPfOlh3ERDcDfONPvHre9clqRWfjUJhUb5qTqNJqxPkF/aVpKio+SB@vger.kernel.org
X-Gm-Message-State: AOJu0YxAzp0mrznB8ocACKaGjgircamFiUHA9nwj/tS9jji0PoRDbNVx
	WvJI1ZclDCccuVP/hbvE17H/OAI450GeWW4etBzs7QkqNEtnJ6BepsOpAutoDg==
X-Gm-Gg: Acq92OFfG+1nc6CH+LhGn61kmNPvBQmj//3/pnCyjhTi+yLOxx/3U8lzrnHjIMbr/Uo
	EL74bJ69EcSsNy7OcVrzBI9v9eSBYh9zRnUZ0pjpBQggf/0ulHS8IKHiAbZzO6ZLtWLw+JDzpTP
	IJpcW4mQoPz98YWOfGIK2ZxrzD/Na2ZWOnnOkdR+GUBOuobUXL8A6xVYPW0SVEnyZpZMq91ao+I
	NXSeaz55WQbnrXiExXnd15iNGZot6Vvpzhpr3+gnXQTMxfRDlFGpovrd7gX65FamELUdFE3ekFQ
	GQpuknKEp8aiEpJ05Yx3iXYxPK0Uc3qgP/Tpf2FjEFCsGcSrxzz3/zFUtD6fCO2LdIDWklVkEpL
	+89Zd8eeBNcmWEc+G4RKt4DhShBFgig6JFGxJygO1MIgoFZUP+JMrDnHu+YlwxA2fuJ6lTuzasn
	P/SPd+3yocyDs+16z+I+QngUTWEx/faArXYF1LuETmn5BZl1T+YSLC0uJDR4IBjFcG+6DuR26Ur
	N/WNRowoR1eoPQBWslzDEstWc3R/rxt2521aiy+/A6c+vvz
X-Received: by 2002:a05:600c:c168:b0:48a:6798:52e9 with SMTP id 5b1f17b1804b1-49042268d98mr482071085e9.0.1779984250724;
        Thu, 28 May 2026 09:04:10 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908d9fb1b8sm34979495e9.2.2026.05.28.09.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 09:04:10 -0700 (PDT)
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
Subject: [PATCH v2 1/1] arm64: dts: imx95-var-dart-sonata: add CAN controller
Date: Thu, 28 May 2026 18:03:58 +0200
Message-ID: <20260528160358.19006-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the MCP251xFD CAN controller connected to LPSPI7 chip select 1 on
the Sonata carrier board.

Add the second SPI chip select GPIO and describe the CAN interrupt and
pinctrl configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx95-var-dart-sonata.dts   | 27 ++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 0f3d2e488f4a..7985a42f5785 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -168,6 +168,10 @@ &flexcan1 {
 	status = "okay";
 };
 
+&gpio1 {
+	status = "okay";
+};
+
 &lpi2c3 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default", "gpio", "sleep";
@@ -280,7 +284,8 @@ st33ktpm2xi2c: tpm@2e {
 &lpspi7 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpspi7>;
-	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>,
+		   <&gpio1 7 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	/* Resistive touch controller */
@@ -306,6 +311,19 @@ ads7846: touchscreen@0 {
 		ti,settle-delay-usec = /bits/ 16 <150>;
 		ti,keep-vref-on;
 	};
+
+	/* CAN controller */
+	can0: can@1 {
+		compatible = "microchip,mcp251xfd";
+		reg = <1>;
+		clocks = <&clk_osc_can0>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <15 IRQ_TYPE_LEVEL_LOW>;
+		microchip,rx-int-gpios = <&gpio2 22 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		spi-max-frequency = <12000000>;
+	};
 };
 
 /* Console */
@@ -442,6 +460,13 @@ IMX95_PAD_GPIO_IO37__GPIO5_IO_BIT17				0x31e
 		>;
 	};
 
+	pinctrl_can: cangrp {
+		fsl,pins = <
+			IMX95_PAD_GPIO_IO35__GPIO5_IO_BIT15				0x31e
+			IMX95_PAD_GPIO_IO22__GPIO2_IO_BIT22				0x31e
+		>;
+	};
+
 	pinctrl_captouch: captouchgrp {
 		fsl,pins = <
 			IMX95_PAD_GPIO_IO33__GPIO5_IO_BIT13				0x31e
-- 
2.47.3

