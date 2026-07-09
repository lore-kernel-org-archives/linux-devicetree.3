Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9564391512
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 04:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569902; cv=none; b=YLtUwUBkae6OI6T6wL5wINFAIT1LQajJ9EkTr7vwY8JIVEQSlVE3s3GQCTzkjePIU7GQprYVGM98LZxyeQzujwmYqtnWceEJDeMrCiy4Hvk8dYrHjB73wZg/GaY/09f6iJ1G2ZHeUBh09/qEusXGZwA7CC720selvTXLUIQdtvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569902; c=relaxed/simple;
	bh=z3sYFVd8IsXgcaQ0PxQUtQdimHxLc4eG7buTt6GPwb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kq/kiSyZXeD4BZNwsGbvj0dL3K3XHQI89LPcKkdxRqFV3mCQ8o+6zux0dm3YaBIYy9SID/LQefN/zsrYV3v3j3MrpB7T9A3SUt6zZhyL61F1uWygiMRsU+BxHJ1d1sRGPRZ2y0fiip2KIwToWJ4oIoqD2S7muI/FpeJ5Zr9aOBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxLnr7DA; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxLnr7DA"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8482074a000so1190671b3a.0
        for <devicetree@vger.kernel.org>; Wed, 08 Jul 2026 21:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569899; x=1784174699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8A2Yz+iwfJcs0dFRSsIsJfrmmL9qanZsP+qCDJrYjw8=;
        b=TxLnr7DASM5tfbpe9Dpjf/jSeS9SwPRxQ24oBxQZFgJl5NaCbFu3eTlhetj47CaOnz
         DkZ6ZClInaMwHLHo2bakAcdT+zKRf1kaeeLtfSrUMrzx31DUccLRTAy283XTgZZU5WUa
         QZT8JZE8hD/9KoMju94Z+GuRYk22JbvdV1+nm4JchBpj87cfNrZFwUY9xqyAycAVsrLv
         yQ1xuVPMiswSdIVZ6y0wPf3FI2NCM9RwKPxyUvFE0F4oSlj4qocbgiLhEtjBQqKc7Ul1
         SA7Wnf4Q6x9Y9pF9ZQiYyGFizn5ylqzV2bdLA/dKKALxhrM+vuOzfhdxF+wWHUUhvVvy
         gyug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569899; x=1784174699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8A2Yz+iwfJcs0dFRSsIsJfrmmL9qanZsP+qCDJrYjw8=;
        b=eOhWakQpxEYHZ1VEBZ3oPBDRO2Mk2sFTK3vp8H0JjeWLCgfbJWkRLAkBsHgwq3VbeJ
         3xkhFqCjjdKxyqH8AnBqc4QkAOI/Q95/bCpBl5j17qoET4gBqZv83cdbUwHAygvULvLv
         Hfq7QaM/Bkt0gN6mvhYd4lIbuYkb1U6n0odiaBEEpXL79i12i1u18PimWZ0BGokNmeaE
         TduMVhqRxQZzrF1jYiSlwsK3yTFjEnC7Sw6pT8bvGgI23sWg9kMpjZSDy7A7aJLjSTBp
         UaxDSroWgMf9KI2rqqPpbNlQ9Mou2RdGjXrUlAlRpsObpi6s5joSXutwsOvH19QMd8Nd
         zJyA==
X-Forwarded-Encrypted: i=1; AHgh+RqAPX/BZ6l/+qNk3rEvdk54mbMgLLudEHPM39gkBj8KLm40TqWQDK3qXl+GBcs9hr5KCHRMy+qirhLc@vger.kernel.org
X-Gm-Message-State: AOJu0YzHuSmqp1DT62AqpUeLKPx1230Oe7qt2xKTvJpfCLWOnfFxbeGo
	5UB5VMmBUeBpLdh/w6jXd7gE390DefSFIVfK3+WwrCG7PcDnRT48DA7W
X-Gm-Gg: AfdE7clQ0Ow4I66tvyFlAZjrD929hB0X/Im9epyO5XLUFS4zuGBuGYW6chkgQdHmI6E
	aVVXsA5n6Ck+de0LjFXCLkj+EldcTJ1mqdRmeJePsACJU9jwIF7u6pRBIQpjxtRO7IZDDyQ0tLh
	j62MmfsarUqx0yauZWOxdstAJcI/sXEY3+CpRgU3m09zbn1MiTC/NApGWS7wdggkoPsQkYEQZ87
	j8eL+HqOvsrQEv7MPCBm0GFRTEaIcAx2JQkOS1Ort+SBK+adE/RlJbWh3C+92OXX/FjFH5tyNSV
	sJU1kD3r+t7gDfrrEkP+lgScf7ynpZTR+0h0M66KC+OEfd9t3Kc6HryhoX3SvR9OCgzhmGTMn6t
	w/tT3s6u0pKYVT+TrGiwXkasVHdmxrA8zaIdVC+gIooPHXbH+I1vjPMsI0csOFTE3mf6vjkAGFT
	o=
X-Received: by 2002:a05:6a00:2912:b0:847:759e:f61c with SMTP id d2e1a72fcca58-84843433a23mr5150837b3a.47.1783569899165;
        Wed, 08 Jul 2026 21:04:59 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-848593a591asm387242b3a.26.2026.07.08.21.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:04:58 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 1/2] riscv: dts: spacemit: k3: add USB controller and USB phy support
Date: Thu,  9 Jul 2026 12:04:13 +0800
Message-ID: <20260709040415.977784-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709040415.977784-1-inochiama@gmail.com>
References: <20260709040415.977784-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add all USB device node to the Spacemit K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 13 ++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 42 ++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e664..2a6d35a64d5c 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -182,6 +182,11 @@ dldo7: dldo7 {
 	};
 };
 
+&combophy {
+	spacemit,apmu = <&syscon_apmu 0x11>;
+	status = "okay";
+};
+
 &eth0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&gmac0_rgmii_0_cfg>, <&gmac0_phy_0_cfg>;
@@ -221,3 +226,11 @@ hub@1 {
 &usb2_phy {
 	status = "okay";
 };
+
+&usb3d_u2phy {
+	status = "okay";
+};
+
+&usb3d {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..82c9e2da82e9 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -7,6 +7,7 @@
 #include <dt-bindings/clock/spacemit,k3-clocks.h>
 #include <dt-bindings/reset/spacemit,k3-resets.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/phy/phy.h>
 
 /dts-v1/;
 
@@ -438,6 +439,47 @@ soc: soc {
 		dma-noncoherent;
 		ranges;
 
+		usb3d: usb@81a00000 {
+			compatible = "spacemit,k3-dwc3";
+			reg = <0x0 0x81a00000 0x0 0x10000>;
+			interrupts = <149 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-parent = <&saplic>;
+			clocks = <&syscon_apmu CLK_APMU_USB3_PORTD_BUS>;
+			clock-names = "usbdrd30";
+			resets = <&syscon_apmu RESET_APMU_USB3_D_AHB>,
+				 <&syscon_apmu RESET_APMU_USB3_D_VCC>,
+				 <&syscon_apmu RESET_APMU_USB3_D_PHY>;
+			reset-names = "ahb", "vcc", "phy";
+			phys = <&usb3d_u2phy>,
+			       <&combophy 4 PHY_TYPE_USB3>;
+			phy-names = "usb2-phy", "usb3-phy";
+			phy_type = "utmi";
+			snps,dis_enblslpm_quirk;
+			snps,dis_u2_susphy_quirk;
+			snps,dis_u3_susphy_quirk;
+			snps,dis-del-phy-power-chg-quirk;
+			snps,dis-tx-ipgap-linecheck-quirk;
+			snps,parkmode-disable-ss-quirk;
+			dr_mode = "host";
+			status = "disabled";
+		};
+
+		usb3d_u2phy: phy@81b00000 {
+			compatible = "spacemit,k3-usb2-phy";
+			reg = <0x0 0x81b00000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_APMU_USB2_BUS>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
+		combophy: phy@81d00000 {
+			compatible = "spacemit,k3-combo-phy";
+			reg = <0x0 0x81d00000 0x0 0x600000>;
+			#phy-cells = <2>;
+			spacemit,apb-spare = <&pll>;
+			status = "disabled";
+		};
+
 		usb2_host: usb@c0a00000 {
 			compatible = "spacemit,k3-dwc3";
 			reg = <0x0 0xc0a00000 0x0 0x10000>;
-- 
2.55.0

