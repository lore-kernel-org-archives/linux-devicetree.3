Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9713AEF59
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742990; cv=none; b=kXAEIL6IYuWlINspd5djDjShkQ3cBMU6AcIUxtS3Aqxb+lXj5vXzIqk81v8xKMOXb/QNJFO3cOsxO8Tl8FkxvbB6KXxLQyJiEB/q8HfcP8s1eekW47ClSADqWDiyyL8Mmb72o/UYxKRiGFiV+y5LAvoVxAfMT/9OP1i3b4Rekvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742990; c=relaxed/simple;
	bh=ZkhtEabiV0OQud8RHFIq9PSlQ4cGED9HQsmxniWMLIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SbWWHL3pqY0JbNY89gIw4buCRGIML11PEK/CdaB/pwqdtPsNIRib4GtOBM7qgmVESO4/Ix9X5GFbYyqMCi02ZTHhYd4+dBc5elJrqs6NeqMEEdMLb4YFeFRKeJ4KR5I9X5DRkWa6ajdtIB4FAN4RP+Nl+ykeSpWQQvSf3Xqr754=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=UME20VH1; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UME20VH1"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fdd674e17so594667f8f.1
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:43:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742987; x=1786347787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=;
        b=UME20VH1M3jw23UjJtJBsDoIX0G8oWTCR0bJJbOsuvGLGe5GZJ/WJj91/CBlAJxvM2
         J6jtnNyaqNt0GDeVFx9bz3ItNI52v9t72a5vqakH5P/W4cMEFpNaSL9V3/igkugnlodx
         0+KMI4rpnlBVGI3VQPNMrsel31YnWFIqqHb5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742987; x=1786347787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=;
        b=FMs6zSyPZ0+QsRZEWa1UJHE80I3uq+5MBnxrhtCp4hvyrK5RNhCor5tzx0FTWUECHp
         TX8LwrhwdDb4r9V5QROjrzN0tW7EQ0e/3yUsiTdP0T6H1kka5LmTmcmja16pTa1+8DkD
         a1vxNzVGKp7PzDC0fI+pwsG4HVCNIelLaubVcV1XUV6iBkPu1Oky/z1l5UGnnZ4xG2Dk
         1WFcRO0f22/gTs9Ak7DQNOIQMeGv7nY3TlZ0L4oVlG9nk8BAALXzfZhtb3xFUis7SwgW
         tUzJVJ/UOquQYiwmTt5R5h7gOnEJlU7qSgKzvcMuo/y7I+J6f+S9Z0A4JymsrA1E5dX0
         SFZA==
X-Forwarded-Encrypted: i=1; AHgh+RrlRg63N/2/0cWLqRXbsU/3MPDn6DricASTVVvtYwOUN4AfdBVXmbGdfzL5bXBYLqWIZDAKDrxZZo3k@vger.kernel.org
X-Gm-Message-State: AOJu0YwvJTegEsG3Mi75EtSKBvN2MOtzTgg+sY3Lna3vSlrBbeiumUkh
	+/PdWenLVyJDeoC7xmXhBATgvFZ104VR35tez58eywuvNlMKvVIKJQGAHZ87WpPkuL5ODDUgsmD
	/2Ycz
X-Gm-Gg: AR+sD11foWiLKGaMAdRI2QQgB8j3ozJZOy7hK3rf51mjQq9bvg16owyCAkZvicWAIvi
	4MTBBgb0NcmkshhxF5N2Ic6XeLyHUbeHtCgY5wzb7YqAT/gO6MfoaILqs0f4gEy73EZmLT2NzYv
	EY5V7OFQC4JviZ2dMA+14oz9PXsyPqxz0wGhX7Ggv9sIrIqCeB5y5+cgzvPgoRDkSOvHDHnndzB
	9Qu7T1wAVrxzqTWqISH3K/iMesDqiTvKlcXLCl8pzdEtz3LKEUzgAA+WQ071FAHYVsUsxIzIrAV
	Qp8luqu0oNx0ybRr531NcXqm8mHTVJZ8BVyME2/SHiUaFopORorjGOcK3LfVUOmiPkexQkmCNX/
	KdiE/MmDjxUsI7ujjgcmPSeE4mEs+suo3D4ER96ReGGyQg7RELWvSrML5cn0PwVXrLv/nBKTRfa
	7QDDMij5t39OQvI5O6YZfQyTihIvuk1ht9VgIrtqYvAjpBZEisnynolWGYi5gqPikXumOe/cidU
	vYz1iLfu7yPaeVL1dZskeR9zZ9e82q5NIa0qtPr8KMKYebUrzuEqaKjElNWg1z4i2p858mNHki2
	1D4FMznAf7Pq1kRs63u3KDlo41CbCW2w3Ppv3Gib8aw59Hq518PsopPZV9KYPVhj
X-Received: by 2002:a05:6000:2203:b0:47f:cb39:10c4 with SMTP id ffacd0b85a97d-47fd72c75d5mr19759957f8f.12.1785742987097;
        Mon, 03 Aug 2026 00:43:07 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:43:06 -0700 (PDT)
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
Subject: [RESEND PATCH v7 11/16] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Mon,  3 Aug 2026 09:26:06 +0200
Message-ID: <20260803074224.3821911-12-dario.binacchi@amarulasolutions.com>
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

