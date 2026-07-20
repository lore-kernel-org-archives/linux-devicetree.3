Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC203DDB0C
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 09:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784540450; cv=none; b=VNhEfrsCTVsB4p0lA4JbdqcIhHZyrm34zuWX8Fj2CfNC8lJa0M+/zWCcvgqXbWOTi59MhRZQ3g28iABXmeRPI1mW9zH/lrhYeR6dZtLBcwmnI0AdB1tLqtIv5Ynj8CLDiU+wXgat8lXsg1y5h/MnQmMAD3LPldZL/p13AxAqFoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784540450; c=relaxed/simple;
	bh=NyT3bvkYhBzVis/qc4NVpDUc0HxiHbXcgKHaKLAMasY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cW6cLZSkpSxXDWPtNGFwsTfJRetXSUVaaQMTComMsC70zVVN7Iv2p+5d6y6SoA4ttOmlGN0YSlxAVHz7VJUbk8WrBpgBh5xUp5u2K5YzdpX6jFrBsX8FMvr+xRVJJvYPWxVihpzlaCi2PAo8geNOych0JlKe5eHrafe7R0Uttyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=gQ0GVw+9; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="gQ0GVw+9"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47de0093c42so5235932f8f.3
        for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 02:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784540447; x=1785145247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=gQ0GVw+9aeiCLEc/xn7mjbxpXod6nRbcnq30cKc33EplLBIKQj4qDjbifW5hxN0/e/
         hbSh3ZXLxggW8GdkgwvIfT5ckWZ4UKph5fj/JfWRh+zLEGuSYtgbf5WFyxLOB87k3n03
         JKNNMo87n0Gjeburunx0rr8fvZuFicbeh5i2gCBR59cgs6ijKENejCh4vWongWwnPaM0
         l09FdMAGGKk9jt4pyILf/dpW7D9sKuiBt7NKRmibrSNc738ulyrtwERz336fvqFKo1Ox
         XVRoq5CcvGc5cNsaPaNDlVBl0bUNvQxAQs+ujt8h8KK9V3vBWxEP1WFVVstjeQfYMq8X
         coUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784540447; x=1785145247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=NC8QjJu8AzcmNH1dWFASLX6Ute3e2Scw6QqdKgrmYx1ANo1Qi4ciAl0E2FQH9mSgkz
         8ubEAV7cZH7fPfUWatDqNDBWdqYP2E4Hx6aeR4jO3cDkBPx9I5WoYfE7Fo1btR7Qj4b1
         3dgcv77Lu2eGwryR/vy4ZaMoqHjLo8h2se3JHApTth3EYHvIUfL2O0VVBfw7ocegplLb
         ixDfkXKKCg1DHf1s+l2ZdhoPKkRZJeYuH4w+SxIaUQ/FT3nndxeXx/l7TU+1/IB2/Gam
         lEEu3fu2niC4Q7jwE2ZyZvjn/HDsla2f/W9rCwZQCuCGByovPPJFq9L9CPBOAh+Hwtjs
         mPkg==
X-Forwarded-Encrypted: i=1; AHgh+Rpq+hwFtKOW5YTFD9HY6/lS/3jaC3qtp0u56w+KKU810Fcdf9aoZyxKvEUlI73pEViMe1SxJC78MZ0S@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjfp7yNdCaeuEmYrp7oP6tN4zolzwQ3m2pZuQTMX+Ri25lsq80
	T0ooMjfSs7BEHD3LnMVvQXOe+cCab3VyOLTXSCHiIJitXOarumQSHDU51Jqyq4PCTrA=
X-Gm-Gg: AR+sD112Tqngys3Jx+rZ1hsiWmqbunsMaSgNuuJFwCgpaLuZrznOBakv0SPbrFQpVIG
	jlW7JYysY6eCiyENsNe2nw10hJGs3a0PkUKHpYePqQF8jVg+kueOxkPx1BlAbwS+PlaVMmaB0es
	sLABzuSO268HY5S28hlYJJXyVmU4XlTVw6SO6Fzg8DJAfU7aFYwwkrOWpjCAh9Qiit9s1gElJoe
	txUzBi+a1zk3E0Hz8xoEkZPGE/PP7uIQr0e46ngQ5g34htvB7+GuaNjT6D9xtKsRpJjGi8HctSb
	PtZzAc/kogqPnATlgDP9ziwoFtDQsf6imyhbjTxXJq+7rqsJ/+3g+wIMznifZz0D5UP7n3o5xe7
	l7wsyiDmZ8ey+zk5qAKkxdxCQUuIjvkfTFeAr73WyoWVUXVsUCpJ7cMw2Ikt8W6TLrBTCg3MaeY
	FcY+DFPy8czaA=
X-Received: by 2002:a5d:64c6:0:b0:47f:7a15:dc4 with SMTP id ffacd0b85a97d-47f7a150fb1mr2150322f8f.23.1784540446582;
        Mon, 20 Jul 2026 02:40:46 -0700 (PDT)
Received: from localhost ([195.94.145.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63eea8afsm29707819f8f.33.2026.07.20.02.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:40:46 -0700 (PDT)
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
Subject: [PATCH v7 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Mon, 20 Jul 2026 11:44:07 +0200
Message-ID: <895152a8a7b541279519392b5e7983a861a7bd13.1784539788.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1784539788.git.andrea.porta@suse.com>
References: <cover.1784539788.git.andrea.porta@suse.com>
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

