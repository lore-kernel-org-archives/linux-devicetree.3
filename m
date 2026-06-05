Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6742FE575
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662017; cv=none; b=ioOWIyFJpR9YZs30sCwKvw3d6Qm3jU/CKNWC6KrNFNPZDsvrQpo+H3Bpe6GBuxWdmnvFy5S9l43j4N/k6ja734OGRjsI5d91JXL4cBxMnT2x61wLXHIDDrRoM17mTwu282x+i8ukw7q4wzXfsbdz4+vzwAL5+GWFr8Sogcqlk+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662017; c=relaxed/simple;
	bh=mms02jd2Y08DdGXCELeBv310xtf56vpwiepMA7Ykwhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BUJi8qNjUR1tUDf3SKrbicqpSL2iUwSZX/R+UI4j/VoYPz5ew9s6axHX86yPmAnz2Xnp7oPBXojv60TRYCGyeykY3uyMLbXwknfbD0j5BHdIoVHj7SuxqI8SJOkIvZmyaazh4Cg88twVB9OPB/YUgVkaL8e5kXd6WVwcSUXdZYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ALCmHBaB; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ALCmHBaB"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so946755f8f.1
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662013; x=1781266813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UD2qTAkKIsCSLn6BgEV5Nc9NLwoB56XEwtzbqoJwN28=;
        b=ALCmHBaBm0r9S2Q/FpnOTL/Mx1V4C9nhZUopxUBs6uMeu9FfEoZRyxag0hACbNMWZ7
         Tu80L9TPhE+EqvJwt0qlazQRFd6u2DakWdeY4vni7Rdq3ucdm30806npkrYCpFXQY/iY
         /dB0XRZBjCkvufmd5uHXHUo5Bc3KI0mv2htak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662013; x=1781266813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UD2qTAkKIsCSLn6BgEV5Nc9NLwoB56XEwtzbqoJwN28=;
        b=an0NvWVzEEDuiOhaDM36pzPm4nRdEn0joZjndZtPoKRdinVGyOIsLhCiIsq4NR9u3M
         hmfloG0I4T+NXMLne18jhFN0U6f/qbQ3LMzrTBgnN/GRFNo+agitT5rwJqbp8KRJnFuL
         oglDxMXVVd11gfSdGl+9d1Kag2OgYQumJMTz4A1Ao3brvkuKfCk7At5aOYHvnJFA54aX
         AV383c8TTAG1SVuHSth8wVPu4PqR0vUCwKpDsJXqvkM/xQvFUXj/LEfKfeyt+wOQ8SMp
         qDa9YgMjTtC/ABuQ8Wi2dy31X9dqVFRK2WtH+5LsMyVA+0IovnCjs96vRmbYDSDx9Pgg
         4tow==
X-Forwarded-Encrypted: i=1; AFNElJ8bEWIttuNZQpfZegNXgTZtNDPIGrUhxOycGRJMQXPCnJaPc/HA4kM2QVKZI2hiprNC6LcFWOdRdYWk@vger.kernel.org
X-Gm-Message-State: AOJu0YyttMU8w9p3eI9P/nXjAo5QNDOojf1bFYnrZ6IHIZhjcqPlOq+k
	vPXkMEkb+9uym9GNA6xwM14dNWA37S8SCt5fyRMRTJh8NuCEB1wA6V6JrMF7y7xsaBUYt3n5Dno
	IqKAQ
X-Gm-Gg: Acq92OFgqJ4m/ej26jv4q6YoTgL0Xy/83iNEYGc8oxBt2EeeaSCkJJPvTFyDKtQFR7i
	aBAwA6NLgDn007KEAYOye1w9hm/zcf87RgQEyJAWS77Fk51On9WCUxyCAlsQER8xBwfwPB3U0l4
	Uf82GyQ7daMzmNPSVor1xthxPWSzebCCmhXyxFj2WiP+12ScN8EYd6o8HIZiidK1a7sl636QOf8
	glhwS6eA2b++aEmzkuI78sKCGqpitSPtUJFYrg0j0rc972HkouSdhdIIzwFowfctjBEEiRLXpX/
	9rq89KSP+enU+nKQubN1hqLhiWfX9CMY1UuUtn8JzxhP458IDDBwuz+ezmBI+g5gBnRIdEdajf9
	LSKkz+Bafc//n4J6mVcj5DV4E2EcO9gh3tlsGd8gjhYZkwS/L5vZZr32izJvFW7WvDNULqAD92p
	AfeSATWPgSxMBREZj/4RKVn0E+av1hpNQfnb5AvqeF12gnEiI2pH6z8aTNnGM7dLY0179t7KxQc
	6kUwd1wfCrm1ougSJky72kGjEhjSLbIC05T6nUHEmJNuRZzENb1YH4M/Fu83gfDk4fazSafYqt5
	cARRdE433v3KkPOq06bOpLwp2ZZI+fMkdrbnAE2aDuSBQw==
X-Received: by 2002:a05:6000:4029:b0:45e:f798:5531 with SMTP id ffacd0b85a97d-460306095b2mr6077813f8f.23.1780662012591;
        Fri, 05 Jun 2026 05:20:12 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
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
Subject: [PATCH v4 05/14] arm64: dts: st: add ltdc pins for stm32mp25
Date: Fri,  5 Jun 2026 14:18:16 +0200
Message-ID: <20260605121957.78409-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
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

