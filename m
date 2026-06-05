Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5169D3AD503
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 12:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780662023; cv=none; b=ezN8cDO9nJdn0QjQQy35qfb6JfmRB/by63OtxUNVqo6MBVmBdrImoaIpPmp9jyIEOwxuYEK+NgioMvohxuLwPYy7Bck23JDY2vaH5631YEd8E5qkpYrJeUL7xKnZEjJrcgEqqNAfjvrvkoADEkt0E4SV8whg5BHXyT9X1w92WK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780662023; c=relaxed/simple;
	bh=xm9o/8BeY4wIz/OiA0rY2K8FPUtC6PGvOrywQYvKq+w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ro6WMXpG1ZKzLfdUkJqQyLE0RIaskM1E9Kus5gVWd38zZBp0AbQR/W/rkLiUbx3yPsRqvveVZDYAEXV9uMDehxHpF4leJb7+OHlWh/ZGqA9J0AAMeOgWJhhdcWdgbYQ47hymFer0PipdZx4VkmDdJJ2sod58I/ZgnEe1NN79sY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=op+23UVT; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="op+23UVT"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45ef1198766so1045428f8f.0
        for <devicetree@vger.kernel.org>; Fri, 05 Jun 2026 05:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1780662021; x=1781266821; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQ4ASpkWIwpAgEFSrqIIvG0Nmxdm6HTzVKFF+4kwu28=;
        b=op+23UVTc1Dp73ByS5T72OtxP2C1HsXj52hdFgqZLEtph2BaRMumCw6Wp1PZjlMDN3
         4NR4R3cRmoAH9qKzzMX7nxUCgbPkFP1WTWyscJmg3mZqlNg19yc8Xsd19uNjbltozNs8
         klje/HlNzB86GdhPO0xXQU6r3NPDAEA7xuj1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662021; x=1781266821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rQ4ASpkWIwpAgEFSrqIIvG0Nmxdm6HTzVKFF+4kwu28=;
        b=khzFxfJYhcrhIqHJBeSyHnKGKuYj91aCkYB0k9VNcfOmSfl4Mn8D5emknf3duMvIA/
         IqMaeciZeL+GSN2HAdP75hbi7vi5IhXopWWQO4AdnSb6tWQGIS0fbI1t9opjSrB8EUfl
         zG/W+Tv511PW2V4sUuhfp+YFSwdFEGZEFX/J6kYkcxxv6L0ox+CfsLYT3H2pFENUbuFY
         iOh7hwGMicDQJjgH1ZH4rv11ISczDWeVMmNy4YIaw+arP0XXQ9kjyGT9IBuON/5IEsL1
         3hN0HhLR8vJHiLlxTMM1eBqtcdz0I6BRCwES+I7CfUzudHRvAhYnK+jgLVFi4wY42KlU
         ZvEg==
X-Forwarded-Encrypted: i=1; AFNElJ/uzXF9HtS8NnAQG0ckqKwvHHge4K5IR96ofn/ZO1uqWXM/apq4aqXRUrRNGNu2Z1a1Rlcb65vvHaY4@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt7StgsghewRoqG1TqA50oYhGWM1wK3XuixVf0zJPNG9AQ8hnk
	rKt0Khi/ZaFT+XTNoHlS/vwciqECk9xBvwtA1XhA4mT5TLrheiOxfO5CRJ+PyOdd3wI=
X-Gm-Gg: Acq92OFU8HSyKF0hR00zNAXXakNYhreAcmHVNSjTP4aa+n72eCge9JJuaFCSFY3p+4u
	NpzVlb2FjEtIlYLY37t/VvVXgxy2dKk8vfa/JL4hBM2ClIxSJOMPV2/SIc407J6hPlaqXmbqRvF
	bsvsY8nKLYJXplkre/wMmzJGwSk37KDanFdX3rl1luWztvvApyR+twDuQ6yCDtApMvMy2u73dPu
	ScuqCTuRa2xDVB94kCKERfzov/BkZk5V7LWyvFqdrNNwMpOm0tdGbmiCgCib7y3Fl6/HR6JBaRA
	aRhX5gJoUF31Mufx0qe1kR6Vg2Cu/WIJnxPMg//EIiw8knnWSx3WlfkUGME+jRsIqA5XM76BUTU
	zfwD9xgYL3vwMCjhMqGHubmESzdjq/SSfKmwJMdw4kDicfxhUnM7dllm5D1o5uuIuc7Tssl+r47
	+JGBEhu8k9H9YVmbQ7wsGg9S2G/tNYHW7C969u7C2wsZqThF+QvuP36ucsEufh2XP7Z7llPe0ni
	wFtylJFwDiK1PnvUZCTjjEi+3U8+2bpqTHliPWNk1yURunaUbGPlVyeTPgpT1ahZwYyUM078lbd
	nefjkfo8CjG57Mwi4alyLNJtMe217ooI/n9aoIVRmUaTrA==
X-Received: by 2002:a05:6000:220f:b0:45e:8526:7dcb with SMTP id ffacd0b85a97d-46032b7355amr3795497f8f.7.1780662020749;
        Fri, 05 Jun 2026 05:20:20 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-48-44-238.retail.telecomitalia.it. [82.48.44.238])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcb13sm24785883f8f.2.2026.06.05.05.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:20:20 -0700 (PDT)
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
Subject: [PATCH v4 10/14] arm64: dts: st: add spi1 pins for stm32mp25
Date: Fri,  5 Jun 2026 14:18:21 +0200
Message-ID: <20260605121957.78409-11-dario.binacchi@amarulasolutions.com>
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

Add the spi1 pins used on MicroGEA-STM32MP257-RMM board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 62f898a55d45..46c5197dcd63 100644
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

