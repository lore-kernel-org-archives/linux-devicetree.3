Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794384792;
	b=QHuztuV5Q4h6WherYxYNH//fujXhiX6tapuMVJLeXxG0czMpgfv3IwOJLrKMg3S4Bl3d
	 yOTu+tn5v4wUC1lBT4cro3ywAS3Miz/A9VmK7m921UiAV1CINtz5k3iTFcwAZickLKJOU
	 J5LjqDpPDTgP0zvi2MfmWSCL6GEGCdrSBdEj4dhd5teU5qoMt5GotIrC9gkHyIRBB1usB
	 omS1z6Iisn+cbjiGsC5fMwugOV06lK8ljKDb2UlBATcm1QqbqnMCy4Yma9P1FdpG0HJ2L
	 dwvsGiZQfpd3Uv7Lzr8Lf8WD5I49EXWNvJgcM8xI23BQzSwVZv+WYff7+fs1GcfJWsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794384792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
	b=Sh6kmGMhtGERc6/xSdPmb7UjWiW+nsATfmNBor5FWyaANTsck6K1FNOcOm/h+Gi3zjmT
	 6VkYroZezeQZj28Y5zV3wVmBGmbI+kpyUCxkaVqTsaiEUq5EQUiH7iHkzY7+JsxEz2oiR
	 ZevFvhKAdlHGZNfU2J2lWqvn3iaogWvhhBIVqv17aj0LawpGUtKQ7DlTtYB+Pp7vs787Y
	 Fz9iKY2r20+k4UHGzg4WwZDkm7fx4il9I4V9/3/5A46CkYY0SVNgkSn0QsxBR0pSiSZRd
	 oSeGztx7Ha0kLAN02o4NBtgc+hKvdO7v0D+DoktjvH0H5aJNPJWI/56muKoH9eK+11g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aZmFw9jQ;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3719A60A2619
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 08:13:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3719A60A2619
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aZmFw9jQ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a215e64962so32691415e9.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 00:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794384791; x=1794989591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
        b=aZmFw9jQm5ocbKm+MfE6RsR2KEAhnRCXokz2wChJUPowgm0UF7AtO0KwWfjhHbDGjI
         l69sBPidmFk8Mtb0FbVrnpF+0QsJMVQ5EkXOCc7O/JRTHPkqjIRlz7tRLsB4Dyvp1Q81
         7otq1ovQg67qdY7R8N8Im7C1uVzoY/qVEReha4T51EPqow2MhdTl+9T3QTAwmU/7dd7q
         hYwokDpEuBbB/IlHwsM7eVP6l61FvdbN0Ce5glXJA/CCwVtfF1n7tOx8KroImABmX6uU
         pNU95P+/sZ+JjDmkgDSEE51epRg1cc5/RHEyvCOcYmmFIuT6OFUqT2vOiFh6ojkAOq7M
         TVTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794384791; x=1794989591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
        b=ypN0ReZr0LfvJFc3ZFHYiyIJgUyikzj6eqY0XUTmT5HOEi2Y1FMd23c7B9YPKjpYIX
         QGleKweVDSp04zaGmEy52N3NKvOWsHEO68qsrtBBkdUx+TvpB2Y8RsXMfc1Q19MPuBs9
         dylp0KIDL/CfBhN/KpNnB/P5FencpXdQsLAyCPPvxC3/GiH8lMDejrbo7VXlMFIL9lK9
         hrV635u4cT3UP8i0EgtuHZtcmNsQDV5AlcoTEsJx7tXTU8F9q2O2qO32khNf45DEXbRV
         i+jU/4jsbkfoDDOZnl0ZL0ZGbSThwstJHq/Bkw2Xr7WMQbV0VZlfWcL07n9kZLv0VFqF
         tnJg==
X-Forwarded-Encrypted: i=1; AL+hErGguKmKOX7YP0DoijhJV7W2haL0Q1vwEfAp4BO0fPU7W0Lxvfn14n9b54QAr9fXixMezWbhlIczXe+O@vger.kernel.org
X-Gm-Message-State: APuU4Z9Upa8301iPyk71RPyROmcr3pCQl2RQ5zy+KYw2vKwzU23bfaaj
	dED2FrYRLBMhcps8fLoPJhppHHKy4h8EuxNuvl+33EeughSbDwLdhy1Z3Zh0D2wY32I=
X-Gm-Gg: AYBFou1wuarwHi1fmg5GUwiIQ4oMjfazpuA6KVM+Pt6m8X0lUVsTUXqS2zuPWcFqnyP
	vGetWPHPLWC5WMkbxhc0iaKm59ByK49+H/fVARzVkmS4+CfqJDQVjO2ru7LvHYNo8HMns1ZaPSD
	ukg3cGLG5h2oSkNUt0VMOlk0lSR4H9X9Ll8sb0I5Tj7K5M0waDTo6X/CqtAsQYxe7bzFEkbFUYB
	mgdo+RKiWi2AsUZIRQtCnU24bhJQ5A4I519D85fcbfpEnvXeMxxnUg62mzb3z23CgW1KYsKSnD2
	egEXvrTHrXbxyIq1KWsp0GOUFTRbo8RE3vCx7gOB49UoF2mj7dhxSq6OQ3ssWYkqsR2LW/lS1t9
	Uq5WzJoatPoPeU02xxrvCNmsFUhSHqcJLb/gl+nkzl5smDNBrzWJSP+3aox08cS9WiXk9C6o2AZ
	G0bYpuO3gBbag1gXrud4k3erE/ICpfpV2KkIN/19v4ak0DsAroasGlJ492eL5SZcrVnnbhAa+mb
	o3V9bYugF0eIg78+/X56bXp3w/9zWpbyOIpMKOFYY1U4zDCL2wS8XCzofe/UzGBnhwTaECbcMJZ
	absvAUUExHhVHadlVsMgff8r3TNJxyQ8K1A3na2JQ6eTl4FO8CR8CBHvsYmrvPE6fuRW+ki2wZN
	MUew9EZllDGw=
X-Received: by 2002:a05:600c:4704:b0:4b3:8529:eb27 with SMTP id 5b1f17b1804b1-4ba09389f82mr26248335e9.27.1794384790692;
        Wed, 11 Nov 2026 00:13:10 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02242bd9sm113233815e9.15.2026.11.11.00.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:13:10 -0800 (PST)
From: Frank Obergfell <frank.obergfell@bytesatwork.ch>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Michael Walle <mwalle@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v2 3/5] arm64: dts: freescale: imx93: Add MIPI DSI controller node
Date: Wed, 11 Nov 2026 09:11:48 +0100
Message-ID: <20261111081150.950272-4-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
References: <20261111081150.950272-1-frank.obergfell@bytesatwork.ch>
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

Add dsi node to the i.MX93 for support with mipi dsi panels.

Signed-off-by: Frank Obergfell <frank.obergfell@bytesatwork.ch>
---
 arch/arm64/boot/dts/freescale/imx93.dtsi | 34 ++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93.dtsi b/arch/arm64/boot/dts/freescale/imx93.dtsi
index e926b6360a9d..1123e372eb79 100644
--- a/arch/arm64/boot/dts/freescale/imx93.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93.dtsi
@@ -58,6 +58,39 @@ npu@4a900000 {
 						 <&clk IMX93_CLK_SYS_PLL_PFD1_DIV2>;
 			assigned-clock-rates = <800000000>, <133000000>;
 		};
+
+		dsi: dsi@4ae10000 {
+			compatible = "fsl,imx93-mipi-dsi";
+			reg = <0x4ae10000 0x10000>;
+			interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk IMX93_CLK_MIPI_DSI_GATE>,
+				 <&clk IMX93_CLK_MEDIA_DISP_PIX>,
+				 <&clk IMX93_CLK_MIPI_PHY_CFG>,
+				 <&clk IMX93_CLK_24M>;
+			clock-names = "pclk", "pix", "phy_cfg", "phy_ref";
+			fsl,media-blk-ctrl = <&media_blk_ctrl>;
+			power-domains = <&media_blk_ctrl 0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					dsi_to_lcdif: endpoint {
+						remote-endpoint = <&lcdif_to_dsi>;
+					};
+				};
+
+				dsi_out_port: port@1 {
+					reg = <1>;
+				};
+			};
+		};
 	};
 
 	sram: sram@20480000 {
@@ -183,6 +216,7 @@ lcdif_to_ldb: endpoint@1 {
 
 		lcdif_to_dsi: endpoint@2 {
 			reg = <2>;
+			remote-endpoint = <&dsi_to_lcdif>;
 		};
 	};
 };
-- 
2.47.3

