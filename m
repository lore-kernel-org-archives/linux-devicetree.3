Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6ED4048A8
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811619; cv=none; b=KcaIm8w9rI+uE2es+6Gx2ChkuW53bY/Szt9T6K5foOasQ8F8mr879yQekGFvoVSzypyyRX4EtFu3/I3ypmysQgCXLpqLKCnw86cro1jsV50/tusDLBauXqK7XOHBE4ghYZM1H2OwnnZeq0CRF2U07I06WpguARpeQBMhFlYZIcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811619; c=relaxed/simple;
	bh=ZkhtEabiV0OQud8RHFIq9PSlQ4cGED9HQsmxniWMLIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bdw3TPjvskv/6X9CAVeO0uxRq+wjBoaIVkyEqun+J9edQOGZXq1Sw+LbZM8h217i50dkVCA9RQDpd3x9UdqzKfZ3+xzs079oM2neoeXc3xIzOyc/D0PYTTG65pYxRO5zPgzXTwmjWYGyHqRJEQwbApN+PgIktSkwaEV/BeTtKlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=cosqdgP8; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="cosqdgP8"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4631679f204so239273f8f.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811616; x=1783416416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=;
        b=cosqdgP8QgegElr7SrZfzmsRqByudX+LxiZlYZBVbC0A7YvkM0otajp76JPbWyovPW
         +TrYHM3r47famMPIbzSQsHbA0GUevORmvyypgyDRaMwb/7cMLv8axWOqwhv8VE2y3uHL
         CvSgcoyfz864ASrgL51qCtbg74v0HrUyuHCrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811616; x=1783416416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=;
        b=l0HbauFxnbMZKJtDxTjZfeS5LRlV+/fHJRAmwFSGf5DbXN4ETmLAwhXjvLGO9J4XiB
         hgW/djModZFKdp/ST4m3AS6HDu7bKNVaTgnA/9sGV0bUkAkKm3FghAHEejtV5S5fXIeK
         qImpt086B358UFqPJat3W02Aw6nSdiFDOcaSXVnqSGMnYVNS02OOBFQVbFpTkkLdnX4U
         YZlK11/T/lX7ODQxKbQb3tNQ2oElW4qCyusE6S3t7cBoklqdqkRbpu89CfqQXvV8m0+i
         B64z+beHhjhzP1gUckFoFDsabyxLhCgYy6XoFS1jbpzzVJUibj+yVBXQiYBBFggoII9P
         as3A==
X-Forwarded-Encrypted: i=1; AHgh+Rq3qlp2Qxw4ct8Tm1YqPeSYc1GTD7LO/RwriU4vQwyfsNEYRD5iU9JLLdQiVCezL41LtzhjJ/lr8ko+@vger.kernel.org
X-Gm-Message-State: AOJu0YyLWY+uE+rbPRSbg1MJy5sjdbhZSYXfTqbdwyQX6Co51h/O4IQb
	k4bWhu18krF5+IttjBXuhMO100z7v1HFAV/jKZF+lZPbFgy95Sa2GS0R1Kr6YFyZKKI=
X-Gm-Gg: AfdE7cm+oGSkvTJreS9xEsDj1phQ87e8Dk1oo6FJeP1kyLRs6sC16OMD9/ztJnvB9ah
	6CHKtNVzTkjT9JLFVz70nIra8yoUklrdKGxaJTvxgKmPK5/I/DXVgTgQby6oC7gxU1meQpF1/ow
	9cmzc4I2JN+WtgGIcnWjgpOfPwADKN0Vs8rU2/TucsoXa7bGAe7n1P09tlQukm5bAAKwBqgaeCg
	cG27n/rx+t4L/Emo17SJuUpNP50WWl0mzwN2E19E3SI85TJaAfZ9OcEpxWSYXmBBGsUjIPyVlrb
	fyX0sfmBS3rOWKhNaPtsClbFStLloOGnRxaPxXeaHCpfEz2FuhFWwTdKFk+BVGp5NmcZkNTI0wi
	mGXncot6bjDvHwYnKXTKdfpcDyzeXdiKZ3ZrmdRZ2qORR6nW9sQCvcSH+sBGL/402Qk8E2gEZt5
	F4DYl7tLx5Gap3CpkhNKltaVjVI9fiTX9PJrK+FR20VDnFe+JEW2sfd8WyDObvwGDunczxrZigJ
	NHSLsWVsBAlKPgahmO532GymdxVwWa3KAaXGCShAzLKBnHRqwOZ4QOL1tRqY5dV2vf2Ng9EdZ1S
	Au6X6xtwf7wjARCm80T47jCl
X-Received: by 2002:a05:6000:400d:b0:474:8dbb:ccd0 with SMTP id ffacd0b85a97d-475dfa8909emr1360377f8f.19.1782811613890;
        Tue, 30 Jun 2026 02:26:53 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:53 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	michael@amarulasolutions.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v6 11/16] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Tue, 30 Jun 2026 11:24:40 +0200
Message-ID: <20260630092628.1695560-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
References: <20260630092628.1695560-1-dario.binacchi@amarulasolutions.com>
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

(no changes since v5)

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

