Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC46D38758C
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 06:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061517; cv=none; b=Y76rMHRBcvvjAYWofyeytQNKlkww2RhMJX5Iove2rILBgVZ3qqu4ZhHzwRpCa5pC0Cm7zK0CvJ0ijrmCto6YCWa6ukWXZ5STbtYgIf5MPQkGqp0FZpWrftFT1CUYlt7Ogqr6pTSkTe0aD2d/e/B3T9rI6WsGh8GLWifD2sur7uM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061517; c=relaxed/simple;
	bh=QGlJqg03ZdMuDaIsMrA23hhc5s89rjWq4ym3XRlGfDY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CW3zygNDN4b1n/ac0JHpVO9J4OFjLv81WnBCkuoa/mt2QueEz+iNwbgUlxJPVO0u8rGCkT0D8KHyqe1DLTeUApo0wHYbOZYm3WmmKnrYp9K72FLwJjUrTM2wANUVUJSKiH08XnPn9Co0sp4mj6SQg7ob21SUySMIacRi2y5OhfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=kpCLQ0Mr; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="kpCLQ0Mr"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c0e124d2a21so19812366b.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 23:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061514; x=1783666314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=;
        b=kpCLQ0MrgRLiIQbqfXHNJDo/omk/oKorutQSlsylMJC/aB6CNvzPcd+ybzXgP0lYnv
         PXbf2OfsFi5uHiSV2jDcwDWuREHkjcJG30cw4gMTNr1ZR9luKDxhIBsRmLEgagVX5Fbs
         ue4d4usviparMWTbdP5RSSIrW2CegBSDUUhqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061514; x=1783666314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y9eicy7qFkVmMZW611/qMDh6GaEBG59Bdrl7IT5yIvE=;
        b=fykVoaIX4yELPDcOSUfcssG1f8NYLcG5oxN1EtjIISf6057Qj0SAxvECyGw2FlThwh
         5hsbgBUtOjumGUQQJZpMxm8HbTPxM7TDoAwxR5MAwuCJ2UVv84HDbLzmo1mTzVbnwI4n
         P79FD3swqdSA+dKXMXleoLB1MMVShfOq4Mpvk1+ql6feFSDNX0OI8KYz8X/88+zUZU9E
         6noRGtCSE6DwWKpcb3Ch5dTYn7Fe2LBwlozkPrNc44kBHxFmeaSvBKSHkSHT1zURRc38
         K4fyf7Jpqd31vXGCJsLf/5bIZFjlbp5ceu4/IPlLjOGmeAbYTXVizTX2rQ4wmypmEI7Y
         3F/g==
X-Forwarded-Encrypted: i=1; AHgh+RoQ3aUShYfvricJl8EAzBMLD5IWd3Toin0A8zKA4WFgIrGKjHSIWJgpnP/EaBGytnAOHAG+mLj+utkc@vger.kernel.org
X-Gm-Message-State: AOJu0YwsOTYSSD2GbQsyDAXRCFy+ozI43V2+9PqQzG1IQOL2jgTPbnLC
	oo8A1ske70YNgVWhgKCVae1UITDMHDr+OVFdd3Du6bizqI6hjIg5RtMJZ7MROTkPfEI=
X-Gm-Gg: AfdE7ck3Q/PCbMmR7lLGrLc1Q0937GJDFNbKHdEQ/5CVJ/0hlNJfDaqVdThxWgZaohh
	Ah5fgMPVwNbD8i4vX9GLBFwIIsLsDquWgl8CJIuqvMSkKp47qq/awvYFEclha9tN5rKQeeiNSq4
	EfvYAmGT8gbZYbg4XOMnguz2tOUICY9dC1UmTs4D/+X9IKnjn8Z2eB7jtMp67FIwahV9S6HQ/tK
	TtJukBInmLDeq+98hzCkTmaJF7K9nf2FPLDCq964rhU03Q8zjUucPTUsoZGofJBwTg7QI2RH7hC
	HVFGcXJOM3Sk5KsLBCQ7RpI7blLnfCZAu/HhmkQlNdB/CiZnGGYdb22rRA/QdUOg7yszRFu7Ihw
	Mtkg2acI9U9Hd6h/oO7zU7x7eZW8mMTMSJg0X1dsi7OjsrOM15IAlpEJlYoxvlOl2obQcSpd6Fl
	xfXZueIzu2h45CNe/2lnjHRi+Bg17Q4Bpq0U0hAEFGVnYwlJyrcApeW/9m0JDt9t2GwXtmJOPLM
	D6IY/eC274=
X-Received: by 2002:a17:907:6eac:b0:c0c:bc4d:77e1 with SMTP id a640c23a62f3a-c12ae7af191mr400864966b.37.1783061511326;
        Thu, 02 Jul 2026 23:51:51 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:50 -0700 (PDT)
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
Subject: [PATCH v7 09/16] arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
Date: Fri,  3 Jul 2026 08:48:59 +0200
Message-ID: <20260703065110.1433283-10-dario.binacchi@amarulasolutions.com>
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

