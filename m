Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFFA3EA942
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 08:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783671143; cv=none; b=EDRWjFw96d5LuOATdwN8m+GsjXRVKV+JTz4vuvbywomzYM4RPcgEUuqsaZhLISAJq2cpkmNMPa186sbYwUVz4wxp8skzBE8ZQ32+QNJ7l/6edsNCbtEHD1R7MfvsQXvFPV5zHMpQDKtZ1BEAhUymy9M6MYquRPjyTGLDQ4zeudE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783671143; c=relaxed/simple;
	bh=xPVAzqbtmCep22wXtqGVdQbZus2+hvqLp+Xtt57noLw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o0NYcw63ccvG+GTmDq0eG5Gc+n0naV6Clfg2hK1T5XbrVaq8U+x1MxsuvVS5nm2ZEkX0f1MbpAlzLv76UStx2Ri3PhsCTzTD7fse+NGvnT/H3HFcXZbYUpfgUxfuSbQINHOLbCcusBECBlAmOuKVzIA/tO0OMzmFiDCQYZVi0YU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AmNoFxcC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AmNoFxcC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8D4A1F000E9;
	Fri, 10 Jul 2026 08:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783671141;
	bh=tyumfbTw13FMywMSssTqeSv9eFHFIvAmE8iGZwAXwzQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AmNoFxcCjX/639pGOel70+pIor00h5o1xhTk+qRiZ7+yF2WSpenGuvfWy5tDK1q7v
	 PEyaACMopRAcm3NWd1cTDstIg9+YE74fMFJXUAWymJIBRDfX1DYZ4eUv1Dqv9NMOGy
	 yW+/BaPUJMaPGeCjwG7cqjydlzMyf+ramzyu9ZDXK1+mn00OoBX66TMrNsBSrGASAQ
	 SSX8dS8mtYcxqqcp4IOUk3xcqG+BjomadADyYprFgiFQY9kwtQsLDYb0DpDC8vR5g4
	 sSxcFxduwYkRJNegfsstavQlSucrXIjcchox3QPX9TKDO28/EmytlkwVOW+MB+/9EC
	 UWelzJDEwQpSg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] riscv: dts: sophgo: Add Milk-V Duo 256M board
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chen-Yu Yeh" <chenyou910331@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260710075917.159969-4-chenyou910331@gmail.com>
References: <20260710075917.159969-1-chenyou910331@gmail.com>
 <20260710075917.159969-4-chenyou910331@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 08:12:20 +0000
Message-Id: <20260710081220.B8D4A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Missing explicit pinctrl configuration for the status LED.
- [Low] Device tree node ordering violation for `gpio4`.
--

--- Patch [3]: [PATCH v3 3/3] riscv: dts: sophgo: Add Milk-V Duo 256M board=
 support ---
commit 40bbbb1b4ad92a0f96cf454940bcf6e5942c12cb
Author: Chen-Yu Yeh <chenyou910331@gmail.com>

riscv: dts: sophgo: Add Milk-V Duo 256M board support

The Milk-V Duo 256M is a small form factor development board based on
the Sophgo SG2002 SoC. This patch adds basic device tree support for the
board, including UART, SD/MMC, USB host, and a status LED.

> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts=
/sophgo/cv180x.dtsi
> index 06b0ce5a2db7a..25ad2bd265d76 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -160,6 +160,24 @@ portd: gpio-controller@0 {
>  			};
>  		};
> =20
> +		gpio4: gpio@5021000 {
> +			compatible =3D "snps,dw-apb-gpio";
> +			reg =3D <0x5021000 0x1000>;

[Severity: Low]
This isn't a bug, but are these device tree nodes ordered correctly?

The node gpio4: gpio@5021000 is placed immediately after gpio3: gpio@3023000
but before saradc: adc@30f0000. Device tree nodes within a bus or SoC node
are typically sorted ascendingly by their unit-address. Since 0x5021000 is
greater than 0x030f0000, this node appears to be structurally out of order.

> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;

[ ... ]

> diff --git a/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts b/arch/r=
iscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> new file mode 100644
> index 0000000000000..21ef6ed9f0d21
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2002-milkv-duo256m.dts
> @@ -0,0 +1,121 @@

[ ... ]

> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-0 {
> +			gpios =3D <&porte 2 GPIO_ACTIVE_HIGH>;
> +			color =3D <LED_COLOR_ID_BLUE>;

[Severity: Low]
Is it intentional to omit the explicit pinctrl configuration for the status
LED?

Without a pinctrl-0 or pinctrl-names reference, the led-0 node relies
entirely on the bootloader's default pinmux configuration to remain in
GPIO mode. If the board is booted with firmware that does not pre-configure
this pin, the LED functionality could fail.

> +			function =3D LED_FUNCTION_STATUS;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710075917.1599=
69-1-chenyou910331@gmail.com?part=3D3
