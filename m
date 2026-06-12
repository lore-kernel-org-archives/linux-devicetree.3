Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D013BCD12
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 14:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781274664; cv=none; b=CtlTtYmHvKQFQY1tySkU1P2dbHiE1d2WfhSZQ0VVgrR1es5snUGvtf8tuSsZTyKL73voG75lZg+xRgTKWr3fWpARH574FggPj6qFjxGEHHYhY8HAnaV3Ae8WAMffWTh4pjiVwmcdNsVeFRp9u8cPa2Ew9ytJe0adqo/9WQTk8gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781274664; c=relaxed/simple;
	bh=SxTM6VRQ0YMFjzDqrZ6PIDgXoXZRNr5erd8yR6hxoD4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Uj7juCOMZx5TO94Q3pnf+XnBczSeD55u3nwQ9IQWExUKOBbeTVWKqnDy/Jzlh7DLEHgrnGfM1r1W1giWutLhnvyuK2ZDTeJci8k63XUi0TCJCPyu6dXBpj/RSGhdrnp8zHm4IAlwWcYk1caUG89XztifhU43Z6BwiKg/V3RcF2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WfnQaYKo; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WfnQaYKo"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45eee266c6cso935900f8f.1
        for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 07:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781274661; x=1781879461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3PS6UrnYbPHUhkh2dJtXOKFyRqOtNX0OJoH+34jYxBU=;
        b=WfnQaYKo+sTpVe96cK6qRsK+xzIoIT7VDCcmJX9xQU/2vJX5AFRdgEJ6o6rqaPMm18
         B/FP+OhyB8BHmg4bLqnB7NrOU2l81dRjxcfXcB/kSvhBovajaW+me3XBrm1ktGayCMFc
         yuwLTdjy+sSrBJeCpDOOYre9BWHmFpBdvJ1wLw918Mt3PVxdyXAcTmotROou8yuTGl2Q
         3BY+YLoDITqps4lSgpwMXhbaTFEhwIgwp6X7AqiQJ+Z+95UGWbewQSVRcibrNUtv8j1E
         2f1QSR29UcDvuPV3omEFKR6UelYkQwV+v0ccDBC2gofCM6roXWY3ZrokFuPkIXHmnKoU
         uWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781274661; x=1781879461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3PS6UrnYbPHUhkh2dJtXOKFyRqOtNX0OJoH+34jYxBU=;
        b=jaCqkaeEmPma8jC2w0Ma2f7CookCxpNW9UazUgzlXcEmT1vsHx3UApEaEOOgOu9vTP
         aySU679YS992WS9rBLBPjGl2HWZpyESl2w5R7akaZ/nj5Rz7jb33g35RzLWaZSR7HN+V
         K5YSYGJfcRkMIgqxx7iW1ljY4JGBDln9yaWoI5ySgYMWS/wlTK+1CfknWOTZnETcOAPi
         ceDS8UNFbiVyJ9kll9X+yL8X/OCVSiU9i7bZQE80wxK2JUiwUtryOhXq5NqJA0FhOdoF
         V2A5waVyvduVPqeWKABVo0udvuWJAdTL4MSQyjZCdOf4ItKJlCSk1ForLtTdfGOXLKRr
         IaaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/fGYghPv8zLmsS6glDdFHtVJ5F+ePuqGaC+ppDrJ23h1g9GUuBDhFfaZwt4HKpAGjrQvbGt44Bj44g@vger.kernel.org
X-Gm-Message-State: AOJu0YxMMEJC83qc2u//Km0M4GMoA2fGYdEu2fNcApwKWg9m7SY+RaHo
	9OkMwEwcajVtiGLpVxckL1ObGSoXDJ/DE9JFo0pitUcl/42rMfANRYWv
X-Gm-Gg: Acq92OF0lCstxo/jEgEA+T+9yaD4AMz3X5XANYcbakAgHcPiuerbQf79xuI0adnn3H1
	xaG5ZcDHTrnM5zcvd6PO3OteqCBZI6TsH/o3e63Ww9OPTHXMCbROeE/rdwvV966aJ7ZGTXQEKcE
	Fbqo/go/sAIqnergnFQ8MeTglMxjytAi2xnzBXN4bJEOpuESSC2UWwveDIdhgfmGgMUBPIIBfqm
	D4xyPEP+NyL9mzbx4ErUVUgsUTaoK/nYrf2n/Oph6p4aF70gCcdbHm7H2X72C0fb3u4Zo6WBY2H
	hb4bX6Z9ppgBtbb1o9HNTHXl282rQxG0g2VLtTICQBTrA/VJJerkGZ0yCC2mcsgMqfxaTeUA8tl
	5Ms3mRyRe/9elKYwNzHZwitLA6m97mqETXKzNhnuwh+kiwfUKwjp8nw3iLBF/xP+MfHvWJmDFsv
	RokXnHbVTJaYtdfg1w1u5HilZnP2IGZUD8Yux/1am2ZQrhF9f9
X-Received: by 2002:a5d:4605:0:b0:45e:f381:cd8c with SMTP id ffacd0b85a97d-4606dba5075mr3406307f8f.30.1781274660401;
        Fri, 12 Jun 2026 07:31:00 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a700:7301:c72c:50c4:8b28:9a3a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2c3782sm5850016f8f.25.2026.06.12.07.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 07:31:00 -0700 (PDT)
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
Subject: [PATCH 10/11] arm64: dts: renesas: r9a08g046: Add USB2.0 device nodes
Date: Fri, 12 Jun 2026 15:30:38 +0100
Message-ID: <20260612143048.317907-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
References: <20260612143048.317907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Add USB2.0 device nodes to the RZ/G3L (r9a08g046) SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
index 85e409ac8d5c..45aa41467e08 100644
--- a/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a08g046.dtsi
@@ -1198,6 +1198,109 @@ queue3 {
 			};
 		};
 
+		phyrst: usbphy-ctrl@11e00000 {
+			compatible = "renesas,r9a08g046-usbphy-ctrl";
+			reg = <0 0x11e00000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A08G046_USB_PCLK>;
+			resets = <&cpg R9A08G046_USB_PRESETN>;
+			power-domains = <&cpg>;
+			#reset-cells = <1>;
+			renesas,sysc-pwrrdy = <&sysc 0xd70 0x1>;
+			status = "disabled";
+
+			usb0_vbus_otg: regulator-vbus {
+				regulator-name = "vbus0";
+			};
+
+			usb1_vbus_otg: regulator1-vbus {
+				regulator-name = "vbus1";
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

