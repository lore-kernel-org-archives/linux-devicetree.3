Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EA03E9C0D
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 09:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811620; cv=none; b=PI6XbA2Xta6T1TP/4z95Zee/d4MnhSQ7uGBgC/cTTMOPLMq7Vc3zgeNzbh0EI5J4iRMCsZ+teUVvmURJi1YzEPf4nqnNThJqXzhqpy3WuerJaxvY5w6vLkdt9MHb3qCPg2jWYKKXiQ+08SuRYL7mPuvWwLarIDg/CBtNSDM6gbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811620; c=relaxed/simple;
	bh=NXfXIGVIGeCVikB9TgfoNEer690zMfYo8lkyy6VHVv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aULOKhO1DWKZ70SHVqTgpa6tO6RBKVQy9D14+Z00xMpzvivWdQw1EgSy3Hbp7aESeni1MGN338rIzeCVz/T3jv+VrJq+cdijevN6ysyupOIWhRaXRUadW8vwjWcOcaPMErv6Ah3spFMO+p0eqHoN5Gci+pC9lvSgf+ETUEvFSNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=MB0N7+NK; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="MB0N7+NK"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-461edb387ddso4133024f8f.3
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 02:26:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1782811618; x=1783416418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=MB0N7+NK+qBrxfVCfoq0AmeCwyy5NmKODwvSQGec2dd8WKpwX3QEn5/GYr8AVodMZ4
         oe7wSA+g85ncpupWAmZwg6RGg7YqSpIvwzl2BVFn3Sp+vVr5DhlrShfTodh8MdKfBk0d
         mvmeBqqyh0GK2yn07tD6bkcPyJwL9K0afIQ9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811618; x=1783416418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=mW/+N3yNTzK23WRjz8RmxZdVmAUiZ8eydnHElCvJ63F6aLpy5N4xNdQimcBAYR5rCV
         M/C02TNZqsCbwQQt3TWlG9Wa580WzolMP8NXNVWRbi/jXmeW6/DvWCyXzazVLntrgmAH
         9mr+Yfq84V4yInSyiR8xxM5EXVLrXqFcHjQ9A6aBWnATptZBpwYfNhATeswM8YarNEUB
         Od/EEtbcsstt2eTZlKdU7Kt+OV6NAvm/wZc/5ueiU2W6qOCkwLiMu7lrMqDgDumvIr7V
         vCC3c67N9mtgrdzHST/Ys3cjSETYYNQFyZ8sC9XLiKOOag/wZ6LspiCEyCET88/fucMI
         vZfg==
X-Forwarded-Encrypted: i=1; AHgh+RrqPOHWX6cjPnjTTlcywDjXsnbBzvynA4+MbFn2GkXpV0LDMg92Xm/YYTeijz/6cJSCaXzOurs/CNUp@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt9B5uFL93JKDVAPjWpXQHDfofbktCSIkdbvcwpYG9gaAgYhL8
	0OxSMzJ0BXTCqNB9iQN4NwhbEtCV4+1/k5/HRtu9ooytOUFwHuGuiL0GT7lukn1IPfQ=
X-Gm-Gg: AfdE7cljAgtqArAdweppPE8mRTG36W2nrVNm0b8V3zksUmzRpofLKL6DJmkMDRHjOBi
	PvWjUaArgnIA3Xy9riGzLQ0BEXojwURdGTvfIGOG+KFwuP6y+PXVce7rBJY04yKKa0QpEnuRb33
	k8/nhI1DB49KKqmWzYR6N5Zhg0F1m94Tx91c0Vy19t4kCyLLbwhechDP7ac3Fq5mq8Cij6smDIH
	GmrQf0IorEeUsPDcOanoad1BK4zWAeNHvtepqgAOXBs/i938TYwXlsEW3ORBmoo4wzRKez7+3nh
	/0HCBEeb0Wh3IULV4JgMH2E+pmhipCwcw6pB7b+E2IMMffjmaVGOgpX08OvRKw8EiFX/HaPH6Zq
	nU8mtiVST/FQwz+o2gTu8ww2pdbgVKV51A8rPZD36ymaJ7BDpAbY545h21Hfdk2LuK7dfutKVOC
	N8H64jPqMAN6N2n7kJ81bYg7VLHRjEBj/fldybRmx1HpKR5zNdP58NH9CIr839bH3sFi/OH00NG
	WA9VcrK+/okRx4sz48UkFzXvrsMHVnuFh6foyZ7XRz8hcocxwROKnF5Awu8mCKZbJ5VjmcR6jIa
	XykUaKc7qKDP4Q==
X-Received: by 2002:a05:6000:468f:b0:472:8343:7f5b with SMTP id ffacd0b85a97d-47550da01acmr2998787f8f.17.1782811618024;
        Tue, 30 Jun 2026 02:26:58 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47567a6f0ddsm5669083f8f.37.2026.06.30.02.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:26:57 -0700 (PDT)
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
Subject: [PATCH v6 12/16] arm64: dts: st: add spi1 pins for stm32mp25
Date: Tue, 30 Jun 2026 11:24:41 +0200
Message-ID: <20260630092628.1695560-13-dario.binacchi@amarulasolutions.com>
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

