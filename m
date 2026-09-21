Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 675F945FFC1
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 09:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789982244; cv=none; b=HauVKNLsLkff0cJiX2Q8ucAQuzUtZqwCm6tN0LssHUtr+nl7lmhK/r9cfp1jBaPBT5xyqQOdnYRKzSDxQwrLEPtshNIZcVm72FlLS8CW6fD4BZvmoXqow6T49u+Qww9faVY8PrwKl2z0TQ7qpaxLe15/f4iorhQH3yUgG2OWgSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789982244; c=relaxed/simple;
	bh=xX4E32CGxlVTnSWLoz0dxmDGTxCPRzhqdRhHxD3wygA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f8tpdN/zItBK2U1q+Ln7q5z51OxitT+cIN0Sljy3XrXAqMwqDpits20oy8TX/elJvVxYIJpHYdg8kX0kX63lQKBh+gCAU6KoXwdLS/FSHFWEQP8bzwnemsO/dm1kiw/M4GRMfRlRPNX8cYqt1sFUg6CTpzPlAwBI30gbcjwEiLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JnB9zb72; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JnB9zb72"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C33FF1F000FF;
	Mon, 21 Sep 2026 09:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982243;
	bh=i54IIVsNJ96LZXw7gKpFjeP62IEwHkNvReD2F6goeWo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JnB9zb728EmNdFj+XL3F8Gk2cdiD2jO79HtGcqcVlWgvAwSZAxUqB3sy/SFU5U4sz
	 +BoNnh44zmFsicjK6uqZRidh2Ke59bjCJliiFNoZtHj2dC35JQPp5ZzfDTXbDj9F9+
	 81VW1Df0NM0dOkHlk+O/yEIU4wdHIWJ6upp4/HwLNtM9+oXIj722ukSE5w77JZZwxd
	 P9We8QBqsfZdB8QMw/dtdOHvA4a7G8Eau5HVntpw7M90tC9tYK7JSRkMaaCPn0IlWY
	 eRcD30heb66I5Pnn/0PAhUYmqHmSyfPeJ/ex+EAG/h2jleif8ifSvuCcgNTcLZdK9f
	 lJq5F3TgjFw4g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] arm: dts: altera: add Draeger M48 CPU Module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921090735.3174292-4-petko.manolov@konsulko.com>
References: <20260921090735.3174292-1-petko.manolov@konsulko.com>
 <20260921090735.3174292-4-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 09:17:22 +0000
Message-Id: <20260921091722.C33FF1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] dts: out-of-bounds IO read in gpio3/4 due to truncated reg size
--

commit 3110a5bc839de956f70473c018ac9b733616c145
Author: Petko Manolov <petko.manolov@konsulko.com>

arm: dts: altera: add Draeger M48 CPU Module
   =20
M48 is a heterogeneous board made by Draeger that is based on two
independent cpus, that are monitoring each other. One of them is
imx6, the other is Altera SoCFPGA Cyclone 5. The latter is booting
independently off qspi.

> diff --git a/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48=
.dts b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> new file mode 100644
> index 0000000000000..dae809c02adb8
> --- /dev/null
> +++ b/arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_draeger_m48.dts
> @@ -0,0 +1,123 @@
> +// SPDX-License-Identifier: GPL-2.0+

[ ... ]

> +	soc {
> +		gpio3: gpio@ff202000 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "snps,dw-apb-gpio";
> +			reg =3D <0xff202000 0x20>;

[Severity: High]
Does mapping a 0x20 byte resource window for the snps,dw-apb-gpio driver
trigger an out-of-bounds IO memory access on boot?

During probe in drivers/gpio/gpio-dwapb.c, dwapb_gpio_probe() calls
dwapb_gpio_add_port(), which passes gpio->regs + 0x50 (GPIO_EXT_PORTA)
to gpio_generic_chip_init(). This results in an unconditional read from
offset 0x50, which is outside the mapped 0x20 byte window.

On the Altera SoCFPGA's lightweight HPS-to-FPGA bridge, reading unmapped
addresses typically triggers an AXI bus error, leading to a synchronous
external abort and a kernel panic.

Is it possible the hardware here is actually an Altera PIO core
(altr,pio-1.0) given the 0x20 byte size?

> +
> +			portd: gpio-controller@0 {
> +				compatible =3D "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				snps,nr-gpios =3D <2>;
> +				reg =3D <0>;
> +			};
> +		};
> +
> +		gpio4: gpio@ff202020 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			compatible =3D "snps,dw-apb-gpio";
> +			reg =3D <0xff202020 0x20>;

[Severity: High]
Similarly, does mapping a 0x20 byte window for gpio4 at 0xff202020 cause
the same out-of-bounds IO read from offset 0x50 into unmapped MMIO space
during dwapb_gpio_add_port()?

> +
> +			porte: gpio-controller@0 {
> +				compatible =3D "snps,dw-apb-gpio-port";
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				snps,nr-gpios =3D <2>;
> +				reg =3D <0>;
> +			};
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921090735.3174=
292-1-petko.manolov@konsulko.com?part=3D3
