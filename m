Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E683AAF4E
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742987; cv=none; b=Puig3CcgDaCDzR3UDrNluaHZPPSCbPCC0BXrIr6JBpuK+hsP9/8uBFLeIy+7gTcM9zd87ysYHK82NCB3eYJGmfdU5fXZOtSGHrAhMwe6hAFqLtYhx+Usa95ISr/e6j+KyksMzQB+u8IJPjvfkwphmd1S1h4KXAJzyd15794Ak94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742987; c=relaxed/simple;
	bh=QGlJqg03ZdMuDaIsMrA23hhc5s89rjWq4ym3XRlGfDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZTVh2ZqLLE1EdeplHBCk+k2C1/5mIk5GE96wRFJ/brCKd4eMlEFxmOZ4hCubueoaa3iLNw6UdvE+1x48XujTKsYpf64gNDhSOnig9n+7dqAGDwWHyy22aSyzbEz2zX1GnTChL9ErlGxP4VFG5zk7O8unbaCmJi9HCrr6Cll5Ld4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=cG1n9YTn; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="cG1n9YTn"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso19738285e9.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742984; x=1786347784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=;
        b=cG1n9YTn2FHdo3BT+S1ZapzNM+nWZHI1+7be+ScADbutvRknkZpAodbCIXrPJ1dG3K
         sE0O7cm7omDq3oXZxGUh/pGzMMGmz/Y3MeQ1vbBvlY58uTIsiJhEtp5+qaID6GVVbqM4
         25pStdDG1CszpVofxMoKuZzcjIQBdp9Ln1rZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742984; x=1786347784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=;
        b=iETRMA2s4+NUMQyONwU/rjhdnVNhmoSY0upNccbl4IGi43rRimuWPa+kvf/eJ2IBKi
         Yvhmdbs+YuJWr7yR1aSlkdtP75uSdFK1iS7msOMYQ9bS0ud5NYxIBEfIURNTyNnVBhoZ
         IcAnJpkd+iIQU9lZBg3BPhXgi8C8E2ojikRV/REv2MH8Fov+tolbQQTDSt01p5n99Noe
         w/p+gWpqcfw8w2nHkGfvPtqYQ072tDRfSo86eZsxa3Psc1GYayoiQijPwEaILtmIvgUc
         tJvgHXY5i5spAtHCPFVD9Cn6Y7TGThfnC2vItHjTOQCVW+Qdm+6tBl0vNakngLUbHyEw
         iEBQ==
X-Forwarded-Encrypted: i=1; AHgh+RrXEs2DOJUxL4kVGH9xphXqSpUznb5TqS7kkNgsLeMytD033F/JCSUOn7AMAkjxT0WtTipBGpkWgV2I@vger.kernel.org
X-Gm-Message-State: AOJu0YwQEPjBGc9I1TR5Rfp8cCWDFCied4vhhHzZj01hi71c5RdZ6XVp
	z0+eZSrjPKQnClrqZuW0hsJHjFYIrFU6dkMer2w8nIHCbCtuawYm9Tvee6c83DZ6PMDaNuvS4Rc
	F2yTN
X-Gm-Gg: AR+sD10nw1uBuqHmvho3icOjc4Zg5d+iWg0LxkSEUozOK9gNQGy85LUo+DJrEatMthF
	iRcCe9peLVjugXbIgrz4o9tc2GKEE82iv0qJnwV05jg7a61PjGo2qEvrd1+VibDTBNew8+Zct5F
	dT0R90radXZjY3D35X02WVCpgojOw4QhsSuMiPBgdwWWxlfb1c4zofnbv5EcHro5lfsLHnj3y/d
	LXQxQ4RNnSnnNqDJKLnqwG/ZcABVSPtcw08v1GtAUpbT0tw/KZNyDFau87asVHbj7ewCEq3fGWo
	LaVkIYYNi/Lk6U+pHgoyb2laXUIxOJ1B1AI+AJKjFeBye9jC2vYNy9vGhj5chrSyemcKmUC7ZQp
	DJmXNxIBWGJr3b2BRUEA2wGcW2rhJsf3Ku3h3z1zzsJXMbhVBZa5jRNXKyRuiRAmaW9FGQYqnsp
	u993zky7wmNXSdsYn9gi0usaytDdetC0PndcfikV1m/F1Bt6t/7+JRqCIWow1NZmA/0UqYCvWST
	Xy4Do2UYy7TukxdZMs4bHeFEUUbKCy16GJYHRfd2e4Wm8lpviTpA7/nm4LuSe+IEqujPxrPam47
	cwAoFXmkrSJ/QXoex/4dJ9Uylw+R4jx3cgnFq8EGcOUqEkVkUhY+8Jus8VbhncOl
X-Received: by 2002:a05:600c:4514:b0:496:bbce:f3 with SMTP id 5b1f17b1804b1-4980eb4e952mr186840285e9.6.1785742984105;
        Mon, 03 Aug 2026 00:43:04 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:43:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 09/16] arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
Date: Mon,  3 Aug 2026 09:26:04 +0200
Message-ID: <20260803074224.3821911-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the pwm2 and pwm4 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 6482dd47e977..695c9d771853 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -433,6 +433,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm2_pins_a: pwm2-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, AF7)>; /* TIM2_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm2_sleep_pins_a: pwm2-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('I', 7, ANALOG)>; /* TIM2_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm3_pins_a: pwm3-0 {
 		pins {
@@ -450,6 +467,23 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	pwm4_pins_a: pwm4-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, AF7)>; /* TIM4_CH1 */
+			bias-pull-down;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+	};
+
+	/omit-if-no-ref/
+	pwm4_sleep_pins_a: pwm4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('A', 12, ANALOG)>; /* TIM4_CH1 */
+		};
+	};
+
 	/omit-if-no-ref/
 	pwm8_pins_a: pwm8-0 {
 		pins {
-- 
2.43.0

