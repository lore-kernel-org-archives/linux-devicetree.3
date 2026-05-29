Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59FE3F8ED8
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 14:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066049; cv=none; b=OlGSlJRFVEInNf2QFkHS9evOllGdPcw2y3c+uBmiH/mO4XPlbtQaJPOh+4fP7811woA7be/lhiPoV2jkAZoqnnRowImX/JBhKlJrLSeErgAg98V6MQoc1UQY56c1MTNXOhJCXNapRInwqZh5uXrpjxDWZSXHKw0oohakk8M1HLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066049; c=relaxed/simple;
	bh=J844s6CJDpVgbP/YQJjGJqkHKNJYIZ5Jgwd9Gtevtr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCBqg+FJXLWzRAnEj7cYodRtgXcd9b+s63LD1EdpFQRq31l5z1FgMJbMtGFWXehGZnzXnvEw3rFznX7W5EQRK51+XGPICHPaZmJ8xprkqM+u3g8vAdfwZdZFXWEfjoukQsiyecVSGWcresQWrqQmgR24z4fTSu2kydoDCjkow3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Oglu3qDO; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Oglu3qDO"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso75786395e9.3
        for <devicetree@vger.kernel.org>; Fri, 29 May 2026 07:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780066046; x=1780670846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0e8wESPhIuGnKBPbF3YDifoYbOSIP99q8OpeirAYTs=;
        b=Oglu3qDOLsYrPSw/vOk2H04jdUt5XqQ1wEaewggM5PpXsDbz5dmZxkxjTZUgR4meQi
         7CaPY8m6ai0t44orq5j40HH6edBm3AuS+IjrpXT0k6gJ2oFon3w7R3OE1Z9eYKSbvycB
         QW+Quw6o/W/GA01d6GiyEmbkeIQYJOhG9rmqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066046; x=1780670846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S0e8wESPhIuGnKBPbF3YDifoYbOSIP99q8OpeirAYTs=;
        b=XDq3D5ZJ1438VlxTQKb5v5NxlsVK5+rt56HI+ktK4J5i924fH4zC9M9j2Ob18I9D+I
         3Lamw5iTYZIHkh9UKX5afwZ9VUIIYiNpF/1SzOsRme4IqcqZQ2EHEFOU1xCKsV1a3PJN
         U8bJeC3jIdnWk6V+RDH1s3QtZVEUZ5AKKYMAkVK2W7Dg7SKSgsTwuF3ImwyBt/CLjKDo
         XI8bTgEH+E2gI4kCiALlVdXzSTwdKE9hnBFh7bPYM4pPEQSgfBiWIwivTodDDRDjxwmj
         0NIzTYmNGO71yoDjFXPofAVS6oZInhTdvYMQurhJeH0wSA5bNE0B2Xnh/aBNmxjOoXG8
         aNNw==
X-Forwarded-Encrypted: i=1; AFNElJ9KLx86Je0KZVaosKOasQJHYaVDqD18a99CqOGMU39xgU6qKmMKypdU4wKQjuyNd2/8f9cXKM/pTqBp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/zWK2OHt2G7CRzZkilKskp5gdpKHE7z1n4TbUyTxNcVz0mhBr
	t/zf0pjCK68pNuPR72UO83R5vMRtDjGgkhmhQnBZt8dayr5gz/6md/mMWtmIm3DQcSs=
X-Gm-Gg: Acq92OFFN5wXWLtZHifUaGyjPxEbf7cDigm0hQlrS7kRN11lT56SlvAJoZ2gB0bCsuZ
	N8wPlXFa7ZTsrfBknEjWLLLskrS7YyPOcmLQ6tBTjfbIS763lXVuXIGY+8HW3j7xcAgGwgiajS+
	tdZh+P6wriq1dnagPbKqqQGpwywO+omxpBTUB+Tl6MilYX0c05v0IBeKQIjqxcU6xylpcF3xr3P
	AoSnTGtwCkppyqZJwVlLTfLlvxtjhUP2cINlUnHSw8aAP+xTFV0lnt91/1BHYigAi7bybwbl3IZ
	n2eRFsYJHMbzvjmkWrQbpZtP/hyPdEve1fi+UgQFBD7+OpKASncuriJGvT9cGX9eLo7sazl1Z6f
	e2k1PnpGvI04hcCd5gY3Y6epTe6/XpyG1BTG9pm9Z7zf6sKHlhjEw8pFmHVpejvn7AgFGypiXC+
	srTxcTAC8HI3p/45qrXPa1E8M/3g2+UD7E2kkn2x73icN69kUG+88Jsy4Gz9zHfm5YnBDehRNyX
	WZ5/UIU/zw5UqiEPMPTqH72MK2JylLqyj6W+RrwfUAYXgcDEwo0Vh70anI=
X-Received: by 2002:a05:600c:3212:b0:48e:5d91:cfe3 with SMTP id 5b1f17b1804b1-4909c078fd4mr36226805e9.1.1780066046319;
        Fri, 29 May 2026 07:47:26 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm38694785e9.10.2026.05.29.07.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:47:25 -0700 (PDT)
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
Subject: [PATCH v2 06/15] arm64: dts: st: add can1 pins for stm32mp25
Date: Fri, 29 May 2026 16:46:20 +0200
Message-ID: <20260529144707.3931919-7-dario.binacchi@amarulasolutions.com>
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

Add the can1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 05bd07a0a561..4be01a6574c7 100644
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

