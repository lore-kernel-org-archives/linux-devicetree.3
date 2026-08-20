Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B83D83ED3B2
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217446; cv=none; b=CnMmy+gPR9S/cUj+uUruEnz7pKzN2u1gNqX3UCzBbkStqwVnUxMVDQQFmD7TSlOyGS0fWerkn/nPrRz0fuNebugIrL8xTJMYCCLsKxQzmwVUxhxgYK9sOQocBMMCkJkfoXPmQjwVRCRSjIYMCPrZbT7g7l8qNKKWMR5HsNR0Z54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217446; c=relaxed/simple;
	bh=RDM9GCcXwKSJ8fxIHPkpwBOWaYogfaAcCcSc/cAzghU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WyeUIAbkX4itO0RsvwAt1H/J7bKzjkAsqN3agGzACICUfq0Zui+IMpQm7zANPoBHNMIktuqcJaeF2PK5K5/gpl1XVc+BXAu3OZPnEiwRUfnf0gAdAtdeuy1ZPmwB9Q7RoaJ3wbJLcz0Dnvj3UxBGjfLQiN//DDglKn59oiFfp5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ZjnhI3XX; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ZjnhI3XX"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-476a130c138so2209972f8f.0
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217443; x=1787822243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8THUtdFYZjL+qriYRdCLEggdu/BrIkQ1sUvSgc+nNg=;
        b=ZjnhI3XX2+ywHDQyUDko0/wvWyCGkkt09XXUu9ZPYV2gZyOBzet9lAGHhoSpTNG3AL
         ktMZDlnSrR9VUetqVJhK65qqhJEK2Ri14LXDSOrfOmoc7BtzcW8z2mQdtp/pesK9WNfz
         FU2+szI2DToNOtivjaQUJUA4dlXvBSBSH3Rjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217443; x=1787822243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d8THUtdFYZjL+qriYRdCLEggdu/BrIkQ1sUvSgc+nNg=;
        b=GAT9p2U7sc+W4TI7qLhNXZ47WfqRYLicQT3e/Q8ML3P+JT7A+elezwJiABzXiBb42B
         HOR48XcpAY2PCgoGAttnCSZUJa5ozU3HWcN3OqvawlsuRXyQpcy/AItAnYMFh11t6N+q
         3J2IrAB6YfLb8MtwTnMd+1HvMMlJzj1MB0nYpA5iIUrAfffaBTVEIEXMdjegrQfhllER
         AA4x81MdosxCyR+JjzEWX095p9mcCRkbNjAOZHdBbHuuNWZSySq32LbSA2s1k+2z/2bV
         4GPMGLKut0/aVkohfKQ/w7GcYWAqLrszk5OlUEl1NWyJhRPpQgvFkJAnM8DSQppa5x/o
         rSoA==
X-Forwarded-Encrypted: i=1; AHgh+Ro5FKT6KEZ1AuhqN3R3XnAOyzQmJZTq98jRuYO3Ei6a+DbmZksouncPGbb7QEbZYienv+VByAJcnFud@vger.kernel.org
X-Gm-Message-State: AFuF++nrWnWm4wNyvMJxf+w+p7mAIcypm1yWYlz3wuhJk+8iWhCuVsNe
	84RSP2nE6H12HgaTcqLCw+HVA6YaevTgb3YLPGPSUkbQOLAIeyIC8hz/8g3/ZPfbuOQ=
X-Gm-Gg: AR+sD12tTwUnnLKMKqc5aT1r8jSWbnx4l0/sPpAPyCdEMrs4x6vNDbfkv+4fzjkCq4G
	nSIyz64wg4isWh7LCIydx3rzpMN7Fnqvte+/8Ysl4IrhnDRzSb0b/HcCRmfrSawf9pw56+bhmSC
	MQkLVebwORFu4ecNL7zDhXeHwNKoDyuxvEgip9ylcXGOmAmkHvX7MQ5v6Vrf4MaJXlQopvFD0or
	LgCDh35L76QZ+oVSElttelRVrF/tIg5aNCReLbhWfjTt+f1OXYjWnnF/DaISu0CFfm7srKJiIIL
	8/DKeEdR/rfuhz8upTOiP9xQ+ce1dZnSj0V72zTJAHtjrqz9sxcjXPDqpRg0xaZwDgoYbhnQ2/K
	E+j7nmA9pjMgpZD5DbKmQrEtcRxX/SYbXfsv8poHCwzVP4WllzG+DYtTuKNWhznCRxJ6PHuEutc
	CGVluzF4kKa/W+qc1djctLo6ScaHMnuWywcto9IXQfn5jYmoWBhQm+NwdKVWx4xCWJUixuGPf6L
	pjaZe0De5qw4yrI0hx6XC/BeCJjyPBpcZw/CSHe6JRTzDQgHfSvlGDuqH0/r9umcMEM9F+aSrIo
	6vaipbAT8WXDndqFi084LAcxZNl/Qd/YSFqMZJJrg5Msnct4FUkArPsaatNKcw==
X-Received: by 2002:a5d:59a7:0:b0:47f:f3f9:ae37 with SMTP id ffacd0b85a97d-482b1e94cc4mr20351548f8f.7.1787217442940;
        Thu, 20 Aug 2026 02:17:22 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:22 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 07/16] arm64: dts: st: add ltdc pins for stm32mp25
Date: Thu, 20 Aug 2026 11:12:15 +0200
Message-ID: <20260820091652.43541-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the LTDC pins used on MicroGEA-STM32MP257D-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Increase slew-rate to <1> to support the 27 MHz pixel clock and
  prevent timing violations. Suggested by Sashiko

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index db485b9ed904..50f454630cf2 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -260,6 +260,77 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	ltdc_pins_a: ltdc-0 {
+		pins {
+			pinmux = <STM32_PINMUX('C',  6, AF14)>, /* LCD_CLK */
+				 <STM32_PINMUX('G',  2, AF13)>, /* LCD_HSYNC */
+				 <STM32_PINMUX('G',  1, AF13)>, /* LCD_VSYNC */
+				 <STM32_PINMUX('C',  5, AF14)>, /* LCD_DE */
+				 <STM32_PINMUX('H',  4, AF10)>, /* LCD_R0 */
+				 <STM32_PINMUX('F',  7, AF13)>, /* LCD_R1 */
+				 <STM32_PINMUX('C', 11, AF13)>, /* LCD_R2 */
+				 <STM32_PINMUX('A',  1, AF11)>, /* LCD_R3 */
+				 <STM32_PINMUX('B', 15, AF13)>, /* LCD_R4 */
+				 <STM32_PINMUX('G',  3, AF13)>, /* LCD_R5 */
+				 <STM32_PINMUX('A', 10, AF12)>, /* LCD_R6 */
+				 <STM32_PINMUX('G',  7, AF13)>, /* LCD_R7 */
+				 <STM32_PINMUX('F',  8, AF13)>, /* LCD_G0 */
+				 <STM32_PINMUX('H',  5, AF10)>, /* LCD_G1 */
+				 <STM32_PINMUX('C',  9, AF13)>, /* LCD_G2 */
+				 <STM32_PINMUX('C', 10, AF13)>, /* LCD_G3 */
+				 <STM32_PINMUX('A',  6, AF10)>, /* LCD_G4 */
+				 <STM32_PINMUX('G', 11, AF13)>, /* LCD_G5 */
+				 <STM32_PINMUX('G', 12, AF13)>, /* LCD_G6 */
+				 <STM32_PINMUX('A',  9, AF12)>, /* LCD_G7 */
+				 <STM32_PINMUX('F',  6, AF13)>, /* LCD_B0 */
+				 <STM32_PINMUX('A',  3, AF11)>, /* LCD_B1 */
+				 <STM32_PINMUX('G', 15, AF13)>, /* LCD_B2 */
+				 <STM32_PINMUX('I',  0, AF13)>, /* LCD_B3 */
+				 <STM32_PINMUX('I',  1, AF13)>, /* LCD_B4 */
+				 <STM32_PINMUX('A',  7, AF10)>, /* LCD_B5 */
+				 <STM32_PINMUX('F',  5, AF13)>, /* LCD_B6 */
+				 <STM32_PINMUX('I',  4, AF13)>; /* LCD_B7 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	/omit-if-no-ref/
+	ltdc_sleep_pins_a: ltdc-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('C',  6, ANALOG)>, /* LCD_CLK */
+				 <STM32_PINMUX('G',  2, ANALOG)>, /* LCD_HSYNC */
+				 <STM32_PINMUX('G',  1, ANALOG)>, /* LCD_VSYNC */
+				 <STM32_PINMUX('C',  5, ANALOG)>, /* LCD_DE */
+				 <STM32_PINMUX('H',  4, ANALOG)>, /* LCD_R0 */
+				 <STM32_PINMUX('F',  7, ANALOG)>, /* LCD_R1 */
+				 <STM32_PINMUX('C', 11, ANALOG)>, /* LCD_R2 */
+				 <STM32_PINMUX('A',  1, ANALOG)>, /* LCD_R3 */
+				 <STM32_PINMUX('B', 15, ANALOG)>, /* LCD_R4 */
+				 <STM32_PINMUX('G',  3, ANALOG)>, /* LCD_R5 */
+				 <STM32_PINMUX('A', 10, ANALOG)>, /* LCD_R6 */
+				 <STM32_PINMUX('G',  7, ANALOG)>, /* LCD_R7 */
+				 <STM32_PINMUX('F',  8, ANALOG)>, /* LCD_G0 */
+				 <STM32_PINMUX('H',  5, ANALOG)>, /* LCD_G1 */
+				 <STM32_PINMUX('C',  9, ANALOG)>, /* LCD_G2 */
+				 <STM32_PINMUX('C', 10, ANALOG)>, /* LCD_G3 */
+				 <STM32_PINMUX('A',  6, ANALOG)>, /* LCD_G4 */
+				 <STM32_PINMUX('G', 11, ANALOG)>, /* LCD_G5 */
+				 <STM32_PINMUX('G', 12, ANALOG)>, /* LCD_G6 */
+				 <STM32_PINMUX('A',  9, ANALOG)>, /* LCD_G7 */
+				 <STM32_PINMUX('F',  6, ANALOG)>, /* LCD_B0 */
+				 <STM32_PINMUX('A',  3, ANALOG)>, /* LCD_B1 */
+				 <STM32_PINMUX('G', 15, ANALOG)>, /* LCD_B2 */
+				 <STM32_PINMUX('I',  0, ANALOG)>, /* LCD_B3 */
+				 <STM32_PINMUX('I',  1, ANALOG)>, /* LCD_B4 */
+				 <STM32_PINMUX('A',  7, ANALOG)>, /* LCD_B5 */
+				 <STM32_PINMUX('F',  5, ANALOG)>, /* LCD_B6 */
+				 <STM32_PINMUX('I',  4, ANALOG)>; /* LCD_B7 */
+		};
+	};
+
 	/omit-if-no-ref/
 	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
 		pins {
-- 
2.43.0

