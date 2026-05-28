Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F630370D6B
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 15:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982306; cv=none; b=U9P+buman2n7fo5hXLLrDR2hiprl2TKQ2+1RERDalzoXr1Ap13ZdkKhxH6EnZrAwwRbZlz5xA410FftaERs4VnpyWFVV8uAIOW2bSlk+Z+DQ2e5Fzr7WyJIZEpPZj0RL/3I2NYq2mZ8OkmoA5DO6dB9GiExVnaOMEdoHGEFosKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982306; c=relaxed/simple;
	bh=ZmuKw4m+NlK8IUuXhkFoD+OD5y+cW81KycMNvd5uFA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e1JPmDjSzNS6tO+Y1CaiCakC2R0DBzekrxgwZPxgXcEexei81ktsBSAA3JX8RkluhSbTdY7DFOtTIDdcMTQTPnR4G+GSSH4jxaPFlRUQJwFYGXuPrTKrexlvH8dZRliu3snCQ4+FNDIqAg2ucMsK+2EQnFQPR1SFkRYE/EEL2p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eW2d11v2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eW2d11v2"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49041e84237so55207275e9.1
        for <devicetree@vger.kernel.org>; Thu, 28 May 2026 08:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779982304; x=1780587104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bacy4e446xDUINsHvPqawvwpNkB6Ps47zY9T3vbwang=;
        b=eW2d11v2aZR0bmhIPArAbVt1+EiwuB78OZ3Wu4Zkcx7S+nqauCZMebzWLxcWBu7vNB
         g0kGRAWkWuVUXIJvfJU1FRVgn01yiv4b7vLJRCyM4lEfh/9dj5neSZ/XtrfW8XCuTZ7s
         oUmPxbRdjJ3LMlgDveL77d6KmQeDwFPmz1TMAiaFL2MYTVFZSN/G9IQIbqOpySrz3kCP
         Oz4UrEqfqMMXvfzQXOnGpEWj5jxYOAmzlpyEQELSe1fZZgxR7RpAAukeEVVwwDM8NB7Z
         iI9Oi19HDdfE9OuRA+iXZIOiYM7gzD+hiyFodyQsK8/EJ+EJxgTMHFNxX2g05xk9x/IZ
         GNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779982304; x=1780587104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bacy4e446xDUINsHvPqawvwpNkB6Ps47zY9T3vbwang=;
        b=XbMOCScZN0ItNXyFlou/4BBqOJuntEQJ6Yytf9Byf5Z7rH9srzaYgrmUA6ZoXCKty6
         KTVuTKN2CjirOgA/NwUDJEcpr1QXTDu1f+MkstYraLR9Ldr+QKnwa1rq7Dd6NZEQ8aV+
         zCnv9L7R8agk2j/8ZsLLsJcOHFMVQam/rFwakeieQK0gTh2iIUbWlAhYn7rw59r3VRkf
         OglF4CqOb/0Kd6p2QaNHuda/xIx3VGjY1//EGp+JYHYOUXBk8aiD56M7DwyMWq+mBbbT
         oUiS86PnS+RFgLJjA4Rk/8aG3ZsaUH/67mO9MXeA1SARXITYMuWL28EfXNCiIuaachLA
         lmVw==
X-Forwarded-Encrypted: i=1; AFNElJ+zjxvy3dk3NrfUq56lUwn1geyapZTE1gZOG5DA51F5aLncmtEruA37ka+nykSXmGrUWlTn2nbITgiJ@vger.kernel.org
X-Gm-Message-State: AOJu0YzgCmLfejHyFSbWG1tbnf9HZjd+r96Wh7fIBFxvBW18OgohSGiA
	OaYL2fh/lZmwCN8jcBHCYO3nkrRugEslDlm9xjr1E9LYlwBizYIpgEFr
X-Gm-Gg: Acq92OHm9eZgW6sZeCzpOWQEz1nHlfksTs/BdxiZK3yCTtvtzjTk9Tk1GOakCQs9/dt
	tXRI4Hv1qxsKvK4cjYP2cjsYl87UHptmRm4bHx7T5iIO6kru160qR+ulOert4K3n+YveBDCSg/Z
	exIfaGDsfYthggzs7EZa9/UksEzOLy65lV+34j7j3uYIt/xplDO72W1+U0tT/kKrYqyOAYoZuqy
	rrF1YWhmZdOM+wI5JpWxirhnkujS3LJfMx+9WnWMHlG04hx64QNg10sjl31U9NgDHKp4Iw5CHU8
	BHQtGMCtVA8+K7PX5/nvavS9br6eys7qb9XH9pRdG0f4a0/VEGtaBjzoruQ5mnnKNUUHEGacTrI
	gBFlRADjA0k39fxxRxo2wIbAtlXJjS9a8QT9hHSpzldKHo6yadWXvInE1RErS2OJz7MKeKHG5qk
	TyUgY2xhZvUxmEfm4r4OC18NjhxtJLEi1BhTD1vB6VGqhUcinBBs5pDJI9os6VzO4AXvzy9qxcm
	qv0pfzGELYAGF7BlNDbunjv4shIJNZWkwEbK5H1cGLI7lbL
X-Received: by 2002:a05:600c:3484:b0:490:3d48:6cb9 with SMTP id 5b1f17b1804b1-49094785aeamr33289415e9.3.1779982304346;
        Thu, 28 May 2026 08:31:44 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a82ea2sm83282005e9.9.2026.05.28.08.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:31:43 -0700 (PDT)
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
Subject: [PATCH v1 1/1] arm64: dts: imx95-var-dart-sonata: add CAN controller
Date: Thu, 28 May 2026 17:29:48 +0200
Message-ID: <20260528152948.15209-1-stefano.r@variscite.com>
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
 .../dts/freescale/imx95-var-dart-sonata.dts   | 22 ++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index 0f3d2e488f4a..62133b40d64b 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -280,7 +280,8 @@ st33ktpm2xi2c: tpm@2e {
 &lpspi7 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpspi7>;
-	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
+	cs-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>,
+		   <&gpio1 7 GPIO_ACTIVE_LOW>;
 	status = "okay";
 
 	/* Resistive touch controller */
@@ -306,6 +307,18 @@ ads7846: touchscreen@0 {
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
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_can>;
+		spi-max-frequency = <12000000>;
+	};
 };
 
 /* Console */
@@ -442,6 +455,13 @@ IMX95_PAD_GPIO_IO37__GPIO5_IO_BIT17				0x31e
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

