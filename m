Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029043AFCF1
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742974; cv=none; b=sbCaCILonU5Z1b8XOLMR+fYPRypT8sW07/+KVxgZesQ/rTq48yy0ncOnWc3i0RcE3pGF7x/Mspu09+M54aXQ0y8NKsjj41vAxf6hbT9JR4YQS+JXXvKqw7C+9IVpAAumY22Hn0Bojb+k3J0vMgS7o5Dl60NIYziU0IMQSwIS/CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742974; c=relaxed/simple;
	bh=G0RotCdUQw1WugxF+88UN4SxQ5ZKhA/qabP0Le2jF1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A/ChS3iZ81KFBAbqFIKdmEtbDadsKjnvnm8Q4rCZumrZB5zQD1QKrnrGNDYaq+6w1/vSkhbSJlB6imoUQKg7sI15XU8iIbs537KnjapUohgENg6QFoBfg739KJ2h1PAhkelS4sEbbc2fTxki1RxfYU7cOC6JmBmk8G64lEM4/1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Wz8F0EeQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Wz8F0EeQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4954aff6088so14650515e9.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742971; x=1786347771; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=10sYi/tVtIvvMUUKo7OG02Z+QG9MfHpevI/v5pXPRvs=;
        b=Wz8F0EeQkpin/tYbVXLllbAH1cvuSvj5jJYBK2q2Y1P8EAZTwyja6Z4KAQHH4npe4L
         jOSMi4vDfIZEMyG9l+1VbB4EI2BKBM72VVq+a3LfbUWwtHgj8KNjTy3Z+yDXCTr5fOVs
         nd+7QRMlH8w9gIHsBR+iR/Vs3QQ3HZeGIQIZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742971; x=1786347771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=10sYi/tVtIvvMUUKo7OG02Z+QG9MfHpevI/v5pXPRvs=;
        b=K/Mg+DW7i8+GxR6tHWnpUmnnAfQB3tiigp9FS00hYbZAhJHmCMJbQ8GRmqN9i0q/HP
         Y319ELPif8igRLQTN/SWyJ2yW5dw16EUTiG2n7IHv/GUXxmXPMzl4T5rt32z8ax2NwhC
         +bK0xnCslcSmU7PjnzBlMKXOwY6lqyARL0kZ+8m+x05X7HDTtY9+AH0/1sn4T7OcQUYI
         fzGrZA8jWk8O8K4VskunDAIodUo+KwLhBWLoBvLJbWzJ5nk2pBOZ2FF+4DK+AJqKKAWg
         60buXDdhDuzRY5rpxma9bFozyh16YghXicE9/L/EiTft4T1UBdgtYygtn4N/iCEupndq
         JDQQ==
X-Forwarded-Encrypted: i=1; AHgh+RqkEg5S0FLkOGxE+wNNUFhEL7kf/kN3rGH1/F5EXaJL5AntauJ7FAmEu/iDSjS1zar5LMzS2J4qDM+M@vger.kernel.org
X-Gm-Message-State: AOJu0YxKt/fozxD6a20UJXFwz2HDpkijVgsBYNTAfidSr+M2J/gKZN9N
	TMxqwlxl4VgBymyI6Jl/F4kLSKzHYt+ZvKSoMn9G7jnbmYJWDnOyX8kqpxvPBwToMI0=
X-Gm-Gg: AR+sD11wdKE4QQhBB0dr8O5T9gDEIsRoljbRsNfAhTUg9NxktpQAntXiBMZukae4oe8
	eJQpnDCcdTLA1CJGP5fKQXxRtkSWLPkDzwT9cKTimA/qs9YU3M0mw8ubfh3/5+73hqfrUaxPJaD
	7Nn8/pNu0gepqxgEdbi7j2jxpmKOQUOKY07U7ym9YGzzav2u8n6i7jNySA42NgnFu+IJAw7Pzm0
	M4ZrMx8tQVXa+jn8kmmWXbbv2YspmdoeMRKn3yvXtPHdNnue2vLZkw8RSjO8Id9fTVPtmL/ZsZQ
	mgvmx/gCyc4v/FxvRcnQtAXTPyJ3YDc5NynIEoxgrMf/w8fMQODnXEZ6QAjrp4T75TdqWMmVfXC
	6yE64guQlaJpQ/An/ta4VQpMacOhYUaJAm9360GFu0QrJisqXqI/MbtpNsTrsSkZOYQez9emWBy
	Nv6CIRo23IzZ6hv439OSiq5xuuI2WUkKl8/OfLssVibroSURc2hvJPqSAKhrPfe2ru4O/JgnlVO
	3qPdwqA/uRYAbEgw96uVub9KJfZ61yV7p+bMnpGBU6Fg2MVMbFMItmx+Yn77P4B0ZRVzH8VhE+6
	geQ195HF8+/6mbDFYSYPOiBg70IqYiueGH8Mvvk1v4APVZiizqUseV2MUHO2e/RH
X-Received: by 2002:a05:600c:468e:b0:495:4b42:8677 with SMTP id 5b1f17b1804b1-4980c6a2268mr174966085e9.18.1785742971323;
        Mon, 03 Aug 2026 00:42:51 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:42:50 -0700 (PDT)
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
Subject: [RESEND PATCH v7 07/16] arm64: dts: st: add ltdc pins for stm32mp25
Date: Mon,  3 Aug 2026 09:26:02 +0200
Message-ID: <20260803074224.3821911-8-dario.binacchi@amarulasolutions.com>
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

