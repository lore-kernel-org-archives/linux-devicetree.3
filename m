Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A56538F653
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 06:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061509; cv=none; b=cR9pHttSZDi9TLCNl5s2dO2WX19oC6qRjPSLE6ckLrP+UuNuswQZ45jmID3Z+eZlCXllC7vl4Pr7B06/lrAiBFyvE5U/IdaLJs78zuJkfUj9amxPJ34Yj3rSST5I3facF0lksLQ1nb9VkrdpKSONCoY4jl25WEIkq1rUDxOOKDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061509; c=relaxed/simple;
	bh=G0RotCdUQw1WugxF+88UN4SxQ5ZKhA/qabP0Le2jF1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EwyS9BJJ6H8P7wGWr/+0yRScS0gskOY7ZzPExxhOIpzHs/VqHfRBWfhD6Eg3NAMvyZgTWpGzSYC6OsOFm9EyYEg+XGIMAShel9UCSm1mC58CuuI0maZ4V8Tk6YZkTURgTsOvPd+uzxiXZChy2TXr3LVq70nv27r07lFPr8up4uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=KpHiPGm7; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KpHiPGm7"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso438160a12.1
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 23:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061507; x=1783666307; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10sYi/tVtIvvMUUKo7OG02Z+QG9MfHpevI/v5pXPRvs=;
        b=KpHiPGm7kIXI9c+lxhG/D23RyK4WapFaij4zvglV3NE6MOdJi0QRiqSK38SkYSvlGg
         C7ZVvs+UE7lytLDsqCxcZgZ7PWZ+YpRxIaG67B4hTg4lbmrvDs/3qAT/LYfag4i3+/jS
         PBiLdfa9qCsqZyeLf5nBWHaYhjIICF60WHYSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061507; x=1783666307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=10sYi/tVtIvvMUUKo7OG02Z+QG9MfHpevI/v5pXPRvs=;
        b=qTigAm8Kz7/vPssvN03KMueG0PUIP6oQwhem7H6c8MmqzEkDoBy4NdG01CWHys97qV
         H4Alc+yvD2Vu9/IrTWYaqrI3syqGc4x9fBjH508PPqAypNwksS8IJGtuT8m8Yv2G+/cr
         A1Fg9uGkRjNG2Z8q6h8nsbXhyPyl+ECYnQSibUx0nEAh/ZEq54Ybh2dLEooyTwu+6lbU
         CwvcNQQvNiZ8fM2Sg4CBWR4LO2sQxrQZqby3UcgPZCMPIxCFk4EEmwMT9wQJczan7kxz
         v9KRwyrjHXMr1kjd/5mS3AWjvxbl6rvlaZAyqBWa82lw0UF9L08nTREwc4RuWkijzylN
         dQVw==
X-Forwarded-Encrypted: i=1; AHgh+Rpu0avigXKfQQDojxD+sfqC/JOiCBw3MVtqHuLo6JaBpu/s0kLHnO3O3PZ4WkcKWxZGAf9qZESZL5Hl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4wxA2t6zQCYgeKxkcSs6SCwoA3/BTJhdjYwIGYXJTnmn50c+T
	NPi4Tbwl6Wk7OqtY0Hg577ePaqKwx4/RY98WevPCFHPE0d95qqMysiwbMauOuvPKpeM=
X-Gm-Gg: AfdE7ck8ClDzioTUm+uTUlkBx6qslK/wW1NnYHBRCIc9Lnd+lgATUnjBu1MSgHZ2/+y
	Pk+QyQhLSytQsaAc9qWs34lNyCAvOG1RsmRFYaeoc1NkrTAh2W5VHrd3P9WiVBHD5WarGQ1cYft
	aCR22jJtvemUseC8Ls1mevzJVBAcniOOTOWhR6mXjNPyoE5TyxrHQvEdMtc/haT/K4eRZTP4x94
	a1QzUzxpoUNqFR2GFFphftiD7NYDSk/PUOu7kRj87nrvVseuJvba1gWGtkwSnS8kStL7hApqxkR
	007ju1qZ8FNNKd7uLfpenj0nUoT7uZu1e72G4Ty54i5LCNTv387qN1OpNg413Iidby9pr6pyBMf
	94EVcr4XrpsUckfxzlXzINIPPKMMBmAA6uSpfGLcd+9GLozgdSOJ6H5PxkVB6oGV9UNsY995km+
	GMsLPz/VAFIpOsmx7LNOXmE9KSpF6tOUBWbVCFfCz9dN2bnVkpJ1QxBTo4dQofhuMSWbVWaskl7
	vtj640ezIE=
X-Received: by 2002:a17:906:d0da:b0:c12:64c6:bd7 with SMTP id a640c23a62f3a-c12a9e053e3mr308332766b.21.1783061506627;
        Thu, 02 Jul 2026 23:51:46 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v7 07/16] arm64: dts: st: add ltdc pins for stm32mp25
Date: Fri,  3 Jul 2026 08:48:57 +0200
Message-ID: <20260703065110.1433283-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the LTDC pins used on MicroGEA-STM32MP257-RMM board.

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

