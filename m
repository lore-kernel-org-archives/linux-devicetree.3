Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6938042AFAA
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 18:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534406; cv=none; b=h/oHLeMqUWVOMio7GIKIW20Y8uzWnOCSirmif2MBXbjNpl0Wh21kPJdPJIyzwBmsFxbwAqHRVuPAZ9Y5LGg+klgQY8Wrn9j5ypWkxlUBpipaS5ZzlDBW0rRAZqvvFs6k1vmtNRM940v324yaA0aywgf3IqnqY0sBvNdZc/HchNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534406; c=relaxed/simple;
	bh=AYelIF8wHDR3wa/9xcd/gaD4T1E2/+3XMDgN38tqDs8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MSLdszCATHqVt1BQKlxWBCVfTLUqvc8Rues8dNo0lD0D0ZhodHjBdUF7avXwTynq6UO1m44vz3Trp4yFgOcmpJKHwsbaJj1FdSb5DgVGNC6vOEDSJb++InLnJcvg3ONtycBWKaZYJqHQm3kv5uTorW1VUkuWoWnmbCw1XwR0HF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j+XAKfVt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j+XAKfVt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BD71F000FF;
	Sun, 27 Sep 2026 18:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790534405;
	bh=+Au+t9N3IgLrvbEOBZOILQ7QogwJI3INkawRRomrqe0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j+XAKfVtiNUNt5lqOTvK8/ldFtmGtYsI7uDZPfejsPhLzvgmhvmW4QrvQjFdIV+eG
	 Bo20tD4OGm+tuQOTOAMII4PhXXoLtr/Dmhp1VTHxGZAjFAmJpzYcyqy5bGLLQS7xQ8
	 VctsfSFB2cYEYaBM776akUFUrC53F/exzMFFHN1k3fqwaWu6iss2lHkX1Xq9JuixxM
	 Dm8dIG1dPg2EbQ0k4cyh6ZQqdbOWkOTs9cXlvI2WWdbwRxrcdRnXQXjYz4uJgHrBu4
	 UjsWRqfAhF/xzJxlEMsW51qEG5YVKWM0xaC8nEGUD8RI9iJonkFvVJMwOiusEfkc7h
	 A3X0kAmsM9r1g==
From: sashiko-bot@kernel.org
Subject: Re: [DO_NOT_MERGE PATCH v2 14/14] arm64: dts: ti: Add AM62L3 EVM
 overlay for GDEY042T81 e-paper display
Reply-To: sashiko-reviews@lists.linux.dev
To: "Devarsh Thakkar" <devarsht@ti.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260927182329.4193961-15-devarsht@ti.com>
References: <20260927182329.4193961-1-devarsht@ti.com>
 <20260927182329.4193961-15-devarsht@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 18:40:04 +0000
Message-Id: <20260927184004.B7BD71F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] dt: commit message claims MCU GPIO0 but uses Main GPIO0
- [Low] dt: incorrect inline comment for busy_pins_default pad
- [Low] dt: raw integer used for GPIO flags instead of macro
--

commit d0e18d861dbf41de9b7a268b82e7b844f57b80dc
Author: Devarsh Thakkar <devarsht@ti.com>

arm64: dts: ti: Add AM62L3 EVM overlay for GDEY042T81 e-paper display
   =20
Add device tree overlay for the Good Display GDEY042T81 4.2" e-paper
panel connected to the AM62L3 EVM via SPI.

>     The overlay configures SPI1 with the SSD1683-based GDEY042T81 panel
>     at 2MHz, with reset, busy, and DC GPIOs connected to MCU GPIO0.

[Severity: Medium]
Is the commit message accurate regarding the GPIO domain?

The commit message states that the display GPIOs are connected to MCU GPIO0,
but the device tree nodes explicitly reference &gpio0, which corresponds to
the Main domain GPIO0 controller in the K3 architecture (the MCU domain
would be &mcu_gpio0 or &wkup_gpio0).

Additionally, the configured pad offsets (0x0080, 0x007c, 0x00b8) belong to
the Main domain GPMC0 peripheral, verifying that the physical hardware
routing targets the Main domain.

Could the commit message be updated to reflect that Main GPIO0 is being
used?

> diff --git a/arch/arm64/boot/dts/ti/k3-am62l3-evm-epaper-gdey042t81.dtso =
b/arch/arm64/boot/dts/ti/k3-am62l3-evm-epaper-gdey042t81.dtso
> new file mode 100644
> index 0000000000000..50975a2cdd2a1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62l3-evm-epaper-gdey042t81.dtso
> @@ -0,0 +1,96 @@

[ ... ]

> +	busy_pins_default: epaper-busy-default-pins {
> +		pinctrl-single,pins =3D <
> +			AM62LX_IOPAD(0x00b8, PIN_INPUT, 7) /* (L21) GPMC0_AD0.GPIO0_31 */
> +		>;
> +	};

[Severity: Low]
Does this inline comment misidentify the pad name?

The overlay correctly uses the offset 0x00b8 for the busy-gpios pin, but the
comment next to it reads GPMC0_AD0.GPIO0_31. In the AM62L pad configuration,
offset 0x00b8 actually corresponds to the GPMC0_CLK pad. The GPMC0_AD0 pad
resides at offset 0x0078.

Should the comment be updated to prevent confusion during future pinmux
debugging?

[ ... ]

> +/* Drive GPIO0_89 high to select the SPI1 path on the VOUT0 FET switch */
> +&gpio0 {
> +	fet-sel-hog {
> +		gpio-hog;
> +		gpios =3D <89 0>;

[Severity: Low]
Should this use the GPIO_ACTIVE_HIGH macro instead of a raw integer?

While functionally correct (0 equates to GPIO_ACTIVE_HIGH), standard kernel
device tree styling strictly prefers using the named macro for readability
and consistency, especially since <dt-bindings/gpio/gpio.h> is included at
the top of the file.

> +		output-high;
> +		line-name =3D "GPIO_EXP_CONN_FET_SEL";
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927182329.4193=
961-1-devarsht@ti.com?part=3D14
