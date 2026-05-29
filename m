Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBB43F8ED3
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066047; cv=none; b=sX6gWS3JTuJsy3FfgbtwMCa5fEcz1Kd/ymJMjUbrY//qQ08f29bD3S0pvxt0BgKCggbZ/IpoA72/lmuBkq7D5qzdu4RDY+8QOqYaZB07VLcxuvQd/6/fWHev4jhdLklZ5DbCg5+SOSOu6nQ4L3YITjkY5i7oi+ZwRQ3k2xl9hvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066047; c=relaxed/simple;
	bh=mms02jd2Y08DdGXCELeBv310xtf56vpwiepMA7Ykwhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bR8zh2RZ4Q1wnHLuKdbJPQj/WNiHjOlL9gqjyQt59yQIp9a/nQnsj7S34++7CeO01orXrQogpmHF+njqM/5c2BMz3KkRyBhFAtKih2k0SHFitwZt2/p1lVNhegn7UB2pbKVhR7H8uE6qqob7JFbHw0RA0L6fDOJiA76KN5LyQUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=DoW+tSO+; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="DoW+tSO+"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ef5146b56so316627f8f.0
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066044; x=1780670844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UD2qTAkKIsCSLn6BgEV5Nc9NLwoB56XEwtzbqoJwN28=;
        b=DoW+tSO+f8wmFfdH2ATMco3WvlUK1C6re0EZEX6AF7XrltU5A72tbn2ba8NvbLAjvF
         +ZQUuiS/BtFmFRrL38P0/kFMcw2DpVyT71YK+2GrJEe3pb+/2l+6NlZIFtgd1hydR5IR
         eJIrWew8aULrXrfUWpO5oUn7sIah4PCYonor8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066044; x=1780670844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UD2qTAkKIsCSLn6BgEV5Nc9NLwoB56XEwtzbqoJwN28=;
        b=Gn+3/aGSOyGF+ckCkToxMo1eRYmEvuWSNQ0Ddwc6UCa+AzFlipPmAb9O7AKL/QmgGW
         QAHi0xL7ci1VvxxKZCftz/jUYitm6ov1M7ysZGjS81vQKDVoN6K5PAdi/BR2U/xlVLFE
         U2VSECM7TJVKrdN6Cx/84U/ZTO/1Ycdho4d6r1le3DxGzTUK8Y6jDO24g1IcZIrhIpY6
         qcqag1gVVkva0gySCI9he1Ibh7JPzu2lpLY2I2ItsIREzuNJbA2Y4J9bF8P4q2YFS0U9
         8ECRtuhhFFDoB9XRZjmivzzkchCc18KXlWakWamKv/5jqEP3BWRq10rG1KBKEl9a0L1R
         9n0Q==
X-Forwarded-Encrypted: i=1; AFNElJ8y0gHvElnbEj0cUsfFwaekX3rVsGyTYqdl1SvjqCjsEE5FabgYQGPNUcgvEU/NuzIsrTKTy55ty8Cf@vger.kernel.org
X-Gm-Message-State: AOJu0YzgooLPoCnO9TPpC5MBXjNhI5nwbh5tPUUe94GbbFAXTWqJnLTS
	3tkaedDM9m/yUIYkQpWSaZLqCCK0whya7SmoEZE0UU+pwvlF823AJdFLri5YowUhEFI=
X-Gm-Gg: Acq92OGPoC3OuNOgY7jHGtiRJtRFCZS2SxgxBgO1HrxzAvntJvLlubwTNMZvehXtM+e
	EndOxKLkD2BPVVsiU1VL0NPz6yqJRTJccKkWAKhJS/V0Xc2lTXENU9/640Tg1UxiUNa/yJNkXdY
	U+UCG2SGaJ0Zz8Z19hYhlwCPAONPw3J7PKq3JGN31AQWaW4750JXwquSzF94zpe1PyGVO5T28aw
	4draeTAHxKksMu5qk9j30DGvVYiwGvUdqmqNCtY5M6nq419qBIxaxciLR3b1UPdYrKDQGjC/Xs4
	ddJUIGCzE5asj9VWkydJ7zJ+RLjHO1VCZ8uGpkqRKlY0U+wF5toQuScyRen/bTzc6rNCm2SkJRA
	lrW+5mT164pspmJYjldJsJ7aTWj7QHMtOR5JLRTmvZmW6Ng1WPpD7GTaLlCjjywHhEYVpVnH6bb
	CYJhE46JNiHaN0btPqvWtxdAuPmgp5/evbJIdouNgOcZVtcAtyQmaQI3P+KEu5ESLet4d4AJHHI
	fc2083pDHOEE1kCISjbigGWM9gqmQJnJGWtmHedUDO3basPqUZL+vR4hiI=
X-Received: by 2002:a05:600c:3e88:b0:490:5000:917 with SMTP id 5b1f17b1804b1-4909c406a47mr43388845e9.1.1780066044493;
        Fri, 29 May 2026 07:47:24 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:24 -0700 (PDT)
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
Subject: [PATCH v2 05/15] arm64: dts: st: add ltdc pins for stm32mp25
Date: Fri, 29 May 2026 16:46:19 +0200
Message-ID: <20260529144707.3931919-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
References: <20260529144707.3931919-1-dario.binacchi@amarulasolutions.com>
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

