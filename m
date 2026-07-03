Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 737EE38D6AD
	for <devicetree@vger.kernel.org>; Fri,  3 Jul 2026 06:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061538; cv=none; b=RDWLgsXNdDGQCd/ZOHs/0Qa5DyZpZZXIV+wW3X7QPsuAzPxmt30hP/9ewWiatJb8A/CJr9iGnCGOpvgiCZimEB8gQZOWzmMcKTS7Q8BzqwuXX8QB9m+dttgnuIIMecDI3tlbzOr/TUzxLceYvBM96JCzVuyD+ON3sbi3MRGuI1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061538; c=relaxed/simple;
	bh=NXfXIGVIGeCVikB9TgfoNEer690zMfYo8lkyy6VHVv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YamEnVcX6Nk6cIm0ljpkkatNm2eiFadKYNjbElzUlg7PX1WyiXiS2cLHJWkfqy2JjGL5eplbNre6B5a/D/5zfCC4sRe5YbpmaIOJniKNRQLqUr933SIhzcALLHfbpIm+AKA6qHUcEC15DVmMINpVB9J7ALSA2DosslEAw20RYXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=IWMLIKk9; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="IWMLIKk9"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c0e124d2a21so19854466b.2
        for <devicetree@vger.kernel.org>; Thu, 02 Jul 2026 23:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061536; x=1783666336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=IWMLIKk9i2jcPAdbWR7uNs1pYCMFU3nLBrk6QuTiwl7zGVbFS6e8s0bhyP5C2KxpnE
         2GAef5OjbXfxlZ0BZz6Q1wmQSiuKLOvovODRJ1wppikBWxvUv7TvgzXXLZ+pawbuLz23
         d3xtR74ja9cTYMwFaAeCQ+dMJrI7rHkTaToNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061536; x=1783666336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q8e2F85Jk42cknJBTKAisusI5iJFywDQWX2RRkkLus4=;
        b=UsUfPEpz4CX1Q+7HoCRxiuLaJCoTmyTlK8atW1q7T/HVlDnln2FIq3ck0XF6AgBXh+
         gLZco72l+KdTSUPy5IuqyxUIoSrOjgtPkxba8rVYqnqM4DVEBv1PwjTo8dhmy6rlbRby
         j1aTc+i2se1aoE4yelbOrRlfKd4wIia0o9E6W5MBe3Fer+CwbGIt0SGuvyZVmQtS4Fke
         TluSYBmr/JNQH8m55uythkufuhRoAGJsmFIYTw4LPjOXcSlfXOnaxXypatgHpt0Zw+1g
         LoERbe+mKANBjVWVpG0AtBRftKlK/eZfrdLDT7e1TdehXJXAIUfsF3h7rSDhNLZD+zES
         r1KQ==
X-Forwarded-Encrypted: i=1; AHgh+RomxVT0F5PByIPtikYAY6IzErCaRd0iiPXNi6THaId6KErIU/tmFRei6W1Fw+1liCTscGzxr8c4x7wu@vger.kernel.org
X-Gm-Message-State: AOJu0YyK6Prp69WeQPyV4T7Uvk0jLrDJR/sRtzMnUOAtx7amhu0TIaWV
	cBfgiqRGuC9mG4QYWs7msWAJTV2+eg1jFmk9MLSYv+al7v0OtCZBDIg2k/71Y6oUdx4=
X-Gm-Gg: AfdE7ck9iRKwM0aZzUinmv/TPz0tDxuZLAxe6jgJcCgQwd2pUGt/JwYB2rlgsrYDE5y
	+hD9hEzIq5Iv97BAUWHhlrrLoYlWlV6buEGA5HUYKYzETnzBK4i1JR+u/ffmKnLCqm5jRWtJsFO
	oD773ib3SelZxjiscFXLFlY1eWCcfEhc3p6yckX2eWThsIWI8qfZXYr6E0ZUnxrc3ywzz/yfGzV
	Z5jqEVs0vE6oo+s3v+Uf91kpfony0mQlaTnud5/FrwP7fXabzH+D4x4rDze/tSf71lVLSWPjPO2
	xO+ug6T/GJtjjssMm9/C4JPY73qSVnofW5uLe5k6qnXJXNdIyC0gyAdal3AAKWhsbv/UQUWxYTq
	MRcAVhKThHSBajVGIBgdiWXJpO98s/T2y1D7hUg72OB/eMhLJUIWWON+plvzizwJ+XyZjupSj+h
	B06CtuEWZlv8BlsxgA6RRo7PkyRlWltfD23HLDgy+j8zYwUfI+t1wNc97IJfESOGwCmtO0ULVip
	WRs1Vxv4gU=
X-Received: by 2002:a17:907:1c21:b0:c12:7b3f:6c15 with SMTP id a640c23a62f3a-c12ae8ef9c9mr438232066b.62.1783061535590;
        Thu, 02 Jul 2026 23:52:15 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.52.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:52:14 -0700 (PDT)
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
Subject: [PATCH v7 12/16] arm64: dts: st: add spi1 pins for stm32mp25
Date: Fri,  3 Jul 2026 08:49:02 +0200
Message-ID: <20260703065110.1433283-13-dario.binacchi@amarulasolutions.com>
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

