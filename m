Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9219E3C768E
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 02:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778813444; cv=none; b=eiFTflcm6zZsxU+nKg8QGlqf0jHZ06ZIYnawUhy0cjWVodwanjgFT+mrUWaxA8ygozHfyGegU0Jm7VOFVp+pDcJyf+G1Am/s2osCigQbPJwf71QExz7wSyuiKVHNgThWdioKedB48O0P5UncaHvkSBF1uxYIuVsBdM9CBK4zMwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778813444; c=relaxed/simple;
	bh=1Pqzqs0y1UG6cPMNOIg3igBFqPqnzgCRxlTKlOklsyA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nn2veT+88oCytSLTYOEQU72Vm6ECw/t4C+3Gqj5MNB75D8pJknDxKp5geNInTMK7h0hkMB5MetRxfr6E3TCKifRqKfA4U65mbbqyYrWIQ7vn5kboxFnoasuSWqZ3nI/mmKGzCLqA8QgSMF+tLZ5wS+kHIJxBA4VCk3nDFHgsy9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZCTG5Si/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZCTG5Si/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C5BC2BCB3;
	Fri, 15 May 2026 02:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778813444;
	bh=1Pqzqs0y1UG6cPMNOIg3igBFqPqnzgCRxlTKlOklsyA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ZCTG5Si/06x486n3k99q4Ai/7nOQ7rh0lg6kBFHz5+hKK2Uy49QchHnR08L/qK6jg
	 68+3NujduGVLD3Z9p2t3+s6g2b/r/YTQ2XiqrKeFCtCECunpScbfwHUq2Ta834eXuv
	 n2IS0GmBYKwIflmtB80PrvejV+D9r3xUvH6w9xky3u4x47bxrCdApGkEbZVEXAbzdd
	 jAj5FAOgnhk5+3IfPEKUYnCirz+x64QeePTObPfxyW6gtAs1CJifIg2H+O2XAQ+Lbo
	 1uHdeG7y4NUpnoZMhsPjowADw++SrRtkdEK+3FtmKbSk+oLVkNZZLSrY0lpei4utJW
	 TVQUWYUHdWIJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 8/9] riscv: dts: ultrarisc: add Milk-V Titan board
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jia Wang via B4 Relay" <devnull+wangjia.ultrarisc.com@kernel.org>
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-8-bf559589ea8a@ultrarisc.com>
References: <20260515-ultrarisc-pinctrl-v1-8-bf559589ea8a@ultrarisc.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 02:50:43 +0000
Message-Id: <20260515025043.D1C5BC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The GPIO pins used for board-level multiplexers (`PA5`, `PA6`, `PA=
7`) are configured with the `gpio` pinmux function but are not driven to an=
y defined state.
- [Low] The `gpio-poweroff` and `gpio-restart` nodes are explicitly defined=
 in the board device tree but are left with `status =3D "disabled";`.
--

commit f0b973e0e230934a238fa1f5d39b91d61efc3d7b
Author: Jia Wang <wangjia@ultrarisc.com>

riscv: dts: ultrarisc: add Milk-V Titan board device tree

This commit adds the device tree for the Milk-V Titan motherboard based on
the dp1000 soc.

> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dts=
i b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi
> index 0000000000000..053206190ec75
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan-pinctrl.dtsi
[ ... ]
> +	mux_dcdc_pins: mux-dcdc-pins {
> +		pins =3D "PA5";
> +		function =3D "gpio";
> +	};
> +
> +	mux_i2c3_pins: mux-i2c3-pins {
> +		pins =3D "PA6";
> +		function =3D "gpio";
> +	};
> +
> +	mux_uart0_pins: mux-uart0-pins {
> +		pins =3D "PA7";
> +		function =3D "gpio";
> +	};

[ ... ]

> diff --git a/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts b/arch/=
riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
> index 0000000000000..21d85c03abe12
> --- /dev/null
> +++ b/arch/riscv/boot/dts/ultrarisc/dp1000-milkv-titan.dts
[ ... ]
> +	gpio-poweroff {
> +		compatible =3D "gpio-poweroff";
> +		gpios =3D <&gpio_b 0 GPIO_ACTIVE_LOW>;
> +		active-delay-ms =3D <100>;
> +
> +		status =3D "disabled";
> +	};
> +
> +	gpio-restart {
> +		compatible =3D "gpio-restart";
> +		gpios =3D <&gpio_b 1 GPIO_ACTIVE_LOW>;
> +		active-delay =3D <100>;
> +
> +		status =3D "disabled";
> +	};

Is it intended to leave these nodes disabled in a final board device tree?

Defining board-level features only to disable them might leave functionality
unexpectedly unavailable or litter the tree with dead code. If the hardware
supports these features, should they be enabled to provide power-off and
restart functionality?

[ ... ]
> +&gpio {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&io_pins &mux_dcdc_pins &mux_i2c3_pins &mux_uart0_pins>;
> +};

Does this configuration leave the multiplexer pins in a floating state?

The mux_dcdc_pins, mux_i2c3_pins, and mux_uart0_pins configure the PA5, PA6,
and PA7 pins to act as gpios and are applied to the default state of the gp=
io
controller here. However, configuring a pin to gpio mode only routes it to
the gpio controller without configuring the direction or output level.

Without a driver or gpio-hog nodes explicitly setting these pins as outputs
and driving them high or low, they will default to inputs. This might lead =
to
unpredictable hardware behavior, potentially disabling the dcdc converter,
i2c bus, or the system console. Could this be addressed by adding gpio-hog
configurations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-ultrarisc-=
pinctrl-v1-0-bf559589ea8a@ultrarisc.com?part=3D8
