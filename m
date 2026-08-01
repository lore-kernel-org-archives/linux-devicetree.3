Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307F52F3C18
	for <devicetree@vger.kernel.org>; Sat,  1 Aug 2026 10:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785579607; cv=none; b=aaISOozE/goWfoJ9Bvv7Vw7Qt6qevguR0CrrGYTqE2MpnHyE84FeHfCgHoNi+crsk/xj0ILV/8TKp/AAzRnuS1P3uEOnw7T857Qsg+CFzYSu5tQByEQu6Has1ipo0FUcUDWBWve5P1CLThTnADslxVlncH7rRVGxWWVVoK9mPNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785579607; c=relaxed/simple;
	bh=sDXg7NFNr1VMXxa6QMTRuQYDOSB8f4c6Tbl3u7TZFLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oZiUCjZYQhg3mkq9hmMSuYrzcQUFwVJDkHStzhPDFG1AlYwrqxQ2HPc6Wvppqsp8V0t4wJwenagByoL1vBLoWnjZNfvo9JEsWZ0yi0OeXve+BjEfPvoFVPCkpFhG+cQfae+CuwfA35koQijTg9gyKchp6gVFB7JFhWcgf2BnoYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KlQoCsEY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KlQoCsEY"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49558ce01afso4195515e9.1
        for <devicetree@vger.kernel.org>; Sat, 01 Aug 2026 03:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785579603; x=1786184403; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oSwy52wPE+n9CbxU0Afr3cSq8DpmnySrLvPQBrinhvc=;
        b=KlQoCsEYMKOcjmR9WuoMXi8FiqGiySiaF93ucj84RMNCC0YwKyBD87N+UAxEk5DcIL
         H1Y99GAkTEU/xJoUTFdsqxf6N+5A82pd5jd0LbopDgJNvaqjw4KLl7qufNIP91WoOHiL
         mD16eNTJEPGonUP49xi3T3HOGl9fAltRHQOsmXFRHfvpiw24qTFO9J6rBxGk3cRB9+K+
         DLc1QIpnLwwIUAwioqqeZuQIsYiZwUEytaUfnnoMhqLreOiVob/g0eTtkBDwiUMMbGfp
         xjiAX1Ad/7PQGXb0VLQgCKthKeNAvHtEQ8Ubw/tnqvXVtWEWGqXIBNUy2L158eQ9PNtO
         21AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785579603; x=1786184403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oSwy52wPE+n9CbxU0Afr3cSq8DpmnySrLvPQBrinhvc=;
        b=hOahXuERzyY/yjvYgPollX4So2l9wesNLGVUYbD5plOcpjuGRU5kAuq49qXXn9s1MW
         O4t5lwgzEabRuA2u/9Wjo2qY+eUqe7YJXZxLdbWhwb36RzGzRrzs8Y80ez3rjgjpkmZ5
         dTYiL+eonkzC/n7VFuQNdXwSK8de9upNQP3igBbvN4RLI6NnTEkaRRE/D9t4xqc6889q
         lyQ/RsLgCCrinakEb+vdNLJ+N9iI7MGk8OH8czepr1iGEkhT3CoiTn7frL3bbKN19d5g
         Cjq8CbAtKDrEze3ibyATj5RWs4m1/zbIDAmqobUi7tX28dupiu/+VG7pDY4S1aNWwZXL
         3nWQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqv9fB9dLpjilhCn8ycvg8GrJenkjgWkXYchQbY+p0uwWGoAdEj36Gr+Vg/brYaKQnFdXOfiJ7oXHcE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq/VLiAquF9cqS0lc4oYompJXSLMyVzdqMxFgKdFLILm33bTT9
	5ThcbaZD/kompyrTAHt+NhobCmuGQK842wAWExvhjrFzlf9Cgge/CYfg
X-Gm-Gg: AR+sD10ImXtW1qAoLbUXaZqzXn5yy4M7Mzu7jhAvAKnpL3S/JxRy5Y+1wVmDupxA1pR
	HqKaHsr1FIe6H4ezQeM7G1CppCuVOezVQdF53HaYCePkO2vxTWPzmSl/UJfLpZ8rS819FyL40E8
	8hjECT6+TkOgvYz3qXK5b/xGgIwdvJxalod10Re76hA6U1GGOQiT4L1I6jN5fTXPciRGBNmikx+
	2LWuTmWXpVRCwFDadSoqhWXS1FGiHH3nKlGYCOSRd2hJ56AQBReUuowOA1fGV10XLXLI6AqaGOh
	re5Z5f2nOuB33zZjNbn2mi3S0ah4ljXTHYTg0yu447EVIdgqfmh6cXdca5+BBPNDJjiifvu1au6
	RpEHCpJnrTBEFyxR8mPDOA0Q4jEghtVfSB/avMh9bIGJqqalbu0L47A/YzZwgdi3qXYxYYCJbYs
	phazPglJ9ymH807EQgtC1wlT9t7jgzUMJjbiojSY4LxnEvVb0FNmX/oP4j7Krz2EVfJlNo042nw
	wbZTxUSzFaVwnHtVo5SCqzaMqirh9ojNRhNqM8V4yBnQpjhSJhEj2O/AmGi0fFFobJv1N9Uq62X
	RW6dxUlmUhx+yXKIL6vLdY+RCFuB2BDSuWg31IWaDdg5wEvXj3+ZVJhQlM35PdLJf5iV2wwn8ub
	uKWG1wK95YJ5Z5Am5WqCyfd5BkG7U1i8U8NLJnUM8KyR+Cozonc4gup1sAgdg
X-Received: by 2002:a05:600c:c490:b0:494:596e:e8c4 with SMTP id 5b1f17b1804b1-4980c67d1cbmr29142895e9.17.1785579603235;
        Sat, 01 Aug 2026 03:20:03 -0700 (PDT)
Received: from cypher.home.roving-it.com (1.e.2.e.9.4.4.d.0.e.6.8.9.8.8.3.0.0.0.0.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:0:3889:86e0:d449:e2e1])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fd456a5a4sm14804509f8f.20.2026.08.01.03.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 03:20:02 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Phil Elwell <phil@raspberrypi.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Peter Robinson <pbrobinson@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v2] arm64: dts: broadcom: bcm2712: adjust display status
Date: Sat,  1 Aug 2026 11:19:53 +0100
Message-ID: <20260801102000.551644-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Typically non critical IP in a SoC are disabled by
default in the SoC .dtsi and enabled on board specific
configs. There are usecases, such as some CM5 carrier
boards, where display output may not be desired or
connected. So disable them on the SoC .dtsi and enable
them on the RPi5 board.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Andrea della Porta <andrea.porta@suse.com>
Fixes: 25d77bdd7df2 ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
---

v2: rebase to align with upstream changes

 .../dts/broadcom/bcm2712-rpi-5-b-base.dtsi    | 31 +++++++++++++++++++
 arch/arm64/boot/dts/broadcom/bcm2712.dtsi     | 11 +++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
index b7a6bc34ae1ab..51c8533f31812 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-base.dtsi
@@ -104,6 +104,18 @@ wl_on_reg: wl-on-reg {
 	};
 };
 
+&ddc0 {
+	status = "okay";
+};
+
+&ddc1 {
+	status = "okay";
+};
+
+&disp_intr {
+	status = "okay";
+};
+
 &pinctrl {
 	bt_shutdown_default: bt-shutdown-default-state {
 		function = "gpio";
@@ -230,16 +242,27 @@ bluetooth: bluetooth {
 &hvs {
 	clocks = <&firmware_clocks 4>, <&firmware_clocks 16>;
 	clock-names = "core", "disp";
+	status = "okay";
 };
 
 &hdmi0 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 0>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	status = "okay";
 };
 
 &hdmi1 {
 	clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
 	clock-names = "hdmi", "bvb", "audio", "cec";
+	status = "okay";
+};
+
+&mop {
+	status = "okay";
+};
+
+&moplet {
+	status = "okay";
 };
 
 &pcie1 {
@@ -250,6 +273,14 @@ &pcie2 {
 	status = "okay";
 };
 
+&pixelvalve0 {
+	status = "okay";
+};
+
+&pixelvalve1 {
+	status = "okay";
+};
+
 &v3d {
 	clocks = <&firmware_clocks 5>;
 };
diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
index 761c59d90ffc9..9b36ecd7bba54 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
@@ -359,12 +359,14 @@ pixelvalve0: pixelvalve@7c410000 {
 			compatible = "brcm,bcm2712-pixelvalve0";
 			reg = <0x7c410000 0x100>;
 			interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
 		};
 
 		pixelvalve1: pixelvalve@7c411000 {
 			compatible = "brcm,bcm2712-pixelvalve1";
 			reg = <0x7c411000 0x100>;
 			interrupts = <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
 		};
 
 		mop: mop@7c500000 {
@@ -372,6 +374,7 @@ mop: mop@7c500000 {
 			reg = <0x7c500000 0x28>;
 			interrupt-parent = <&disp_intr>;
 			interrupts = <1>;
+			status = "disabled";
 		};
 
 		moplet: moplet@7c501000 {
@@ -379,6 +382,7 @@ moplet: moplet@7c501000 {
 			reg = <0x7c501000 0x20>;
 			interrupt-parent = <&disp_intr>;
 			interrupts = <0>;
+			status = "disabled";
 		};
 
 		disp_intr: interrupt-controller@7c502000 {
@@ -387,6 +391,7 @@ disp_intr: interrupt-controller@7c502000 {
 			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-controller;
 			#interrupt-cells = <1>;
+			status = "disabled";
 		};
 
 		dvp: clock@7c700000 {
@@ -405,6 +410,7 @@ ddc0: i2c@7d508200 {
 			clock-frequency = <97500>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			status = "disabled";
 		};
 
 		ddc1: i2c@7d508280 {
@@ -415,6 +421,7 @@ ddc1: i2c@7d508280 {
 			clock-frequency = <97500>;
 			#address-cells = <1>;
 			#size-cells = <0>;
+			status = "disabled";
 		};
 
 		bsc_irq: interrupt-controller@7d508380 {
@@ -460,6 +467,7 @@ hdmi0: hdmi@7c701400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc0>;
+			status = "disabled";
 		};
 
 		hdmi1: hdmi@7c706400 {
@@ -489,6 +497,7 @@ hdmi1: hdmi@7c706400 {
 			interrupt-names = "cec-tx", "cec-rx", "cec-low",
 					  "hpd-connected", "hpd-removed";
 			ddc = <&ddc1>;
+			status = "disabled";
 		};
 	};
 
@@ -667,6 +676,7 @@ v3d: gpu@1002000000 {
 
 	vc4: gpu {
 		compatible = "brcm,bcm2712-vc6";
+		status = "disabled";
 	};
 
 	timer {
@@ -703,5 +713,6 @@ hvs: hvs@107c580000 {
 		interrupt-parent = <&disp_intr>;
 		interrupts = <2>, <9>, <16>;
 		interrupt-names = "ch0-eof", "ch1-eof", "ch2-eof";
+		status = "disabled";
 	};
 };
-- 
2.55.0

