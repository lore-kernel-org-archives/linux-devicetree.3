Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC22D3B38BC
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742993; cv=none; b=PgjZmrBW4ht8PCAJGpySQX9+/uboYv2SyOmDcKUHB4fv1rtsB8PSYroSq9h/0JwRg5UrO3ccojrjslpxjopkIMlXJwdnMrUD42GahosiNnCosI4G0jwC2pSFPdTdKbPTlFKcpE2YwFWJwg2jCShkkxW/0eHT9yN1He9zjGH84O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742993; c=relaxed/simple;
	bh=aj2uH9b/bfRzOkvrPYZ2176FA4QkmEK3VTNxofNEdQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dQJD7TxAcfuxwIsRgbDwP2IxEA+GnCTW+x9m3KCYUXQ3CA0jyoAMR8BAzjB8FlQMiWuXPMmZyGi6gOXeT3X9U14Qf2M8RLeqmzYU3Sk8qBmDPVgzYBAPmMsvxnpId0DMw16Tl4+dowUeJmD8qHGu+ImrqtlHffPGtWJf99M6LQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=AjDp3DqZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AjDp3DqZ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49800c6a846so15046545e9.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742990; x=1786347790; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=AjDp3DqZ471PbbXUJ1x9nQwIOhKOMLYnxcI52izcx762fQPuXZ+ONbUIx6BHRsv7vR
         sb1nG6ZMwhcwjaFYjG/+AUrFEAj+AmjXU2iT/p3gnJMRLTUSsSlBq6EIWokSAlpvdXww
         5AhEQ5MoOl9PipVbIxYy14FN820OsBCNj8zhw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742990; x=1786347790;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4P3RDq+QoFIrungFJ6qmguRlrjE9G4sn4ESNQyuys8=;
        b=a6enpKfnKdRJXY0dgqLsbU2+sd2MSMaEZA5YPQmGTzQdRwE3ds0bQYQvcE1jrD0kbm
         mIAdqH7oinETjmXcBkrk0oCoS6dWSGsDf7RhzzVidk/3NWqBNOfMYf0YeeRiS24jAYAy
         6Bgax1Y3xRslUxBuU3zsfZh1MYaC5Ax8P9ZOtkB0xH+EcCZ360vGAa1nQAyZ0gIQgI2A
         WTa0td4tAdYoDsyvVxsCIXnO0WtybT0PxzShNtqBVTDVIaoSZQsOkP5RVYJBm1HJLx4M
         M+NlT295NAowLHU6825Fo/0BSqDHh3ZyaCQXcFbXgYY1D3jEn2AYQFZI1Pa7SXrIzZsA
         eRSg==
X-Forwarded-Encrypted: i=1; AHgh+Rqip+5Oq3WJfiVUVEd++Tbe3pVGLyzT7d9VBXtcFLqegjKAyxCOI8tEime6Z/J3YQ4PKyf1mh2YNimH@vger.kernel.org
X-Gm-Message-State: AOJu0YzAcQ/gKq0QzSXBFFqK5w8QuvDmhF5QwQA7M8uJnPbw/uXELIi9
	NOf1dEr8XYooPcXSDEYvHsBvWdHg/kf9+oyFBypqPnu0gUy2xtjPNmkIW4h1/VJCZfc=
X-Gm-Gg: AR+sD11rwpe2ecxcPkA5DRPgpU6yie5fP7/Pv1F+Fn9FlOn3M69Lucghf9SPA7YWJRV
	gdl09Ur6vIruXont56WAAq3L6U2EanwE5t6CoROGWJIkHZYaYlaBU94anwjLvWV4numk0kcs602
	UU/gMiKeBZ4X0sz05TDseU0G9og/8vVvGIEhYreSiAFda3eh3+mnQ6lhSR+EpH+pE1zSaFj24rr
	8oKMdvUkhUMFmvdfv4rrGr3jUZEk+/XTgjctUw8gieEJ/YgMSFWGZV6tLDnzqmHyUhcG83R+GLV
	BtpQ9qurBSAdGEUlj8koHj6vMD5Xh/xxzRMl4wkWL7SEzdipwqH6bG/Fao8b350rRAfHyvd/QYl
	1Xaw6O4BiI8HcYdYcdWTSm7ASQIRxc8xzHrh2xUEJNAMsvowIeiVuwhSaJdotf0dYMt0x9goFzK
	GnkL4zWKnO0hsfLCFazy6H1JRc/Wx0hSVS8LaoRTgKGSaMdKmfe0/Y6BRbEKUbYsTBZwv75LEyU
	4ve+EbnX3mSYXm0OWQ4Jg3N0FPQ83lCVMjjINMbW5DxYcxqWnlNPKlpYK2Tytg7ZPHZSlVHwBua
	TSETA95GAESSZfzwXmDs8Amyctq7FFuCtWCBRXs2f03dLUNWAAj7q6/PPvS4gO8t
X-Received: by 2002:a05:600c:524a:b0:498:28b:1025 with SMTP id 5b1f17b1804b1-4980c66c838mr180454545e9.5.1785742990105;
        Mon, 03 Aug 2026 00:43:10 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:43:09 -0700 (PDT)
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
Subject: [RESEND PATCH v7 13/16] arm64: dts: st: add usart1 pins for stm32mp25
Date: Mon,  3 Aug 2026 09:26:08 +0200
Message-ID: <20260803074224.3821911-14-dario.binacchi@amarulasolutions.com>
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

Add the usart1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 4e570e2e5157..d515e44832d7 100644
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

