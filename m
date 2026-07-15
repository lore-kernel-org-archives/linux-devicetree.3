Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E678315D3E
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096549; cv=none; b=LurJBV9Pg6qK/Pnht/XDp8IWzRVMF1inoXqx3TtVyKcNd82MnjZAG2otcqD0Q/sImnmpY86Ij8KcxHU6rESVu2B68rcFuaUqxgk+9b2+yzv0n/d8Nl4M7ZF15D8F7zxmOsj1iV0e+AnIWHAFKWDOn0Y9oWnJWDDB7h7MAgKOxv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096549; c=relaxed/simple;
	bh=G0RotCdUQw1WugxF+88UN4SxQ5ZKhA/qabP0Le2jF1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QZwJgmf69fDFQOLw9KS8eA7U31LyBZGnP7k4X40G56S//TcmoTFN0LNAxOL38Sn/RgEQx4oAIvfwGopztQyrV47NUXu324G1J26T1HOJPxqIYfYW/z60UwHvXvHX2YUc8o1Oh2ze7S6Vmioyohg7DtCy4FhEAacygDDFYDRrHWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Dg3v1xUD; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Dg3v1xUD"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-69ccd6483acso2521023a12.3
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096546; x=1784701346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10sYi/tVtIvvMUUKo7OG02Z+QG9MfHpevI/v5pXPRvs=;
        b=Dg3v1xUDGGc0Qpg7Sum4bbQnuLHrcXBwnLJ+yFHRvVjtfzKXWgaihpTwWS7ncW/ErP
         jrShBZlaCwglfNvAXPAA78BVk8KtIn7EXU5KuXtoheiGkX/YHPVwrTrVk+lLh1AqsOam
         g3ZRfavdNZ+nMmVkh3B9ixjLsOw+6f9dMpfz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096546; x=1784701346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=10sYi/tVtIvvMUUKo7OG02Z+QG9MfHpevI/v5pXPRvs=;
        b=XsoQlc2WwK9PdPHFm1JKZASuLgblOTcXijWDg8LqJxAP0WJYGH1UpLiId6H2jdms3r
         54BpEJQ2n2H7EsB97VEn29k5Cu/iGdp+z3kSBMCYNiLLsHcY+szZrrmzAKGb/yeG8KTy
         vsSrAu5k/s9VRp3qX1t29bd8w23m4jbZUaPu6xTEuzKRbXjnxb3ehPDpvykE29Ae+A5j
         fpxcHHxBPqqYo8ggYSb0UE21OJPCWqbmkw3KcvnjtmnatFPp7ZYdiP2/IR5VPlQ1Xvjj
         0+F7RolbfC0jfBijg2v4RuSxeJ8qgBSuvqrA6BRbajpJlgZ9OG0iL9p82N3uG9YAxBeg
         l8lg==
X-Forwarded-Encrypted: i=1; AHgh+RolXMr9rmk9hb0zWdct5gN13SIuNkf3tPBtaMJsM7/ux/ajWg/7Af0dchzT1IegTr2xX1gc3+qV2QLS@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8ih1VrVwV/ktxVlVpPQ52Jq6zKLMzMGO/+8x3+++Wakn8rPJh
	lMeZTDxvU3RXjoqtNbufV9SdXaEH+DTiPz/zl30TYhk7qcR+1vqv7cBxDlYbXDt2njs=
X-Gm-Gg: AfdE7cnqHqQCT6Tc8eAx6WF7RSidyqOmm+CGTRwY+Rz1zxZwp4OyvO3Fs7lE2xPT/WS
	5H7Rtoys0qn32qjL9Vn5dmvETuHe07afDAF2XFDOgspwUO7be+Y8KK5qWWnCHCouIPTSeKe+euf
	X7LxLF89AO2LUyGPKQAkPorgwTtuhSD6hXjdCoewdIidrIY3U/PJ6VGSbnm9qVVBNCEtOTNCbKY
	3eTG8iekO1d9dsjMcqK584mRhHAkJzSvpIXXXgLHw1N4mSe7dx8Oc1R1pdJkGRFQapNEFIrh6JN
	jskXEmkatXBG3lWxtgb7v6BKVQeCHV/rZ+EZHhQ55popUeUJQX1RVvlxc3+bfCDXc8MdgPTe0GQ
	WQb3qa+2+EXLYx+zd//wRvnL4Klf27sz3KnaqfnygzOr6A4yCR2pzSxBY1jta8uBAUTkpnnDIni
	+d1qeIj3OjvWEBB1U7a6yNxclWOnB93BlwMfMMlg9QRgw/zJkU0ZlojD8Z67KURmYAI6jHNbNbc
	D4hdPlSQMKZ
X-Received: by 2002:a17:907:6d02:b0:c16:12ff:dc93 with SMTP id a640c23a62f3a-c16679d7da0mr313911766b.18.1784096546357;
        Tue, 14 Jul 2026 23:22:26 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:25 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
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
Subject: [RESEND PATCH v7 07/16] arm64: dts: st: add ltdc pins for stm32mp25
Date: Wed, 15 Jul 2026 08:20:24 +0200
Message-ID: <20260715062201.3599458-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
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

