Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EFA4611CA
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 14:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786544395; cv=none; b=cx50HDujyDGYxQfiagGSAhDt8H/47msgpzWp4aWPizqoCjwGy3AkH9hzoOpEW4rGcm2L+wb9OPI9eWWGDBaCwA7st7JWrKZ1YXqL9TCb8ThcB0SzxN3uPMcXKKGdhr3qMrKdS5DPgwZwlvK8r96gtZEnAdtpOWDahKnpbwX0FOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786544395; c=relaxed/simple;
	bh=sY7bE7EJxCFLPt/FFDL//Y/g0b2d9Hy5wNG8j/WBZS4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QnEHHk6OrPpGaRsuB/+HuyC90KbAlMZAIbwRTNbyU8uc02Gn3h9gf1+9ddqAWEFtVkoUhXFkD816af3aWPwKFY67DhVSJ9p/qW8ZmlU3rA6ujDhRzaLkxCyx7fB/5iDDqIcrEtciiPJtNr3I90RnkIJliTpmQVzgLB1KD76FwvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lNyvWcXe; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lNyvWcXe"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4956869750eso6171435e9.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 07:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786544392; x=1787149192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q1Bmj5ZZaimND1aKa4lg/F3Uu6RM17i4yCaGTVGWWA8=;
        b=lNyvWcXeYMUWYH6HgdKVKz2HvCMpWl/Ew6A4HCJTFIqQFym0fdyPfPytKyJxvZNjNE
         +94ShDH5an3/b0uShs+tNK1di6xPMMpIuBKQ1fm6WN8EV1bouGhAShfcCLxdQ9Q1Pfb+
         B70byc09i6pexchDmfoWGootRE2r/7t2cWQ7Zt64HVXjC8emBOL1Job9OF04K84+nR09
         X61JpnGUNcqqGDDQ+jy5AfuH+Vrp0xGcwjsJgZXq+vDwgbblcwW84LDH1iqsJLnce7MA
         Td2p+LC/ICdJewhs028Jy6Hp1YvnbzVHWs4hQ5T+igUsErVyVLFNtbfRpyV5jXaiddxJ
         odKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786544392; x=1787149192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q1Bmj5ZZaimND1aKa4lg/F3Uu6RM17i4yCaGTVGWWA8=;
        b=dfT7xu4LNrH7MmoJkGQX38711MHI7FjHrTq+iEa0PrF5fmz/EATPbk5KMd3tu69PZr
         JTMaMgRJBCRUkAA35dvVJ2TZFMVWEzmDrGW4DySah6Q55jt5tt9lzBPAA76NhoIExHUK
         MIIz37hQpkaMWYOVWW4R+u9YDh1Lt9QS/HGwaWH/k398wy6hdQV4T6JS8RutMMyHOllv
         VZnnRKx4rMAgkHSr3SeSy1Ipp9JXt6RBkl+R9sAiqZLRK36f3okjG3PigMjHUnPk3Ghl
         K5Pb7+MOtj4HcIYNzINjlIjZEu/RlVcNitE0qNyWVRV30IqR7Teu4YWCWUmKXsEV6oG8
         1Ojg==
X-Forwarded-Encrypted: i=1; AHgh+RoY/H5Bq0pPnLDIX+7oJVNg4RMCfNkEgJvKhe6NjTn/SXGBz45DC5lcxjDVMgGPae048iCYHPVBr7q1@vger.kernel.org
X-Gm-Message-State: AOJu0YzhrCGVdvL7MxXsIPOMzr9DkSMwp4Vf6IBPUGUBMhDkGD2X5gy7
	7tn6UFm4yCgWusOZiUiM5+ndpxmX/BBBOuk6QpXTn8y9Mylota9bgt1K
X-Gm-Gg: AR+sD118/+b0HKPekpFbYEeaZdCXgSiuYHCfKploLW4jfaMJ+ekr4VKhseYTmFru5NM
	rGy1bZ4clhzxf0Y15pWVoLbLGbaXgcz/hdeZBPaoj731AYia3BH0Uw8OtdroSyw0quYjJv+2ISh
	1omU7FKHf0kelfrQnwjE06fulNcSl+2blLTVmrTvikXqxhqLe/6NfUXFqlbIeOXF0DrGRlGvr0H
	i9d5/wsL/lvOyCYwH1i/EWHphTXm4QiS8cBfetCx2HmOBf2RJVf3Bw+7wab2xyZcywpT9Dvyiea
	tyYQjva1Va2SB+ZrrvjmrR8/kEIRUyu7//DlzTgyGEjs+263k24VDg0ha7smS/+7H1udvr4Ifvi
	u1JRC0AqAsymIsEQDJOTM1QaxIfnx3y0MBqEh0gquclG2wRuEHitj/bG3chphAqsuD80rzVeUkq
	qkvC97li1UBo1auK9vwxG6NUn4n5MO7br2pqXGSII53/k5MzbK7gGN6WdWBBhbrNBjynOj4xnlm
	aQAy/APbBR+YQ==
X-Received: by 2002:a05:600c:3baa:b0:499:484a:81d0 with SMTP id 5b1f17b1804b1-4997c10710bmr88140485e9.9.1786544392175;
        Wed, 12 Aug 2026 07:19:52 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:94c0:1825:d248:50ae])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4997ad78f2fsm47352235e9.1.2026.08.12.07.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 07:19:51 -0700 (PDT)
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
Subject: [PATCH v7 6/9] arm64: dts: renesas: r9a08g046: Add USB2.0 host/phy device nodes
Date: Wed, 12 Aug 2026 15:19:24 +0100
Message-ID: <20260812141940.246223-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
References: <20260812141940.246223-1-biju.das.jz@bp.renesas.com>
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
v6->v7:
 * Updated commit header
v5->v6:
 * No change
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

