Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D25E92C0296;
	Thu, 13 Aug 2026 08:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786609333; cv=none; b=H1pNomidr40PfNueRn9BkHDNnslS7Ndy8TAM7pC7aSTFnoq7zYn3izeo18z2G36TaT8dQUiq5cUrUPuhR2UQs1WH3sK+el+Nu0xvsdsByawjglvKdrHz5iXbX+UxZqPPDnYW+g+X9OW89V6aRL2kKGTSzcWU0oNYtMVHp6zp6WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786609333; c=relaxed/simple;
	bh=3Oc9+igtgoc/lQw/YdF+RWkuIUmKOYXI5dHEemDV9qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rfu4JZEmXqfSn9e0WxgkfoH4+v6fPzoAuaiTLAg6OyXYVx7sj6hz02vmGoKtTjNrOtVy9Ts2WveBkj0ps5ja/siF95hIVt935WFczG+QGoef2l8oFHBgAYt2d91I79AwVRbniYx2mEY9m4HUc+yG1DvtCxuQK3pC7n99zrK7c5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bfpnA+O1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bfpnA+O1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A921F000E9;
	Thu, 13 Aug 2026 08:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786609332;
	bh=o/6dxYzI0TD3UNzRgwz4x8rsUTTcR9wFV/sueb04ia0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bfpnA+O1GmEyuQ0io8f+ZJOvIyFdpJvQUQX7u4jPrn1GRWdOvoh4PZQwoJW/27YsP
	 XX2T/B9QAtKw6jepWyiKK7IM86KtVda6YUguVLQ1Xz1mqXAoZwhqMBeyAOF7ugQ8VO
	 jVRtxAlbreCjU7dYHfOPpcEQ6GiV1pA3K/SvnGCBLWQHr9lasrSgzu6z+w7zyse7HK
	 stmaDVZA4ex7qOIH/TsreFPyXvPIuyZHJyDlSbVEw1T+/B8kKwYgYOiymEcarBR9gP
	 mxzIRPLFHehhblc+87K2w4XllSt7mZB8IaRAPDCO6XgQXtLmZL+jJ3f6jBkbHd4/Vo
	 l1hnDGZf8KRRQ==
Date: Thu, 13 Aug 2026 10:22:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Stefan Agner <stefan@agner.ch>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco@dolcini.it>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] ARM: dts: vf: add Iris carrier board support for
 Colibri VF50 and VF61
Message-ID: <20260813-comical-elastic-beluga-abcb1d@quoll>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-5-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810142047.2811230-5-mehmet.fide@gmail.com>

On Mon, Aug 10, 2026 at 04:20:47PM +0200, Mehmet Fide wrote:
> diff --git a/arch/arm/boot/dts/nxp/vf/Makefile b/arch/arm/boot/dts/nxp/vf/Makefile
> index 0a4a7f9..47be8bc 100644
> --- a/arch/arm/boot/dts/nxp/vf/Makefile
> +++ b/arch/arm/boot/dts/nxp/vf/Makefile
> @@ -1,8 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_SOC_VF610) += \
>  	vf500-colibri-eval-v3.dtb \
> +	vf500-colibri-iris.dtb \
>  	vf610-bk4.dtb \
>  	vf610-colibri-eval-v3.dtb \
> +	vf610-colibri-iris.dtb \
>  	vf610m4-colibri.dtb \
>  	vf610-cosmic.dtb \
>  	vf610m4-cosmic.dtb \
> diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
> new file mode 100644
> index 0000000..d0fa107
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT

Odd license ("or later"), but I guess this is a derived work of existing
code.

> +/*
> + * Copyright 2026 Mehmet Fide
> + *
> + * Toradex Iris carrier board V1.1, common part for Colibri VF50 and VF61.
> + *
> + * The Colibri modules are pin compatible, so the carrier signals sit on the
> + * same SODIMM pins as they do for the i.MX modules, whose Iris device trees
> + * are already upstream. The two SODIMM pins below are taken from the Colibri
> + * VFxx datasheet (102 -> PTA12 -> PORT0[5], 104 -> PTD28 -> PORT2[2]).
> + *
> + * An Iris V2.0 carries the same signals on the same pins, so everything here
> + * works on it as well. What it adds is a regulator on SODIMM 100 that can cut
> + * power to the uSD slot, which this file does not describe.
> + */
> +
> +/ {
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	reg_5v0: regulator-5v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};

This regulator is not really used. Drop, because there is no need to
represent chain of uncontrollable regulators whose purpose is only input
to other regulator.

> +
> +	reg_usbh_vbus: regulator-usbh-vbus {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_usbh1_reg>;
> +		regulator-name = "VCC_USB[1-4]";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;	/* SODIMM 129, USBH_PEN */
> +		vin-supply = <&reg_5v0>;
> +	};
> +};

Best regards,
Krzysztof

