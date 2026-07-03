Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A25E38CFE1
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 06:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061536; cv=none; b=c4E9QQmdeLi3Xnj3Dlub9BP3yfVvaRZEJ7Asb1yoC75w3gachv4xthBoDEL31bEd3B5MyLl2claTrPpY6C4/YpscCK98VZ/sCTA+FRbmHTYz2lz9FJqW54GXnasdDmqdNuHSynUqKmwQzQ9UyKPsDhYPFB6zlgf1soyvIVg3MI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061536; c=relaxed/simple;
	bh=ZkhtEabiV0OQud8RHFIq9PSlQ4cGED9HQsmxniWMLIc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GvS1/K2XFjZBpMnjhUEdSpdxa9SxzLEHh53FsIs0rntad3BPkOcBDJ/PBLAbWb7LZTplMsYK7IZjp6jDabJATldS+BduSJYw5pWw9URf/prFEnTKYKxiKvEkBptDl0vERZB5pWXZ6sJ+joveMYDsGY6/3FqsjJGSyoTIZEowqWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=U680zpYv; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="U680zpYv"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-69532288224so568203a12.0
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 23:52:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061533; x=1783666333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=;
        b=U680zpYvMRyysdD5U/62UQOl4Z6+0a3zWaBrvA4XGF+5zo8zeZwxrQqZd/VCE4fLuz
         8QPzme+PM9JyWIGmGuZjUC9EQP7B/x5xlooi7LhMp0ZsRfWYnR39iEOWNDSGX8o1hP6V
         18X227wzvWfg3LXpYCUXesWeYLTDl1IJ6o/Q8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061533; x=1783666333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7oUEPB4rJ19ry2ffYzMEEFC7kNls3yAJStjl+lVDAw0=;
        b=rRK5tqfUmo0kRJB1+mCGVDc++/UmenbNurVpdwnT/hIH6HWQIkHK3pLzNIMwpKV93G
         zHnkD7+UudVLP7Yx74iKPUn4/WMZ7z5YbSAYE0kMcX6OeYNan8jHTWxi2X29PtdH21Y6
         1kWuxHqCDjvecQonOzdVHdNlzLG6kZv3PZ5oVYgUNSqzWUKV/5Js+ij1njBaf2X4SvuM
         Yfk7d6dFIkaAur/YHjz3GrXbAQil91roBKNtwqJY2eB4mnP5FQnEJ77zmzG2t4EhnLQg
         FvWJQ1mSvelt2WExzPUtXrk+WAeF94/tXzLHZk7yY8zT9Xt1/LOhQEsr9uYX26meVgg0
         9O3w==
X-Forwarded-Encrypted: i=1; AHgh+RrlALpXQlod46px88OkBLAQhogRGDQjSng8D5C9JGC4kty44Va0EpnDgw2rpP/jbl0n6RB+6xDaL9tp@vger.kernel.org
X-Gm-Message-State: AOJu0YxAHnbD9lX8KNxSj0iVf/jANPihmEijb0T864EAhKsDpRRtBJYM
	Ld7KuPmaybWq453KXAkqnDbngAKZNKeTIOWhl3WNAeW1J0XECBM7dVGrASKTjfjA0Rg=
X-Gm-Gg: AfdE7cmnuLpGN7DGOa29CfDNXlJOBpr/Tjag3f/lPQdQVJ77XIeGQpsEYfS+5y0Fbr5
	oLHAFwB7sY/Ijp59tdPceMEJmZCeUUp/Mj+EigNro1mVGco+1B/K2T6gOhP8ovmD+uHeQ3eXRWt
	P6fkqANUnF5o8qaQVKd53qjkBywn295NaTei16lgZsBOnSd8NhCIEH6q3DujdgDlpkYe0f41srX
	FkV3niSrJQ45I4lswyBPxaLSeZi3P+hJ0oi4u/2oXY+DH26ITN6Wqls/S58npH6BHXBgUWk4h2W
	5qwvIuHxyJ0ko1N1hHV4vKJi2J+C9+pNldyv6am/GC7eHo6NdwQND8DqTllj9Q+Zp2ssRscpUXI
	2BfIOzy8oiCG6J3jiLFkQV7coQ29wXIFgWR4EIDHOCErTcyNvIqMDQZ6jwBeRnVYBnebYIc5/0e
	+PeyRVi3lK5beOhY82Ga0njtKZ+PFmrKtX1aWec4HXGHyquAOudBLJQPpOCdhwYKFn9AKP/GznG
	mA2U185MX0=
X-Received: by 2002:a17:906:6a27:b0:c07:ef7f:61a4 with SMTP id a640c23a62f3a-c12aa1b050bmr418013066b.39.1783061519801;
        Thu, 02 Jul 2026 23:51:59 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:58 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
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
Subject: [PATCH v7 11/16] arm64: dts: st: add sdmmc2 pins for stm32mp25
Date: Fri,  3 Jul 2026 08:49:01 +0200
Message-ID: <20260703065110.1433283-12-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
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

