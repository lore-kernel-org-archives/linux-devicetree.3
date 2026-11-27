Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.19.12.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795772414;
	b=v8OWsQHI9zOktodVDun8pO7grDTjLr9WV4nnmtksDn6aJw72O0HUnm+tiA1CyZjrFwuE
	 g///L7980Y2QWbsfq6xKiYPGiit53aKm13kzqNeAhwyNtS7sVId1tB6jK5GrzDEJzjRJM
	 NpZ3PQgm/xv4wPoHqilQQNeYVrIZmJ8C+rjxPHVma6c2lhaAyjjT3nJH+Vi3YpNBiS1Q2
	 9cUKeiElGOejpZr1q8ugyhPBb/JYrvLSOVDe9JS9EJYYekK6yG/6Qy6xYjaldl/yyXjse
	 efEyDIyX+CM/aK+18bGCJACrfo6Zj04/75SVrTslTD03p0I4eJTw+OmDR6gz64x27EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772414;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-Get-Message-Sender-Via:X-Authenticated-Sender:X-Source:
	 X-Source-Args:X-Source-Dir;
	bh=0XWNk6O+PAAYTuKWgmTwOpHOlIhYqI0eh8fUor46d0Q=;
	b=boVk4BRQZSbj7rwgEsI8hHXaStBkKMQTQSu69QmjUqGXQpFhYgGTDAr6WUAODdt3C20M
	 u5hk90qwNhyW7fSugYwPDjHwQEj4s7C8GZhYLM/NAQpa128cNDuhJpSXb+yw2qSbY0cUB
	 mP6mSEqDpA6abC2z3SSWBxN2jyIvlzbyiqa3YE25crpGfWNBt4fxaKpntLCBoz0t0DNzT
	 KvvxeUNAGMd1PeAbw9c+t8/mH7BR0Uz1RrKictahG7Fj5v6eUmDB77iL4LuVQJDRdczJB
	 qSQ3ofpn9pExyaLzQ7wYFbfFFRq2MQh9hjQeoEqKDg9H5oRKzx6d/bQ1mJbs0cv+qqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=norik.com;
	spf=pass smtp.mailfrom=norik.com;
	dkim=pass header.d=norik.com header.i=@norik.com header.a=rsa-sha256 header.s=default header.b=b8vqXXzu;
	arc=none smtp.remote-ip=46.19.12.180
Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5660606A331;
	Fri, 27 Nov 2026 09:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5660606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.a=rsa-sha256 header.s=default header.b=b8vqXXzu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0XWNk6O+PAAYTuKWgmTwOpHOlIhYqI0eh8fUor46d0Q=; b=b8vqXXzuPo7B7rbk8w4D9tXgvk
	q2i87xhbilNJ5pbRn2rZEMJQ6Yesl+FOG1OV8Z+9tk73LMysNa8YDxQwuImKFHqg2G9lhaRBRHSsq
	tXg6eGAGX0vOtRpBkFR1m5SwqYCTYMiGKkzSD720GjR7b8Im0X+INh/F5fFax/stW1RuQwLdjGPR+
	SKT+6UmpGtEWgZmPxMy1elUsW3+odNBBmbumDs9MndoRDMFN3OEBU2kMgGrFx2KgbXd41Rxp1I98n
	0t0URCclI6pkNnwzp2Io6vgbKpLsFCVsWHtmLIWJOhle4fXHCxkXvQPDTIII0Qb5F0Lue+FuP4oKU
	+lQLW6sw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:44792 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <andrej.picej@norik.com>)
	id 1xWsR4-00000004G7F-2UpA;
	Fri, 27 Nov 2026 10:40:05 +0100
From: Andrej Picej <andrej.picej@norik.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Teresa Remmet <t.remmet@phytec.de>,
	Jan Remmet <j.remmet@phytec.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de,
	Andrej Picej <andrej.picej@norik.com>
Subject: [PATCH] arm64: dts: imx8mm-phyboard-polis-peb-av-10-etml1010g3dra: Fix display glitches
Date: Fri, 27 Nov 2026 10:39:53 +0100
Message-Id: <20261127093953.3541816-1-andrej.picej@norik.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: andrej.picej@norik.com
X-Authenticated-Sender: cp2.siel.si: andrej.picej@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

The SN65DSI83 bridge derives its LVDS clock from the DSI clock. When the
LCDIF pixel clock is exactly the same as that LVDS clock (72.4 MHz),
the panel randomly shows line glitches after a display start. A DSI
clock slightly above the nominal 434.4 MHz makes the glitches appear on
every start.

With the DSI clock at the nominal 434.4 MHz and the pixel clock at
72.375 MHz, no glitches were seen in 50 display starts.

Override the panel timing with a 72.375 MHz pixel clock, which is still
within the range of the EDT ETML1010G3DRA panel (66.3 - 78.9 MHz), and
fix the DSI clock at the nominal rate. Also assign the initial rates of
video_pll1 and the LCDIF pixel clock.

Fixes: 1811697151f9 ("arm64: dts: imx8mm-phyboard-polis: Add support for PEB-AV-10")
Signed-off-by: Andrej Picej <andrej.picej@norik.com>
---

Tested on a phyBOARD-Polis i.MX8MM with PEB-AV-10 on v6.18, on PHYTEC's
NXP-based v6.18.37 kernel, and on v7.4-rc2 with commit 4af021a97773
("drm: bridge: ti-sn65dsi83: Remove NO_HFP and NO_HBP mode flags for
LVDS stability") reverted. With that commit applied (v7.3 and later),
the display glitches constantly on this board, also with this patch.
I will report that separately as a regression of 4af021a97773.

---

 ...hyboard-polis-peb-av-10-etml1010g3dra.dtso | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtso b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtso
index 193fa9dc34d4..0d84578aac75 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtso
+++ b/arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10-etml1010g3dra.dtso
@@ -23,16 +23,54 @@ &bridge_out {
 };
 
 &lcdif {
+	/*
+	 * Set the initial pixel clock, so that video_pll1 is not changed to
+	 * reach the 24 MHz default.
+	 */
+	assigned-clocks = <&clk IMX8MM_VIDEO_PLL1>,
+			  <&clk IMX8MM_CLK_LCDIF_PIXEL>,
+			  <&clk IMX8MM_CLK_DISP_AXI>,
+			  <&clk IMX8MM_CLK_DISP_APB>;
+	assigned-clock-parents = <0>,
+				 <&clk IMX8MM_VIDEO_PLL1_OUT>,
+				 <&clk IMX8MM_SYS_PLL2_1000M>,
+				 <&clk IMX8MM_SYS_PLL1_800M>;
+	assigned-clock-rates = <144750000>, <72375000>,
+			       <500000000>, <200000000>;
 	status = "okay";
 };
 
 &mipi_dsi {
+	/* Nominal 72.4 MHz pixel clock * 24 bpp / 4 lanes */
+	samsung,burst-clock-frequency = <434400000>;
 	status = "okay";
 };
 
 &panel {
 	compatible = "edt,etml1010g3dra";
 	status = "okay";
+
+	/*
+	 * The SN65DSI83 derives the LVDS clock from the DSI clock. With the
+	 * LCDIF pixel clock equal to that LVDS clock, the panel shows line
+	 * glitches after some display starts. Run the pixel clock slightly
+	 * below the nominal 72.4 MHz, while the DSI clock above stays at the
+	 * nominal rate.
+	 */
+	panel-timing {
+		clock-frequency = <72375000>;
+		hactive = <1280>;
+		vactive = <800>;
+		hfront-porch = <72>;
+		hback-porch = <86>;
+		hsync-len = <2>;
+		vfront-porch = <15>;
+		vback-porch = <21>;
+		vsync-len = <2>;
+		hsync-active = <0>;
+		vsync-active = <0>;
+		de-active = <1>;
+	};
 };
 
 &pwm4 {

base-commit: acba37c2e2df26ad722d470777044fd21620834e
-- 
2.34.1

