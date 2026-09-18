Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD80C3AAF51
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 11:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789731065; cv=none; b=r97C/BJFKvwYBt5esbboL2dMd+MvKBstfUOtz2DQQ5/ga9R9TdqD7ON4nwtf2FtOL9PlUydP2HeIeq2ZbG0HnSe/EQsZZcA051lqVzhFg00liCTbAOnm8JBGyLVZBuzJ57a3RV6h08HKiDkwgh+Ykv645z/mUNh9W6IecA7smDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789731065; c=relaxed/simple;
	bh=GcArmRCrOZpELy4TyR6KSE7lMQCZ+2wjNVJyM0Q21YQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pVe3w1BscjuSVv1VbbySRh10l90g8CFOUIoS7ZsIPOPIhvqI3Fskl6fTT3nzo61XUURK5++CEViUiDG8TkqqYrbaU1mHbHpTM7z+G91EJjw3om45R1yDd6UCxZuzoBE/j6yr7wluok657QdusD9UbSMwNCBjC8I0gWxDVm5ZB7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6+N6bW2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6+N6bW2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCB71F00893;
	Fri, 18 Sep 2026 11:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789731064;
	bh=xku0mQ7DlQYT23dIZk7jLMoqOmM1hgklzsAYADSbmPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A6+N6bW2eJ7X4uwztiq31Ufy1pmskigYpnd6qsud3xUqe5gCkkHLsAKZ/duoShy+9
	 +lhzplWdQKyV5N3f/FaXzTRtHKFDZVaDYyMpuQo3nIb8flk7693fRrBetLN+IQFy4i
	 kpDnqL+9bVxNWIBVnOztrL0aY+sAyzMM+BjDTFZ0XMcuKgr+CWPGsJQQBDIFcS1Eom
	 NMyuYaMKjBBf6EsCM/TrTL9wBeKPvH4MLPZkI2vM/YHXSGH0D/s0igK6IN+ZHYrMs7
	 LG++/dv5USnAKDQxbiCu+g5TlBsGkxVpiwss1ev6VqDrRqjIrqP7fWpHx6Ui7xp287
	 dXLwbpjP5MtZQ==
Date: Fri, 18 Sep 2026 13:31:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	qinjian@cqplus1.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux@armlinux.org.uk
Subject: Re: [PATCH 3/4] arm: dts: sunplus: add Tibbo LTPP3G2 board
Message-ID: <20260918-silent-zircon-cuttlefish-bafcbc@quoll>
References: <20260917082632.626614-1-ag@ffroot.co.za>
 <20260917082632.626614-4-ag@ffroot.co.za>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260917082632.626614-4-ag@ffroot.co.za>

On Thu, Sep 17, 2026 at 10:26:31AM +0200, Andrew Gaylard wrote:
> Add a DTS for the Tibbo LTPP3G2 board, which uses the Sunplus SP7021
> SoC. The initial DTS was provided by Sunplus Technology Co. and has
> been adapted for upstream with permission.
> 
> The board features eMMC, SPI, a bit-banged I2C EEPROM (Atmel 24C16),
> PWM output to a buzzer, a watchdog, RTC, and two GPIO LEDs (heartbeat
> and MMC activity).
> 
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>
> ---
>  MAINTAINERS                                   |   6 +
>  arch/arm/boot/dts/sunplus/Makefile            |   5 +-
>  .../dts/sunplus/sunplus-sp7021-ltpp3g2.dts    | 182 ++++++++++++++++++
>  3 files changed, 190 insertions(+), 3 deletions(-)
>  create mode 100644 arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a53620839407..f54a833484a0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3737,6 +3737,12 @@ F:	drivers/reset/reset-sunplus.c
>  F:	include/dt-bindings/clock/sunplus,sp7021-clkc.h
>  F:	include/dt-bindings/reset/sunplus,sp7021-reset.h
>  
> +ARM/TIBBO LTPP3G2 BOARD
> +M:	Andrew Gaylard <ag@ffroot.co.za>
> +L:	linux-arm-kernel@lists.infradead.org
> +S:	Maintained
> +F:	arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
> +
>  ARM/Synaptics SoC support
>  M:	Jisheng Zhang <jszhang@kernel.org>
>  M:	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> diff --git a/arch/arm/boot/dts/sunplus/Makefile b/arch/arm/boot/dts/sunplus/Makefile
> index 868f2ea0c127..25ba2e530c35 100644
> --- a/arch/arm/boot/dts/sunplus/Makefile
> +++ b/arch/arm/boot/dts/sunplus/Makefile
> @@ -1,5 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_SOC_SP7021) += \
> -	sunplus-sp7021-demo-v3.dtb
> -dtb-$(CONFIG_SOC_SP7021) += \
> -	sunplus-sp7021-demo-v3.dtb
> +	sunplus-sp7021-demo-v3.dtb \
> +	sunplus-sp7021-ltpp3g2.dtb
> diff --git a/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts b/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
> new file mode 100644
> index 000000000000..f91b0de79c3d
> --- /dev/null
> +++ b/arch/arm/boot/dts/sunplus/sunplus-sp7021-ltpp3g2.dts
> @@ -0,0 +1,182 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree Source for Tibbo LTPP board G2
> + *
> + * Copyright (C) 2021 Sunplus Technology Co.
> + */
> +
> +/dts-v1/;
> +
> +#include "sunplus-sp7021-achip.dtsi"
> +
> +/ {
> +	compatible = "tibbo,ltpp3g2", "sunplus,sp7021";
> +	model = "Tibbo LTPP3G2";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		bootargs = "console=ttySUP0,115200 earlycon root=/dev/mmcblk0p8 rootwait";

None of above should be here. earlycon is for debugging. Console is
below. root - why booting is fixed to mmc? Why none of other boot
methods are suitable or allowed?

> +		stdout-path = "serial0:115200n8";
> +	};

...

> +	pins_btuart: pinmux_btuart-pins {
> +		sunplus,pins = <
> +			SPPCTL_IOPAD(40, SPPCTL_PCTL_G_PMUX, MUXF_UA4_RX, 0)
> +			SPPCTL_IOPAD(41, SPPCTL_PCTL_G_PMUX, MUXF_UA4_TX, 0)
> +			SPPCTL_IOPAD(56, SPPCTL_PCTL_G_PMUX, MUXF_UA4_RTS, SPPCTL_PCTL_L_ONV)
> +			SPPCTL_IOPAD(49, SPPCTL_PCTL_G_PMUX, MUXF_UA4_CTS, 0)
> +		>;
> +	};
> +
> +	pins_bt_reset: pinmux_bt_reset-pins {

Please follow DTS coding style for naming.

Best regards,
Krzysztof

