Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D206149EC46
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 21:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789678970; cv=none; b=J2QzFu2fv38sq+Yqu7wAiJoq9htKcsTtR1TrmkTjF/XJ8y7yNuXPg4xk6Q+d/bHC+u+Tm94ouckBOLvWWCJoDlj4tR6Ntt5fGnWpRtu3rB02sxWTddoxBXfN5aFiNRyOIxK7xvFWSBq273sJkNTeKQv8oOX5Qf6HFo485PtUy1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789678970; c=relaxed/simple;
	bh=TZWXiYpGe3PgSXyHXeQpQDxriAYLZIkbRgm507qkSqQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J4bXhCWvLatRYyXvxB5v/Xe5SPWFzr0Kdcslt/FIefW9hdMc4wLEA++XgYDy+IRgsnnR9WUTelGHVB5c0u5qeNZyRRqsT1K2yTrNWbHq7p5iLW3HK/IGDcpX/clIrpD52suwvFrcKb15AMa5UJjP1s8YrhQLXfaePUJlk6I4E9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lGuRQtB8; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lGuRQtB8"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ce364488dso235165e9.0
        for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 14:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789678966; x=1790283766; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OrTs8R98RYpxja2qfNL5l+wSlcq0HfU9S2hHFoYZzL8=;
        b=lGuRQtB8bziadpmIUSknGxFc4zk/X7BMDPdxDRipeKfokNmsuroEBXw0PrqR/KLUKg
         wYU1fpPykgfoskWZ70dRDdRasd1OgfbZGkSEvkD/vMcnUQ0rPVxWzCakcyZBbm4V3KVi
         9PGZCPOd8J8hFivbEcAdh8zz6FWPoAGh8X+y0YbesOSdWbepxRQyehE3JHkTvpvLEgBW
         MVkkyiGWvp3/OwMGpptzU+ax88S+jug6Mp8uBGMfYmU9lma3BlZ64H8A5mOYnN0XpvJA
         9c7Qz3vkji9bA8IbQ433sHfyEBwZ99+wh62N4K8wYchAHVzP0vG71z+C6kWMp4VKwTwn
         3gAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678966; x=1790283766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OrTs8R98RYpxja2qfNL5l+wSlcq0HfU9S2hHFoYZzL8=;
        b=NeW5BbEK8aCDvXnb2IXO8++NLeoXi3lTFJM2JP0FdS7DJN5BK00L3+OIhufSjeM/Da
         S0dOwtx6jsSmdzmI6mntDTs7BWVbpTXMQfvzA1p085csFGlZXxHap/F+7BnBcfEzI0DK
         miH65lZStmtRNn5Rzz8c8UXC2memqCWtYp7XQDYtSIj/NVx2g+pg85q3aLOxPQfnlkz9
         VtXMr5XLQICwwnpDZtx/KkaTiGqQAoX3S3dyIHGOQaCOLgzroo4lsziCHZhYxL2cNWqB
         mm5pqnhKiuUMX15LfkTQKYUAUbZIHZMBlzY9aX4Pw13HSz49LWYW8+FKJ732f1YTxvJe
         1rKw==
X-Forwarded-Encrypted: i=1; AKwUvBxrlQOPXhgZn8PMqGSh3Tl9r2ue/0N1FcgcTWeBXTnfun4ISoeGzdIM7cXtkNuizIaLMV6k8ihUUdGK@vger.kernel.org
X-Gm-Message-State: AFuF++kDxVozioIXLDzDxQaOsYaVqcfcmxxZxinWWMEGFBxqYd4rkj5x
	4WwPY3+r6UfNxw+YswL95/vDjKp0SQEORE8E+uV+sNRI7oKFkwBp3jlR4ljCtAJhbPk=
X-Gm-Gg: AYBFou260l79rSi4xPlHJHgz8BbhWREPEQX8gWfQfxYkaNn7vHu57ylDJF8zRBOVa7h
	2IVnE6UenRACZx3kmLEv/2QxyLSDW+NYtP3xjqSzm87/GVgWp/j2rGtM+piQ8JehTCtYlVhjGBY
	kvqzHG7jsTSeccc1ADbPq/Ajl+3u69s8Oq+gqP8QrrgZilDfZe8XH14dpINzT+riwFzfhmP/Jhq
	Bvuq0njomXbe+4tbBkRRpJl7EqWWAz3rLiRjGRr4Qt7rR2ZuG7mmcyrsdLd84WyWWwIoe3MymTY
	UYL6gIhb5NhlOO1lPYz/qIFL1BHNm71bOBDVL82m9ALKTapwHQB0kW5gsQhWynYLMh2WrfMCDel
	gZPRglwKDaVU52zKy3gezB5KNGRXBk9rxq4lgTAMJnmKAqZdKDCihrv4VlFSsEkvQZTQzWT8AKZ
	z+5RwoZTe634Lsg+pidjt5s0k2qo+CqdjX+1bYD3vwDKptKgGqo3DaJgNcEbBDgMgHnXEjkLWJt
	hgA
X-Received: by 2002:a05:600c:1d06:b0:49e:8222:3451 with SMTP id 5b1f17b1804b1-49fc5001358mr4202515e9.14.1789678966047;
        Thu, 17 Sep 2026 14:02:46 -0700 (PDT)
Received: from [127.0.1.1] ([151.42.87.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5755c40sm3106095e9.3.2026.09.17.14.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:02:45 -0700 (PDT)
From: Valerio Setti <vsetti@baylibre.com>
Date: Thu, 17 Sep 2026 23:02:36 +0200
Subject: [PATCH v2 6/6] arm64: dts: amlogic: gx: add AUDIN node
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-audin-v2-6-38de4bc1de34@baylibre.com>
References: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
In-Reply-To: <20260917-audin-v2-0-38de4bc1de34@baylibre.com>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Valerio Setti <vsetti@baylibre.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3080; i=vsetti@baylibre.com;
 h=from:subject:message-id; bh=TZWXiYpGe3PgSXyHXeQpQDxriAYLZIkbRgm507qkSqQ=;
 b=owGbwMvMwCV2z3ty7kUrRgbG02pJDFlrQvNmvF8unFH9eH6EzySORvUZecWKr2zfpoin7n3IZ
 Pr0cfujjlIWBjEuBlkxRRaW6fd+F5SqPTROOFkAM4eVCWQIAxenAExkUTIjw8en9zJ2svh/+rbU
 ff5ZllW67KenBohvO8zx3b2e5fi9Un6G/9GnGbPtczkErYJuBjNXp/QLT67Xi2s6cP1A6E+3vFf
 OrAA=
X-Developer-Key: i=vsetti@baylibre.com; a=openpgp;
 fpr=0497DEFB707526E13360C970DE4B936DD13A0100

AUDIN provides audio input support to Amlogic Meson GXBB/GXL platforms.

What's missing after this to get capture support working is to connect a
capture capable codec to the SoC. For example to test these changes an
NXP SGTL5000 chip has been connected to an OdroidC2 (Meson GXBB) board
using a custom hat board.

The following additions/overlay are required on top of
'amlogic/meson-gxbb-odroidc2.dts' to make that hat board to work:

    &sound {
            audio-routing = "AUDIN I2S Formatter", "AIU I2S Encoder Capture";

            dai-link-1 {
                    codec-1 {
                            sound-dai = <&sgtl5000>;
                    };
            };

            dai-link-3 {
                    sound-dai = <&audin 0>;
            };
    };

    &audin {
            status = "okay";
    };

Then, from userspace:

    $ amixer sset 'AUDIN FIFO0 SRC SEL' 'I2S'
    $ arecord -l  # find the "FIFO Capture" device
    $ arecord -D hw:0,<N> -f S16_LE -r 48000 -c 2 /tmp/in.wav

Signed-off-by: Valerio Setti <vsetti@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gx.dtsi   | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-gxl.dtsi  | 6 ++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
index c1d8e81d95cb..54b6cc0bb8ff 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gx.dtsi
@@ -436,6 +436,15 @@ watchdog@98d0 {
 				reg = <0x0 0x098d0 0x0 0x10>;
 				clocks = <&xtal>;
 			};
+
+			audin: audio-controller@a000 {
+				compatible = "amlogic,gx-audin";
+				reg = <0x0 0xa000 0x0 0x148>;
+				interrupts = <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>;
+				sound-name-prefix = "AUDIN";
+				#sound-dai-cells = <1>;
+				status = "disabled";
+			};
 		};
 
 		gic: interrupt-controller@c4301000 {
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index a9c830a570cc..7ad69992a226 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -84,6 +84,12 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,gxbb-audin", "amlogic,gx-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
 &aobus {
 	pinctrl_aobus: pinctrl@14 {
 		compatible = "amlogic,meson-gxbb-aobus-pinctrl";
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
index d5e0f72892f8..9181eba81eb7 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxl.dtsi
@@ -100,6 +100,12 @@ &aiu {
 	resets = <&reset RESET_AIU>;
 };
 
+&audin {
+	compatible = "amlogic,gxl-audin", "amlogic,gx-audin";
+	clocks = <&clkc CLKID_I2S_SPDIF>;
+	resets = <&reset RESET_AUDIN>;
+};
+
 &apb {
 	usb2_phy0: phy@78000 {
 		compatible = "amlogic,meson-gxl-usb2-phy";

-- 
2.47.3

