Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B295D241CB7
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 02:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783047425; cv=none; b=TvSjdagjGb80Vz+MmdY/HmRpehu7FY1Z1d4HLpIO4624dpMdhkWvB4F5+NWa7UP2bnWmWVwwCqA0Smkbl9Jwcl9a4oZmVCYw5Idkm/pw/eN8c/mpO/nK0du+ugukDyTdXAGDcZ5+8IKjObAMuiWs/Ngmad9aQOcc0J/jlqy727Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783047425; c=relaxed/simple;
	bh=IsERjZASmoVoV1lYOdhQ8tqxvr21ky0zobJZ277IM2A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=L9nQQEoHaXNBz6V1dWECBSKC3B86Z2w4npOW5RxLEEcdjf5JKkdLrnLx8TaYWaAOoQkT/1237mFnNev1IGrY8aZQu1xxcqjkqgN99H9cYE06csiwTRPnQIPAXR7zSqV8JyX8xWyf4XtsTnDbzd8IwaQdbhYsmvMugVzkEp5IHQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBS5G8Ci; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBS5G8Ci"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c95d0a54ea5so71510a12.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 19:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783047423; x=1783652223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JlV3zJ5RwhKne2jUh8CcjrZlF2RdUTEpohrGS1TCb5w=;
        b=RBS5G8CillKqu/Cpoawv+Lt+EExiFWvpLQqd9w7AkzDXUcYPw2ON4uBj1+Gw4QTv+D
         FYkSWTJoncNVo1EQupI2P47mEdk03XpiHX5aOWpmRJbsVMImOD11l7j5VGmPoR2fc3/+
         ShfdlpYm46TruxBMoaDQJr1MYmyZErKcXdte7L7VObvNo0n9PcNPBR2TR+oSAsqn+bOq
         xGnmtYR7p2RdPoaaRLOik7Liyog3mysD50uO5lsj8PdWf/QDh42fWPDhgYhMW7oTGhJx
         HYTJB1GqgBF5rcvA/5JtQdEgBRjrH3G26brkNRSucceDN/Gs6RCK64ys5mbPyr/nO4yl
         JpxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783047423; x=1783652223;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JlV3zJ5RwhKne2jUh8CcjrZlF2RdUTEpohrGS1TCb5w=;
        b=TwdR2URHNotxecCZSufDD2O0MHLyjWt05l1Rwpg5+0onVq6pDsDwptl884Pb5m09so
         uhPrB1+2ly6Et48ryUy5WzW09LiF34P/mEoG5D5gkJbijUXUqk4kgXkbGDuJAZSOGcW5
         vHjIWpvWSttYOtz5+6E5rWhVhXl8ynbw87AIR6/aAtqKp8TAx2G3rjPOU7nGRT1hckES
         AimTri/Xqkdczyei2W2L/2xAz4r91P4UJ5wkeMCuPuxeGZTX2Rl7+xtN6k3eiUXhjP/s
         2Gtwyzlf4+DqwkMzMk37u59qcd2HT7bLEMVKi6VqR40Dvh6N7HoVmmqd3GMo8UxYB7gZ
         905Q==
X-Forwarded-Encrypted: i=1; AFNElJ+C7HGTIYTUZzqS5BpzWnMfffpvwPM5UWOsSUliu9pSYRlhfDFaG7Z589mFi6QWKTUy4JHrqMXbW9Tf@vger.kernel.org
X-Gm-Message-State: AOJu0YxejbFrkAxPTleijPyBLW4LArpLU++n5fioJn6eAnmuLtT8mFPi
	tqG2dUG9Q342QJ6Q7/D4eITkBpbs1Oo08OVT3KB5g0fTuvRnVTVnstvv
X-Gm-Gg: AfdE7cl4MsMFUn1xhkmPv/ZkAzs3QkUXbwSdlURnptgX6qNd8N/s3JUdW/DJj8zsb3K
	6qsJbKPSDOl1LiSGI9KvL/2ud3oDxqJ8eGuO+h0WrFYkDzU5/dIniUhM67l4uGykWNRkVVqb3cL
	+IoNqRxeI9xwL0f3qzO5+f0fSsUwMKTR5h6BnOGFwcSv5txDyly0kdGMKmJPBy1URnGrUDD33nE
	a7GbHA6I18v2WXSpj/ngOs7YTyNF3fnUnA7tRkie6FtWwfEoz7pdFI+xRLPYgijdQ7axuGWQuZf
	tTbrGIxDmKUwrZT9L2cvqYbfr1K3b+zJITLkJ1t8cwzTpwShQKnD7s9vRBSjheYgUIfgkzIuG5n
	t80sDbd6mV8MLIONFKynetaDXfAM7pG+OYt3/qCzIMgkNJLaiOA6V4zWi11ib6TH2m6Q4E3Nnoc
	gculDQIrl+2JzpBTZlmf4NBcfGVk9mPeQntehgA54dyj2WKwn68ah7v0p9D+k=
X-Received: by 2002:a05:6a21:4516:b0:398:9379:d04d with SMTP id adf61e73a8af0-3bfed22ecacmr9856159637.24.1783047422829;
        Thu, 02 Jul 2026 19:57:02 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:1b3:a800:5116:5334:8739:4661:fde2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa65asm14645620c88.6.2026.07.02.19.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:57:02 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Fabio Estevam <festevam@nabladev.com>,
	stable@vger.kernel.org
Subject: [PATCH] arm64: dts: rockchip: Fix rk3588s-roc-pc audio description
Date: Thu,  2 Jul 2026 23:56:48 -0300
Message-ID: <20260703025648.180135-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

The rk3588s-roc-pc ES8388 codec is connected to the i2s0_8ch audio
interface.  Use the matching I2S0 MCLK output for the codec clock
instead of I2S1.

Using the I2S1 MCLK can leave the ALSA PCM running while the codec has
no usable master clock for the active audio path, resulting in silent
headphone output.

Also make the CPU DAI provide bitclock and frame clock.  This matches
the active Rockchip I2S controller side and avoids relying on the codec
to drive the bus clocks.

Route the headphone output to LOUT2 and ROUT2, matching the old 5.10
BSP device tree.  LOUT1 and ROUT1 are used for the speaker route there,
so using them for the headphone widget can leave the headphone jack
silent even while the ALSA path is active.

The old BSP also used hp-con-gpio on GPIO1_A4.  Model that GPIO as a
simple audio amplifier so DAPM enables the headphone connection when the
headphone path is active.

Cc: stable@vger.kernel.org
Fixes: 7f9509791507 ("arm64: dts: rockchip: add DTs for Firefly ROC-RK3588S-PC")
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
 .../boot/dts/rockchip/rk3588s-roc-pc.dts      | 23 +++++++++++++------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
index d534d662c40f..99853880aaac 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
@@ -23,16 +23,19 @@ analog-sound {
 		compatible = "simple-audio-card";
 		pinctrl-names = "default";
 		pinctrl-0 = <&hp_detect>;
+		simple-audio-card,aux-devs = <&headphones_amp>;
 		simple-audio-card,name = "rockchip,es8388";
-		simple-audio-card,bitclock-master = <&masterdai>;
+		simple-audio-card,bitclock-master = <&cpudai>;
 		simple-audio-card,format = "i2s";
-		simple-audio-card,frame-master = <&masterdai>;
+		simple-audio-card,frame-master = <&cpudai>;
 		simple-audio-card,hp-det-gpios = <&gpio1 RK_PA6 GPIO_ACTIVE_LOW>;
 		simple-audio-card,mclk-fs = <256>;
 		simple-audio-card,pin-switches = "Headphones";
 		simple-audio-card,routing =
-			"Headphones", "LOUT1",
-			"Headphones", "ROUT1",
+			"Headphones", "Headphone Amp OUTL",
+			"Headphones", "Headphone Amp OUTR",
+			"Headphone Amp INL", "LOUT2",
+			"Headphone Amp INR", "ROUT2",
 			"LINPUT1", "Microphone Jack",
 			"RINPUT1", "Microphone Jack",
 			"LINPUT2", "Onboard Microphone",
@@ -47,11 +50,17 @@ masterdai: simple-audio-card,codec {
 			system-clock-frequency = <12288000>;
 		};
 
-		simple-audio-card,cpu {
+		cpudai: simple-audio-card,cpu {
 			sound-dai = <&i2s0_8ch>;
 		};
 	};
 
+	headphones_amp: audio-amplifier-headphones {
+		compatible = "simple-audio-amplifier";
+		enable-gpios = <&gpio1 RK_PA4 GPIO_ACTIVE_HIGH>;
+		sound-name-prefix = "Headphone Amp";
+	};
+
 	chosen {
 		stdout-path = "serial2:1500000n8";
 	};
@@ -327,12 +336,12 @@ &i2c3 {
 	es8388: audio-codec@11 {
 		compatible = "everest,es8388", "everest,es8328";
 		reg = <0x11>;
-		clocks = <&cru I2S1_8CH_MCLKOUT>;
+		clocks = <&cru I2S0_8CH_MCLKOUT>;
 		AVDD-supply = <&vcc_3v3_s0>;
 		DVDD-supply = <&vcc_1v8_s0>;
 		HPVDD-supply = <&vcc_3v3_s0>;
 		PVDD-supply = <&vcc_3v3_s0>;
-		assigned-clocks = <&cru I2S1_8CH_MCLKOUT>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
 		assigned-clock-rates = <12288000>;
 		#sound-dai-cells = <0>;
 	};
-- 
2.43.0

