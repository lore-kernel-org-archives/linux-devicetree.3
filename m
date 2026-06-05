Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD5F367281
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662019; cv=none; b=NTgxWMAef8T+EkaGHnoNDluu1IzwWwbhwZfklYVDgINFn/GmQJSkUtv2cUtYXH23L+Ol72XS2BGqQczLMCO9C7T9HSZBRJitfXq6vBhw52n++6oXCXXVSuvAUb4CqiOF3g4FUHJGWc0BC6aaHMLc7qH+YCYLQlp0BVtOyamH24o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662019; c=relaxed/simple;
	bh=J844s6CJDpVgbP/YQJjGJqkHKNJYIZ5Jgwd9Gtevtr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pk3ubeJ354Xezt0XLMD3gYIuFbgmb+uJ15+5bKcdy+XWNgq2yVGlGam2UOMKKSZPhwiaGR2Mrx8SpA12ac1ujPjKDXxj2CJIQHABxoOPqhpVrIqUIFlzZ28MoyFNQzNW09VCwIXYUgEbVJr9u2qt7TFziUr5UrgYrq8c23zuek8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=jbLicza7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="jbLicza7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490b64c8311so21650305e9.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662014; x=1781266814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0e8wESPhIuGnKBPbF3YDifoYbOSIP99q8OpeirAYTs=;
        b=jbLicza71VAlHdAmXMdvXC88Opm+/Y6EKFJtRGnXVjiXxSMRpdorDo9QcoAcnClTaG
         ZgLYMPMgJQIc98CfR1vuOKFA7jwPG/CVh+fcaZ+SivQ/pW7MSwh8JZVK4mH4JdOKeBy2
         Ilksl5EUJmzgzFXQoa08gj7gHfp89VZB72rkc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662014; x=1781266814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S0e8wESPhIuGnKBPbF3YDifoYbOSIP99q8OpeirAYTs=;
        b=XgQnMJmFrchNfBH8hjhRcavTIFwyKYagQmA5HwoEm6pesZdq7pauvOuK8hv3+3ri/B
         ryYorpTlzAUuIlBOFTQkMUM6cOm4PQunbgtnNGQjxO3c9uKsISsJPGgyFOvzYxdWW78G
         tpZ3HRo//cD/ZOlFUmI7VqRLzCvBUaPfCL7+iCEHx6gUTsJbG2KCbprOJ4f+cHufh+Ez
         u22Z57FiVw/iJV+SgJUcDXgSkz1wC/U+oBpFHtFE8h9sREfJXaGeGW1FE6/Hxq0xGngP
         nPErbaoLp6NGXTkEe6U9ggh8VsJXgqA4wNKtQAIGFSv4RUVUkxnVn3AeC3FHU7lIK7SM
         Kx5w==
X-Forwarded-Encrypted: i=1; AFNElJ9UbJ2Uar3pBV9etLpi7kZK27aW5rwgyGc+UbIGGsWSsiWps73vnsD6d/cZnlfyQmGpeYXRVkJ+ZtxD@vger.kernel.org
X-Gm-Message-State: AOJu0YyqRrHGtCzuoEfkf5nyebsZGS/i7Qpb8kCRfbfHj/CzVW3EnAUj
	uXUTEJ8NeWXJigsNRfIGL0R/wdPBM21nn+PoYsVCokfKG55rW4iONz4GbxNrljDhpcY=
X-Gm-Gg: Acq92OGofsltCUSFWh7aGwRQm0aFehwJmcUy502OuT2zZzP0zO2EQzXhEPRSL5jSpVf
	7CVqCcW4VpiV4PQN35gn/rQ7TqL4qLtlIg62LjP69y2DEnF0/+Ot6ETWCXL3srGaGTTqa+c30nx
	A5MvqPEFQXC9cCMBYvrFhW4pfS0Mxp277yVrUiqgI7KIK23KAYz4IGsJgZF7k0UB4ux2OUpnTba
	5IdXe/rL3Holr6IeYK9L+AFUTY9rvm/WfJWrTbm0EF2p4oN7wknqDPUdZbZZvmkoeLOGH2AtW5u
	255t5aKkvIaPTH5NMMNnlQpZ04C0bDDBX0UcMC9mDZSjIFikKiM0ePQL0lAJ4SlDbhet3XU8oqg
	Q7xpZYC44bH66eC0YReK7HMGRDKcjt4vzlPb2L7Ue3dw10FUUyozJ3ZvjZ2ADbnzt+5FXpcPqEw
	Rtv1kRE+r9YGUOMvT8rH5IT6OZ/gnQnVqxuPamdmLKJys+ftQ+gO4V7h7k6UAV/m2uI8Pc1z1F/
	O6BdNULZYfKqwoHpagVMa0brg31cXOeK677uXJrz6jsCyv1TMHlxTCVc8MJJxf1RntCAe6Oa+i6
	hOPO0tmvl48nBasrak/CfzhBxAkLgbgeJrXubKoUY1bq2A==
X-Received: by 2002:a05:600c:358d:b0:490:958f:2a5e with SMTP id 5b1f17b1804b1-490c25b22d7mr59154005e9.13.1780662014287;
        Fri, 05 Jun 2026 05:20:14 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
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
Subject: [PATCH v4 06/14] arm64: dts: st: add can1 pins for stm32mp25
Date: Fri,  5 Jun 2026 14:18:17 +0200
Message-ID: <20260605121957.78409-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
References: <20260605121957.78409-1-dario.binacchi@amarulasolutions.com>
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

