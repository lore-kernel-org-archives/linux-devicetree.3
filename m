Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FEE48C8C4
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 14:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779114743; cv=none; b=ZrYMWMtUnORxE5lFWQRX2znenaaIHtPVNRgqZYef21O888FLm+byClT+tJxYNQU6U9QzxoRjImsAhzmg/nWPyw/iRFs+A/ZkSilxlY7beN8EruN06ZHdgM5iyF3e4V1wa+zbTj52hv+aNZ1SbXYjNKjVPNe46oyA2dQ/fN70MXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779114743; c=relaxed/simple;
	bh=nGwZ92KUvAyhajRcMM3KkCE+aIbgk5+sXYIHKn/Ba/A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mpv21cS/2iFJMqZv6O6u1mZbsuIzx8zvgKFe6l+iNsjPxcliRQK3ZEp6cD8FpenBGUoRaD8tBtIFYaMeIKiq3kSNhs2aEjV8BtbcloT4OGzMqS/CldyytGiJFP+5//AGcVegeEV+m2kPrLRaVfgcfBMDpbgGsXJYK3+2ueTeXdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=G+/kqkil; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="G+/kqkil"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48909558b3aso25385225e9.0
        for <devicetree@vger.kernel.org>; Mon, 18 May 2026 07:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1779114736; x=1779719536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWi70U0jso89vNkeTSGJm/hmh+o8WPBNV6P94K1wY9M=;
        b=G+/kqkilGnInKn55f8tujAbyPVVxdMGJwxpGgrIMB4rf80EqjYJzq2yYNL8zgHuHhA
         8/d9VhDPQ3jLYTR5Dw36xPJ5gJD3uifZ5klgQurZriqetrhR/Q6uD3qgbHkVUANX4uQr
         3HHxYvdH7Nic18C0D9bJOZuzHrLdOmi8s3Xf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779114736; x=1779719536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iWi70U0jso89vNkeTSGJm/hmh+o8WPBNV6P94K1wY9M=;
        b=pNYWNTTmGX2v5TGRd6TcNiI2nWGyrS3IzDGZKZJ0YNfLndd0RT0tDs1qzA9vLCQvJr
         UrxxHANGtbOKIRIMGL5rwM5Tf2BqqtH5mGf9NA1zsFvDd+F8KwytPCeoUCLvgTEaXUCW
         5huCt10oCevcohXtm6yLNtslzdO1JscOkQ0z/sQ9w4S8IJeue9v1jDy+D8ww8TWvRx6d
         XuG6gp3uTKfEBztQjfxjm8NjETd7+Alcztrdp7fIYioY1v7TpbjLpvERA3a83uNc99rB
         F1drXaFHRBWZp1CivV7Ixc+S6/9GGBp6pUkZXN25/yYGlXAYTgeYEYNRLuJG51oszJXf
         pGfw==
X-Forwarded-Encrypted: i=1; AFNElJ/9vc+qnsw2wxw7syc9K72r8xx001Ff6wfLGH+H+HgSuuecONKHBPG5FFEFSiyL46fij2rJgZSEI5+b@vger.kernel.org
X-Gm-Message-State: AOJu0Yya4d32KlvZe4odfBtxpSidX6KsSbQK6M4zwJsNVc8UFvqYuQ6t
	wTSXA3X4Fhgf2Ff8GyeP6h0Y7y9jJvLlcB2B648dS8GuAMWwEpjVSW8Snh9pNTGmhII=
X-Gm-Gg: Acq92OGdQNBYM9cBgjPfPwigCcccB8MOpZFQua9oiQFPiHjtdjcbRLXmEQ1fxU5rGjM
	sCctbrqe022TunC24nJOarBbosmkMy8lBeLJFzVDi+2wmWN7aZV5b6THpMHakui8DEgG7Swu/2l
	gu+RR9CooNR3HpUDMfiBi3CORRRwn8wQA6s13DRCjcrtA16Ay0UfVVoJXEt0a4Ms3irrDCHCGOJ
	efryOWtcrogurQO1ZKdKsG/tn4KwoW8l8BtEU9SOwHqLHnEP1WP91fO9SdL/t/sR5X5c9N2jB8u
	g+nSG4Qz1tm94KhABASLdaj/rAe10Av2lPdO4qf35X1iLeeQtQz/11D6o62pxnnfmLmlK49MYkq
	PBbj7CuYtHRVSLT3PmavUFns+7wU+jfXxRyDpStl45FAdrg77HfLkn+kSw0tr5e+83gLz7xsn8o
	6+MTfBk/bzmZvUUmMq7kzPA6UHTf5zrvTtA5VcsE9mzlPAzfrqRq9O+lp/a/E/5CuwRfLv3ewGn
	ZfYV8GyB9SCs9rjhbSdn/1HHXl5N/mBeqmhZywXtvfA9RqbZuTDGN+ZY90=
X-Received: by 2002:a05:600c:8184:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-48fe60edcefmr232164425e9.13.1779114736213;
        Mon, 18 May 2026 07:32:16 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.43.167])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm39564572f8f.23.2026.05.18.07.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 07:32:15 -0700 (PDT)
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
Subject: [PATCH 09/15] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Mon, 18 May 2026 16:31:24 +0200
Message-ID: <20260518143150.3138712-10-dario.binacchi@amarulasolutions.com>
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

Add the sdmmc2 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index ab1e62cf2bfc..62f898a55d45 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -622,6 +622,86 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	sdmmc2_b4_pins_a: sdmmc2-b4-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_od_pins_a: sdmmc2-b4-od-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('E', 13, AF12)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, AF12)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, AF12)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, AF12)>; /* SDMMC2_D3 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('E', 14, AF12)>; /* SDMMC2_CK */
+			slew-rate = <2>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+		pins3 {
+			pinmux = <STM32_PINMUX('E', 15, AF12)>; /* SDMMC2_CMD */
+			slew-rate = <1>;
+			drive-open-drain;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_b4_sleep_pins_a: sdmmc2-b4-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 13, ANALOG)>, /* SDMMC2_D0 */
+				 <STM32_PINMUX('E', 11, ANALOG)>, /* SDMMC2_D1 */
+				 <STM32_PINMUX('E', 8, ANALOG)>, /* SDMMC2_D2 */
+				 <STM32_PINMUX('E', 12, ANALOG)>, /* SDMMC2_D3 */
+				 <STM32_PINMUX('E', 14, ANALOG)>, /* SDMMC2_CK */
+				 <STM32_PINMUX('E', 15, ANALOG)>; /* SDMMC2_CMD */
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_d47_pins_a: sdmmc2-d47-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, AF12)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, AF12)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, AF12)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, AF12)>; /* SDMMC2_D7 */
+			slew-rate = <1>;
+			drive-push-pull;
+			bias-pull-up;
+		};
+	};
+
+	/omit-if-no-ref/
+	sdmmc2_d47_sleep_pins_a: sdmmc2-d47-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('E', 10, ANALOG)>, /* SDMMC2_D4 */
+				 <STM32_PINMUX('E', 9, ANALOG)>, /* SDMMC2_D5 */
+				 <STM32_PINMUX('E', 6, ANALOG)>, /* SDMMC2_D6 */
+				 <STM32_PINMUX('E', 7, ANALOG)>; /* SDMMC2_D7 */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
-- 
2.43.0

