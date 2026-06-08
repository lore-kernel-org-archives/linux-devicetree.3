Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D1D3DCD98
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928569; cv=none; b=kNuV58WhJLQJ3PXaMyoCCIpaa7Zu1ufkajM8hcFIGEDO4a3NjnlTxZ0c7hdQxpKXVisJxGSjwWSvFcpMbWVWDC2pFhiL1oD+YB+Cii56SF0k38ajPGaaIoKE1EHJVZ3nrODz5qzTrpa4pd9iP+bk3PSrU2QnC+8n+jkxI0CPJaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928569; c=relaxed/simple;
	bh=AZ09XEpPFDwP1Z7fM7nTX74RMhemy9JWX7RWEHgEg0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g1L/EaS4kDTktimPIu2t0HnEJpYherRneOi3sHL07PxWbITKt9XMcNMhqixgpL/Gy0XwZPyMFl25zO/xitnfX498Nb44qjbLmzcQxXiKsf+CUHJilptUXYzgncsNRAgV5761KeqlQyEqDhIZO705riaEen9OS2skPkHVd2NUnmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ZnumCsdq; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ZnumCsdq"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-bebde89cfd3so548760166b.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928567; x=1781533367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXhCAfGf0Dhrwl1fYtWsjCC+QRGfLFtW6oj0NY7CcVg=;
        b=ZnumCsdqteVtY+1n/q3+SOMf/LGIcrDWMoE82YPiVt31XdSpoJDMJ/UFmbZ4xLLn82
         kqNL/vPaZp0LVDCMy6OJ73zcjUNLpA2nFo9nyIK8eUffwG0qgDNe9J3Y/7bsyYn62iiC
         tZ75JCpUsOp84FvKtEDKEYZZrSwINAtA1Qs8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928567; x=1781533367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hXhCAfGf0Dhrwl1fYtWsjCC+QRGfLFtW6oj0NY7CcVg=;
        b=EoE67J0U6ZXlwY54z5iP0n4O+s0qTArgTWGuK5yfNdtWsYXrHJT0H2lxvyfyHvTICw
         3nQ3U4daZlSrgZWKzci+sniMsTb+Hx9XTVWvzWSYpI5ILHsamBc27/eFQsRU4rBJswSs
         FOYizXdPgu+eHTvsRGeQCa08cwMlNPgWgpwjstl/mXkSGnUd8YIZoaGwuWKK/HmRyjbm
         4LeEFC/w1XfVwTf3ITb4gIvpX1UKVGGblOP5nfuy6ZJ2a/eXFVQW24ZLpJCP+zZMBg43
         KNmzxPjrXegVLkv4XmrS92y/pbG/ev+FOMQk5aRudnYLSZzSva8VVjoFbd2h5Es8BJ4B
         i4uA==
X-Forwarded-Encrypted: i=1; AFNElJ/2YhIYZUqUV7DniF61/932HPY1arCQiTDeD0dBgcPow8NkuHtET/EnicER1YfwZFOTEP0QuaEigLWj@vger.kernel.org
X-Gm-Message-State: AOJu0YzjmnHfYd9ACDm9gIeTKQ6XH9XxWVrH162bzk7gudqzNBtcSdoy
	cZ+Qn2fETbg3wMPhEIdnGKEBKeWamPD8C0jWNu65QlYVD1s/aYdFDhM5EEtZoePWxO6AFd38R4D
	w0txO
X-Gm-Gg: Acq92OFpJ+zrxaoD62lp4isvUzlJnY++2Dr7PqvrSEKt7DrsJWmnrjrax7XOL1OhLnj
	YUF694WDX7JFA7UfhO0JZK4FT7UYO84ZMkqYEkx8KhFYOmWUyu+F9Vy5guozBcegGQDAPLqdPov
	ecKN+YccL9oJUKdTNxjNcE5DRUMa3encMwV3S9sW+I+94ccfAMhxCvbhfPjn1igLMO3Z4UoAtPV
	MytxQW5DCMxaF6ZjtR7ii9EXOF9ZaPo3rLIhpM6K6lrCcliVwRl2y+cGMQoivznMkYETSrIihIy
	WdHCJsJ/XpPPYrkdCf+6ARGTQGPr01B8EGESn4tl3IcjssooCr5N/St6rt6ePZKwHT+zk/KM/wH
	apiZD8Dbit8qGkomG38tNdLL+GdCIvh6FEzrqV4wF8XcQx3UYdSRudIuRqLvXSto30psYvZqz0S
	f9qzZJkuahvitkUr0gSJtmUUQtXgRWeRvUwNK1GPOZ8Gc+rdbnrlfoUAM1SQwh+5i9c4dbcOArY
	SmgC5VU1xaOcA4nRGRtN6q6BeP5k9gmxCQN8CrgbZEaPQri4fB5AktCtoA=
X-Received: by 2002:a17:907:944e:b0:bed:a213:a89b with SMTP id a640c23a62f3a-bf372c31d24mr774338266b.37.1780928566673;
        Mon, 08 Jun 2026 07:22:46 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:46 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	domenico.acri@engicam.com,
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
Subject: [PATCH v5 11/16] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Mon,  8 Jun 2026 16:20:28 +0200
Message-ID: <20260608142221.952245-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
References: <20260608142221.952245-1-dario.binacchi@amarulasolutions.com>
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

Changes in v5:
- Change SDMMC2_CK pin bias from pull-up to bias-disable to
  avoid signal integrity issues on the clock line. Suggested by Sashiko

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 002fbc724b9d..c816a6aece47 100644
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
+			bias-disable;
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
+			bias-disable;
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

