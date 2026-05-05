Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBC1407598
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 10:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777976065; cv=none; b=XLu7u+0tf7RNu5EYn5vKBzCZD87DyKpCsK9X/UTTGyw6whSq1OON+o4Ej73+/Piopo96UFi67r9xy/VHHvCF0QJjxLcw+iCa/duy+F+ZrY5ntkBFROBRC9XunV+PI4Pm2KaqMAYisHb5NV071jKrSGMskOyLZ1kN3AEdUZmbU+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777976065; c=relaxed/simple;
	bh=XSfi1JYdQtczzpDCQ51h/+zdJpoLLvs7XaMbux7EzOs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LqMAlFFfsVTTEGtti5YFI7ahp40c14RMMiS4cBrrQmh5W/AIPvTlcoqZcClfePfJQv3hkgZoIBH1fdMTwHxwKrsZ8N+zp6ZBsrBJz4I4+NZHvIx7Nzw2m1vNCZMzumUqnOakGb11KiMpHM6eFLyD0ygQZuarVGvAlrvPEycnblg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HS0QngWL; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HS0QngWL"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-837b39eb078so1321715b3a.2
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 03:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976063; x=1778580863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZjcVEJCK/cwTNvVbr5CQaLiCjWyMPPoiyKPAoaxLvx8=;
        b=HS0QngWLf+GbOaAM3vlGOdB4h7E9t9uBcAkOzO3s0TD71m/UbLrHXTDN8tUHnnGFK9
         xNQHscwV8A0r41q9Cq2XSdWZdE7xgecvGD/irOEdWOg0rlHkq4NphCf9kLDv4HAEN8d/
         1fdV7J1krKadjVq6dA50USr0iDRBcn924TSHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976063; x=1778580863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZjcVEJCK/cwTNvVbr5CQaLiCjWyMPPoiyKPAoaxLvx8=;
        b=sofkh785Hc7Ma++Cqgq0MgSwiut/1lVFyTYlEDPOI0YGgguZ84M1OiEualCr3WtwOU
         BB1agZ25Ol48wtKtwuURKn9Cju1CGzFIJjGiRVuF55KC8CyIMriOeMyAHZiSMk7qCXct
         prXx4+wskg74IdLkTHkgV3BlxRY4lx6Uko205bAsd6zVJH7PQawNZ8YcHDHSkNBIvzY+
         PASB7FhwmdOfSQj4yYD7H/eqf4Kswas+lXa9gCHHPfp7ZBdHtTa/ZzTwEfR0V1Vr6vm7
         GD3HWh0mhp6LMxMx4Lrj5MkeXS2VOr1bmbhCTvGpcslxS99eXm0+gQ8bb+pp/Yvu+Xjf
         0c9g==
X-Forwarded-Encrypted: i=1; AFNElJ++Mi3Q/o0jMYY+C6kTbI1bIrgnuvGVN3Nlk7OLTEI1ddq8rLp6s/SX6FI1luLxuuBZPx2oeQtIn6Ts@vger.kernel.org
X-Gm-Message-State: AOJu0YwqRBOP8d8OVssQMagjHYQd/l0p4h2MVRqyXEJ4hdectP6l2sj2
	BmMIySA6E8+B7CWAs1fcMhdBMGpnP6CVhE/flwtJd89s9kn/34TRQHYWiBS9Fy1MNA==
X-Gm-Gg: AeBDievROQepNzZ7JQrm+W7drX82OVHB8DdK1oXuOZUP57MmHTka9wwHyMEEww2DDTo
	53cMlb2F9Rt/l9JzGpU1aRlCUyCgYEb0DH68vVSeWQOjjpVyU2VNX7Kkl3wDPd+wgjeYPPgcP03
	N2nW9M2ytEgCajyHlIGzFbeh1M92vkZ/CheFqHpaTwG8ROgan70vrJ4fwvdQurzk1PAvsDTkAL/
	MBldoOt4KHmVwqlDbKs5ZLxnT9RrchpKqP76B8eBTuWmUr5Rp02QdSo4TQnFXKKfdy9Sv36OacW
	oN3lbmGvSsv9wQKvowvCSRJNTYCOrXn12VCVRJupnkGCviWy7oWrehmRq1y21CC5O8YIvp06t3k
	V4faHSe8rWYNIDGZNSiXjZZstOE13AQ9EOdVL0vaJuhocXn4m8/7gGvqvw7dh+4xCICLG9bJkIN
	j0n0jF/wz80LhngeMvRwqj1+mdBdjlVPeLxmXD1hQ1T2Rv/ZlO8v2CHLRBJABXvXJgYzWMiF/WA
	FkeXQfvegGEQU5YLNw=
X-Received: by 2002:a05:6a00:3a19:b0:827:2a07:231d with SMTP id d2e1a72fcca58-839228c94bamr2443788b3a.17.1777976063465;
        Tue, 05 May 2026 03:14:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:22 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/16] arm64: dts: mediatek: mt6359: Switch to proper ldo_vcn33_[12] regulators
Date: Tue,  5 May 2026 18:13:52 +0800
Message-ID: <20260505101408.1796563-3-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ldo_vcn33_[12]_wifi and ldo_vcn33_[12]_bt are just two regulator
outputs instead of four. The wifi and bt parts refer to separate enable
bits that are OR-ed together to affect the actual regulator output. The
separate bits allow the wifi and bt stacks to enable their power without
coordination between them. These have been deprecated in favor of proper
nodes matching the output.

Add proper ldo_vcn33_[12] nodes and drop the old ones. No default voltage
ranges are given as they don't make sense, and the existing ranges are
about to be removed. In-tree users of the existing *_(wifi|bt) regulator
nodes are converted over to use the new ones.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Use non-suffixed names (ldo_vcn33_[12]) instead
- Convert existing users
---
 arch/arm64/boot/dts/mediatek/mt6359.dtsi      | 22 ++++---------------
 .../dts/mediatek/mt8390-genio-common.dtsi     |  4 ++--
 .../dts/mediatek/mt8390-grinn-genio-som.dtsi  |  2 +-
 .../dts/mediatek/mt8390-tungsten-smarc.dtsi   |  6 ++---
 .../dts/mediatek/mt8395-genio-common.dtsi     |  6 ++---
 .../mt8395-radxa-nio-12l-8-hd-panel.dtso      |  4 ++--
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     |  2 +-
 7 files changed, 16 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index 45ad69ee49ed..a953fb527b69 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -164,15 +164,8 @@ mt6359_vcn13_ldo_reg: ldo_vcn13 {
 				regulator-min-microvolt = <900000>;
 				regulator-max-microvolt = <1300000>;
 			};
-			mt6359_vcn33_1_bt_ldo_reg: ldo_vcn33_1_bt {
-				regulator-name = "vcn33_1_bt";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <3500000>;
-			};
-			mt6359_vcn33_1_wifi_ldo_reg: ldo_vcn33_1_wifi {
-				regulator-name = "vcn33_1_wifi";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <3500000>;
+			mt6359_vcn33_1_ldo_reg: ldo_vcn33_1 {
+				regulator-name = "vcn33_1";
 			};
 			mt6359_vaux18_ldo_reg: ldo_vaux18 {
 				regulator-name = "vaux18";
@@ -231,15 +224,8 @@ mt6359_vemc_1_ldo_reg: ldo_vemc_1 {
 				regulator-min-microvolt = <2500000>;
 				regulator-max-microvolt = <3300000>;
 			};
-			mt6359_vcn33_2_bt_ldo_reg: ldo_vcn33_2_bt {
-				regulator-name = "vcn33_2_bt";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <3500000>;
-			};
-			mt6359_vcn33_2_wifi_ldo_reg: ldo_vcn33_2_wifi {
-				regulator-name = "vcn33_2_wifi";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <3500000>;
+			mt6359_vcn33_2_ldo_reg: ldo_vcn33_2 {
+				regulator-name = "vcn33_2";
 			};
 			mt6359_va12_ldo_reg: ldo_va12 {
 				regulator-name = "va12";
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index 2062506f6cc5..ae11cd73e333 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -445,7 +445,7 @@ typec-mux@48 {
 		mode-switch;
 		orientation-switch;
 
-		vcc-supply = <&mt6359_vcn33_1_bt_ldo_reg>;
+		vcc-supply = <&mt6359_vcn33_1_ldo_reg>;
 
 		port {
 			it5205_sbu_mux: endpoint {
@@ -637,7 +637,7 @@ &mt6359_vcn18_ldo_reg {
 	regulator-always-on;
 };
 
-&mt6359_vcn33_2_bt_ldo_reg {
+&mt6359_vcn33_2_ldo_reg {
 	regulator-name = "vcn33_2_pmu";
 	regulator-always-on;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi
index 8da47c916313..84064511fa0d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi
@@ -58,7 +58,7 @@ &mt6359_vcn18_ldo_reg {
 	regulator-always-on;
 };
 
-&mt6359_vcn33_2_bt_ldo_reg {
+&mt6359_vcn33_2_ldo_reg {
 	regulator-name = "vcn33_2_pmu";
 	regulator-always-on;
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
index 40b381d4cc35..2e68e997dff3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi
@@ -592,7 +592,7 @@ &mmc2 {
 	interrupt-names = "msdc", "sdio_wakeup";
 	interrupts-extended = <&gic GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>,
 			      <&pio 172 IRQ_TYPE_LEVEL_LOW>;
-	vmmc-supply = <&mt6359_vcn33_2_bt_ldo_reg>;
+	vmmc-supply = <&mt6359_vcn33_2_ldo_reg>;
 	vqmmc-supply = <&mt6359_vcn18_ldo_reg>;
 	mmc-pwrseq = <&wifi_pwrseq>;
 	status = "okay";
@@ -617,12 +617,12 @@ &mt6359_vcn18_ldo_reg {
 	regulator-boot-on;
 };
 
-&mt6359_vcn33_1_bt_ldo_reg {
+&mt6359_vcn33_1_ldo_reg {
 	regulator-name = "vcn33_1_pmu";
 	regulator-always-on;
 };
 
-&mt6359_vcn33_2_bt_ldo_reg {
+&mt6359_vcn33_2_ldo_reg {
 	regulator-name = "vcn33_2_pmu";
 	regulator-min-microvolt = <3300000>;
 	regulator-max-microvolt = <3300000>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
index 62c336e21500..4259291a52a3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi
@@ -701,7 +701,7 @@ &mt6359_vcamio_ldo_reg {
 	regulator-always-on;
 };
 
-&mt6359_vcn33_2_bt_ldo_reg {
+&mt6359_vcn33_2_ldo_reg {
 	regulator-min-microvolt = <3300000>;
 	regulator-max-microvolt = <3300000>;
 };
@@ -1216,8 +1216,8 @@ can0: can@0 {
 		clocks = <&can_clk>;
 		spi-max-frequency = <20000000>;
 		interrupts-extended = <&pio 16 IRQ_TYPE_LEVEL_LOW>;
-		vdd-supply = <&mt6359_vcn33_2_bt_ldo_reg>;
-		xceiver-supply = <&mt6359_vcn33_2_bt_ldo_reg>;
+		vdd-supply = <&mt6359_vcn33_2_ldo_reg>;
+		xceiver-supply = <&mt6359_vcn33_2_ldo_reg>;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso
index 0389c9cb8581..ecc9fd27b82d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso
@@ -29,7 +29,7 @@ panel@0 {
 		compatible = "radxa,display-8hd-ad002", "jadard,jd9365da-h3";
 		reg = <0>;
 		backlight = <&backlight>;
-		vdd-supply = <&mt6359_vcn33_2_bt_ldo_reg>;
+		vdd-supply = <&mt6359_vcn33_2_ldo_reg>;
 		vccio-supply = <&mt6360_ldo2>;
 		reset-gpios = <&pio 108 GPIO_ACTIVE_LOW>;
 		pinctrl-names = "default";
@@ -57,7 +57,7 @@ touchscreen@14 {
 		interrupts-extended = <&pio 132 IRQ_TYPE_EDGE_RISING>;
 		irq-gpios = <&pio 132 GPIO_ACTIVE_HIGH>;
 		reset-gpios = <&pio 133 GPIO_ACTIVE_HIGH>;
-		VDDIO-supply = <&mt6359_vcn33_2_bt_ldo_reg>;
+		VDDIO-supply = <&mt6359_vcn33_2_ldo_reg>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&touch_pins>;
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index bf91305e8e4a..4530434015a5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -614,7 +614,7 @@ &mt6359_vcamio_ldo_reg {
 	regulator-always-on;
 };
 
-&mt6359_vcn33_2_bt_ldo_reg {
+&mt6359_vcn33_2_ldo_reg {
 	regulator-min-microvolt = <3300000>;
 	regulator-max-microvolt = <3300000>;
 };
-- 
2.54.0.545.g6539524ca2-goog

