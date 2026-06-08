Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3F83D3301
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 14:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928562; cv=none; b=nGkVnp552LYWncQ4TpvM7o8HtnwlZ/f2LMyszdJ6t8GBwieg5pTByeULH76ZPJBQzgZN5K1ktYZqgLOv4yBMTLGnKLT/3h2C9MwVQeZy0zl3uJqFXvbWeGA2QyWh38YIDpZ8Z4JepADhHmATUJ6mn6u9SxBOfToNBEvvFytNFfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928562; c=relaxed/simple;
	bh=f5ODRYPzF2N2/bA4+U0BfoMUdwu1in1sTb+ewmlimQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QRwnUo5uZ/Y7x21tA8CBGGuzW0yms04TpfW8SlvgP04UG0tpWhgSxXBWvLd3q6G0N4PeAfV8soPEwZZolwom/SUT7D9EObWFI0pdX4m4ttjwWnmIkRjAmCwuZhb+sPzv30121lNCFVKE1XCOwr1kkDV/hYD722GPgg3FsvATmM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rvXgYZFN; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rvXgYZFN"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-beb2a97cc9aso703446566b.2
        for <devicetree@vger.kernel.org>; Mon, 08 Jun 2026 07:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780928559; x=1781533359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlYmcGocUtKVOJ3lCSjwzgCdhzYGeg/sEXkvnvDcqs4=;
        b=rvXgYZFNcxNbYTcUf/RXDFggYWPTpV0OnVEJQyixl9XCUzwDP/Egq8lTI3DF9fnupa
         5KKuK1FrcFyiUPJplBDFezvP0q4uTSEw4ao7b1TnWJK6dFE8xdrX+5WcvbN1qsQaxNdB
         X3aW/C4VuA//lMF5T02Wb7Jp6wDXXZyvPcdT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780928559; x=1781533359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jlYmcGocUtKVOJ3lCSjwzgCdhzYGeg/sEXkvnvDcqs4=;
        b=LAZBJRWo9rqd9MFxj4JV9VyEvZpWX0EBnGl0BULg0A9Naio1JYY3y9nV1Iz+Byg+Ev
         BGahBszSpRUMA4PBjJtAIRuPEor2eC9zMYJqSU8o9HxxOTamFTRYZmtnmRqcxH+vP4Lr
         stBK6Cb4xEPVl9n+LsJj86KnvaKn+rq1vJx/G5iAXeT4gf8zV/wGMJZbq5RwZbv05HxA
         23jrRnuVo1gtdSsAvdntxLh0YOqmPh7B3yHNjGfA9v1TlVvK/n1iozJVA7R6z0m1lAWn
         3URETl5ARdt+XIGE1EakSpqq+drUkCSiwI7RIB86Lx+0ZfiM1dCmfo9wB9GQ19sNky3T
         zixg==
X-Forwarded-Encrypted: i=1; AFNElJ8ve4TYjufdTujtWnYnmdPHQIPdv8mxr7F8bmCGOW6Yt0ZbbXtxpq5gxh/oRB4bjMtUBqVdfUe+rH7i@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqd78STTWKUL6NKEsScv62kcP/w4YRkPAiT1CbSV/SY0UZ2KNG
	YBYZSjj8aNzGKoRLxL5WQ3TQCc4kTINoovFEieF8nuLXK8sKsPobpTM+ZmleVw65sj8=
X-Gm-Gg: Acq92OEpVarpB0oSJLVeV2RoJnfB90U0MtJXWT7FXI4L105IP//XMfZ1sk4LSeXciPm
	u80R1rF/AR3goErZjWrbDidWcqRpSNiYa2lfyftZR31OBsbBIS2WvMprOxRusRAOcpwoubkxBK4
	bPAPedpt4YbfTx2/IhQiWETXU+hKBaxGe1kKA8IszYiGLV5rhuD8H1X47xAqidkRMNndFjkDZ9k
	uXQCYYYLxyBeOwnE6hYHYq07gzq+Y+oC+lDcoBAUqYoPitUwWnxlhDdDdtn86Yrx0yelKYtXi9S
	M0fTC0lb+Ul9RJ+QP3Db7moS8pOG22Hphhn77UdHh5SIb6uIag3v5sSjcqJ5WOHUgoYo/HF7cxv
	yuL0AKNBQwpsnw+VBMdBd7uvRlPM7JlEmeVLbBP6jAATsBer2iPS2AzfZc6j8UMpyfc7EQWa6B2
	BimH6+c49wCgBrtVKS7ToAt8xxHzVNB9O4b7oFhylcdymFeqak7687RFlaE/vGg4INAKrdoJh+I
	Y0aoEYAeTDbt6TX3/rno6ZSQ7qHayd5uUA8h4OJdbltmH14zWKNkzO+zbI=
X-Received: by 2002:a17:907:9812:b0:beb:2665:f37c with SMTP id a640c23a62f3a-bf372f20f8bmr632395866b.46.1780928559123;
        Mon, 08 Jun 2026 07:22:39 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055307a35sm881847066b.52.2026.06.08.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:22:38 -0700 (PDT)
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
Subject: [PATCH v5 07/16] arm64: dts: st: add ltdc pins for stm32mp25
Date: Mon,  8 Jun 2026 16:20:24 +0200
Message-ID: <20260608142221.952245-8-dario.binacchi@amarulasolutions.com>
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

Add the LTDC pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v5:
- Increase slew-rate to <1> to support the 27 MHz pixel clock and
  prevent timing violations. Suggested by Sashiko

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index db485b9ed904..50f454630cf2 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -260,6 +260,77 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	ltdc_pins_a: ltdc-0 {
+		pins {
+			pinmux = <STM32_PINMUX('C',  6, AF14)>, /* LCD_CLK */
+				 <STM32_PINMUX('G',  2, AF13)>, /* LCD_HSYNC */
+				 <STM32_PINMUX('G',  1, AF13)>, /* LCD_VSYNC */
+				 <STM32_PINMUX('C',  5, AF14)>, /* LCD_DE */
+				 <STM32_PINMUX('H',  4, AF10)>, /* LCD_R0 */
+				 <STM32_PINMUX('F',  7, AF13)>, /* LCD_R1 */
+				 <STM32_PINMUX('C', 11, AF13)>, /* LCD_R2 */
+				 <STM32_PINMUX('A',  1, AF11)>, /* LCD_R3 */
+				 <STM32_PINMUX('B', 15, AF13)>, /* LCD_R4 */
+				 <STM32_PINMUX('G',  3, AF13)>, /* LCD_R5 */
+				 <STM32_PINMUX('A', 10, AF12)>, /* LCD_R6 */
+				 <STM32_PINMUX('G',  7, AF13)>, /* LCD_R7 */
+				 <STM32_PINMUX('F',  8, AF13)>, /* LCD_G0 */
+				 <STM32_PINMUX('H',  5, AF10)>, /* LCD_G1 */
+				 <STM32_PINMUX('C',  9, AF13)>, /* LCD_G2 */
+				 <STM32_PINMUX('C', 10, AF13)>, /* LCD_G3 */
+				 <STM32_PINMUX('A',  6, AF10)>, /* LCD_G4 */
+				 <STM32_PINMUX('G', 11, AF13)>, /* LCD_G5 */
+				 <STM32_PINMUX('G', 12, AF13)>, /* LCD_G6 */
+				 <STM32_PINMUX('A',  9, AF12)>, /* LCD_G7 */
+				 <STM32_PINMUX('F',  6, AF13)>, /* LCD_B0 */
+				 <STM32_PINMUX('A',  3, AF11)>, /* LCD_B1 */
+				 <STM32_PINMUX('G', 15, AF13)>, /* LCD_B2 */
+				 <STM32_PINMUX('I',  0, AF13)>, /* LCD_B3 */
+				 <STM32_PINMUX('I',  1, AF13)>, /* LCD_B4 */
+				 <STM32_PINMUX('A',  7, AF10)>, /* LCD_B5 */
+				 <STM32_PINMUX('F',  5, AF13)>, /* LCD_B6 */
+				 <STM32_PINMUX('I',  4, AF13)>; /* LCD_B7 */
+			bias-disable;
+			drive-push-pull;
+			slew-rate = <1>;
+		};
+	};
+
+	/omit-if-no-ref/
+	ltdc_sleep_pins_a: ltdc-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('C',  6, ANALOG)>, /* LCD_CLK */
+				 <STM32_PINMUX('G',  2, ANALOG)>, /* LCD_HSYNC */
+				 <STM32_PINMUX('G',  1, ANALOG)>, /* LCD_VSYNC */
+				 <STM32_PINMUX('C',  5, ANALOG)>, /* LCD_DE */
+				 <STM32_PINMUX('H',  4, ANALOG)>, /* LCD_R0 */
+				 <STM32_PINMUX('F',  7, ANALOG)>, /* LCD_R1 */
+				 <STM32_PINMUX('C', 11, ANALOG)>, /* LCD_R2 */
+				 <STM32_PINMUX('A',  1, ANALOG)>, /* LCD_R3 */
+				 <STM32_PINMUX('B', 15, ANALOG)>, /* LCD_R4 */
+				 <STM32_PINMUX('G',  3, ANALOG)>, /* LCD_R5 */
+				 <STM32_PINMUX('A', 10, ANALOG)>, /* LCD_R6 */
+				 <STM32_PINMUX('G',  7, ANALOG)>, /* LCD_R7 */
+				 <STM32_PINMUX('F',  8, ANALOG)>, /* LCD_G0 */
+				 <STM32_PINMUX('H',  5, ANALOG)>, /* LCD_G1 */
+				 <STM32_PINMUX('C',  9, ANALOG)>, /* LCD_G2 */
+				 <STM32_PINMUX('C', 10, ANALOG)>, /* LCD_G3 */
+				 <STM32_PINMUX('A',  6, ANALOG)>, /* LCD_G4 */
+				 <STM32_PINMUX('G', 11, ANALOG)>, /* LCD_G5 */
+				 <STM32_PINMUX('G', 12, ANALOG)>, /* LCD_G6 */
+				 <STM32_PINMUX('A',  9, ANALOG)>, /* LCD_G7 */
+				 <STM32_PINMUX('F',  6, ANALOG)>, /* LCD_B0 */
+				 <STM32_PINMUX('A',  3, ANALOG)>, /* LCD_B1 */
+				 <STM32_PINMUX('G', 15, ANALOG)>, /* LCD_B2 */
+				 <STM32_PINMUX('I',  0, ANALOG)>, /* LCD_B3 */
+				 <STM32_PINMUX('I',  1, ANALOG)>, /* LCD_B4 */
+				 <STM32_PINMUX('A',  7, ANALOG)>, /* LCD_B5 */
+				 <STM32_PINMUX('F',  5, ANALOG)>, /* LCD_B6 */
+				 <STM32_PINMUX('I',  4, ANALOG)>; /* LCD_B7 */
+		};
+	};
+
 	/omit-if-no-ref/
 	ospi_port1_clk_pins_a: ospi-port1-clk-0 {
 		pins {
-- 
2.43.0

