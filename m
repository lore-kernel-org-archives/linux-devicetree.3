Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C7B407587
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 06:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640959; cv=none; b=CWlZTGjJYhQy0o+7/cw1pbxTSr4blR1JNVr5qC9Z8SQ0pXwhtZ57ftjRNCN7lgfe9/8lKDhrvz/tZhGzNLRdWiSxMBhR8BkjCvAPFcaShbSThEo0kH/XwfuNP3C73MmvnToQ1XU+kB6rOEvrWTsvXB7jJfLJUn9fyrhMDfsCApk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640959; c=relaxed/simple;
	bh=mms02jd2Y08DdGXCELeBv310xtf56vpwiepMA7Ykwhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJbUufJnqdYWRgohhc5ZzC+1dzIBLH1Mw3xFTWMtFxCTGV844orzrLTeuemNcUhRjM7lwdx1ISWyJWdxgiYT1hXngUG1Bh3lSYNQZWeWDSgxUDFW6RRMYBJ0Mg1wzDd66LLNIt991jpXuILiFhN21AN3q/p9svXqrAcpKdHVp4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Kzb//4/4; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Kzb//4/4"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490af320e2aso17646745e9.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 23:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640956; x=1781245756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UD2qTAkKIsCSLn6BgEV5Nc9NLwoB56XEwtzbqoJwN28=;
        b=Kzb//4/4qIiZ4ghUVMVQFz2ufCLigKiAAKW12YmjUMjh4yjqX6KsjxiBx1cqRs0wRd
         9nV+ZBnlOpt5enrLILvkeJwPpC+1xRKJWaZltJZPMFCAhDgYpZiVgKPhqlXleTbNOd4l
         Ngu0b/+SD8LP8r0ySTvLtYgvBIlGcK3XSq46o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640956; x=1781245756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UD2qTAkKIsCSLn6BgEV5Nc9NLwoB56XEwtzbqoJwN28=;
        b=cQoDYEeF3AFOOkUeKJzju+7mPXPvyBzpxiKs0n3xPQrEgMkUJhKEffCPvs5FP/UgkP
         EdSVUpNh9J/B5GGvJXQAT61ETRTaB0BFjPxWHPq3PLJRtUuNEFJAmjZrz7DU5CWYH6i8
         /9R10eFGkWEVEt5w5/9hapz2C7q9qU8VUsSCykM7/wMdLukKu34jvsl2GVTFK5tN3XXG
         3FmsZIZHatQsfU4uGv8k7NxcsQMN7SE7Og3lytqx34bU9lPA6MshbhiA41WGmk/mNy3P
         gMOJiz07iJB1XHmxqCDfVsYy8R4V/pSABAWLMdacctlMMRvM+pzeMLqkE1G0hziUchWo
         fdsw==
X-Forwarded-Encrypted: i=1; AFNElJ+mX9ALHwAnG1VS1tek4gfYgevyony/1ewjcRk/6MIHyzTs0l6FJG56rhPKlwucyBUHvC39Bj9tj5Dx@vger.kernel.org
X-Gm-Message-State: AOJu0YxvAHE1p3rz43FMbU90+jvVYa1nGwy++rKJMbs1PUVj3uWcfdON
	TIYD+wL0z4qMrgImALf2Oa00gTxOzq9NfNalHtbWTqI7/i2Cfr2M8k6A55tzijVmaas=
X-Gm-Gg: Acq92OFlcbOeMgB+/eHP90v99GrVLBf3mRYSYzquENyD/YvrlKPPPl2rGoY7nWLnABS
	8dGj8OnbutIF8iNHoOIpOuqz7nTWOt+IZbxJlYMWHNrRZhDvrQoxuqCNafjtI1+wiLcSgmzsVay
	+KE6Mn+LWdH5fDaVpJoP0lQ2LdPSXCcx17AOgRfODTItF9bvMMq2UW1tQaNVOa3uieeqSM0E9Bp
	ncB3ElD9gbsXUCLvw2v1J/bJ6nfO1F8I/Rt+NXn+P7iEehrbqtQ6qtjtD5rR3zWsHk42lobJg53
	b5KX5Wcs8FiXW+SAjlnigVog2aJx5DMRHlZXkFqZYXKwx+t2X/GvL+yqNYWZ7sO02OWP4uHbAGj
	fcy5k1oh1VYipYPoVV8xkDnSc2qhJ3J6e9b4ozyGnIxzK7AGlMtETvdLADgNOXLn0M1i5vRE/yj
	PaZgDY536JPxWoDYbKFRLZS0qcav4ib4d6Pglxo8ci9Qf09vqcKN5hjDt6NtwpOo8uiiTdwPfH/
	bwwqH9uhTLbN+MsmTcztiEhFWKuvBnOzQV5AFOCKp22iFg0Y7mKJYKdxk3kFcdIcJD64UjFMhcf
	n0Y1kN4sLJG1FttFmaJf1390fbWU6KPpoMw=
X-Received: by 2002:a05:600c:5020:b0:48f:e230:d5ab with SMTP id 5b1f17b1804b1-490c260f495mr28184305e9.31.1780640955724;
        Thu, 04 Jun 2026 23:29:15 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:14 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v3 05/14] arm64: dts: st: add ltdc pins for stm32mp25
Date: Fri,  5 Jun 2026 08:27:33 +0200
Message-ID: <20260605062900.368376-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
References: <20260605062900.368376-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index db485b9ed904..05bd07a0a561 100644
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
+			slew-rate = <0>;
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

