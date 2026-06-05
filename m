Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA86640B6E2
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 06:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780640969; cv=none; b=IqXCxKUAHiSP/bjGldt0Vc9T5q3iKRYeOwCzNSMc3bT3Du3zyX2vxL64mL0582rnmDZF8Ttwp1oouDveaLmZCiD55TGoO1qt9TNQxrAOrRnLqLXf0tnABK1moCakuwudcSgIMkweGOa52U75TupAkvowJyzKpLB5hhIS860r/R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780640969; c=relaxed/simple;
	bh=H4l2qG+pGEJgFcb/52U52UrJQhd3/X4OF9BCeqi+O+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mq2LXB3a5yK7xHmFbfv/nOryFmMemF0x8c1CXQBm0Ikr/0JUwas0p+vofe8urajfeVVh0M7m7Amau8hWnLcOssxswDFFTP3puKES5MlACcBba0ue7sZ7LtWeemN5r1SiGVDNN9WL/tBa81EapnCe4+JVC2SDSsuyYQnZ0cGe4NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=HQgQN/TI; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="HQgQN/TI"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4602e2a0372so818099f8f.3
        for <devicetree@vger.kernel.org>; Thu, 04 Jun 2026 23:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780640967; x=1781245767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Cmtnz5uL0NhcEWKME+3YqiQ1Tn3C+OdDm6ovZMriaw=;
        b=HQgQN/TIMgauEisgWAXtDihlL6Pukib8DFyYOwCPO0CDCtGRYX3OJEyLIOujUZykwX
         FgLdljI7fVIv8BQ8tqUZVsZ0klmfDB1bHtU/Uz5YQ8uq/zQqXiZpm1wsoQe5HjDI2lc0
         tvDF+yPnby5RC6/nv5FT0ZTadFsd+xBKZU/ZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780640967; x=1781245767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2Cmtnz5uL0NhcEWKME+3YqiQ1Tn3C+OdDm6ovZMriaw=;
        b=Wkv4VcpZ06/qudvTLETGc8+ODVMYAkuRNrb5vdh50Me6i0BqVpYtWSmobjhJmbf7aI
         9b9jkoKyM8c2vNlNsgYtMBJkSj1ipVubI4GfdKLldwUZlaajuzXOfzJZ/DU+BZgW3qwG
         55UqnqNrNP18s4IaFsTJiCtVFQDLzAlbc8XnKx6IKK9RS6vsnIdGU/mtZLLIHeItBgs6
         h1q8FE6s+ApYMlgIjTq5yxSlSPNC9QYU/PoJrZveA77kS8P5g0LeWO8GYovIqlx6Otwh
         /6+7N9QOrlnlQHck7F+qgrKVbvjGatzu5fJ3YwTkzgTAaRWc9bgngl7KocRxIIzfIkkk
         HKHg==
X-Forwarded-Encrypted: i=1; AFNElJ8DaQEAjAhQnOQp4S50aag3tLK8xbrWRcaRb5eTab1OBsgVJpUNX1kXEMbdS8WSKlCS1Ff3WJNPjh1d@vger.kernel.org
X-Gm-Message-State: AOJu0YzX+yh7uqRjFLrQRYl7T9AeRaC0VBkTs3Ay+IJpKRO4QeloFQKS
	zD5USyiiSsGnJj1opcSFz/sbDOla4vfNfivNYvkiDsufiASntx8oZq5J3YFU70oQX5U=
X-Gm-Gg: Acq92OGWCYjRzqMnqvIDJiE+aX7WiztzN+4dQE4JmuPlmbcAOzegq8EIsL6KgRpylQV
	bLi0R2rV5M5zmMCUuCwzjoyu9IakXGH6Gj62IqJtBR0g7lYrOz1giIrQwZiym+RZpkg4dJ5/55l
	asm9e7NhHmARMLuxpjEcy7GIkaPQ5AUGUyztICeZShqZ6ptjhGExwYW63X6F2uZY0MZjqWuBpbC
	1u3wR20W/oINJU9YfgxYbN7WvCQIxXqHs9nan/JN0xMl8keufcgD7kH+XU1gd6iU7hLGwlSntu8
	gWUCtnyFwgBOq2Qc3XILFBfx3BjQbQPUw0t4p4/IziRiTA1HeMR24f6zYOi+0iCWRJSzl8QYi+w
	I35aGhJZBBMBz9W6T7EOrZdKs+o9eL5bBrV77FysRXgZEjCo/LzYRr+S6x3+g4FcaPiaTFknvKM
	0oRYSjQpsrLw2XQrnlGaKLygYdEMEBsJJ27xzAaBNXAmI5GOS1asljcTIPX9b+8+C43QCqK7V2V
	CB/zkGGoQ9V8A/MeOvm5HNk4AJRNDU+/4E1ZPkdtcOPe398DMsodJdQSJ2qVvsQGJKbSQdtSDio
	3ZdXSSvuJNSgGAKH7HdeDsvS4WZLCuXDsb2uUXOjD7Yp8w==
X-Received: by 2002:a05:600c:818c:b0:490:b0e1:2161 with SMTP id 5b1f17b1804b1-490c25b39fdmr31776185e9.2.1780640967237;
        Thu, 04 Jun 2026 23:29:27 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344148sm23022648f8f.19.2026.06.04.23.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 23:29:26 -0700 (PDT)
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
Subject: [PATCH v3 11/14] arm64: dts: st: add usart1 pins for stm32mp25
Date: Fri,  5 Jun 2026 08:27:39 +0200
Message-ID: <20260605062900.368376-12-dario.binacchi@amarulasolutions.com>
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

