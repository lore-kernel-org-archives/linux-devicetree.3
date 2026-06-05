Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910D5408002
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 06:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640962; cv=none; b=NXvoMaZk5rVmQ3CTOfTYD5SfYSmizinY58QvP2+2kAcswNrJBNXRP7Ly/niwCz9y6FgWT4PH9CM/6PYCuWF944V/ouasgKffhigvuqV5RzPxpi1v6M1FMdrgFobySskKTBfT0xSpv/2bYq3DFTmgMKHOimfM8fte2GsENuN9l7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640962; c=relaxed/simple;
	bh=6zuYDkkbdS7/04DL+lA+SktZDCLWIJ6OBZecU/rAVa0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NI7j2yES626hIy5VYdLex98gdMN4GKY1s/AdD4gr8XYwXd9yVValx0Et4ILrcihK7L3OAojSLB267yNkKVdUD69e81ZEFKi/VFkUgZPgXxP+A/f4rk7wp/Gpqttw5Uy2i9ho4L7N0vcgvC5kG63i99HV5E9x/YIA67dU8ncHNnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=bxZonteU; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="bxZonteU"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4903d730b1fso15797845e9.2
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 23:29:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640960; x=1781245760; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RQ9iUdpaW/UgRLg2/BpFwjAvwsUvVTg65Q7BjB387tg=;
        b=bxZonteUQjmGThJvsq2A71g0P+iIFkb+NEDN+Vu2FgF8ZEEAw63qXdpm44btNv4N4/
         nJZM3LIFclxynZ4RMufrQaHvU6psQrpC7uVLDOhAfDlMSrb4fDeo8CwfHGVzEzn6kzVr
         VWeliV1JZXobxUCEAqX0q1z5wad+Fqlv+CgTU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640960; x=1781245760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RQ9iUdpaW/UgRLg2/BpFwjAvwsUvVTg65Q7BjB387tg=;
        b=KGyO4t2DNlZ7c5L6VTIs3g0PsViUTGdNPHE6mkFf9mi0hu+KgAEu9r1TVBT+mJ8T0x
         UEkZHoO9HjLdwCEGCDoYIjM1+vuYv22GSOBUfsTC7B9KTyjO3rME6LrZvx/UI9zy18S6
         Aoh274sdToRcl+9/B3K7/MOsm+OexunWd/ytE1+VcCif/ffef9suXjKvVHqLTuAgcpvB
         8paXjYgDg+h4EB/o5u7kTdnY2SnIxYetWWFJkG8VvEQmX2ju8y1KXCqykBlebbK7esy7
         ORB2RqSb9YTdVq7Pxui+xn/Olit+kV4pJ4md9uK022UBb749e7LX2FmGHAQk7oNuWRe6
         9QgA==
X-Forwarded-Encrypted: i=1; AFNElJ/imRC8gDlFHtNwGdcWhaYsqkH5Gvasul/NFWkrrZiXfPPb639K+s9buOz8KZ9TXhuYT/dWElWnDFmO@vger.kernel.org
X-Gm-Message-State: AOJu0YwOEpCdRymYa3GDQdUWN0hlhfF8STJ7YWe5vrG7uDduE6sjJAFs
	JUkxq8O/IZGbnHUZ+/+npM/ciosXLIA+Kf0yfe4Eyb7z4ifHROj8hpMCNfHU7CWJLWY=
X-Gm-Gg: Acq92OFPp2GcqiRnqW6kBlvzJBgH9MnIJpJdp2tc9Xy4bAazQxRhbmlg80V1laiv/aP
	yaaPTJqj2HdSc2mRm6/oFFesnXnhCb1s7nKr15vjqD55Fee5W6ZisEUbcNjXopKUTGFvHy5YoXe
	EwFoSxk3Gi9wPKC59k11s0M8CvLplk0E/4gSHeJWweMsR+2g9OY5IR7Mwnts+hqPPVPTtAu8fsA
	g9NllLXRxQO2+6WFj8E7lmeYfbtV4/TXW7DEHxwai8uW3+Up3JdAPrQ08emRYwqo6pGD748SA26
	o8vLSKAq1EU8kZfNcZGJWnqy78TcbBYeoPlCfYJD4mWz7c68jiNe9Q+fERVzXrYYO5oGELpLvKv
	/85ntMpsptwM4Mk3LfX0znIgK/5bY77WEei6DSjwFjYYY1miMdv2YSn8nKEbJvwtKGzDpTMFsjW
	5AUFUhWJLTejFHtbsO4udcYGNUNLvfUuYqBv6Vqh0pVTh0gtFRf7pUiexRCBmSM7zPODDs3PGGz
	asFDPkuIhZS6sS/gO4US98FBE6WIQ+mdhon3XNLB9MCV4WbfW8DNk+vISdEX21izEcWD7RXYAwL
	dar+c+EBGVKfayP4SMGsdmbz+vq52i2PddCer3mQhaOL4w==
X-Received: by 2002:a05:600c:83c5:b0:48a:7a10:4f17 with SMTP id 5b1f17b1804b1-490c258f424mr30412265e9.6.1780640960028;
        Thu, 04 Jun 2026 23:29:20 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:19 -0700 (PDT)
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
Subject: [PATCH v3 07/14] arm64: dts: st: add pwm2/pwm4 pins for stm32mp25
Date: Fri,  5 Jun 2026 08:27:35 +0200
Message-ID: <20260605062900.368376-8-dario.binacchi@amarulasolutions.com>
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

Add the pwm2 and pwm4 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 4be01a6574c7..eab8ebe71660 100644
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

