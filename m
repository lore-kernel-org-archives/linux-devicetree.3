Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE907403AE0
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811612; cv=none; b=uH/7WP5dO26k/EUtWs7lQCrUWYr+gE49LhzyvsujCQmjRZzlZH+K79vj1ZFqqa76hRGMzCnsYUE583ssvzqwbHdTlGvYQgR3m7ty41++R9vr8YX6G0LfPt6fCoJv7MGP7ELjO+8miuRsWl3Lnr6XmLpBhuZXSaf+SPvtJ2czkFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811612; c=relaxed/simple;
	bh=G0RotCdUQw1WugxF+88UN4SxQ5ZKhA/qabP0Le2jF1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JtLL3h1E4VyCPZgka+YiZKDV09d+zMsoPAaCAJN/2QwKH4HTcaKY1M6ktpFBAF7uDORSgEZMtfGOVsg96Ld6Sd+gpO3PpEggEfE44BgmU7SmN99RgOQXNmgMc4OSxIWZFL5UQID7cDxI3RkhWH2U/n0WurCkPPUKXtvnQDt6omE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=aej8Yk+L; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aej8Yk+L"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4704d652e9cso2107389f8f.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811608; x=1783416408; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10sYi/tVtIvvMUUKo7OG02Z+QG9MfHpevI/v5pXPRvs=;
        b=aej8Yk+LBH/BX405nsQg4nlHCI460kMdXg1en5lHhEEmwRydKTYRuA+wMH6WOOCE+X
         /y1Jg8pOWENyQOkltx9LgeSARGuCaNZlVGLWIHqmyz953faIFNJyshU4rih8Zc3uLo4W
         0ALAA08J98WOn5HmWbRMTvJF8OXKJPRr2i6ss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811608; x=1783416408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=10sYi/tVtIvvMUUKo7OG02Z+QG9MfHpevI/v5pXPRvs=;
        b=AWOGubMW1Idkr63Wiy3qAN3QfcmarKlkKgvoblsxTswXYnvqm2qRLjcR5tAYMm8f6P
         w66DHeHdhOeoC2MxGhow0zNKc2HQE2gQoSvW236vcq05yEqIGNMOKkuIZ0YThx+CCLGO
         Agj0043syEUHStozVQYvzRuu8HNbswjq+ONprCNoNAT8e6V7SBTbeIRMCbH9pk8ynafJ
         jw2io1Sy5oIFQ9MLWr104TV8QtPXLndQxO+mPHUma/C2vEcD1/sQZKK5XRTAxU+0JiAz
         XMCKVA8l5M414BgqgaXlt0FTfnPyvS6ZAM2U1R4bPX0TD4/UMBAi8g1jcwaQ5WaJwM1D
         V9sQ==
X-Forwarded-Encrypted: i=1; AFNElJ8SktM2a5bL/6IBoMrom4gT9IxIgbHPVbpRm4ypOjTyVmnBCmVw/fhDTFxTPHtAwTBxG59X3Z3fASDo@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6qqHfXL5hXHSreoWpeY47hrW7W/lqfU3BPp5fMF6ZU0FsbldF
	AsL/ArlxruzTjWSrx8iJOBW8XDAET4Ywpd4cmCCbyW6QFeuIki02HfU4/aDyjrhHmeU=
X-Gm-Gg: AfdE7ckOezDQrqvYzVIuMda0xK/g5MuEZiNJrU6cuqd2E6RHiIWld0haqjYizD4HVug
	i4coExWGYugpfQSpAETSUoX1p13deMdpDY2CT0BKvA7dYYaGmJtauS0BW00ZNmSBNRjNZtckzBM
	w3emPfq6ij23n/BkaicstGV2U6fWX9gxzdmFuo4lu+WFuCL4MfLEmvPIZfzRVDPr4jJPNq5Jzyb
	R5W9sSA8xR+Cb0jaXWNx0GgYRTPUee68t1cpkNAlKdYshrW0zQ5HHgb5aG2PR/DLPD3/5rc6ptX
	Q1yiGorOeYfE+9s9lyemGehOd2BI+AjCxuw3xG0QxoC4FhO1hrEX4VmNLBlzXPoT47waQHckLPe
	P6jR8XCdvwxVTeM/yKZ1f4AgI6d1aEbVzJW+//SFHKmYroLHFOlt4k+IoIZDX6m1SPc4sRZmAcW
	HUPwNqGDJ1dwje0ojOGa/9VEGxqpYYlgmozmHHzzk3p7V19DZNIV/0ZYCu3z1KBYNlTanFx7bZC
	j2I2wJuAKm3fuFp4dpXVxYXOCm4DWhHD9pgKpmdZRKVZ6/MniH7+/n+HPB/GHEyI0xjAKHAo/Fl
	8ROSPnpIXdUD6A==
X-Received: by 2002:a05:600c:528c:b0:493:af0d:484c with SMTP id 5b1f17b1804b1-493b82d4b0fmr42650855e9.34.1782811608092;
        Tue, 30 Jun 2026 02:26:48 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:47 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
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
Subject: [PATCH v6 07/16] arm64: dts: st: add ltdc pins for stm32mp25
Date: Tue, 30 Jun 2026 11:24:36 +0200
Message-ID: <20260630092628.1695560-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
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

