Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB0C41B8F2
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 09:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725334; cv=none; b=LpTCSNJXjDaexmyKq1Sg28gtv0tc6hItJ/Cp0LHFWJgQMjWFYQPO+m0FwKc626XkcqZMxDXvBakQ2G0R65rA317chyAVkEtaZMLxNxi9X4hjdKCTz1MhsfmciE5q3nYAO8tDvHkQf+ZVa9owzSuhDj/fenNYMiBgor7j/cZBMl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725334; c=relaxed/simple;
	bh=NyT3bvkYhBzVis/qc4NVpDUc0HxiHbXcgKHaKLAMasY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=thMrrHkJqKygE2MLT5p/Hy+Futj31SwSCvQU7tl9sLo/sf8QxqqXsvld6CWQiS2LLjf5zYp5PhHTIuJYqjnYnChLpuerLVvmE5VAB8YMtZS2plqqSBiKfVZrkbShZTNSdHUoZFk3xiEW9QnvR3vy1x3BxM0oHQ2vaaPa5YvUZus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ICB15+dM; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ICB15+dM"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-485984ebf5cso405799f8f.0
        for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 02:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789725329; x=1790330129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=ICB15+dMW8qgOThkSxsnuoekJONG4TpcpLrrqabzQyhY67+KGirTMj/xyuTKbsvmzw
         2nTT666mqYUWivLtnqIBiKk1mjVqs8hKYmvokDAC30ww7stroOIETdV5mekvKP6e2Enk
         J6HGGwP1z5xuJXqPlEOutMW4z6hSSY+5vNsufn4lfPHDZsRm7nWtW4WYA/q5t8XpxxFX
         9dQUo1tqOzEsoXlEfM65y7QECASTu+h9gafAHHlhjxGspKDu9rl+FxxBstwwWL30L1X8
         iJ4gjx+ejLTGp0qZjLL+IUOb43z92KTTCjXPAnAB+Arqo0rvJ6Y8xu5Vst9RtMO7cnDI
         fgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725329; x=1790330129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=G2u5RTG32FFkZ4kQrCjJZWlBF0i+PMS/Ypvg4bsgw2ttLvOturjjX8Qzy/lGTEjqxK
         bw7ewJovI2WfHAKC9lK5HiimeFqfyJpTfg/uBjLn4zfjnDc/PWxRrVbgWQepCaP7XK0t
         LNDkiBsjBs7Kwvy5SJneOcu+OtBBa/q/cX/YVOgRTiAsdtuxHLl9YW7+wtS172z7F6L3
         jICgEQIuHzWTASAqjHoMcHck3FmSqKKy1vt7VSp+xgl0+/oIYikhMa8oo+SmSU8886l7
         cXJtq9iJNdwsosf3ZlpL98qdF6SbiDCoZVAe6S6L7g2MW+DEWKhFasvFbPnbHo7zl8Q+
         iF6w==
X-Forwarded-Encrypted: i=1; AKwUvBy7dtNkKo1XPERU28GtyTrTa+zPI9Hd24Wmos5UIJ4/vAfikQyXaNui94Hzh9QTFa+1nCxvBFP3N7ho@vger.kernel.org
X-Gm-Message-State: AFuF++krguxEET5w8Er9h0AnPz94EBaAq8jFlFiLs0JgejkGnADy47dW
	/bflQSCUPKV7SSoXyfYmWFi1YR/rIeMaVcJObiyLIkkoZB3zgn94D9nk4Zyi9jJfs7c=
X-Gm-Gg: AYBFou2WlRY744H9xcR1sCITZmW1Eb53JCb1NKMTTFt+bFmQgPRYy2L0EZMG3DS31kP
	OL0ze7pTj5WytNKMJzJWJLNH3f/x7Lk74y4sHbNDJ6vUq3XC8v7r1031b8LlnvqjRnop4t8rLLc
	a4zu7N+ckLQJ4A6mUsOob3LtKPzPgNTL5ior2KGGNzOxxM2kAExlg6k0nBS4lJUrNQ9vgfoX1c/
	Mm5DubFhjZK7fnOyKW0qezJhbVLkuLEz1SFPi+dDYaWy2+mtfOOYcZoa6wEu4J49Y0Ot2rHPdvQ
	6cs9vZnkSCyxQC4iVr4cLRPrw2n2pR99dJ9+pjnImXFBrSM/q7DFrQao8XgQlZ3crTw99z4ltKe
	IzDVP2/NIed5Ub1YihNouWLcwPJPQGAnBa9OMyvJiWoTQYpJMFmqyfYGyzXri5C7DMwgFhuyIj5
	NFWfGixnh/1V1/Z5M32L0+9kmsFD7SJ24VS/h2dqiz1JuVJQWq05GYmVitqId2dpny7+NGqK0=
X-Received: by 2002:a05:6000:186b:b0:487:81c:b5e2 with SMTP id ffacd0b85a97d-4871e244c0cmr2606562f8f.5.1789725329175;
        Fri, 18 Sep 2026 02:55:29 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3a928sm3077528f8f.13.2026.09.18.02.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:55:28 -0700 (PDT)
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
Subject: [PATCH v9 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Fri, 18 Sep 2026 11:59:02 +0200
Message-ID: <504b6c3403b0cdc1731d3dca735d5a07450e80e2.1789724999.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1789724999.git.andrea.porta@suse.com>
References: <cover.1789724999.git.andrea.porta@suse.com>
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

