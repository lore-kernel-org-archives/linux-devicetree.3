Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E5739AD34;
	Fri, 17 Jul 2026 09:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279649; cv=none; b=AE5wxpxpWN9mtycobLwm+U6970rxGeA1Wzz1Js/RL9zoaDHlUYX4EyBK+Aocn3yVHkq9Sg70Ld3OUDR6GqB/SZU7g3iDtktnxEUunayrliaNN25E+8xfOZ/RhzeTqehRFcHsHuWtiHrpsaztaFkzM9ooQe4BRcTEyldHMBRW/BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279649; c=relaxed/simple;
	bh=O75sBDl3h2ri+8Wkh9qotwgoinVNqibtbWrcDKixjrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OUVWdL2iX/WG6uULnuWXzvG77DXmB9OJK+CYNj8vukrx+uhiv7uJ6bO43OkJPAP0QTSm97zzJ6GSSFCw3v9YWxxB0DEfUEOX89NqIN5wHHyJj7/+isbEpQm6Wa1to/+acu8VhlI1jad+0GHDToG5hX8UlzStTYrkBujNmbqYKKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M8d0K+41; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M8d0K+41"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AA01F000E9;
	Fri, 17 Jul 2026 09:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279641;
	bh=hdEdwOk9Yi6Snu3myq/DFMCAWJnPUUX85o2H98P1x9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M8d0K+41rR4c7K+sMXbp/wtNyXxoel/OeMKi3n7FSO0g5t/RPAB6B3wc/GhtlKZdg
	 bbULax718vZJ/jOH4jp5e8jhHW1ZGQB7+XJB6anuVB9tWPYtCHzFGWVY8jQiXAn16u
	 48SGhLGaA5aVJpbew1r9kPR1FEopmWOKHcE0wBfVhyLnUhaSzdOUE1jPsUSeWT9oT3
	 5efFsLC+6616LV5ivDnraCQI+9hxyRGUFy5hJRcM0K6Tg0Nbm4BWy+d0ZN4VH2Ell6
	 c026376Q/pv5QolAD8BlrvQAiIiVHV6PN/1EOaW4vlurHfNiduMyK0NepH8CIj2ydY
	 dm54SL5F/XTgw==
Date: Fri, 17 Jul 2026 11:13:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Vicharak Vaaman board
Message-ID: <20260717-robust-nondescript-husky-ed6c5f@quoll>
References: <20260716092859.512306-1-hrushirajg23@gmail.com>
 <20260716092859.512306-3-hrushirajg23@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716092859.512306-3-hrushirajg23@gmail.com>

On Thu, Jul 16, 2026 at 02:58:59PM +0530, Hrushiraj Gandhi wrote:
> Add initial devicetree support for the Vicharak Vaaman, an RK3399-based
> single-board computer.
> 
> Supported peripherals:
> - RK808 PMIC with core/logic/IO regulators
> - SYR827/SYR828 (vdd_cpu_b/vdd_gpu) CPU-big and GPU regulators
> - Mali GPU
> - Gigabit Ethernet (RGMII, via &gmac)
> - eMMC (HS400, enhanced strobe)
> - microSD card slot
> - SARADC and TSADC
> - PWM-based vdd_log regulator
> - UART2 serial console
> 
> Tested by booting to a userspace shell over the serial console and
> verifying eMMC and microSD storage, and Ethernet link-up.
> 
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3399-vicharak-vaaman.dts   | 438 ++++++++++++++++++
>  2 files changed, 439 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 761d82b4f4f2..e1b974502915 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -90,6 +90,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64-screen.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire-excavator.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-vicharak-vaaman.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-armsom-sige1.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-zero2.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts b/arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts
> new file mode 100644
> index 000000000000..6060365bf731
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts
> @@ -0,0 +1,438 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2026 Vicharak Computers Pvt Ltd
> + */
> +
> +/dts-v1/;
> +#include "rk3399.dtsi"
> +
> +/ {
> +	model = "Vicharak Vaaman";
> +	compatible = "vicharak,vaaman", "rockchip,rk3399";
> +
> +	aliases {
> +		ethernet0 = &gmac;
> +		mmc0 = &sdhci;
> +		mmc1 = &sdmmc;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial2:1500000n8";
> +	};
> +
> +	clkin_gmac: external-gmac-clock {
> +		compatible = "fixed-clock";
> +		clock-frequency = <125000000>;
> +		clock-output-names = "clkin_gmac";
> +		#clock-cells = <0>;
> +	};
> +
> +	vcc12v_dcin: vcc12v-dcin-regulator {

foo-regulator yes?

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc12v_dcin";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +	};

This regulator is completely unused (other non-controllable do not
matter).

> +
> +	vcc3v3_lan: regulator-vcc3v3-lan {

so why here regulator-foo? Decide.

Please use name for all fixed regulators which matches current format
recommendation: 'regulator-[0-9]v[0-9]'
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml


Best regards,
Krzysztof

