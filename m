Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CE6147ACFD
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 11:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785325837; cv=none; b=EG5KgHEAG3lub+fl6IWPBRZ+ZDSIJ7fYz+HjSeNhB3P6Yw3NLmYBr5g/eaOvByrjiP88CKAonbJwFxiVVyQO1AJoxJ5XV/qT+SY64EUntpuiR3B3QGmctqQqrn2seQnkrInG4gWmg0W/V5wb9k0Kf0O9AuZLxpYkDk/ViJBGmaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785325837; c=relaxed/simple;
	bh=rJp+IHRhwtCUDMpP+CeRO1ZawrpamrrkxlM7KrkyIgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PJCNAfwiSvSgy9nAXyZEDiz5N5o75JBmLfUJUOpuq2ZMu14GJTEHAc7GNcEtqUtyHpVpUDZsVzb1LNDHhhHUGObYenEITerg08lwmAVaU56KBZPimgVPas0JxQ95L9tYS/FJor0yuk/Ww7S7KUaVj3iy1nfYiF4q6L0HTPBhFZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvcuVYr9; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvcuVYr9"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49553515a8bso11005875e9.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 04:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785325832; x=1785930632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=baS9I2YLswpUz5OkPJnMmEZArGv7qLITUDfySWIO39c=;
        b=OvcuVYr9HGTilM3QaknGqXu7BZTjdyOvGmOOQl1+6o44fuMmtchTdWvPyNdVjuA30E
         i2EQvgKU31M2vkD75H7MMGi9Xus/NkyCpTdoZoKsd/5GDSX6FyJkZcNMDTloSrco4jBd
         YqIk/k0BTvcUr4h+qSBXDEOhvTjmAYvWhn2dBkt7PhbgcMQb5jFSEgiJ2PEM9Pq6gt4k
         EIpRuDzoHvGoJqwj8Ja5pzTMcE21eZAxsV7HWP1TrMOdV7XI+usYgZlp9RLtr4Hb6oks
         8wlKknmOsgr6Rvv/FsnOrvSwkdHMuoTdl+Ob6YsXbJ94tTLNB31xmPDYruHC12HFj3ds
         EQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785325832; x=1785930632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=baS9I2YLswpUz5OkPJnMmEZArGv7qLITUDfySWIO39c=;
        b=ER6yXkIBt59JkmfgTiRI9evP0cs7ausB2SCpDl62FqlBiKqb5OLRKvMgn0QqoW0X95
         AsnSr7/VAQka2Y0SxvEH6br4iJKggh1sGX54oHiMQnS+/JrQh4r4yx6HuVWCz1wuFW/g
         gD4lxlsz8UVg77cxQg10BzBlL3b07nWNG/nk+c2V2H3M4mbNXdlCBv2DQ/pBphQLfFp4
         pNbAqRsjH6RsSwNWg9AmaLGdYOqsyP+Arc2kLghQzAgOGLdmd5Wvp/eOqNzFpTilITMS
         +hwGF4015D+Bg4V9xqO8FYv7PabzjlJMMseJTAOQfQ8OH4soIjkrSyO7NIiFqlfokCf+
         EvpQ==
X-Forwarded-Encrypted: i=1; AHgh+RocJKxJYyp3CxCRotDokb6OXI5GyLfvoD8ab7RoFuoLGVUqgUkENZXtUUBAegD1lOeiekSB5EDCxRQe@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg8fKqgYWDPt/PAtrvQIMgT2A3RwBsuFMB+qSKoOaw9qAW6/eK
	DtpwjwwvvM3fXIIgCzqvIdqIMQ0UNTkZ4JVF+QnhZRhwD4PhTfkhBSKa
X-Gm-Gg: AR+sD12anTMYVhwB2k6bO/HnbYZJu6CF/BvQOIT3zzOhkLO+/dkf0NM5TT/Hkj6Tqxg
	7xLsGRWJuC1nsgHs8pjTQLyq6N8GId3BPKQS5UdOYHoG+qgXZmPCUT8mFAzL4LIUgFGnEb7qXwn
	cpr/mQr892Z1V9Cn0BZMpDZuNSVk3JeMasDkmprI9dOjla/ccl9kXX/EXc8WZa/pNBKwcC2cEnj
	q4supGzB5qrDarYfRlKuYA/7hnA0ndo0xlemqGvcqS8iiIM2DbpjiKofESMK3bYI3s4wpnPqK03
	2HkO5tAWzvYELukWrJpy2XU/H4Ojr7OIloZuPDcCjRmDW1dek+gd/n8bVzX2TRxSNzIrGGqbXvU
	y5VGw4t5V+hq7Kzv09W4ubIx26hf71Fq6HOybIdpI13b0ye4X2P5aSl+WHnv7+RshSF3zbzPAGo
	O0/BqoORJxhcp9PdQcC+7xQ4lqeeF3MD/GedFL8ZvX/wBd6eie5pquVIWhQYDj1D/vFnu1SqtNR
	pqzXtUyN4QumzL+2xsR2jbXwA==
X-Received: by 2002:a05:600c:4593:b0:493:c337:db0e with SMTP id 5b1f17b1804b1-496c6571d38mr67732745e9.18.1785325832157;
        Wed, 29 Jul 2026 04:50:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:10b8:4461:ee04:15e2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4957bfc2ff2sm326144165e9.4.2026.07.29.04.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 04:50:31 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 8/9] arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
Date: Wed, 29 Jul 2026 12:50:16 +0100
Message-ID: <20260729115022.222340-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
References: <20260729115022.222340-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI, covering
the USB PHY controller, OHCI/EHCI host controllers, and USB2 PHYs for
both ports.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Dropped renesas,sysc-pwrrdy property.
v3->v4:
 * No change
v2->v3:
 * No change
v1->v2:
 * Updated commit description.
 * Added regulators group node and its children.
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 85e409ac8d5c..bf0dbac66d14 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1198,6 +1198,110 @@ queue3 {
 			};
 		};
 
+		phyrst: usbphy-ctrl@11e00000 {
+			compatible = "renesas,r9a08g046-usbphy-ctrl";
+			reg = <0 0x11e00000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>;
+			resets = <&cpg R9A08G046_USB_PRESETN>;
+			power-domains = <&cpg>;
+			#reset-cells = <1>;
+			status = "disabled";
+
+			regulators {
+				usb0_vbus_otg: vbus0 {
+					regulator-name = "usb0_vbus";
+				};
+
+				usb1_vbus_otg: vbus1 {
+					regulator-name = "usb1_vbus";
+				};
+			};
+		};
+
+		ohci0: usb@11e10000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e10000 0 0x100>;
+			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@11e90000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11e90000 0 0x100>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@11e10100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e10100 0 0x100>;
+			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci1: usb@11e90100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11e90100 0 0x100>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@11e10200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e10200 0 0x700>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A08G046_USB_U2H0_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy1: usb-phy@11e90200 {
+			compatible = "renesas,usb2-phy-r9a08g046";
+			reg = <0 0x11e90200 0 0x700>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>,
+				 <&cpg CPG_MOD R9A08G046_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A08G046_USB_U2H1_HRESETN>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		pcie: pcie@11e40000 {
 			reg = <0 0x11e40000 0 0x10000>;
 			ranges = <0x02000000 0 0x30000000 0 0x30000000 0 0x08000000>;
-- 
2.43.0

