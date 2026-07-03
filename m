Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B4330C15B
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 17:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783098132; cv=none; b=Le14T/eODzo6QvvR/f4qvquhSPG1wUhOyIrkkho5MZnpQ+LIlplDc9/Au70Y9ydTVEen7ZVcubtXzjp+UHrPN63AkRrPD0aanbaK3UsC2o+XtFb7kcm/V4qGJGdae3724uTyHyH8GV2nqO1PbuVahk2sV5scs9pj1Z+fdLS/nNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783098132; c=relaxed/simple;
	bh=NyT3bvkYhBzVis/qc4NVpDUc0HxiHbXcgKHaKLAMasY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LHocyyAYFSHifcrjAAEhCLFMzgpRePEo1AbsyIt9ix8xKblqJV/BfhS5xwTctIiY0VK4tCNbZkYIPg3Ihyhwh/UyQVOskPQwJA2n49CftlAJsIrOU89e7YqxiXDGHRCyKMZ+NfG7JhoSZ6yBY/0ayzfMplcARoUn7L+B9rLjq2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=SrIT9wos; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="SrIT9wos"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so4256805e9.0
        for <devicetree@vger.kernel.org>; Fri, 03 Jul 2026 10:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783098129; x=1783702929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=SrIT9woscH72pWMFOd2U7HIlNZGqY9utg3/f0SLrqxePz2tAIqPZ5Be1TwmVrNcKb4
         QRJyf5Bw/rsY3OeZbZ/AhgqLQ4d/I6DIaDVzHGciHFwfgWwGg2hxCz0zCGNG2Pc1ZLYy
         OR8tPoYyekzvHjhf5TR8CEy5jbqf7ZK3I9on6z02f0Bn/69updId2LdYpti2wFMJ/heV
         WM3nmvje+QQ0dUQy9W03RvMsk3NC6rPFCaTXY/5LWRAUuANsCnWYIw9YylQd09jZMWr0
         ABvne6NlypDWDj6jBhf+vTSZqj6JkmE5u9dwOHXppVOJ3E1ELMnpOIXSdPLEuDLD+B52
         YWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783098129; x=1783702929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=ePJlxHvQbwf1xLyvlqmJyLCYhVzJo2zMjv/jRFuOauhMZZzmbUJ/l8WESr4UDfzKuB
         PMzauKWCrgKBBYWOr46hrgpLlkLdOzQ+1v1PV3bAyWUfjEWyRNc7ZyhF2uKrCKuHaWVC
         DfA82FtcJmXw8uOFEAEO/yTrYyN9nnF8uzcxGTxr86fLw+LMCSZjwaGYlD+v9f4v0rcg
         fYJxxYbx5jEUzinDL0WYXIu9ndhgZZZy+J3KDfT/cnc/2V2s6UwKdIXJVvLqmHHC9cJm
         d4vceZtevsiQ42PwNKRL9EPLHQRaVr0WF716Ush7tQ6FRq4c+c1NCHBR91yDZJUWifgE
         J0YA==
X-Forwarded-Encrypted: i=1; AFNElJ9xNcq1Aq13vRAVAo7kPurdaVp5U7s0jFs15PpMjqRtlSrOC3BupzEvf2wgyC+Jy63VQSwWTpY4nT4d@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx2BSvn3a5gNPNlrjo64SHaGB06GYXjOIUDTjsBTeXG1BizG1f
	BZQePM7YBCBy6hyM4oKOKRPg4l992FfurlR2kl1asxmBqXf4lJgLLr3Lv3z6T73Ii4Y=
X-Gm-Gg: AfdE7ckzls1oT9Z+Q02+seY0NYzewq6dEIp7lKS4NQJNpbZx9g/VQG649xZ/GL00JWx
	Xlku0FfwOhvqdSpnNNe6IkYv8ozWgWIzzcAXuU+wup2dvdvaLNi7LiU4TQ8dDANAvuf12eDJ32/
	md0+f/TAZNgKvJB1ps72umuJ9BLCeWnstgz6z/zmqgIYGYbt17EO+GtdCLbIXkEWIAA9Cp2Ize4
	ucS5HNlbpRssIqDgAHr3KrMR8OSBEEzmO206gizqGmMqBTIn5SGX+cmNF7n86nCxdASsUYC8Uaa
	K0xPtw9IQa5kqkppDAdCTYhXalcbCkCOuzbqyAl4B0SsjUX3vNd9Mj2K4SCC5XsZeQdYa8A82AI
	91ww4vs1Uyp4KJfxLzcrB0Yx5J7ynPVP1gkwZkFg47W19mWVS5X25HryEBr9bkb6TDjrxoFbrxj
	w63uZvfEn2Yy8=
X-Received: by 2002:a05:600c:358b:b0:492:3da4:81ef with SMTP id 5b1f17b1804b1-493d11f13d7mr1621605e9.18.1783098129262;
        Fri, 03 Jul 2026 10:02:09 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c63ba971sm225754325e9.13.2026.07.03.10.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 10:02:08 -0700 (PDT)
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
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v6 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Fri,  3 Jul 2026 19:05:26 +0200
Message-ID: <300b6fb4ba2c9399297b4bd85cbb3bc14f08f6b7.1783097764.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1783097764.git.andrea.porta@suse.com>
References: <cover.1783097764.git.andrea.porta@suse.com>
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
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi     |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 0fc57e72632ed..748be8f1ee9e2 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -64,6 +64,12 @@ phy1: ethernet-phy@1 {
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
@@ -94,6 +100,12 @@ &rp1_i2c6 {
 	pinctrl-names = "default";
 };
 
+&rp1_pwm1 {
+	pinctrl-0 = <&fan_pwm_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &rp1_usb0 {
 	pinctrl-0 = <&usb_vbus_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 16f5359395835..df4c2d09c8d34 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -99,7 +99,16 @@ rp1_i2c6: i2c@40088000 {
 		clocks = <&rp1_clocks RP1_CLK_SYS>;
 		i2c-scl-rising-time-ns = <65>;
 		i2c-scl-falling-time-ns = <100>;
+		status = "disabled";
+	};
 
+	rp1_pwm1: pwm@4009c000 {
+		compatible = "raspberrypi,rp1-pwm";
+		reg = <0x00 0x4009c000  0x0 0x100>;
+		clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clock-rates = <50000000>;
+		#pwm-cells = <3>;
 		status = "disabled";
 	};
 
-- 
2.35.3

