Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C5B397E9A
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662022; cv=none; b=bN4o3YtNouIvE3ZrbEety6I2ack1apnK2l0oEmINdBNeF0kBr4WhGu9urfg+Qj0e2F28pPUGdOdspcNXQQB1lMUfG0arV+C/16efRBpqYaW6yh6pB+cSl43D7JorxxDKeHcRdpGGoN+iKwNeUoy1hvwG5cJCNU6wd9Gq5i6dBD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662022; c=relaxed/simple;
	bh=0CbxIVBYXVwiSrXOvX8E9FYo1CJPet4hsL45pHulX6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WdnLn9/iyf4fv41Z/POqCXvv6ldz4k7iqk9YVniWQwJl1j5t/7wnpKyzOGteFPX4cV4qr6BAMrp2RO1U2q6L1n0HInXkzupBfMgBnU9vXJ0LhceC7QVZPov5OYVqqXZEMRGc8h+5OJVyFUKG/hUCOSG7JFCp0p0WSWrMdlWBoVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=f1bORnyX; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="f1bORnyX"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45eedcdaeaaso1360203f8f.3
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662019; x=1781266819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXBts3WbuCXiU0EHch1WC7B0zhmdg6BYHc3PSPue6D4=;
        b=f1bORnyX2PqO66RfUWM9rUXW81sdtYnTOuvSOSyGzPyUMGqDjehjjhgkz6hi8hVViR
         1EV+CtxuInD2UZIQ2wpWFogR3ymawi2zTarZWuI6H/BZUGjb1Q2GA2LtXtMXgdZKDMhH
         QX5QmijHRFYHBp/pu5Q92Ijzxk/bxtNAQrg0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662019; x=1781266819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXBts3WbuCXiU0EHch1WC7B0zhmdg6BYHc3PSPue6D4=;
        b=Tjrauk2W8PcdMgslArwHgczfJcAHSfpmxR2qiSS7n3VtHUML26ubUN8/IlIt2p1SLf
         zgQfZf5dkzi8J8+JG7/Hd8xFpkFbsTXB/Tfdo7o2EadIDSAMUSXnMQU2fgpgIzyXyMcw
         mMCZ7nBIxFuaOQhtk0u5Dmu+bD9PykV2g9hr8eObI+rEpMipqGR6QgQNWvPv4H8IR9EK
         n+gOgXB6dv30UnnxIgP59GRLUr21QZwFpcwO2FGfC7plnEJAb+CTsnlmGBMwmmtqmciT
         iVWgDhjLwJGY+BaoW6FtkGQlFoFvjhIOJfkew1mOfzREhevdDq00rO5+tqGSY7f+9K1i
         25og==
X-Forwarded-Encrypted: i=1; AFNElJ8VuGvLpRtxdr/euU++Eu4LsbtC1AVn3zEeKdlgv+x8QDiHI2vywvUaM3A9FDPi1f20qFzVHL4YmJ+U@vger.kernel.org
X-Gm-Message-State: AOJu0YzJRN9J33UCSJZi9tUat9rWg63bEqIN7srnN3fyIrgJ8fIFYyGW
	0/j6ALkiytEjtMScA3o2ttE9foe6j4KchQrJzgWto6onPdEUyq5I0QJcyz65BKziVXs=
X-Gm-Gg: Acq92OEGydC0t8DKLHu/G+NxuzOLkoor3Pq9qrsIhdQs9F24OIu4tHF9hhdX5HQ1i1/
	ZXrPlpoEp0MBb4wcJY/oOSLWU+6PJSrj2zi9w+wTsatalNXrvU6FzyJXUjRACWpXpaJpBtGHd1A
	RlOJosUGgUDInj3BtvHnVNH+CHTGM0CiswP9K5C7xmBEeIqAbYtu1ZVIbjbaTusNPTgIHYnXHmV
	esl8GrQ5QEke79+qXbfBVgNFK/jjVnnaq1JdNl4/MRmM9YbeMCuN8OiquhpIf8MyI3JIxE2QFDW
	kdfkQFWBzfLq0BN0/6mYqMbxxSHOhL3q/9kd5DPQDR1w47ptHrxNrn+gq9p4eiOBPgqRkCvvI4J
	0Yy2AakBz0Ia/ZSbJebVcofGP2NZZ6xPzxLnEW3XWE8ap9kcZ33AECOLFpeG+jxfkRUB+vctjW3
	G1iAxaN5FCGAbBCJgEtnODHO8LxLnyBCIMZGCu9OGSCHiFW8qyRv2BKBjCeTEFWOqenb25RQVRx
	S2/RwCktprzTj1Ua0X9/A8hJyWYy5U/YDPWbk+kqOJ7r/Zkm9FimUcNW1Zn8TUp5PQvAJYDLpap
	4DwBIRf9goYq8Q5zceUSTqoAwaFFH0QR+II=
X-Received: by 2002:adf:f30c:0:b0:45e:ec17:430a with SMTP id ffacd0b85a97d-460304f9ff6mr4772692f8f.11.1780662019076;
        Fri, 05 Jun 2026 05:20:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:18 -0700 (PDT)
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
Subject: [PATCH v4 09/14] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Fri,  5 Jun 2026 14:18:20 +0200
Message-ID: <20260605121957.78409-10-dario.binacchi@amarulasolutions.com>
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

Add the sdmmc2 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

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

