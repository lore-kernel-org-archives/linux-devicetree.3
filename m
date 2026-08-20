Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBA3543B3F9
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 11:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787226485; cv=pass; b=sRm7O/HspCTDEac3YRhCU/JcHUvXv2ePgJ4WNeoeZeJV8lZf7ecBGNIKxA1mICQxtL/YzDJEk/HjW0ackRFsiCAAvGq4RMRWA48wVdfB+Ro8fdTZfyNm6xiR/Tlk4eCj+ReJx8O6N4huLuEEiEAHcVtz1LhGS8AzuvUPT4tL/PE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787226485; c=relaxed/simple;
	bh=N3XcxuvKeFv0jrHZq7jORW96HDTgTe/U58U3ymleexw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q/prqrJg1YNlHNsG3zZ80YHriTsjQObcuZLqvfkbWTEb/kH3a9dOEfmfARogo5JIlpFfWdzRkxSrmU2mbZr6aO0IEE0SZjPqVcDPD3UKiEyRbIuIPR5rk4h7QY0dtGw7BT9tj3aqu7vUV8pWRe0l2tlGokwpDp6VqagIJcCgd7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h18HZxoa; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h18HZxoa"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c1670dad7a8so359179966b.3
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 04:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787226482; cv=none;
        d=google.com; s=arc-20260327;
        b=ZlsaqOdJVZh+qqRyjQbFlYhy3e8wxKKuV6zgTI+uXHZObo0Prkvv0LatbPCOotwpN9
         6kRk72osxOLHCCjj9v9Wu59uGEZ29dpS02VgxUa4g+lTK+tWC2BH4SbFtrQd5Y16IP8w
         GyIu4r3G1nCb/0g3Cem92MXGRvJkU61g3Q1VJbd48ub0M2HGYoeuzMTw9Po+CCWmCBLr
         z5xOgR1ZgH7DbKtMiym+E8T09yV+xEW78xN+gZKKrRQT/GgsBkCoiIKCaCALhMxcs5Oz
         zTpax7MT3cNX49Jq/+rVzqVSwg5S6SSsSpnQMlYWl5AFQ9ayOaRulfrwURErK0LWYJ3P
         tkoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=M4ykTKD26brTAJUSy1BqDUBmv6bxfPzSIe8lWvsCYHQ=;
        fh=nptnhqWOBHr7e1vGODxEj35/f4aQdOq7VB67nwieCQc=;
        b=ikApyseOgxA8enIix4aqWGeJzGW6yN4Imxn51me6uVwsuXSKn9+gBjIDV35qD/LGLc
         lPiH7aYr9I2I0C+MycQEvDlw8B3McCh0RHsv3EZsExpOChXhhRurg+c+wxgwOId0yVbG
         YdYDiRqA3WEuQ2rgoEE1KTFOGWcePtE/FP7+g7lO4xjasVINAms1ce4KE6eeenW8n7/2
         oHKcnDe8jgYmqUKxGYcV9jQuIk/FH4T9nLl8jg/reJdcvZFemkmeuZGPYfqpNB114uj2
         A/giFS8vnHOBK6nXPqY0XjMoRkBhShu3luegMh8eOMvAXOrddUIWQaSsRAfZIsHAokbL
         MpEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787226482; x=1787831282; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M4ykTKD26brTAJUSy1BqDUBmv6bxfPzSIe8lWvsCYHQ=;
        b=h18HZxoabvn9m/ScdqEyw2LXvAVg3a8Ks6k+ikg3eexYdUFCrjL54D29ghc9LxQC69
         x9Ih6lttJ/t432qM1uJYNSoVDUi5ARvRmIYuJceIXLw6Vh6PzGybvqvjvr2KFqWwYwak
         J9s7mTgxn3cyEBGN8r+9ztQuC8DUpUagH4QZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787226482; x=1787831282;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=M4ykTKD26brTAJUSy1BqDUBmv6bxfPzSIe8lWvsCYHQ=;
        b=rpXWXUlEGWO4wnJULXyKld4m2dhqWLqgfnFmHD9AnOOhS3ZPd2FAhI+Z/n5Ntm0J0v
         2o9AjstuUHzEDG9lMMvIZBM7TZ8Qc359tnEakWUzmYc7PnKU/2rUWbWiF0/Zzy/L6JTD
         D+HmPinhkqkIXrI0dcgAkA4o7yxTpwO4V+byGkDoQmT+QjvmY7CMl+NBpqCZENpIvLRz
         fhtaQ7ZeviyhBpQPBtppitb3nYNAvwBaMcUyjRzo+xFi0xPECJuZJFYeukFPSy2QAUOz
         9NntMGa9gxNcdHFXtUVhUN7MLSbUo2SXGuqhOmMYFEJERzKT8P7KwwqmqeWaIbtSpZ++
         AbvA==
X-Forwarded-Encrypted: i=1; AHgh+RrUkl1e2g7itkZ5iT8IDfAPovE1S9zD/ajuVeDa8mIu55N5u8XOki8F4nWOoGRc4DQO3t2ibOUThuWN@vger.kernel.org
X-Gm-Message-State: AFuF++klFGhQdmXmWqndDOamxBNRrqBzAPZit9dnHqs2w8zIP0uctrQ2
	tbmEEvuHNr8hoFdIN0pTaqbISnxs6/Hl4NChKYrt/6IpFbFpA/ttkEXrCnpKDM9PPNgXgW+GbH5
	cdCmFQh6XqiosnTcvDBMwZdStjg0RkJqFHAESd0z2
X-Gm-Gg: AR+sD12cN9v7F60Vwzr1USUMreO2OeIyqIQjnsGOWWrKy5o81dRuIQHgt8TLPgKLrgm
	dW3QSYzkQyHQwHdrVVbR0ZmpgdA0yr38/vdnPKHudnsglLPtR+LN60KzbMvsixTXKWwJbJJ3bYd
	hZckr4oiIFWYLCtuioZr4Y6C6ZpFGbf/2gHZO6rp4ecmu2CUti+NefAxjWoaCyORRX1NdujRzZV
	rMaXwjukjKcjxXJjwPKyeOOlZ2bc9zhy+IMZgfOzquZmJ00CHgGwBA0bwn5WVMQcc0F6sG2eW4z
	YZuZDU1VUHURLhfvTT3V783rpJQfxKiuau6XTX8zJak=
X-Received: by 2002:a17:907:c08c:b0:c21:96e8:578d with SMTP id
 a640c23a62f3a-c242e22d1e9mr985944566b.15.1787226482262; Thu, 20 Aug 2026
 04:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810121121.210040-1-vlad@zlab.su>
In-Reply-To: <20260810121121.210040-1-vlad@zlab.su>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 20 Aug 2026 05:47:49 -0600
X-Gm-Features: AcwNN1XeIHyrOI_JtbOBD7QmUWCfs6jOmGCxaoJ2CvViBz-nzt4BaJLUZj-8m5s
Message-ID: <CAFLszTiGPVD1UvGcdE64H1To3OWjOYTd9BNV+jHM0=_dEkMsDQ@mail.gmail.com>
Subject: Re: [PATCH 00/25] ARM: rockchip: Add peripheral support for RV1106
To: Vladislav Leonov <vlad@zlab.su>
Cc: linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Aurelien Jarno <aurelien@aurel32.net>, Brian Masney <bmasney@redhat.com>, 
	Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, 
	"David S. Miller" <davem@davemloft.net>, David Wu <david.wu@rock-chips.com>, 
	Eric Dumazet <edumazet@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Heiko Stuebner <heiko@sntech.de>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jakub Kicinski <kuba@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mark Brown <broonie@kernel.org>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Olivia Mackall <olivia@selenic.com>, 
	Paolo Abeni <pabeni@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Vladislav,

On Mon, 10 Aug 2026 at 06:15, Vladislav Leonov <vlad@zlab.su> wrote:
>
> Basic support for the Rockchip RV1106/RV1103 SoCs currently under review.
> This series builds on top of that and enables the peripherals needed to
> bring up a board beyond a serial console:
>
>  - CRU reset controller support (dt-bindings + clk driver), needed
>    by most of the other peripherals below.
>  - Ethernet (GMAC) via dwmac-rk.
>  - USB2 PHY and USB3-OTG (DWC3).
>  - I2C (rk3x).
>  - DMA (PL330) + support DMA for the UART nodes.
>  - SPI, including a new SCLK_IN_SPI1 clock gate.
>  - RNG.
>  - SDMMC1.
>  - A dts-only quirk (arm,cpu-registers-not-fw-configured) needed on
>    the ARM timer node when booting without a secure firmware that
>    pre-configures the CPU timer registers.
>  - PWM.
>
> Each new dt-binding is added ahead of the driver and dts nodes that
> depend on it, so the series bisects cleanly.
>
> This series depends on:
>  - "Add support for the Rockchip RV1106 and RV1103" (v3)
>    https://lore.kernel.org/all/20260729133609.3465563-1-sjg@chromium.org
>
>  - "pinctrl: Add support for the Rockchip RV1106" (v3)
>    https://lore.kernel.org/all/20260729132736.3807082-1-sjg@chromium.org
>
> Testing: boot-tested on custom RV1106 board, with every peripheral
> touched by this series: reset/CRU, Ethernet, USB2 PHY/USB3 DWC3,
> I2C, DMA+UART, SPI, RNG, SDMMC1 and PWM - exercised and confirmed working.
>
>
> Vladislav Leonov (25):
>   dt-bindings: reset: Add RV1106 CRU reset definitions
>   clk: rockchip: Add reset controller support for RV1106
>   ARM: dts: rockchip: Add reset bindings to RV1106
>   dt-bindings: net: rockchip-dwmac: add RV1106 compatible
>   net: ethernet: stmicro: stmmac: dwmac-rk: Add RV1106 support
>   ARM: dts: rockchip: Add Ethernet GMAC node for RV1106
>   dt-bindings: phy: rockchip,inno-usb2phy: Add RV1106 compatible
>   phy: rockchip: inno-usb2: Add support for RV1106
>   dt-bindings: usb: rockchip,dwc3: add RV1106 SoC support
>   ARM: dts: rockchip: Add USB2 PHY and USB3-OTG (DWC3) nodes for RV1106
>   dt-bindings: i2c: rk3x: Add RV1106 compatible
>   ARM: dts: rockchip: Add I2C nodes for RV1106
>   ARM: dts: rockchip: Add DMAC node for RV1106
>   ARM: dts: rockchip: Add DMA support to UART nodes
>   dt-bindings: clock: rockchip: Add SCLK_IN_SPI1 for RV1106
>   clk: rockchip: Add SCLK_IN_SPI1 gate for RV1106
>   dt-bindings: spi: rockchip: Add RV1106 compatible
>   spi: rockchip: Add support for RV1106
>   ARM: dts: rockchip: Add SPI nodes for RV1106
>   dt-bindings: rng: rockchip: Add RV1106 compatible
>   ARM: dts: rockchip: Add RNG node for RV1106
>   ARM: dts: rockchip: Add SDMMC1 node for RV1106
>   ARM: dts: rockchip: add arm,cpu-registers-not-fw-configured to RV1106
>     timer node
>   dt-bindings: pwm: rockchip: Add RV1106 compatible
>   ARM: dts: rockchip: Add PWM nodes for RV1106
>
>  .../devicetree/bindings/i2c/i2c-rk3x.yaml     |   1 +
>  .../bindings/net/rockchip-dwmac.yaml          |   2 +
>  .../bindings/phy/rockchip,inno-usb2phy.yaml   |   9 +-
>  .../devicetree/bindings/pwm/pwm-rockchip.yaml |   8 +
>  .../bindings/rng/rockchip,rk3588-rng.yaml     |  11 +-
>  .../devicetree/bindings/spi/spi-rockchip.yaml |   5 +
>  .../bindings/usb/rockchip,dwc3.yaml           |  35 +-
>  arch/arm/boot/dts/rockchip/rv1106.dtsi        | 426 ++++++++++++++++++
>  drivers/clk/rockchip/Makefile                 |   2 +-
>  drivers/clk/rockchip/clk-rv1106.c             |   4 +
>  drivers/clk/rockchip/clk.h                    |   1 +
>  drivers/clk/rockchip/rst-rv1106.c             | 340 ++++++++++++++
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    |  55 +++
>  drivers/phy/rockchip/phy-rockchip-inno-usb2.c |  76 ++++
>  drivers/spi/spi-rockchip.c                    |   1 +
>  .../dt-bindings/clock/rockchip,rv1106-cru.h   |   2 +
>  .../dt-bindings/reset/rockchip,rv1106-cru.h   | 305 +++++++++++++
>  17 files changed, 1272 insertions(+), 11 deletions(-)
>  create mode 100644 drivers/clk/rockchip/rst-rv1106.c
>  create mode 100644 include/dt-bindings/reset/rockchip,rv1106-cru.h
>
> ---
> base-commit: ac414f5eda0814030636177593400acdacfe5e1e
> branch: rv1106
>
> --
> 2.47.3
>

Just to note that I applied this series and tried it on my Luckfox
Pico Mini B (also RV1103 but more basic) and it boots fine. I enabled
the RNG node and the driver seems to work (i.e. the CRU is good).

For the series:
Tested-by: Simon Glass <sjg@chromium.org>  # Luckfox Pico Mini B (RV1103)

Regards,
Simon
