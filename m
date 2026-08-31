Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10D437C11E
	for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 23:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788219522; cv=none; b=XVyUO51w8M8G6GWjkhuMGOjKMgKcPfv4PY70dKhBhcgOuyyxZ7Wa+YNR2eeKpgKMyxsqIiU9YSsiV3f/UeLliQe294fD+M4ALAOLY2etVxgG+tdkGocJrw79kl08qKohqSn5PSwrGYcoMzhqENFMt6Hk5Juk+6p1G+kjILHp8Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788219522; c=relaxed/simple;
	bh=WFjPHdh767TYAqxnbwvqJA2jUU4RF6BRsluNltVcpcI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hFdM1k7SvtDK1ZmXCBRJ/+6UQbT2Q7g2DQea1aYtcLdUDjzuI9l3mS3thRX+4Ql2k3ksvD+smcQ0sNOvIW23A2XVs8oML9PUz1shngIr5BOPY9TRitqBPh3bHrFH0l9TPuGUTKRMC3s56kF3fBBOboI2xfEBukfbKEyfL4xlSu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UChs2yJN; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UChs2yJN"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-396affa9420so625173a91.3
        for <devicetree@vger.kernel.org>; Mon, 31 Aug 2026 16:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219519; x=1788824319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iRDYJHHyH3j1YjcQkf01ypzJlaSwq1OAM4tqza49KSI=;
        b=UChs2yJNmechYuMHMhlKPzwe8qs3elTdMWi2m9dis2jFrd3iaPTohtiZ6mUeH7CjRe
         ClvbkyuscqXhozuGnISCUImZHV2uZvWVydzEroTDcIJtrLo6ePiGVSiNh0RPid7bCr3X
         +miigtJs012k3S5rJUJwz2+sDDEDrz2XvdhdrowetbcVC4eISAlRFZtg2lPzkKyfUNfp
         /TuICFFgj14d/pDPTWY5ExpRA2Dmg7uxlTmvFC3Zf7zvbvhnCHu5v0YAqLJewyGBDtD2
         PKyNM1KIDTlsNXY4eBux4i5SRjlAfwdzi1TubfE4GQdR9D/EMPraqVluIX/J8r0AMFDW
         svfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219519; x=1788824319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRDYJHHyH3j1YjcQkf01ypzJlaSwq1OAM4tqza49KSI=;
        b=dP7Y27oOdnAMi5IbeSfFK2Wskusd0wm8l6w0onebIWEIiIFa+XB0BdBNMcNObcx7F6
         4kYrMnXUfAJL78qU5EDJWXVr+g4nZcVP4j53/+Grupmk0gQTwWhF8jJiLz35EbqcFpwS
         T9AjEFvQGwaGf1gtPF6KHXhbRp8o5VcLZtC7/eUScLr8YpFVFPFlw9RjbB43lfGOAEOJ
         Tt9ivlnXF7/FsvkcT8z82tV6wX/JTfxh70Aoqpbq4a6aSvfEGDLG9ApwACubsmZCev6P
         QhYgguywK0C3/fWZQOh7Ct4iSUXTozAy7fBlIrWSrLhlPL+DmxobA43wIjGu2lX23xbx
         yyXw==
X-Forwarded-Encrypted: i=1; AKwUvByqQlaJ7XlX6R/2qQeJkHoia/fHh76oOOb9MsuiJvuAh4ASXcaw3ufpdSnPCxsap/sIdsW+mVqFnOJ2@vger.kernel.org
X-Gm-Message-State: AFuF++n880GV9hXIxCezI7PAqDUIX2RbIa34fhq0p7AKe9DIzwx6lZjU
	5Z77QQHJeI3cf9ScRInaDcXVMaCG5rcc4R3rJ12Hmlpkqzl/Nrf2KUJ2
X-Gm-Gg: AYBFou2D2CbbSI8N1OFcnc3j/kyFqHbd1PyAfmepEYoxmSq8jIzEj3zfRNLOEMC8KJQ
	h9I9Ris5r97LjadEAl4FMOLJis1zfjubFlHGW3ts6EqdyHHfB/HG1KvJ9a7tMyiOCM4GVo//uSH
	aB06EHJ4QHjcW5bA7poQPZ3fZAomO80aKaCVNw+/p7kXRmbtcFxVFXZk8D7BqkpRxi3AdW5VwoF
	u1j0q/x5q9TN2zLN3S8CER91Tm8iMhZpTmO0j5RG0b1wyewBt8wdWo/MJzdVb2DmZmI+BZix8PA
	FfspMteXDt0XEqDM88+IE74wDKTKMuQQyuU9tQC5oOq8UdjJlwmXdu1V/8cjpHbf8sVPNX/YAN2
	9zhYEjXykqq2GMk9Vpf0el7VBnO6EIdLjnsmZiRZ1eaKpXVRTW3NKC7d6CwqfmsTYa4ixCNzJDC
	RgB4yE05QyzRD0CC4IJOdk/LsGePSeqgvlXoQ4ye1rS0bLI1RGdRVR3JOzvqxBzjnG8k9EPGg=
X-Received: by 2002:a17:90b:2d46:b0:38e:7069:7117 with SMTP id 98e67ed59e1d1-398ba711f3cmr15122465a91.0.1788219518628;
        Mon, 31 Aug 2026 16:38:38 -0700 (PDT)
Received: from [10.60.78.252] ([2409:40c2:5002:4362:354a:8f21:7ceb:c8a6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990c40d0c9sm2143682a91.7.2026.08.31.16.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:38:38 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Tue, 01 Sep 2026 05:08:12 +0530
Subject: [PATCH v4 1/2] ARM: dts: ti: keystone: Align devctrl child node
 names with dtschema
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-ti-keystone-devctrl-v4-1-2922f2a44792@gmail.com>
References: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
In-Reply-To: <20260901-ti-keystone-devctrl-v4-0-2922f2a44792@gmail.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Ivan Khoronzhuk <ivan.khoronzhuk@ti.com>, Nishanth Menon <nm@ti.com>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, goledhruva@gmail.com, m-chawdhry@ti.com, 
 daniel.baluta@gmail.com, simona.toaca@nxp.com, j.bhargav.u@gmail.com, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788219500; l=6209;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=WFjPHdh767TYAqxnbwvqJA2jUU4RF6BRsluNltVcpcI=;
 b=LvYQG2LtgwiOLVmxUDpAnaExOoT7ie3SEbDN27AFmeuJj14wkZU5B/Mg6ldUIkLKKZIlj6ega
 /s47dW/KU1MAhtc8LYd7C2w5fZlEZvrpw3+XusdyvvXZpzKujT91UD+
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=

Align TI Keystone device state control child node names with standard
naming conventions.
- Change keystone_irq to interrupt-controller
- Change keystone_dsp_gpio to gpio

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi  |  2 +-
 arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi  |  4 ++--
 arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi | 16 ++++++++--------
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi  |  8 ++++----
 arch/arm/boot/dts/ti/keystone/keystone.dtsi      |  2 +-
 5 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi
index 662aa33cba11..083c94b62fc7 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2e.dtsi
@@ -110,7 +110,7 @@ pscrst: reset-controller {
 		};
 
 		devctrl: device-state-control@2620000 {
-			dspgpio0: keystone_dsp_gpio@240 {
+			dspgpio0: gpio@240 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x240 0x4>;
 				gpio-controller;
diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
index dafe485dfe19..11b27663503a 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2g.dtsi
@@ -121,7 +121,7 @@ devctrl: device-state-control@2620000 {
 			#size-cells = <1>;
 			ranges = <0x0 0x02620000 0x1000>;
 
-			kirq0: keystone_irq@2a0 {
+			kirq0: interrupt-controller@2a0 {
 				compatible = "ti,keystone-irq";
 				reg = <0x2a0 0x10>;
 				interrupts = <GIC_SPI 1 IRQ_TYPE_EDGE_RISING>;
@@ -130,7 +130,7 @@ kirq0: keystone_irq@2a0 {
 				ti,syscon-dev = <&devctrl 0x2a0>;
 			};
 
-			dspgpio0: keystone_dsp_gpio@240 {
+			dspgpio0: gpio@240 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x240 0x4>;
 				gpio-controller;
diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi
index 4fdf4b30384f..b7a9fbd6d59d 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2hk.dtsi
@@ -88,7 +88,7 @@ pscrst: reset-controller {
 		};
 
 		devctrl: device-state-control@2620000 {
-			dspgpio0: keystone_dsp_gpio@240 {
+			dspgpio0: gpio@240 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x240 0x4>;
 				gpio-controller;
@@ -96,7 +96,7 @@ dspgpio0: keystone_dsp_gpio@240 {
 				gpio,syscon-dev = <&devctrl 0x240>;
 			};
 
-			dspgpio1: keystone_dsp_gpio@244 {
+			dspgpio1: gpio@244 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x244 0x4>;
 				gpio-controller;
@@ -104,7 +104,7 @@ dspgpio1: keystone_dsp_gpio@244 {
 				gpio,syscon-dev = <&devctrl 0x244>;
 			};
 
-			dspgpio2: keystone_dsp_gpio@248 {
+			dspgpio2: gpio@248 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x248 0x4>;
 				gpio-controller;
@@ -112,7 +112,7 @@ dspgpio2: keystone_dsp_gpio@248 {
 				gpio,syscon-dev = <&devctrl 0x248>;
 			};
 
-			dspgpio3: keystone_dsp_gpio@24c {
+			dspgpio3: gpio@24c {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x24c 0x4>;
 				gpio-controller;
@@ -120,7 +120,7 @@ dspgpio3: keystone_dsp_gpio@24c {
 				gpio,syscon-dev = <&devctrl 0x24c>;
 			};
 
-			dspgpio4: keystone_dsp_gpio@250 {
+			dspgpio4: gpio@250 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x250 0x4>;
 				gpio-controller;
@@ -128,7 +128,7 @@ dspgpio4: keystone_dsp_gpio@250 {
 				gpio,syscon-dev = <&devctrl 0x250>;
 			};
 
-			dspgpio5: keystone_dsp_gpio@254 {
+			dspgpio5: gpio@254 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x254 0x4>;
 				gpio-controller;
@@ -136,7 +136,7 @@ dspgpio5: keystone_dsp_gpio@254 {
 				gpio,syscon-dev = <&devctrl 0x254>;
 			};
 
-			dspgpio6: keystone_dsp_gpio@258 {
+			dspgpio6: gpio@258 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x258 0x4>;
 				gpio-controller;
@@ -144,7 +144,7 @@ dspgpio6: keystone_dsp_gpio@258 {
 				gpio,syscon-dev = <&devctrl 0x258>;
 			};
 
-			dspgpio7: keystone_dsp_gpio@25c {
+			dspgpio7: gpio@25c {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x25c 0x4>;
 				gpio-controller;
diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
index 330b437b667f..4678454c0eb3 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
@@ -290,7 +290,7 @@ osr: sram@70000000 {
 		};
 
 		devctrl: device-state-control@2620000 {
-			dspgpio0: keystone_dsp_gpio@240 {
+			dspgpio0: gpio@240 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x240 0x4>;
 				gpio-controller;
@@ -298,7 +298,7 @@ dspgpio0: keystone_dsp_gpio@240 {
 				gpio,syscon-dev = <&devctrl 0x240>;
 			};
 
-			dspgpio1: keystone_dsp_gpio@244 {
+			dspgpio1: gpio@244 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x244 0x4>;
 				gpio-controller;
@@ -306,7 +306,7 @@ dspgpio1: keystone_dsp_gpio@244 {
 				gpio,syscon-dev = <&devctrl 0x244>;
 			};
 
-			dspgpio2: keystone_dsp_gpio@248 {
+			dspgpio2: gpio@248 {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x248 0x4>;
 				gpio-controller;
@@ -314,7 +314,7 @@ dspgpio2: keystone_dsp_gpio@248 {
 				gpio,syscon-dev = <&devctrl 0x248>;
 			};
 
-			dspgpio3: keystone_dsp_gpio@24c {
+			dspgpio3: gpio@24c {
 				compatible = "ti,keystone-dsp-gpio";
 				reg = <0x24c 0x4>;
 				gpio-controller;
diff --git a/arch/arm/boot/dts/ti/keystone/keystone.dtsi b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
index ff16428860a9..20596fa446b9 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone.dtsi
@@ -93,7 +93,7 @@ devctrl: device-state-control@2620000 {
 			#size-cells = <1>;
 			ranges = <0x0 0x02620000 0x1000>;
 
-			kirq0: keystone_irq@2a0 {
+			kirq0: interrupt-controller@2a0 {
 				compatible = "ti,keystone-irq";
 				reg = <0x2a0 0x4>;
 				interrupts = <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;

-- 
2.55.0

