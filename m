Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D44E443CEFB
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066058; cv=none; b=PxDPe06h5/klH1u9gCwEJovXiWe78gUN+bBEvM2xcpNEpyIjGdEjMGx8GFqxJZvOZsIvqXikmrOiXu/SZypS5EkzIOfZ+QxGn1B9EyTtFPBgqxYyrQR8MRBWoLmabG+Z5n3IkYta7UNzqNPNPW6TRCsGAhrJQzW9RIMKdAgMJMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066058; c=relaxed/simple;
	bh=H4l2qG+pGEJgFcb/52U52UrJQhd3/X4OF9BCeqi+O+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kkh6EeecKwkzcK9vpbAu8l9jn2GGLyGWXHqG0+kjsCDQgGBJrKVzofb6kt53n4NtvGAxApbx2fXReM1w4uWatDrWRs9JEHPpWuvWe/1rwonZwIs3PVNxO2aKEeEypMHx68SKyg/+AwYfM9pTdA3nMwEKn5ic6Bu+n3ZfKi76tSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=kiStxnC1; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="kiStxnC1"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-48e8132c6d0so89581995e9.1
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066055; x=1780670855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Cmtnz5uL0NhcEWKME+3YqiQ1Tn3C+OdDm6ovZMriaw=;
        b=kiStxnC109BlzzOqjY8OVSgzKYbeKX47xwt3aAHj5Y5y5VW+iSfvnO3zoYvxY0gxs+
         JNGo03sXQ7PTNmW0xe5SvgR395HVoCstAm3LkVNsnEj4C/9bxqmVuaquTZy7H1mcvY/4
         MFHhhzJMHxlPq6YxwYxQ5hmJnKkd2Fk2z9RB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066055; x=1780670855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Cmtnz5uL0NhcEWKME+3YqiQ1Tn3C+OdDm6ovZMriaw=;
        b=Vf0q54OAtdhBf6SxbgY8gyhCDHcfhalk9oR6G+ynX3uswhyYmw5kGfLod0V6kljUDE
         IaEcErCeuuDJmKh34guD2eT/zD5PlC+1tQAipzvBB5gjp+dacBnucy65QLNSCorTM4Ns
         DJnxmkjpRpWmrK1krKCDxd7JYS7Oci4tqmDa7ETqSWZPYN0tB5+4aMkP6V0u2VUIKzWg
         eOZAv/SebWV3LEaKfsKvYzsIwyGxzpq4JU96ztigqEUA3bFvjTBtyFvhiG1wxegP3NmR
         Uxsf09lC372tHUNfLKu1/eiMenNxAS8gP5mokLrutlPeO5rG0hv4NU8AD1ZMTgRBmt5E
         AGaQ==
X-Forwarded-Encrypted: i=1; AFNElJ9P+toWx1tlrU83Zlh0JYdlNOTtEnkEf6tfK5i5W1NnsT0+/9OeCrc8jW6EBaaT0n9AgKf30zAJONqZ@vger.kernel.org
X-Gm-Message-State: AOJu0YygQVAlmc3W4wKT47mf4LbHziNXkCV5zzgJIa0xQil0lv30lIkj
	3Z+dewFEHB41QOLtxOU7ILxBfLueBOR9XnLEoCFAUnclJfYipByWXeTs5TY/4933HztKKshmcy6
	dtVh+
X-Gm-Gg: Acq92OE8FXSF6y+NSH/7Vr64p/tDPGS7sb5tA5XCtzMV/XbPmhrQp6K0NMLceh7996a
	6YxzV/8uDnOIVZW4NDuQrWxJ7jM6KjOCkfXInkG/txIzMz1L7sY9jtd+rSFY4a7LKlXc89+hB76
	tviZ2+ntmDTzBqvzAqQv/dqIhJBBvc14H/LrFh3c1IEp+KR4n4TdyNYO/yR2iYV7MI7VaX8wU7O
	HnDsFp+TzZHsT/Cg7RYTwOZTm4MxMagZgDSe7CDaK3BF9T2tO3CVQh7nLJ1o1F0NsCnhNwDkuoU
	6MSN0HjM73sA2ZY3Zca8LLCqna0LpkM3q3nKUBGaBfVYff+OfdWlczmKSCgfjJNRQwYsbdQedOP
	euTdKrnWkHulgf7HIQ0vNEw+bmF1IzlFfb6zpk58l7potIh6M++EEM8YaQmmaTC6/EvXdS3L80r
	Ud7Tjuk1bXi2f+gNaDnon08Eg5EacdbzFf5rgGOEa2fNKYxARK8wxmbAQBR7xfsc9+qsVo4FZtD
	tPv66GuXeu4b7D4wnm4wRfEUI3v5jm5UAQ/1B1V/dgBqH7I5Wa0frN50LBuaInS2Z/ahw==
X-Received: by 2002:a05:600c:3545:b0:48f:d5b8:5b07 with SMTP id 5b1f17b1804b1-4909c0d67e6mr59175955e9.20.1780066055347;
        Fri, 29 May 2026 07:47:35 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:34 -0700 (PDT)
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
Subject: [PATCH v2 11/15] arm64: dts: st: add usart1 pins for stm32mp25
Date: Fri, 29 May 2026 16:46:25 +0200
Message-ID: <20260529144707.3931919-12-dario.binacchi@amarulasolutions.com>
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

Add the usart1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 46c5197dcd63..a72c458b2c6e 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -766,6 +766,39 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	usart1_pins_b: usart1-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, AF6)>; /* USART1_TX */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <0>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_idle_pins_b: usart1-idle-1 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>; /* USART1_TX */
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 10, AF6)>; /* USART1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	usart1_sleep_pins_b: usart1-sleep-1 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 8, ANALOG)>, /* USART1_TX */
+				 <STM32_PINMUX('B', 10, ANALOG)>; /* USART1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	usart2_pins_a: usart2-0 {
 		pins1 {
-- 
2.43.0

