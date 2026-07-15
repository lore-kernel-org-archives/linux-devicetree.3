Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB4231E845
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 06:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784096558; cv=none; b=F3sp8N4KlH4tp3JLWDikW2u797bfeaZV5N4/hF0/DzUV4ZRjUqzxYMYQxxlPg8sOfyha38edn1Lqxf1bnMrGvsr3HtZ+raYfRLxQyzarq9aCOAWlv2Moa/NwgUjKkWREhb7LUGmPK49cBlHOtyj1DkaumyEBjv0TJgWmM14M6u8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784096558; c=relaxed/simple;
	bh=ZkhtEabiV0OQud8RHFIq9PSlQ4cGED9HQsmxniWMLIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltxMAJR0gmNWqQzaHcD9ZP/bKvot7hb0lqvtlRgoT4W/rebgiONiQ5NBJ2QJtAknO2VR8XlibWTOdGAJ4V8xh11fNpMU24G1X7YW7UTuts5Xx6Wc5A0r+clhln1TafyOA7RFls9rh9e9uvb9afeJmjX5cp7l+3LB9XfP/zuYKkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=Ao0t7T1j; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="Ao0t7T1j"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c166f1bbeaeso174639966b.0
        for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 23:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1784096555; x=1784701355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=;
        b=Ao0t7T1jSfADRyCsGvaQS0xMSEnOCPhcGY8ljm1GZ5eEDnoPhuzqtF2UB6vsxZeeDp
         wq372s9b8CX8u85aN/SwMEPE71PHwnmqeTg1tdyNLEe8bRxg0krqMmZZR+OQjhcWqlC8
         o33l5T9boRkOuOqcsOTdduLbI0MER8v1R05W4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784096555; x=1784701355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=;
        b=LkY0u0sGRgpR44pL9dsPEUaiQp6Ic7RSrhqAWiaCFnEulBpQz3Sa0Jr0xhokxU9h6X
         BKPiNSzwhAMVlrVqlcR6LhS+IKmz1G3u8GE3lsHgpdeQtZWcYSN+6Ih82w9cFAb7g7wM
         ew0DQMGmS9nP5MesaCh/6kKJgIH2VoyBkuqJJPg2KNw9KB4p6JewtN7winfKNxHBP3/+
         RsvrXve8tBEWLvOn1bJcRcnmdmEgKz8jTCDFKxXm2WHdpeWQtj9zCzlXp2Wky/qSyJve
         cn6nQM++I3cLrpnCbU9GhT3+ygNtL3xJ/6yIXCO1O0Tnsuws0YbIf9ObYZzaF4pPD8Wl
         AkdA==
X-Forwarded-Encrypted: i=1; AHgh+RoYgvm+iz5cbeXajj3qaeUoyICkZ9WA8JhnrKmHJe0HOy5V4q75WJplYNvLmqrqYqm81gAC17BU6yJh@vger.kernel.org
X-Gm-Message-State: AOJu0YyEgNnPFLOYQYKM2SM+Jzk+bcdUmUKn/kKe29vWPky9ntIgGjhc
	1qQn635POAjy7Qksf/+GPZ9kJ5tEo6wFisP2J+gvGzzFt7mmEaJCK8cDXmz+heITwibFLKiC4Pd
	6PxjF59g=
X-Gm-Gg: AfdE7ckIv7p1udWbDiZDBYqNEoKMfwg9SpfUEw3RikmCmrk/OfjL2vXfGSPm+jOoiA7
	CDpvtjzlp3Wy++uFBuI2JifLXcs5ZlkqFKZvyZ/TYiuDbM0v/0rkub1Y5xybwAsP3tCjlQIZkKC
	oRHBQgPiqO4JUtf8RSk5JyUxt7jlGytc7J7ygSPcnCe9NilOR5bx2ZeVjlmI9q2bB0rHQ1h0Zq0
	xen8l/9MMHSzvChnDSE85h1ps7Yw8Q3FV/P6mUUS951iN+RsVYU36jLiNkl5N8h88QBwCYJOBBR
	+PZwstXAe2sEN7MsFJeVC1Lqcu16uoIreR9jw1yBZt3JK42G2mGwkLhub2GzGNp2ZRX23+q/NQ1
	JAWp541ShHUX2w+Kk3FlhPVS5sm+ToAHtvad7+7RZIV/TfFeR+GVyGK57H2vaVgnan7/GI6LEG+
	OdU74A7CDuDWpXY39cMxBQaxIyc91wHeHLJDhW9IHQ2wlFwLt1clmIIx0Y86Sp3HdEOavd7q582
	n5knnIVeMlM
X-Received: by 2002:a17:906:6a29:b0:c12:5e3d:4023 with SMTP id a640c23a62f3a-c166161c474mr372775866b.10.1784096554994;
        Tue, 14 Jul 2026 23:22:34 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.41.101])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15d0c3cf1esm1028820366b.44.2026.07.14.23.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 23:22:34 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
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
Subject: [RESEND PATCH v7 11/16] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Wed, 15 Jul 2026 08:20:28 +0200
Message-ID: <20260715062201.3599458-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
References: <20260715062201.3599458-1-dario.binacchi@amarulasolutions.com>
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

