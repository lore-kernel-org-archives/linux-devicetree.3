Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794227046;
	b=VH/Zm4KZ4WiogEC2KnVbjwdmrFM9RMM8Ej8rqm4k1PUFhmv9rmFYya1dUpRu6DZd8rby
	 etrNcEmerTzlQBWXl2YDx+fKw2aaGaKJXZNxIlVMwic4v2D5EtCgeyzvUcJsyN7bj+tGJ
	 IWvCnd5OhwT1RwHlxPlvpuIYlnmfHzOYrj6Nre76WBCRmqLy29vfIFKrwD1TYp8kiJqmv
	 ujRpsPQbWbo0ueQYRgcEijD28SM1hFkRsomF6gFTQGfC8UcvVE5Ox9LzCcg7oeujTIw8c
	 TEJmhpqO5cODwFFZj5tANNYIxssOqZ/OzC/sZeFqfGE2/F1cAqT4t2hluIoYVAgDYqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794227046;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qYbJCi5+nwNEi61CS2emr9alE1zi1Zmi+juvvOHmGRo=;
	b=kedkhAcvURZl0G4FlMD9w2uJFz9TXq4Wr+QtfcjMciTusnhP+4JsV+PWvDKIWT/HEIV/
	 HXzL56KIVCYyzQIRbSzp2I3tEv0vi39sMJqcSBzXQRQi6dW94T+RRUZZlI2ziXiPUkzyy
	 G5WXZrRlw2rG7c2Hjyqlt69jqbVZxHujW+C2ZwlwmIu9hdY0WNokPSujdzWIs73n4WNYf
	 5vLHMYot5L9lrKwz9tdQZpyyhoD8JtSOYDF35DRaDzsvikeKc5x+5VVJa9XEBExQj3dWT
	 XDADN49r155ewQWio6FONAyUgjHmjUQ11QtjqZiuUx3vKs6dLzK6iqmoZIqUjJ/RH5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=bytesatwork.ch;
	spf=pass smtp.mailfrom=bytesatwork.ch;
	dkim=pass header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="aMXikT/1";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DF86082BFE
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 12:24:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00DF86082BFE
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytesatwork.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytesatwork-ch.20260707.gappssmtp.com header.i=@bytesatwork-ch.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aMXikT/1
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so8699305e9.3
        for <devicetree@vger.kernel.org>; Mon, 09 Nov 2026 04:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytesatwork-ch.20260707.gappssmtp.com; s=20260707; t=1794227043; x=1794831843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qYbJCi5+nwNEi61CS2emr9alE1zi1Zmi+juvvOHmGRo=;
        b=aMXikT/1i+nirRpg3diNLBj6e61GPmaqVh9Rgimyrs2QFUjxAmWOBk2yjz5SYdyRmX
         LuZGZ8P06KuM3ysMB8fFwTmHbLID1TtdVKMJ+YoBYmwTHsdoR42rUxUfoTa5H8YdGwPA
         Sepx8ZDvT1Ia89rn6AYfla/8Kdq7yb0Fx0Rq/74i9CI2YCqPr02MP5+qnZJKduVL8jrT
         MYsnRlBhEswTpuICt3J+QQ8m/xV78Hu7BbC1SbzE5m0xg3mwEBcOJwJ9B6brm9P3DoCN
         uegC1mSB5Zf3moubtMvVPzx6TSk7fkBuoQl+c9O9CI3aV7mIiN7cI8eWELW8D/ObQbJm
         GpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794227043; x=1794831843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qYbJCi5+nwNEi61CS2emr9alE1zi1Zmi+juvvOHmGRo=;
        b=bXLzaUQrEV05fio0JaM0MKS/RxtjjcDyfjFjFqV0OC5pt1cewmXKiXuDlNcHLoxMR2
         KJUZMIIgUsOPeh26dDpsWtgSVyzrKfml3/M5QrC736/TWwDs4NZS9ZINhzS7meXiIBMC
         iR+830Bt6Ra0ETH3nGnw1gUASpZx4y0kmisE4m28V1fszYAB3Dpz2h9Q0PdG/+TVWg5v
         ND2FTqPsETjDX73VWu0pBzC9rur5Dvx/3aIjW+SCHaVBCyD+e7eF1Vrb991kkL6N6eGl
         q2bhEAS+nmmKU1tKfxOKd03tDjTXYSsp+WLnoWC6KZi2OMRPmJiQ8JfjlIJnZch4g9V2
         WYMA==
X-Forwarded-Encrypted: i=1; AL+hErFPThvd5fGYEhaQ9BE1LeEhko1YZx7EEXodhabK0Ba2hmMZkro0ABFg8V6Ty09MCSchjupsYXzoKXvc@vger.kernel.org
X-Gm-Message-State: APuU4Z9wca/dD9l6Ll+q3i4mwJi8fyDG4MTDUWYeJlaR/KTi5m3O6aLJ
	JYLmobZ2W6e+Qm8RYbTgcrjFHj1zl4DmNF/4efAwd4mB73Ur4CM90xt2zPciNUgECOo=
X-Gm-Gg: AYBFou2Y+ubgeErP7OssliIafbCfQfA2xcRGyC76uvozyTY0o6kp1Kq4ZJ7gtm0UyjX
	fY8NAGTkqvnSsKaBNZgtDfnWrGwamOgCekCdXJhbYWilwRKQDUd2R1RxnK2wfcUnrXqK1OytWPL
	UpFsLueFdWVqCZ5OSqYvJHcvP0Tx6XPLv6u9FBj8wdTOTmnhVi9G0v4pT49OqstysjCyOIP5+Ew
	DXOTRePMMWIYZ5d0HIHLqtzjkHor1lGNKolxQo2hpHaf02Njz0JD2OvJUFcRT5q5V0fYaqB22ax
	Fdi/pjmdDwr0oyeukUZzta8voYdASuntHvZ53a99wcRi223ftnsI9mJFLfQGm6NprxW5PeYHZEw
	N1HRvdf7+T/yAxd85lvRFI87AEVvUb3E325PIhAR+y4WYQPZmJ9lsw5vYNk/Kyd+M9szZNK82RP
	GGnNop6jSXz9ZH/yFMAir/knKvUMDJnk3oapK3srvRq4YlncOE8L6RopfXLfrQU+DQ0Mm8wtPNw
	VtRL4Ob/dPPF0ckngC3421lRVsPstRZqkZq/uRsRS30T5TlkPr51+rDtVAdIPVmvzp4j1RWW8HO
	DJgTJ2VjHZ1Mong9oXrXmybTynnuhlifkpIK3M8rGrNazndEIxRqnKpWFsXFLWQjVTs8/IsE9dU
	EApt/4MkSYw==
X-Received: by 2002:a05:600c:8b70:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4b963c73ab1mr72661995e9.12.1794227043509;
        Mon, 09 Nov 2026 04:24:03 -0800 (PST)
Received: from frobdeb.bytesatwork.ch (162.40.150.83.ftth.as8758.net. [83.150.40.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597652ca7sm10500318f8f.39.2026.11.09.04.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 04:24:02 -0800 (PST)
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
Subject: [PATCH 3/5] arm64: dts: freescale: imx93: Add MIPI DSI controller node
Date: Mon,  9 Nov 2026 13:22:48 +0100
Message-ID: <20261109122250.720757-4-frank.obergfell@bytesatwork.ch>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
References: <20261109122250.720757-1-frank.obergfell@bytesatwork.ch>
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

Add dsi node to the i.MX93 for support with mipi dsi panels

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

