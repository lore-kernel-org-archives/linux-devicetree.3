Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EAC4E06C4
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 14:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790606356; cv=none; b=qeXGIXE28NQ2wzGM7UmIjDCM9rxr9uuroMAU+SscgNU2WqhurwvLCmpT/qkZZoM1RZvLdXqupWYCoeWLY+61bE+5q91nNTHQLHdEPoeq2JBUc/Yl5tcJ7hyGgO4kKQTO61TzalZhL5aHKOwwSIiQNMtH9f2Y1BddxeLv9+Ll49g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790606356; c=relaxed/simple;
	bh=NyT3bvkYhBzVis/qc4NVpDUc0HxiHbXcgKHaKLAMasY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RSo76N0Kk4hyFzWLZLkmnb1ZC7kIT4LV0y8N9r4Hy1ONRH6/dqadyBQpY/6N2o0KP8C5ayDG9GYWTQuDSfYiO3Cqch7XmjFM+G4jRv72nXhYqGMO6y5ChCAzE8TVDtlevNdUToWjLAESM2uS0er6HUgV9RHU2o0Y86LMxyoxcNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AS/c0Hwc; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AS/c0Hwc"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffe281cb1so11870105e9.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790606345; x=1791211145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=AS/c0Hwcv4zhiS8YBh/DQJy8jMGXEe63fvU5aHp6Js0OXeAz53SKfIQNgQHVgIBY5p
         wcBP3ainDjZcIz59Q6NixdldLaEtQ01p3y1V+LoUudmB1EOZqsYHOeYNN1B3zTTWgBKO
         VAslxMi7B4wjqtfU30f4+DwQ24XVqtTeH5PeT4nRQBmSRkO+VpU/eb1t1HrP9CYodrlm
         d3OWamAd+u0egWQ3HTv5maMLa3Rq193belfTaIjGKysz0GsWlIG8UaUtUIMioKrwO9di
         okGg0t7TbSFCUx6QhqUIs0jLEpS99uXDPEv9VjVFeYxWjqvEv8QiyjzJQA9e94wtnCD+
         3aLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606345; x=1791211145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=g7E/v81gy3w10uqFmD8OVnBLFWiQyXycTiep+MK8m9GDYjPiZAgWdxyrl1xSErJLWs
         wTp2RZq8WD2BsQW9UNvki0OH4W9sT6d5OGFRMoBVQqBYARcfdtNFqoPENAAKjJlbl4gz
         2kbdt3V46ZvpxAixHIbwilwwi3zIFNUsIeysHRdvGYAZ5frKZF4+d9TnAJgEAZO2X2Z0
         i/RqCBG2ZgduA0TQAiDROpbCk1d51VOsD0O1ZYq3S0Zatys0WG7sG3J/qDgiQ15hdslo
         B3CA6eC8S41LmHsqlmHHXq9gWxkZstX8hLApXgT9BF6/vaoDxPVhnpiIfwygw5draYDi
         kV9g==
X-Forwarded-Encrypted: i=1; AKwUvBzUXS5vavmxXY+jT1746ZXYCnDZArzW5yFf8Vz/klDZv+QDpVXkPRhfc6CfJwNGKjcd/QYwWa1mzJi1@vger.kernel.org
X-Gm-Message-State: AFuF++k+lQd8tiu/QBtsonZCn+GWzPCa8wcD1PVPTnadTJZl1/JAHj1Z
	c3Sp4R6cdIWnRdVhSFWqvYxjcQS27R3K180Sh/39Oggu/TIKoYGtrV24XqYxrtIOiEI=
X-Gm-Gg: AYBFou0s6HbWJD0plYt19uSzwzZ7lAYuMP+y/fBB256QwnCXsuWJ8UmujLvYLFdg25O
	j5w+gDnw59CJazYW7hifV1Ftsvsy/3lS/phURsoJA5XdUjhpTeffVFRoqOjkOCrg1o1EutASHJV
	kfe11HcDbD1QakMaaqTvFc4Jmno7KZpq1ITcvnum3oCBkgDa80tNlHGg67Q+UTqKXq46JesdoDl
	+tGpE8jn5QYq1Z1Bnq006K04NyvB5Z/eTUjhV0Kb6UkZ4L9Wokc4wAWhTmj6tzd2+fEj1zrRPk6
	1CtcqBMTx4xzJkKBqlrG4YtHIRJFcFaqSOAe6f57XuXEjLiod4we3fp3zpgkPKjxexO79OXFBti
	XZocP732FqmVU7K5n4EDkzNCaMogEG9/GokQMmmvIiy7bFe7QVOFcFY3vwnDP2KYNZs9Uz+lxog
	mVYAC9ZkpE1V76rTMUryQe8sBV59f62jYgBmnx1aCFQYCYOf2Q3jIScRbNtUWiUAunnT1Ylg==
X-Received: by 2002:a05:600c:8718:b0:49c:fc6c:be08 with SMTP id 5b1f17b1804b1-49ff06f8316mr163210765e9.31.1790606344550;
        Mon, 28 Sep 2026 07:39:04 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0018f0e79sm233409295e9.7.2026.09.28.07.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:39:04 -0700 (PDT)
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
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v10 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Mon, 28 Sep 2026 16:42:42 +0200
Message-ID: <ad9bc35d7c30f7925fed4c6621ed0f67c39c3f09.1790606188.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1790606188.git.andrea.porta@suse.com>
References: <cover.1790606188.git.andrea.porta@suse.com>
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

