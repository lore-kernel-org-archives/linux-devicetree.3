Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C16F3F0A94
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 09:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787217459; cv=none; b=iG2lDzuYz9ISPmtnoXMJo6qyd0LLbNKpXMj3UHM6A2+aCLGUXqqd8tjBt6UvSP0SXY6JCqEiDZ4IxN58hvNJx7055tRiCiA9ZQy0fsQkDOIk5Si8clx3bcI+5PKLVSXqWOj3Dcn8O3javaJDMoG0luVf/QcREgRT6iEUvFuzCoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787217459; c=relaxed/simple;
	bh=7e4DPtHvNukBIi3gZuD7dAfUEK4+I8dM8LnF7QDHFyk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UBqtkNVwi2/6FcJlD49qg9Hor8xe1hbh4feToDHV6n29PdjzLrSLrbmLc/AdcpW1ggmxjLg5G0h1Z0Wc+cuUMZN5zSdBb4N9xighu7Q+cRTDTXV5t3r/81ce25rLXjaCtz9um9psr+8hheNoJjCncaieAJpiguf0znpBSwopDi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=gADtwdI8; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="gADtwdI8"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so21424105e9.2
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 02:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1787217456; x=1787822256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t7LWSb8qWivuTBFZOTkhMvIYG3C3K+jwZJ32iqKW5og=;
        b=gADtwdI8V1CW7PMXLsaOdZMbcTpctZAptrxpXnxfoUGZSHsQZNhByN27RdK6UE/aYE
         d2cckV5rIV/72L3p2JFxe4Yt+c5M0mWhxLCSTPlvpPyVBjmlqnuTigywdhEhXdTwlxMa
         /mycC6j5ZFezXPwX1kTpIAu6gxeF6Be8Su+yM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787217456; x=1787822256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t7LWSb8qWivuTBFZOTkhMvIYG3C3K+jwZJ32iqKW5og=;
        b=QhCeUThI/SnpJVpRmKUsgThBL/nv27zQV4FE2GP7TR5NSDBFmtAZKys31zCab7+iZi
         jduhuP43XDW3cATBycHBSI8aMkXIemCcW6exwm/OQcrWqYxpv3MZ0by0X6MT0jsjuSjT
         uInYVCzBoOlKW4FdvJ79Vzkz2AmE4MXiJ0/WjBA9FJPRLKNGtQF3nG69cV29jKBjrQVA
         R9QKMrHhIEFzPtoKzvEstkoirtaHQPfScsQLJJMzK5jowjE2sGVLOMAtXxQ9ZbLiBPoI
         2F9XgOmiIzdmjy4f5YbnKc7W8W/qQzwWepHGKqisAjPVqMzugmanza7Ocj+r2+39zslh
         nZDA==
X-Forwarded-Encrypted: i=1; AHgh+RpYcAjacB8E0vMkpYRT0dh1q0fSDYrUg33rDJQ9/p+yhMs7/S6OKDclX4ThGSS/+/hwS7Ez4Q2mg3Hg@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi3n8z79Sh84iwxSSMhx57Evada++qaQ6ldm//Dnl9z7Kcwrvp
	LOjksIcmX9kkQI9dNdRpVQxnMMtTVH6JlMT9/bHfzzsvt4843LxeqrYppBgaUescwf4=
X-Gm-Gg: AR+sD11HqzibcImkYMtqdjBJEc3cjoCaQSc1Y1NvtaHgz8VA+kh57Od/wePmllEDQcZ
	NcOFFO7LwKrKOhDbkObBSFmcEgBEhuPCu1WxwUIEntPRpUVxeqlGWlEcqqkypZG3oPm+Y0kCEVY
	Y/n/a0Mv7OZNcjjPOVg8AXuFBN7xjDs0aHAnCGBvXLzGNBrKXenIGTEtg2orBb51zB5Sao6hxZF
	g6yI456K6B7Ra/ALrDMnUb09WNGEfJrpvbUAMYkvhVChWrvcv8qwDy+O/07PIiuhovsVOFlwZFD
	Ik3ZbF4hsixTuC1DFVHZdkGmE9p9gJxSssfYJ7wpeVxaDmUTSfvMju/SA9SbBW653u+73NUTtzC
	8SCCUaXrPwtRfr7hRbcNbNlmpQPbRpJcinL5IWwRM/g+D5PfRyHe4cytlakqjNoQ7RQf8Ss49Cr
	S/BDO+nzFitToVqecpAO3+zhYPXH359xY3jKxk3L7DU8D3LrSfYHXX5Ym4PXOgXcSC5wX5vmmz2
	y0mvghFkKGGWpz9g/zdJepxhUHY5U8kXX/IpZXNZhhFxYwfoUVzxSMgzJlwZSGKDdEoUnpzpxqg
	lFWN8YvvaEsWzssnYAhRxtxtyt4VLr6uhV7OzvFowqITq4eQIaWAyKWPBeGBqQ==
X-Received: by 2002:a05:600c:3f19:b0:499:51f0:a9b2 with SMTP id 5b1f17b1804b1-499aa1499ecmr217324705e9.1.1787217455710;
        Thu, 20 Aug 2026 02:17:35 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-86-139.retail.telecomitalia.it. [79.54.86.139])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14c3775sm10021606f8f.26.2026.08.20.02.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 02:17:35 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: alexandre.torgue@foss.st.com,
	francesco.utel@engicam.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	domenico.acri@engicam.com,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v8 11/16] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Thu, 20 Aug 2026 11:12:19 +0200
Message-ID: <20260820091652.43541-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
References: <20260820091652.43541-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the sdmmc2 pins used on MicroGEA-STM32MP257D-RMM board.

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

