Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596903AD52D
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 07:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785742991; cv=none; b=CBHY5IKHgrwkoGDEJPXPUYaVZc9XwhFZLtTOoV/Zapu5KTBye6WwTGNByykH3gylySyYueQVJQunJpcL6iaoZTqKZwC5VpUDTwF4JqnMnwXrSTk2fizg0ftdpR8zt3IiZ+iOrT5iSdS9vbsTfT8W0aofqLP0r5tuqZhw8MgVYcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785742991; c=relaxed/simple;
	bh=NXfXIGVIGeCVikB9TgfoNEer690zMfYo8lkyy6VHVv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OcdPmyo42Fn1Ix7KdzA4MWjKZa8VZrnswyYWheX4vBNuRVed0XXNOXhEWH7h5b0Zbex+KsWxoD99aVioG7Tl9eX5pDaeluEmrQxo5QXdYhLlyrplAErn/mAUjeTUMzjFijxlHw7UdCHsl6zB/5gDKtpAcrx+Jz9EMO6Ky0nRNN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=h4kcUwed; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="h4kcUwed"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f71156e1aso1513049f8f.3
        for <devicetree@vger.kernel.org>; Mon, 03 Aug 2026 00:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742989; x=1786347789; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=h4kcUwedk7unOSRaxHwNWUPszc2hpuHXUAP+WdKWnaWZ0vM/cM2X7rhReEkjlcOV9T
         S0zd/ljlFOFAl9xfSvCY5ESk8ulmQGPBbiL6n3BkUcigLHcxuou43eKJm9KRGS2YRS2F
         0khi3OQjSoSOG25LsJv11kCj1LpznRhjQDQaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742989; x=1786347789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=Bg3iMuu4NjFHtYeq3AMyvWlf1ZM3y6EqTRF46TYakm5SyMzaT6XeWwpP1LaSXFn3SN
         6JaSzAECi8PUACRo+ojMcP3uAQB2VKfpBg2mnyvqGcQHmJ6rj6xL+I3OPjFcMIx0onIb
         cWZT97/xmu7c3MNidMbMnix9vqBte9b0EMoy3huU4aAH5szIGNO68rXCAdbyQl7JWLUA
         c1M3TUYOWLlePoo9sSqNI8UV6nL1k/M1kG8kUMIUfYipUkUBxenGvysVzZ9cVo/oSgxU
         ZPeCbWtLsqNlWout7xwEPuM9/CM3i5oqEGEQC2TaVlEW8HFkzcrLJhK8jq+xaN9iDRpe
         Ufsw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1GNDF324L26tnEf/3p2uVyKL6GjWt830xjBZ3c55OjWS2NHY1UiKYa6E28lUpOeZ4l/TSUKMuLfO1@vger.kernel.org
X-Gm-Message-State: AOJu0YxOrinhb9tH19qVV9dEWCDH/26axxiGVmAZJFVv3uFT10NbxZa6
	HaAK4Un+E8pGlNjPVTiKd17BwUkGoFH71tsSHhHRcXhVO0IGDBxkB1maLHxe+PGB1yU=
X-Gm-Gg: AR+sD13XoSyr8VFbOdDJJYzrmLSVJnar4FM3HD/C397NraRAD6gbJFzkr4Hqm7Fw/KJ
	nYpD2z1j1R212BK3XA31Gjo6KYhvngvGvbaA0W5AND2hI4fjf/meIPuLTbuuCkxmJXalsQqtbJb
	l9tcIt46dh8BW1vkTdhpuwc5L08YtcE+sTbU8fdeGfgwJFWtDhWK4NKZm632vJnGQ6t7m0OIQ3C
	H5+owv93BVqR3o0d6bM6HiDBuufCjwpKjQPUFypBovWOoiCTmnagZcmbDjlWjMh9OfKq8ku5awN
	GeVaIswQsCpQaWY7YS7WSiihGGNhh1NAOrIWTpbfZLmsGQGtRwmw/Lz0RFyIlP5JbE8mt8p2HRa
	Jor0lHoAFIJxcvs+jkkCwe/kz2AXgZ70bvxUyWh2XGuL+LA8A+0V0Y9HEdWqHvhZbPJricEhm5q
	ZmBDCrBOIU3osQgBkWCfm7H4MQjbkhonhuZqtBERQrVtiypn6w7nbmJdKJFkQm1zfwthSIjA8IG
	+4uAg+rmxQGapTvUPVP48CtfzpfzM55z7jZKimg9gkZLJlMtMkX/4xROXaZ/rgY/Iuw/pdJfQ8e
	qsEBWw0tEXBjsLhM7bum0m9Wa93xYMfxPLaLowSgUmpGXH0VviTICqCH3fcGGk83
X-Received: by 2002:a05:6000:46c4:b0:47f:6f6a:6a7f with SMTP id ffacd0b85a97d-47fd72ab2f2mr17824879f8f.8.1785742988685;
        Mon, 03 Aug 2026 00:43:08 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:43:08 -0700 (PDT)
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
Subject: [RESEND PATCH v7 12/16] arm64: dts: st: add spi1 pins for stm32mp25
Date: Mon,  3 Aug 2026 09:26:07 +0200
Message-ID: <20260803074224.3821911-13-dario.binacchi@amarulasolutions.com>
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

Add the spi1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index c816a6aece47..4e570e2e5157 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -702,6 +702,30 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	spi1_pins_a: spi1-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 6, AF3)>, /* SPI1_SCK */
+				 <STM32_PINMUX('I', 5, AF3)>; /* SPI1_MOSI */
+			drive-push-pull;
+			bias-disable;
+			slew-rate = <1>;
+		};
+		pins2 {
+			pinmux = <STM32_PINMUX('F', 12, AF3)>; /* SPI1_MISO */
+			bias-disable;
+		};
+	};
+
+	/omit-if-no-ref/
+	spi1_sleep_pins_a: spi1-sleep-0 {
+		pins1 {
+			pinmux = <STM32_PINMUX('G', 6, ANALOG)>, /* SPI1_SCK */
+				 <STM32_PINMUX('I', 5, ANALOG)>, /* SPI1_MOSI */
+				 <STM32_PINMUX('F', 12, ANALOG)>; /* SPI1_MISO */
+		};
+	};
+
 	/omit-if-no-ref/
 	spi3_pins_a: spi3-0 {
 		pins1 {
-- 
2.43.0

