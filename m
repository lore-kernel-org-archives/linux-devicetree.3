Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794831116;
	b=HbHCX7C7qR8+PxzvmvSpfKxykkg5Ca9PQ5kcb1F+SEHTKLUafo59ubCiiS02HvNfAoZA
	 TwmfYz1ntT2KCWtFG1HGxk8cJEj0tITUgWGocbyf1cRoj3AGIIg9X20JN8E9REsadpixO
	 QL351vmlGn/2SAnhPfYusplT7DPLsyPxOXopFohrq1n8mVl/aleaWDJLRkrdkPukWjVPH
	 D6KP3GvAfOzDzcThxkCfe0k/tE6bF1CSWcCVW4WGmDAs7NoqPpJe6LOfrS6dCqWWL07iw
	 uT11Q6vla/TXnTKik6/Dgm1MbWlSgEDFLFvTWwAh0Re9MMn0hFIXOKddB0+thCAUE6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794831116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=pEbQYi4NjQVP0dtbEgl40Tg4qtmWWlkw/cjXJIhkZZg=;
	b=jkNrX179Mi6CT1DrfTV3sQlWxXvzepH/l2M+XcJtklHC6KLDa95YFHdQuhPteCQw16GN
	 IFLuvUPrZi34ZRl44BUo63ieBlPrdro1bVZyLvZmAsBLZ2YU7Ow3OlaHF+JjbBk3NOxow
	 1o2KuU7Ek/g0WUDez+TRHZ3jj3frwcWV010OsPrChByNs63kI+3wkD5OkAFVeKqmGjkBa
	 0vBp8ivIVOxmC6WTu8MLs4Ep27XITcO5ulUSlgMYxRKRLrJf4kqeaH8yJrWZAA+4wzHRb
	 AdpLi0a4nHtjWp6KfVsQZbH9GbXul/6Htk7GoVMkbQfMbZOmF9o8C0vODCxhEJp3R/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e9Go8mMR;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C132606A339
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C132606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e9Go8mMR
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so37590985e9.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 04:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794831115; x=1795435915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pEbQYi4NjQVP0dtbEgl40Tg4qtmWWlkw/cjXJIhkZZg=;
        b=e9Go8mMRt6CeWWTDO4HPH5sj1A7YFgUu/hybUxyiZsIm94O5mAosz72l8YPgiWdFG2
         lU5MOSD37s2mn/eEKrtnWqEtBbMSRZCmadviDFlv4rEoEJ+O6K3MNON88r35Ag1kKeCl
         /FzW5fX+zqW8lnxkkthYpLvGuqR7cH/cUWG/MaooR4/YaGo7WNAUihTrV9l1ifgCQXQY
         nKj64+d2yEbvqf4Dcx6t/Harg0oXfug+Ndb3bHsXKbpAmAnSU/xteNeP0oiUdul6FNgY
         cta/aYMWeAWcC/SGSaMll51wrAKFcKtkKcXUQQSucKwBiBsqlu4YHL60ap7XGf9gsq2p
         CDjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794831115; x=1795435915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pEbQYi4NjQVP0dtbEgl40Tg4qtmWWlkw/cjXJIhkZZg=;
        b=FbHvEE9w/ZV/eZaWdHRxZ4fUU0SZ29aMNp5RuqAswgWHBs8JtGvmKZW1Xs1lRZo8w3
         1RF/uP3EvOQT3FLpeP9Bn1GCR5z1KWPaUFsPjeX77wIAkvNo5G4c4CX+NgoO+D9GNYrG
         nRgXo2XGY0tM+DOz0+baYvAHDaF1idp5jcw+E1siab6u0wtRkc79vglDLwEjJd4ctATS
         3N4hipxAdPbvKTBVrZFGQ4J2VrRJBKrRuKRz0+Jd7+i1i9OvRbwzwtlTqYJ8NNkNAmLS
         C06/2N9iBmmWkgIKx5+enUcnGZ2/on00RkLd6pVBP1GjLAnWzb6ZbcAP5dW0XI8WQabU
         XkKw==
X-Forwarded-Encrypted: i=1; AL+hErGmhUz0ifssNHoUqbrFFbadyG+vGlHKgmWM+F6Ek9SA1dilg58v9zWe+dP5QZ+YNGDESvWaF9SOsHul@vger.kernel.org
X-Gm-Message-State: APuU4Z84JIJGuPLI/Qf5U6K7GYV8gEfOksGd3WTa7HteQt37nXA2FD3p
	IZrnS/SY+ELq80wDoDsYm0S/eOEUjqTmDdyuGfAQSUCZzAisyKDPsWAv
X-Gm-Gg: AYBFou0QJN0wGFDyjueEEV2VCMS1lwMq0TTkqRmbXlb1zT74p/zIRS9q6X7CkOBx7Ng
	hTnDEzwrBnmxJ1q5cQd5L/dS99k4bpaOFJAN0G8P+r9Vmmrz4vokLzKBnIAlZFrthCx7WGeu/ln
	GAtltjRdtMfMJzhh2pM+dou2Ear+IZeW410A0GpAX4+ZcjGYl3msp52eLRt11Hv/+yR/+iPKxbF
	r7jLnj/tqMUTshldNG+He8+Z64wBcfU9sZKuAoUU3+/m7KYQdn3Qmpnhj+pWRlWVJH0XMD48xy5
	AAp1rxYw987bhqHRNNF15BZDcKFYBMxmTmz6huDH3QDI1FAaoU0V7Dv9sYSon5ty/0XoBuoZjK9
	xkriotrilFs9SoyJetR84venXh0FTyHk8a0B3aMfdx9xbpWhqY1gMB6JQLAZoP/8Sj0uKKeWKf3
	8WjRH9CN6QA/L5j1ndibV0XVEvg0sobMjHCZMZKo+Aw9q6QX3uvL20zUKN1Y9ORXpo47gLQ5QYl
	ZEHEDUaRJNzT6lgKm1N6gr8aUBxg0PFtanEkKo+wJP1vMKw8lavuQbMsRu/DIXsP+wCH1AgxHPR
	vWC0bgpgAtScpTTuLVDU7j9CYESqY4PbgToXrbvKlpz7BheBN436msU7xwEhPfcozs36t53asGn
	1ywILC5It2YqkbFOlp4CaFXPXFS9gWcsdUpGTCr2RtFScSHZ758g=
X-Received: by 2002:a05:600d:41c9:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb60bd5507mr142579815e9.10.1794831114708;
        Mon, 16 Nov 2026 04:11:54 -0800 (PST)
Received: from localhost.localdomain (80-108-121-211.cable.dynamic.surfer.at. [80.108.121.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb70105a98sm61442005e9.5.2026.11.16.04.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:11:53 -0800 (PST)
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Mon, 16 Nov 2026 13:11:49 +0100
Subject: [PATCH 2/2] arm64: dts: imx8mq-mnt-reform2: Drive the internal
 panel from DCSS
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-reform2-internal-panel-v1-2-765cf8d5ff4f@igalia.com>
References: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
In-Reply-To: <20261116-reform2-internal-panel-v1-0-765cf8d5ff4f@igalia.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, "Lukas F. Hartmann" <lukas@mntre.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Christian Gmeiner <cgmeiner@igalia.com>
X-Mailer: b4 0.14.3

From: Christian Gmeiner <cgmeiner@igalia.com>

The panel is driven by LCDIF through the NWL MIPI-DSI host and a
SN65DSI86 eDP bridge. LCDIF underflows at 1920x1080. The picture shows
horizontal streaks and the underflow flag in LCDIF_CTRL1 is set several
times per second, even when idle.

DCSS does not have this problem. Connect it to the MIPI-DSI host and
leave LCDIF disabled.

Use IMX8MQ_CLK_DC_PIXEL as pixel clock, with the video PLL at four
times the panel pixel clock. The DCSS binding only allows three
assigned-clocks, so the PLL setup is in the MIPI-DSI node.

Signed-off-by: Christian Gmeiner <cgmeiner@igalia.com>
---
 .../boot/dts/freescale/imx8mq-mnt-reform2.dts      | 52 ++++++++++++++++++++--
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
index 3ae3824be027..31c7428f0386 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mq-mnt-reform2.dts
@@ -171,17 +171,61 @@ edp_bridge_out: endpoint {
 	};
 };
 
-&lcdif {
-	assigned-clocks = <&clk IMX8MQ_CLK_LCDIF_PIXEL>;
-	assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_800M>;
-	/delete-property/assigned-clock-rates;
+&dcss {
+	clocks = <&clk IMX8MQ_CLK_DISP_APB_ROOT>,
+		 <&clk IMX8MQ_CLK_DISP_AXI_ROOT>,
+		 <&clk IMX8MQ_CLK_DISP_RTRM_ROOT>,
+		 <&clk IMX8MQ_CLK_DC_PIXEL>,
+		 <&clk IMX8MQ_CLK_DISP_DTRC>;
+	assigned-clocks = <&clk IMX8MQ_CLK_DISP_AXI>,
+			  <&clk IMX8MQ_CLK_DISP_RTRM>,
+			  <&clk IMX8MQ_VIDEO_PLL1_REF_SEL>;
+	assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_800M>,
+				 <&clk IMX8MQ_SYS1_PLL_800M>,
+				 <&clk IMX8MQ_CLK_25M>;
 	status = "okay";
+
+	port {
+		dcss_dsi_out: endpoint {
+			remote-endpoint = <&mipi_dsi_dcss_in>;
+		};
+	};
+};
+
+&lcdif {
+	/delete-node/ port;
 };
 
 &mipi_dsi {
+	/*
+	 * DCSS takes the pixel clock from the video PLL. The PLL runs at four
+	 * times the 138.78 MHz panel pixel clock.
+	 */
+	assigned-clocks = <&clk IMX8MQ_CLK_DSI_AHB>,
+			  <&clk IMX8MQ_CLK_DSI_CORE>,
+			  <&clk IMX8MQ_CLK_DSI_IPG_DIV>,
+			  <&clk IMX8MQ_VIDEO_PLL1_BYPASS>,
+			  <&clk IMX8MQ_CLK_DC_PIXEL>,
+			  <&clk IMX8MQ_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MQ_SYS1_PLL_80M>,
+				 <&clk IMX8MQ_SYS1_PLL_266M>,
+				 <0>,
+				 <&clk IMX8MQ_VIDEO_PLL1>,
+				 <&clk IMX8MQ_VIDEO_PLL1_OUT>;
+	assigned-clock-rates = <80000000>, <266000000>, <20000000>, <0>, <0>,
+			       <555120000>;
 	status = "okay";
 
 	ports {
+		port@0 {
+			/delete-node/ endpoint@0;
+
+			mipi_dsi_dcss_in: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&dcss_dsi_out>;
+			};
+		};
+
 		port@1 {
 			reg = <1>;
 

-- 
2.56.0

