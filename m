Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16383C4573
	for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 08:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776932861; cv=none; b=knebv51HPGzIhPUAYuKJbXvYwruwqivS5oxlK/gBAh+H2Wf7ye8W1Yp9kBLGsB1hoNokAnTzqec/9BHmTJZYVoxA1UqNqwWQ/DFCqXTxHPalduyE/K50NKHnlNkfk7pBjHPWLQKr+jnsWf/GhuNxNGfkhqnMHI5yDzBF0DVWzsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776932861; c=relaxed/simple;
	bh=fLM8M+exZKgQsFh5tdcGS1DmZreTyFRyr9bIXtCcplM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G85IK2JfzW9ioTi9D8cb0LF1jQZUDHEuyHNirgdcGBJxxA1SMaVjeHVGygRfNY1ahIeOG9FneO1pq3dOsFjpoqRLuP7sMJBRdoeAlgHZyJW1skDWJr4vO3bo/s0h92fKsqOWOV9dsbbQsEO7J095I5DZuG/P2zwFV/w+vmQD4Ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=HN4D0qJU; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="HN4D0qJU"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4891f625344so48062325e9.0
        for <devicetree@vger.kernel.org>; Thu, 23 Apr 2026 01:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1776932851; x=1777537651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUTaySjIgh6lfu9rWtVOEFr4avLmeO2LROURou8Y2uw=;
        b=HN4D0qJU1Vo2fsFKl+MMANnkIQ5Vs6TvZ2d7/BIT62H/KdDKJvulgIr6mhxvb41zDS
         34rMZSnpPeBtVd76tkJAgsBD2banAvk/WkGAfBsfVGMwqitwQkgkMrCEbiG13IPzd333
         MqQQ7XVwlQV5U93qSFrA/YQBdEsIY2FxfhnkrzcCQBpm1Er6J7sdgV5DClR+L6zRuqUc
         KIWtxNfMGfFs0NyeT32kL9Q1xsokneVUm4N8qqjTBNCNSV07Ass/CmXsTN0HlrPu8cKX
         AsofUdXPdoeBlBHVbY9Rpc1ISG/UxDYSA2fINgqQ8UmZVmsX51Mqh7HEm3fsWbqbOEaZ
         /kxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776932851; x=1777537651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aUTaySjIgh6lfu9rWtVOEFr4avLmeO2LROURou8Y2uw=;
        b=MNEo7nfpJxkNe9wRC6hYzdmsrZRYABUvFDDhArF8A3Ta2AWmFpl7RxskfvUpZFgNh2
         Emc1AAR0u2DLBgDwdfLddyOjTgNWOwaGLPTyMAWmfEZnBjTQCembr1IG6oAS4HKI6q2q
         vWv0g4DTef5pyYuhGGAp8+El7juy+IjwctAsgy9eUAK9LUKtGHFJhuWvGE4fJFMJwk6h
         gMSRQ4+Hl8J5LJO0Zqobf6Oi7P8RdsNX6cQ9wyqxaT9PKJfLuln6UxouDVm1g6e7wKVw
         dyBWPdMBSLMQdwNo7j9n3flMoGUhPtuGqScNv2pk0yGsCP7vnujOU3dgdtPnXOZTfr/W
         hm5w==
X-Forwarded-Encrypted: i=1; AFNElJ8KhyBwp3AkVwh0NfpPfeFX9hqady1+V1C3kzHuKpQ74Pk9tiSl9tzNpIdrCGDBpNM78uPcukbEacJQ@vger.kernel.org
X-Gm-Message-State: AOJu0YyN9ofXuGxxFdz61qlO4KbrdapRjGTjGIFRaMhqonJM7VtT1A92
	7ZxvvTJrLWXSrbj6bzS8WLxXQIOdOV//+SpKCCwi/kwswnCoPb90w7HLd4v1zfGxdtQ=
X-Gm-Gg: AeBDiet+tR3a/tIh2Xg0fSZJ7XSO9b2jGEMDP39NDQWsSZktw3G6A6BYhJ5JVbOnoTS
	m6rITdmoETDXa8e/ZtGTNZYHIMmbc5WC8ssssF2GugQ9VYu0aOzRGmmYDWWCULS6GPusqobS3fB
	nZtZ0vQcV431sF/uHYANaRH7GGFTHRIK+vzVsXoxJqumAuuOQmjEKCcgyOVtGmAZ8FG0C+MOfNM
	Imf7spSn+ZPHeNzrj9CJ3uGhAA4rKU3pdHASxocS0OPqrAVC6UfvDwHolnWqqt3bAn5UY2izeeO
	NUTWYTCiUeEs0PTFVblGSUfmTWixxL/K4l4yf6fwU9HC4SAHNp+pNaIEilr+IvRanJzHM+ZfcP4
	pLSNzc486O+joFptywdhQfQ5xNkafuNqaRJVGYGeRi9Ggdl353xtJfbYsSKY6mz35pJU2RxDml9
	xLVgkjYgDJzEovDYtXjMNAQnpdv4jgmowR+hmUPrRQcqBiWruHpdsikRCzHza17d6ftfQBPHzgb
	1sKbX8=
X-Received: by 2002:a05:600c:691:b0:488:9ec1:4976 with SMTP id 5b1f17b1804b1-488fb88b81emr223263245e9.8.1776932851294;
        Thu, 23 Apr 2026 01:27:31 -0700 (PDT)
Received: from localhost (host-79-33-140-232.retail.telecomitalia.it. [79.33.140.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb135asm55901924f8f.6.2026.04.23.01.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 01:27:31 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com
Subject: [PATCH v3 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Thu, 23 Apr 2026 10:30:21 +0200
Message-ID: <d6af30e0d72b2df2a0b640d413314a9377cfb226.1776932336.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1776932336.git.andrea.porta@suse.com>
References: <cover.1776932336.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stanimir Varbanov <svarbanov@suse.de>

The RP1 chipset used on the Raspberry Pi 5 features an integrated
PWM controller to drive the cooling fan.

Add the corresponding DT node for this PWM controller.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 12 ++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi     | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 2856082814462..a4e5ba23bf536 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -64,12 +64,24 @@ phy1: ethernet-phy@1 {
 };
 
 &rp1_gpio {
+	fan_pwm_default_state: fan-pwm-default-state {
+		function = "pwm1";
+		pins = "gpio45";
+		bias-pull-down;
+	};
+
 	usb_vbus_default_state: usb-vbus-default-state {
 		function = "vbus1";
 		groups = "vbus1";
 	};
 };
 
+&rp1_pwm {
+	pinctrl-0 = <&fan_pwm_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &rp1_usb0 {
 	pinctrl-0 = <&usb_vbus_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 5a815c3797945..d0f4d6be75500 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -26,6 +26,16 @@ rp1_clocks: clocks@40018000 {
 				       <200000000>;  // RP1_CLK_SYS
 	};
 
+	rp1_pwm: pwm@4009c000 {
+		compatible = "raspberrypi,rp1-pwm";
+		reg = <0x00 0x4009c000  0x0 0x100>;
+		clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clock-rates = <50000000>;
+		#pwm-cells = <3>;
+		status = "disabled";
+	};
+
 	rp1_gpio: pinctrl@400d0000 {
 		compatible = "raspberrypi,rp1-gpio";
 		reg = <0x00 0x400d0000  0x0 0xc000>,
-- 
2.35.3

