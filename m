Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7603B0AD3
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742976; cv=none; b=r7cUEwieFKbk4x7eDSN71QH7W1PyTFsJ16JVypw2IIDoe/N+2BZwSU/K+iCdm2LkzZnaAgTC2cCL8I3yDvdpC3ENy5Fl+dvymHrh/4arXEsznf0CjevauY2n1bn0jijDnYdYibnC7+2XEoI0/D5moWV+5K2QCF+JfNctPLRMPTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742976; c=relaxed/simple;
	bh=H2YwgLpeEoUgwkXMc0nAyFKniAzF3scYINRPengKJHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=st5xz9V2jktuhr55V7TWonighsJHFx3KbW/UarpUFYll0UyOmD6LHAC9R6kDFei/LaY1JNQDmOos6h4kCOIA5MSkufrXuBJ6QpIb8wtDO8BLUi4Ik/Cdk9Hz3vsaiqjz8OcyKgtkhilhlTjN4yHG4OUISNNVuTBEVaGnJABa/K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Yhgt83m1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Yhgt83m1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so16286085e9.0
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742973; x=1786347773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=Yhgt83m1e2TUnijODNh2qEWcq55Rm5IPLGMlu9qeL9/0HE4wmIPUl1XT4Ev7NVfmp1
         IP6mG4vDVcf2hTjxzqlbXIgzy79U8GyYe+F3TMDmWaE8u4zkX02gsHTgmtbmKm5tu++G
         ogPdnazBziUQMczgl6i8pgXgNkozszfVnDwms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742973; x=1786347773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mf08+e18iQyaBCmXia6is7dzqtiU26q8LvKBSudwg7A=;
        b=IwI62SFWlnpcIFCjDS3cUy6IT6qvfY5lbuwDvY5sc4h2cXh34/L/ZnDCqYM3IPQY6s
         G25EWxykuMNd7sVOdIpfb2gj7Dg6TOz6o1dnhF2/kZqXgunUCeiKS/kR8HgjsZAnVlgH
         GFl1CK9G2aKOSru4VuMxhykBetRNv9DuHIaa91S+1NUf1cuPwwoJxgc9kf0nb5FdDiib
         OSqhq5eX9RHd2VD0jNPSG8zTDVt0QCSUi2AHiKO1mQuFObCAFyVeddKQGs4GWMUqxLy/
         V6soQtr0+o2Rr57i3UaKFg3A7bevyzxXSQ7EqmmNY+tGm1tHqemww8QE4P56GO32helX
         koSA==
X-Forwarded-Encrypted: i=1; AHgh+RrYSCFsxozK3YMh9LTmWXbHSuE4NYWtYya18mkE+LvVk2rM5gLBHaZ0sw3U0yZt733Qp+aSBOzC8ILS@vger.kernel.org
X-Gm-Message-State: AOJu0YxRhDc97FYo453/SxrViYDV5dbyxyvuC5fz5AS/c02Cg3CW2uHI
	+MQxW2zRnCcSfuRm9NYFPz9tdPF8b9fRnAKvcJQXnartlyNOT11/HhOGu4g/q6eBqME=
X-Gm-Gg: AR+sD11nHQqPA3bkaEalj6qXjuT0m2fLXwgdaVJP1zCEi3Mtomyy8cC/qyWE4Zx/5AU
	347q8/wO7b7K/CtUpnDz0B9HYkGINAyM5tFdZRgC9Fy9ex0Yum8UVADoyWg1h8crGhnd8idcD2S
	5GkRdxCUT04MlvAeaYEk+SWrCrWKO6ngf23R6Af6P+gugyNdj1d8zJxhZcV+Qx2u5oLwzNVTd+R
	XE0gKYAPZRuhrRRGL/1ARDZ0IS2HYCyh4UZRDjAF5CbbXM4eo15F0Sh5MP7XHqfKG2XJKtrMd+9
	ly3r5bfmMsJJ/RUVqWN0Lh50xUdwSIxfCPXvaiRGH+MTce3YLo+PkQO2rAebNrCaIH/xuc/E7S9
	3QedA/rNEWpbKSx1Sk8Jlv8Q7HV6g4AdTumEA4T1kfzQctMp20gx8Jv0+ttp7D44IBLMbFshGcR
	PnnX3vxpLyXSJZiHbWK71Ko+b1eV3ermH4n54uDWTwDoHnzgISI/O2baJy3I5or55FBb7s58bgz
	uZD8u32HeQceulFSJQos499X6R9K2LTbH6pKDiXeeOli0mB5paBr22tPgZA0LIN9/CgBzyCpdFZ
	oR6MjquP48jBd9PvyIqCcDVsGclitprY5GkNLZXP8LwO/asHGRjM3b+BzEROvTtC
X-Received: by 2002:a05:600c:c113:b0:495:4811:d71c with SMTP id 5b1f17b1804b1-4980c674e51mr154429905e9.13.1785742972896;
        Mon, 03 Aug 2026 00:42:52 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:42:52 -0700 (PDT)
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
Subject: [RESEND PATCH v7 08/16] arm64: dts: st: add can1 pins for stm32mp25
Date: Mon,  3 Aug 2026 09:26:03 +0200
Message-ID: <20260803074224.3821911-9-dario.binacchi@amarulasolutions.com>
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

Add the can1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 50f454630cf2..6482dd47e977 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -331,6 +331,28 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	m_can1_pins_a: m-can1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('B', 9, AF7)>; /* CAN1_TX */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-disable;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('B', 11, AF7)>; /* CAN1_RX */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	m_can1_sleep_pins_a: m-can1-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('B', 9, ANALOG)>, /* CAN1_TX */
+				 <STM32_PINMUX('B', 11, ANALOG)>; /* CAN1_RX */
+		};
+	};
+
 	/omit-if-no-ref/
 	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
 		pins {
-- 
2.43.0

