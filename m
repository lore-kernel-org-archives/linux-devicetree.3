Received: from mail-ua1-f100.google.com (mail-ua1-f100.google.com [209.85.222.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F68D38657A
	for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 21:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776202876; cv=none; b=OvMvtu+HPCisBzfMjq8VHYRLAPbcZ9GJ+MUF9D5AYYm8AJ/3mlyzv4e4eyOfeKrro66cJ/IIwuhDMSetan7n+YQGqrtVHkHP08XQGXRUyQO7WvYQzrefuPerrc9HjpldUsbSwYtqHs1xERhl743qoGhy585/h8u8AZachmmQ4gs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776202876; c=relaxed/simple;
	bh=62FA32n6ghYjgwrgVV2bEZChmkiSaw7eix9dVTqzEhU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=haGujJCLbN3/S6jlKRffaPU6zlSUgqY6I22X+kFDjad6Q0s4awlTBPg/beNNp4XCtcLTcAbCtjgVb69BaVsOuzTiqAQVzMEJFzrAn/0V8stT1XO1idoxk/CJbdHCLyQTWJN4k/mXivNe11lZMAWMpeopiJqJBVNYrcYz+y2Y7tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us; spf=pass smtp.mailfrom=ausil.us; dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b=Tw+JSXIh; arc=none smtp.client-ip=209.85.222.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ausil.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ausil.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ausil.us header.i=@ausil.us header.b="Tw+JSXIh"
Received: by mail-ua1-f100.google.com with SMTP id a1e0cc1a2514c-9568159ee07so1694623241.1
        for <devicetree@vger.kernel.org>; Tue, 14 Apr 2026 14:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1776202874; x=1776807674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Q87q408S6kD03eCdhgkumlXWLlyzkrJl5PR3laXuXk=;
        b=Tw+JSXIhm7qsHVEheBv4PoGLSYBoQmAqik9neeHYDgk7lSBVvRsWpSY9SoJhFqxT1Z
         xNpJOXDH4x5VvJwPM0SCrsO7l+FKDkYFYk4oD04c/l5jbiBHdxeAWRyu3TYM4AW5hvIO
         3/bgsVu/f5ItTGon9xMQ1Rrvxr4PI7bxDE1aF00Ao1iVtpMCQfoQgtToTK2sqcq5xjc0
         bS2rIArvgJCJrLOQFJOMGkMfMT0+WPr/esMK4aE68BmhZz7+Oh9oEvT1Ik9FBzyeIuMO
         TkB6HmBXf4S+3hAxfzkihU5JMJoGvwV9loqsobspP8zY/X+Yn//c5mz/oReb7NVyZEpV
         Z/jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776202874; x=1776807674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Q87q408S6kD03eCdhgkumlXWLlyzkrJl5PR3laXuXk=;
        b=Rt1g7YkPGXKBX1Dm7SfqyIMH7SoyRj5TmCTvKRYqL5wzKKKrSVxODkTpLA/+gHlYFa
         Rm0bDW00S9fbLNwCzyAhizcK2//7P+OXTzeEKfXrG0NExq+5s4+Nqo4c5pE3Z9A+O1W6
         LeOmRv2UGdSRAwLLp9jEs54ypRlvtt5HelKAGoxj8hbQKahnZAhMOhm7vtLFnfGAZ1TJ
         qwymb+BjC16DJmXhEism8M1zYvenwQl0agVnLFHMf7QTvY6xzECt14XIAZ/vyS+vuqz/
         q9/FT9GaCI3cdKKOQ2Av7I7pEQ8EfWqacNAPH+liSZW5uUKp6TT6yZEYYAAYMhb/8pk/
         bJvw==
X-Forwarded-Encrypted: i=1; AFNElJ85OJHDbXoEN+NY8EO5zpu62L5W3Qoiy7bn6VjDG6rAN+KmwqCK1KB8jrNQfgb3fbxW1NFjN+2c9d/v@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+L87/Q+51PzqFgF84meAA6NYZNNp0GWy2psRcG4a/JvG0e0cu
	7tbj+k04KBhzvjY8pxmSdaSiVBKglmDSmWVQF9SrfyViyAAwzDP2S2nGD6qXlG/U5BeziWTaGEE
	lvWi6hxs6/kub7DUTdNgGGGlP5FHFUQs2bYHY
X-Gm-Gg: AeBDiesC3ronqmvxaGHXw2epIoG3riuaiB6WnB/g0SGzhwtBkcj8DdaZ8Nv5uXY5w6F
	jxRs0sMNMm8PHUF9JOHZsMHG/gmtOtfkWCh36xndztigcE5xBm5wn2Ox7tMBUlb7Q6tpOxrB96C
	EySueBrIhRIaMVsT+OOTW0FtxLXBOCclj92Nd5kBYakTiXMe2LMj/KjySweUZ0KVglZyEchMUFJ
	U89+CjrWs6Yu8h1qWGoZHzk4jS3uzdqvQcAka4zE/agb/yO6wDoN7MHo1iqbdcnsnm3Y1V1vf9U
	Dk81hsn6CI5DsS/bPSlM8nCPwZ+lxwpHmYbO34AEf5fNIDZ09QFSjc6a/NzSlKHfqyMatAmb4kg
	g8g1ltt5UvM+rueNa22At8DS2bwlcorylet0pTwaSIxVXHyaHjgbVYKQ=
X-Received: by 2002:a05:6102:4b81:b0:605:5d09:8631 with SMTP id ada2fe7eead31-60a010583b2mr9353897137.29.1776202874377;
        Tue, 14 Apr 2026 14:41:14 -0700 (PDT)
Received: from ryac.ausil.us (207-179-239-100.mtco.net. [207.179.239.100])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-95691131afesm346899241.1.2026.04.14.14.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 14:41:14 -0700 (PDT)
X-Relaying-Domain: ausil.us
From: Dennis Gilmore <dennis@ausil.us>
To: 
Cc: Alexey Charkov <alchark@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Dennis Gilmore <dennis@ausil.us>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	FUKAUMI Naoki <naoki@radxa.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hsun Lai <i@chainsx.cn>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jimmy Hon <honyuenkwun@gmail.com>,
	John Clark <inindev@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Michael Riesch <michael.riesch@collabora.com>,
	Mykola Kvach <xakep.amatop@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peter Robinson <pbrobinson@gmail.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Robert Foss <rfoss@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v7 4/6] arm64: dts: rockchip: rk3588s-orangepi-5: rename PLDO regulator labels to match schematic
Date: Tue, 14 Apr 2026 16:40:55 -0500
Message-ID: <20260414214104.1363987-5-dennis@ausil.us>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260414214104.1363987-1-dennis@ausil.us>
References: <20260414214104.1363987-1-dennis@ausil.us>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Orange Pi 5, 5B and 5 Pro schematics label the RK806 PLDO outputs
using the pattern VCC_*_S0 / VCCA_*_S0 / VDDA_*_S0. Rename the base
dtsi regulator labels (and the es8388 supply references) to match:

  pldo-reg1: avcc_1v8_s0 -> vcc_1v8_s0
  pldo-reg2: vcc_1v8_s0  -> vcca_1v8_s0
  pldo-reg3: avdd_1v2_s0 -> vdda_1v2_s0
  pldo-reg4: vcc_3v3_s0  -> vcca_3v3_s0

Also update the saradc vref-supply reference to track the pldo-reg1
rename. No functional change.

Signed-off-by: Dennis Gilmore <dennis@ausil.us>
---
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi | 26 +++++++++----------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
index dafad29f9854..fd5c6a025cd1 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtsi
@@ -274,10 +274,10 @@ es8388: audio-codec@10 {
 		compatible = "everest,es8388", "everest,es8328";
 		reg = <0x10>;
 		clocks = <&cru I2S1_8CH_MCLKOUT>;
-		AVDD-supply = <&vcc_3v3_s0>;
-		DVDD-supply = <&vcc_1v8_s0>;
-		HPVDD-supply = <&vcc_3v3_s0>;
-		PVDD-supply = <&vcc_3v3_s0>;
+		AVDD-supply = <&vcca_3v3_s0>;
+		DVDD-supply = <&vcca_1v8_s0>;
+		HPVDD-supply = <&vcca_3v3_s0>;
+		PVDD-supply = <&vcca_3v3_s0>;
 		assigned-clocks = <&cru I2S1_8CH_MCLKOUT>;
 		assigned-clock-rates = <12288000>;
 		#sound-dai-cells = <0>;
@@ -441,7 +441,7 @@ &rknn_mmu_2 {
 };
 
 &saradc {
-	vref-supply = <&avcc_1v8_s0>;
+	vref-supply = <&vcc_1v8_s0>;
 	status = "okay";
 };
 
@@ -666,8 +666,8 @@ regulator-state-mem {
 				};
 			};
 
-			avcc_1v8_s0: pldo-reg1 {
-				regulator-name = "avcc_1v8_s0";
+			vcc_1v8_s0: pldo-reg1 {
+				regulator-name = "vcc_1v8_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1800000>;
@@ -678,8 +678,8 @@ regulator-state-mem {
 				};
 			};
 
-			vcc_1v8_s0: pldo-reg2 {
-				regulator-name = "vcc_1v8_s0";
+			vcca_1v8_s0: pldo-reg2 {
+				regulator-name = "vcca_1v8_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1800000>;
@@ -691,8 +691,8 @@ regulator-state-mem {
 				};
 			};
 
-			avdd_1v2_s0: pldo-reg3 {
-				regulator-name = "avdd_1v2_s0";
+			vdda_1v2_s0: pldo-reg3 {
+				regulator-name = "vdda_1v2_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <1200000>;
@@ -703,8 +703,8 @@ regulator-state-mem {
 				};
 			};
 
-			vcc_3v3_s0: pldo-reg4 {
-				regulator-name = "vcc_3v3_s0";
+			vcca_3v3_s0: pldo-reg4 {
+				regulator-name = "vcca_3v3_s0";
 				regulator-always-on;
 				regulator-boot-on;
 				regulator-min-microvolt = <3300000>;
-- 
2.53.0

