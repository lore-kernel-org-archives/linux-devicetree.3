Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40502437115;
	Thu, 13 Aug 2026 07:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786605943; cv=none; b=BpxY+o4NfzTd/9zNvXShyKTu9Cf6bBbabfdX9VvXHq80ZXM4SG/Tkf8RNphkK3NZ/v08f7dve60FaFLAHg5FIkLsUicl4Pb7hFstbm9FFVR3FSteCUWqdXZpskGXUAH2gDpvLLpAHMv311uhtFHnVbtXI+fTmcme2moqjXsRKGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786605943; c=relaxed/simple;
	bh=xskMP5i9IUq98msC9SlBCa6Bapx97QqrGqgwgxkSt5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q+Sk4WSZh0tFp1wa30QsHPGiTxsF1TwIZSLPgkcWD1N+zZQV50so0oj8a0frLNAnbM8GywkjsPqeN4/il3oedOBB7UqLu2bdG5BZtkvnCX8JSH8J8DUEQP6aqSGRyl3bwtTtlrl8RLJr5L3Tzq++wvRuBe+pTmO+mL+262X+ecY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0+M/66RM; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0+M/66RM"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0124A1A15ED;
	Thu, 13 Aug 2026 07:25:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8813602B8;
	Thu, 13 Aug 2026 07:25:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 752AD11C4D9FD;
	Thu, 13 Aug 2026 09:25:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786605930; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ae4Y1LKEtrS8HaD4L0HeXkOJ7/FVtmzDxwwoJBX8xFg=;
	b=0+M/66RMB64SC2dFcH8dQZsVj4piKukOs8uPS87RZImBAACr55XDgmyK8BKR97jWKcrEl3
	z5grx77YgnFag0y0TKSO/yytvOeEkuqI6MqrHdGY9cR2RxuLuwUmiCPl+oeRfWabhxkEOV
	XbTOcf03cxkzO8OS1nN54QTkqckL3QpB59shYBj7GGbuld7JxSMa4MRsbSeaqIQ8Zp+iS4
	OAPrzJknT2l71TY2kV9KgAc/UGFa8EkJ9elbhD3tZXGJPrtSuFk2W5kejLVAFTjbst3Dqn
	xr53xWKhRSxu9o4HQUHTaNwbTZ88v2CMdPEQAAECTRN36hW2DZ/L+w7j/cBbdg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 09:25:07 +0200
Subject: [PATCH 2/2] arm64: dts: nuvoton: Add NuMaker board
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-perso-ma35d1-upstream-dts-v1-2-bb237fd7c3c2@bootlin.com>
References: <20260813-perso-ma35d1-upstream-dts-v1-0-bb237fd7c3c2@bootlin.com>
In-Reply-To: <20260813-perso-ma35d1-upstream-dts-v1-0-bb237fd7c3c2@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

Nuvoton MA35D SoC is used on the NuMaker SoM, itself plugged onto a
carrier board labelled NuMaker. Create a DTS including the SoM
description. As a first external component, mention the SPI NAND
connected to the Quad SPI controller.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 arch/arm64/boot/dts/nuvoton/Makefile           |  1 +
 arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts | 37 ++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/nuvoton/Makefile b/arch/arm64/boot/dts/nuvoton/Makefile
index 3bc9787801a5..4c82109c885a 100644
--- a/arch/arm64/boot/dts/nuvoton/Makefile
+++ b/arch/arm64/boot/dts/nuvoton/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_MA35) += ma35d1-iot-512m.dtb
+dtb-$(CONFIG_ARCH_MA35) += ma35d1-numaker.dtb
 dtb-$(CONFIG_ARCH_MA35) += ma35d1-som-256m.dtb
 dtb-$(CONFIG_ARCH_NPCM) += nuvoton-npcm845-evb.dtb
diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts b/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts
new file mode 100644
index 000000000000..01f1f800aef8
--- /dev/null
+++ b/arch/arm64/boot/dts/nuvoton/ma35d1-numaker.dts
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (C) 2025 Bootlin
+ * Author: Miquel Raynal <miquel.raynal@bootlin.com>
+ */
+
+/dts-v1/;
+#include "ma35d1-som-256m.dts"
+
+&pinctrl {
+	spi-grp {
+		pinctrl_qspi0: qspi0-pins {
+			nuvoton,pins = <3 0 5>,
+				       <3 1 5>,
+				       <3 2 5>,
+				       <3 3 5>,
+				       <3 4 5>,
+				       <3 5 5>;
+			bias-disable;
+			power-source = <1>;
+		};
+	};
+};
+
+&qspi0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_qspi0>;
+	status = "okay";
+
+	flash: flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <30000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+	};
+};

-- 
2.54.0

