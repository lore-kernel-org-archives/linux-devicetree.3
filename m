Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403906;
	b=VCvCoWow1oWh2vWBSlu/iP9QMiyMZ7CcXyWY+758IKUUFc9kyPK0Kb9TwD5EqGn+vF9K
	 /URIvilhwpAheJQWdqtW2Y526A1kuAKqJNuSGX78jW3YA2njUwLa5D8KEGjt2z8hgwSkr
	 iMwCC1ewX4nhTbBb2WWj9j+tQIhoDDtS/ivVGtgDZZkWGK/tBrdrTuqZd+SklGpmTzd3M
	 pikirJmynfeSXIh/swqqMWUd6KGmUpZxf4CpDRu2rwfWqwCX9+6I9/NwujOHVvFdv4w7H
	 HVGLjceqxbTdEmNasam0BqsTuT66aAO7d5a19GvDKQgg4JxeV7RTmevtIQUyi8TSnmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403906;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
	b=0pdLvH5Z0VPCeSXABvZQ1gz6T0EEK8dxWDz1VZERSJrfRiHDveQl+uqcQq4Xu+UXT4EZ
	 VhpBadkuoQj8cfqsHAa6oA6G1B0tmOf57VN8r4jPwcpr71ACRAG0uFt3OWNB7gE3WjaPt
	 0Y1haJiRiP/Z+KHmdWlpyHYRGRu2qW4gGuUcj+9gpQ0M7KwDEtj778K9+Pd9ari3Omi1Y
	 Y96A4ib07kPhMwvckfWg7+Kux+tEcLqpDT38M0UeJg89yUFCwQPr5se2lTWGfTxUGuz3K
	 PDWQe7sbPUR3Ek3gCGnLcyU8eKMZkdiVPrK+TFh6jbyCddqNx/2iSZlsTDTbYfOpV9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FekIPMwG;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7137606A8A4
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 13:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7137606A8A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=FekIPMwG
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2072b9832so18491195e9.1
        for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 05:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794403904; x=1795008704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
        b=FekIPMwGx7yh/nYv6KSPNlOCyLlIbCjmyBhzMQnkD7ULKNXkBZECk/rQxZEM5RUGcW
         KiZbA5rizOv4mOw2tRvViDDTwf9c0oY+yB2ogK0xYvQTutVnUbuKyf1SuwN81kqA5kHP
         BK6yNWVKAv7JB/uq01NUryWOqbuzlRHQu6yKzqOVPblyVPFZALr9zMpvZNUko/1vqYp0
         2icnOsKKEg1SCpMF547oIBQl8pnyYIxM11TaArtGQYjNLMWly0gQXR/jLUTW1zlxBwmK
         T1coSiUNFftypUepY/ifXI3GV8G5DC2MCgRf0GSVI5fOJiJ/BJfDp//qQ0PNu5oR7SI0
         LP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794403904; x=1795008704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=G8qkZnmaQmgcsJmklkVA9+lzZWNtRCGmSFYQH3Mj5xE=;
        b=1qWEHfmgSmBKhvKtL9Up8YLvbB7/8/trzKnPwqiMA7POSrigkW+2uMeVEHXPIWzu5Y
         V7zgVsB/a9gckYqR6FfBQ4QvNg/YFs/hffJ8pO4Gs/W4ioCxH5sTn/DR7kZLzmi6fAFr
         SqC/JCqLlubhJOuZZNykAPVugh0SM73nOzDSduGTI+0VwjywObxtGguvrNDNd5HU7vuf
         WHI6aMtnv+GjHMALRyDLt30KH0REKS6b1OEgNHPKqx7t0oUFbSki8aDvWyvAbcTmcCiU
         G4ofHhGzAQQ51NgUiGniQu9vyDkrRnxBlH4SbkfHAHJ82IhS+dbshecCN/KqWsBg2tV9
         o2WA==
X-Forwarded-Encrypted: i=1; AL+hErH+rNZMnPnVzqVklKYm0AW85VLPWWZpkCzQ7gXttCXL3AydCBkeHS94Pz8PtWdPiwr6r7lGg53+rBRG@vger.kernel.org
X-Gm-Message-State: APuU4Z8NHSj3XLfuMheE+KhYi2HVQmwovp0frV7PBMWfwhbHgeJMrb1B
	Lk7fJJ+qlBtCqrzhAIGLc+dHKiTnptMW9ht9Riwwei8uwugZUcNu5ua5EHSemRvzZmc=
X-Gm-Gg: AYBFou1Ax2W5FuEZphFlZ9hiVIb1O/m3tz0hThXu+er6g+Kq+1qB5H9JyB3wx2BQq6z
	kBbGHXzP+sZsNqYf4iM8M3c2B5ecyWPOGnQ7jLccXfIya4qdEwHqkABTG0heJ0DKnDO6DwMhVIg
	T9vlYMq4wdm+pgAJvU5S/WvVB/WnLZmOzyQradDfL2ohFUoCta/v4gtxU8kJF8mRmF4ElzxmJr/
	LvXKvrkJ6kN5KU8itubMBdZToFCGJPRxq+VBps5EH+QK4mKCjlH4+LOyonc2JreOS/vmudJ83kg
	E0uw3mtJF0D6kK8otrgi6ZtoyEU8Lkrk3Rypvsbhyk/xC/eInsuK09LRnf2ar3krdq1mXJi7cet
	eI1DaHKs+Be7FZdmxFWP1OrTK9u6n7CoCsqd/iV366eet0cUUDxPK3fdHpRrJ67EWRnxDtU4wJY
	WGJevRVbR1t36WrkQvv1cG2l78yKD7jLeF/YWyRLBt5MLKr5uEazDsjgi8tOwbcTC1t8LkidwT5
	2aw0jE2EaLfNE69ciGOlvGMi0TsLcRS5ys48tjSgU1GFBMqcHYOOf95T76YxPqgVQpzuDF3LARd
	a87VqmmpNVudbALjYrGVMCEBVggiYWtlOAW+IJ0L/vVMBYdw44a5rZEbJ2ZofiOHEf2+VxvBcpF
	+3mE/0uRVhWI=
X-Received: by 2002:a7b:c342:0:b0:4a2:f58:9a82 with SMTP id 5b1f17b1804b1-4ba08e16f94mr38360965e9.13.1794403904169;
        Wed, 11 Nov 2026 05:31:44 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm11089358f8f.37.2026.11.11.05.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:31:43 -0800 (PST)
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
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Alexander Forsch <alexander.forsch@bytesatwork.ch>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Obergfell <frank.obergfell@bytesatwork.ch>
Subject: [PATCH v3 3/5] arm64: dts: freescale: imx93: Add MIPI DSI controller node
Date: Wed, 11 Nov 2026 14:31:17 +0100
Message-ID: <20261111133119.1063210-4-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
References: <20261111133119.1063210-1-frank.obergfell@bytesatwork.ch>
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

