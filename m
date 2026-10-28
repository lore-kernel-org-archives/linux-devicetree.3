Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793195961;
	b=Yis8qubPcDpi+3ynL33Y3YhUjpCImJjGyX8zRxQA+GBT0tp1TUOLQ9+EWPInh8wFgto4
	 ZclE7T1C5uGh6M11IcMdB4VOP51c9BAPO4e5JMO0Q6bA+1/n+Qt0+VhkCIDsMx62qm7jp
	 rHOvfdbqeNw9gC8QJDOSfQjBaunvN/Z58zCAI4k7SYErUJHrdNROrYUwjsbLTAcWkcHsb
	 iqvwouKc9/Vx8nGO2Vx3w3IqZcyOTOihvFiYsZHjjd7v0OEcxkqiIisEF1+j6ME9zWI+Y
	 c9sdT72SpX/YWWVeWlJaMPOWJcDMvG8vCRplb6OXGoZX+tVhFoqtIYz7SSETJTXiOig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793195961;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lYHXTOOweh1eE7Y7hm8o0zEk1wPirsbRKfDAC2lJjM8=;
	b=TB9nycv+MGeGAJ4Wd3TQimpZ+T4pilRXC+oQOyPyk8FK2D5vEFyu6nIH4mshC8ociFrt
	 qGT1TEiLXn5V1jPy5ysG+yy4mGuLGsft/IKSFFBAp2P1mklRvxEP2HNZgMYDJdsZDttY5
	 g+LiACG7sNoJ2QFIRukVjqUDHZkJ9XuKF6o1SZzE7ghi/serg9QpklbOLotgV2raExfRE
	 9LEeB14pCDtOkkKO2knJ4NbtVgf0kpQSQ8e+uIQxU41Ka9VtW0i5Gc+kzrZqSkYzKmCSL
	 Gp2pVx9esDEcNLRyNDKxGguUSTvUKu7fLItRQUJGyOpIJSfZaXVyI7OjFFnvugpZ15A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=d135ZkWZ;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5469606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 13:59:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5469606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=d135ZkWZ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so8946295e9.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 06:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793195959; x=1793800759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYHXTOOweh1eE7Y7hm8o0zEk1wPirsbRKfDAC2lJjM8=;
        b=d135ZkWZ0M6ftIv8qzLvPuqcdeM5tiOBVyUBSN3wwckCuVNuqXSnhL2Buf1IoYHKIu
         B6jnFQVFZiphxcWZz+Dx9fEfUWyZZoC0l0rG/AdsZ7VIwPMfLuM8Gll06pKM5n7gO2Jz
         3fx14VVhccXZZwEV6t81TRS5U8smBXLzBV/8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793195959; x=1793800759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYHXTOOweh1eE7Y7hm8o0zEk1wPirsbRKfDAC2lJjM8=;
        b=w7dU/7l2LU0/dGCH967+vfW8C9SLGkcyCA4NYnPnVNWtu4LBG32I9TxFco6ExLZ+9q
         qn1Cmy3JKcPJmIq8QW+Ra8QqsCSDPFqv0CdSlzyY0KacGoKyHtiOlMUTC5F0bcAl1dSs
         tJZKuxb3rar6re71BIL9k0xBlSSYR+4VnylP11o5r8VAIGIW25HT+H/VJ0keeirK5VeO
         yvqKVa8a/Nh7RnGktKEo/ct1alj7un6U5aiNEEz12T0M2JcMHHv/2mGMjK8f3L9QzUbU
         jrAGcF3WHNLUzKIrxS1BCryxlwoDmsPFgm/E/ktlSIVw7dTPUlDKYUq+GJ88JHz0Tcq2
         F/7w==
X-Forwarded-Encrypted: i=1; AKwUvBwSQciRtPYT3diAbP+BAg/iHMI2VKjnq9zCWluspEwrNieE11CEk0y3KstbkJtDhAUb25UNDuc01his@vger.kernel.org
X-Gm-Message-State: AFq9FYIsw2x581Xz8QAifaFHqsbgn00dDcPvw2v3uLykmyoot+uTre7L
	l+A69amZGPrBqY7AGkfAwEZ3lUTmJmk/qXKNidnEFHU54biMEFQAF3sOP625EoANeHQ=
X-Gm-Gg: AYBFou2JDpZoJkA0GE+Cj9wPQfUoT6WllKVcteBQpF8EY8zoEoA/+dzR+1OCidhit9E
	LUSq7p17JrOKQKcSF0tDklIB2xghQPhDddFkMaEHvTRzg3W5eJ1KjVC4a4l7D+t0k6rhheaXRBE
	AjBS5aHBMHGgpphD65GZxtVaPpy7IbCeAMKHvYWjPhjGtvQjtbE1vT/1lT6VsQXQSTgNQxJKE8O
	wJ4Cy5A4e7VVDzC2DJulWNHZVQmglBI4g8IDXB0bEJl8iA//gi3YM8k7s34Eh26UQamOVGR6tBJ
	qkoLubrQaY8UtPt+y6w2o1S8L6B+RO9cI86NmsRBPl4UPToHsUXkQB5xcpEeQK6JP5v1D6A53ft
	p62BOzk2fOGOWG+YqWj1+85Od9s1TvamwMULVR8leVB8sCx2L3nIARbdNJHtCzX0iGmXJWBqN0G
	HQTz+APZAJhFp5NyJ6++CI6gyStq3J5l+g05dsZ/h4AFj1uo/wE/jfWiPJmTkldeCHEZ0JHUtBe
	jFTS4HxdV0OCKu8+t2b6OMZFaltz8VNwe7Vk34DSyBBWv2hr5QPE+i//wP6o1CCmBoH9LR8sILL
	BE56jE98jFsqOzWadeOQK5ymOUIlEOgomJ64Y74FE0h3emcd22GjKxJDfyOk6FxiA4i7xw7hzh9
	0XM8XRDxYAXGPv2Ways4oCgIq9hZfnBx2zLOeeTRvy2U3+/6y1U1LZcjnGXXEl3PT6FJxTQ==
X-Received: by 2002:a05:600c:3510:b0:4a9:18f4:925e with SMTP id 5b1f17b1804b1-4a966774dc4mr52485205e9.18.1793195959170;
        Wed, 28 Oct 2026 06:59:19 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com ([2.196.42.39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94f05f168sm37077165e9.4.2026.10.28.06.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:59:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Yannick Fertre <yannick.fertre@foss.st.com>,
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 0/4] Select the STM32MP25 LTDC pixel clock source for the RGB output
Date: Wed, 28 Oct 2026 14:59:04 +0100
Message-ID: <20261028135915.2665857-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On STM32MP25 the LTDC pixel clock is selected in the SYSCFG
DISPLAYCLKCR register among the DSI byte lane clock, the LVDS PHY pixel
clock (reset value) and the LTDC kernel clock. The SYSCFG node is
already described as provider of this clock, which the LTDC references
as "ref" clock, but no driver registers it, so the RGB (DPI) output
can't work.

This series adds a driver for this mux, probed as an auxiliary device
of the STM32MP2 SYSCFG driver, and selects the pixel clock source on the
Engicam MicroGEA-STM32MP257D-RMM display overlays. Patch 1 is an
independent fix for the RGB display overlay.

Tested on the Engicam MicroGEA-STM32MP257D-RMM board with both the RGB
(Rocktech RK050HR345-CT106A) and the LVDS (Ampire AM-1280800W8TZQW-T00H)
displays.

I am sending it as RFC since I am not sure about:

- the mux parents are referenced by their global names. Should they
  rather be described by clocks/clock-names in the SYSCFG binding?
  Moreover, no driver registers "txbyteclk" yet.

- the pixel clock source is selected in the board devicetree by
  assigned-clock-parents. Should the LTDC driver rather select it
  according to its output (RGB, LVDS or DSI)?


Dario Binacchi (4):
  arm64: dts: st: fix the Engicam RMM RGB display pixel clock
  clk: stm32: add STM32MP25 SYSCFG clock driver
  soc: st: stm32mp2-syscfg: register the STM32MP25 clock device
  arm64: dts: st: select the Engicam RMM display pixel clock source

 ...gea-rmm-overlay-am-1280800w8tzqw-t00h.dtso |   3 +
 ...icrogea-rmm-overlay-rk050hr345-ct106a.dtso |   5 +
 drivers/clk/stm32/Kconfig                     |  12 ++
 drivers/clk/stm32/Makefile                    |   1 +
 drivers/clk/stm32/clk-stm32mp25-syscfg.c      | 111 ++++++++++++++++++
 drivers/soc/st/Kconfig                        |   1 +
 drivers/soc/st/stm32mp2-syscfg.c              |  28 ++++-
 7 files changed, 159 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/stm32/clk-stm32mp25-syscfg.c

---
base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
branch: stm32mp25-ltdc-pixclk

-- 
2.43.0

