Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F82257827
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114733; cv=none; b=bgAYYi+NcCSRZQHFZ0zazt84tIVF7wyeOlfurbGnSic0miC0Z53oWQvEJ3FtF62ZIQbQtIn1qd3ux/a9Ki7RpKIeV6mUI5vFPZN/FfEFGYG8XKYIc0MmYANaQrQobqoH5qd4/JzPRwnh36vw6YikGQkEkxEkaTIRDQyhLJqCYdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114733; c=relaxed/simple;
	bh=jwcRGKy3/TgN32Yv8MBFqC/R8np/8KuCnqpg4TPkGsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Fiu4UlfswUwJYJ8uAdJCECktQjvQZIEMdZo7yKbs9JKtBQqiGnB9VdhBrfOWJnb+GPSjOSpsdH8Sqyg9yt/Z3qd4HH2WbAljQSqHLLjkAl/ArjAdbOCtpeTdunDSk6mjPulrK6pSkXQ7IJBxvbfOerQbNYr+XvX8i8E2grigoRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=fC+0Fas3; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="fC+0Fas3"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-44509921fbcso1394298f8f.3
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114728; x=1779719528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdvucN4E2bCrplak4cO8WKE5auEkirQtL7ZhDvTXJtA=;
        b=fC+0Fas3o3kwkFn5XR1ZkgnMDf625fNY1r66AWPeAIHBHylBOIyv7C5QqWC+d9gjK+
         bKoj9OhaRqRH0mmRqWmRSENM8TkwAU+kjBP7zpasOgdflRBXLcETYVwHswPj7JPg78V2
         TAfwhbe8zKVZm9W8ui477Ba4r1GEhWTtr/Yvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114728; x=1779719528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qdvucN4E2bCrplak4cO8WKE5auEkirQtL7ZhDvTXJtA=;
        b=r7rwbS0Hwi42NFNAq8q0NozltFKDiavwS/kVB6Kv/YLIu9lf4QXtyFBanJ9C++FeW1
         nW3pjQ/VxjQUZ5n5L6iKbGtWq66FznbivHyCScQ7vM7IMjmMhwxjA8BMGUVOx5pFkaG3
         ovm3aMf0UQvXUezEM4PBmF3EzC16h7ziw5lUw0c+0Xo2lQsXSErjNkF3oVuVkuzFW+/6
         VIHeteb2pgA1GR6oWQCBO7FyuC7VFaL/LA78WIGxWQMAh69HhTZi1E6yyf4aKnZmuVms
         rCdTTTRXULlkGhNcypmltG+4yeB/FR9XUpjzJ3HIH3xwRCo8T2GnwzEL9OqR+XhV4gmd
         0HJQ==
X-Forwarded-Encrypted: i=1; AFNElJ/o0PgkqFlvNFPoRtkWK8fWjD2O3xqjK1TAe8XPwy1U40PSrOqU9+3FweqOu7FeS1SGpSfDeVrFrNvn@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Oy9pwP+nXtN6D23YKeBR6yCfjFcMlB+bP7I2/s74pGLgr2aN
	XWc8kdG8yRD60zqLz32sGz0aRlkRQaecqAT19RMAOwup59oFn3yrFQ8nkEM+6KBmCU8=
X-Gm-Gg: Acq92OG6VXWuJ74M5+19kJtD2RlzQmVOinuf4hx2VOZ3Wlc7plMJpahoiUNFnOzZg1F
	/Y5nlYjyj0IGsFoWX9wEPYIz8JbnADM9gew3ZV655Mh70vnsX8LIERzOlPeMikP73ugVlI8cJFo
	T+bxVDaQgLFMMAfK9BJPFt6R3n1fjmysUtCZRWI2cHGnokJsvXlOMRxwZTbbpGqV1fFy/Gsl/cO
	H1CE03TfqyeBI3Uh361AuNLqvRp5CIS7DBsgIAJZvGdr45rplXTO0i+CGiyhapZ9El+xYtGwrXy
	Mh6PiKb4MJYl+8TIeniMWPj88O5hg6cKgZXmqMcq0EEUjHv6DABYyXMDv1TxMELUJbbyruAd9sn
	ZEtzHsDwxJHupXyV9Hr3ZQVL1qiVHks1ppEPlcKAt8qHGqhflu8GI0cUvnE7eYNwNIeQKJEYhyg
	U7cbE3JMa8HeXWGHq4wnJUwfVq7LG3ReFn2ZyqRv2+uGZiqSYelhp54zYn1bAmu79tt2hRdz1IJ
	2bmIvQ9P79hlZPyV2LFa/TVPxBFDi+9Q1NbNwBZFHV7nZik
X-Received: by 2002:a05:6000:2384:b0:44a:247e:67b4 with SMTP id ffacd0b85a97d-45e5c5a0fbbmr24201432f8f.18.1779114728068;
        Mon, 18 May 2026 07:32:08 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
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
Subject: [PATCH 05/15] arm64: dts: st: add ltdc pins for stm32mp25
Date: Mon, 18 May 2026 16:31:20 +0200
Message-ID: <20260518143150.3138712-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-1-dario.binacchi@amarulasolutions.com>
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

