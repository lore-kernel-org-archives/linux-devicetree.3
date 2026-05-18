Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97824313552
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 15:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779116879; cv=none; b=AMR1Ye/qg0dnV8Yd9l6rb8GX4p1b666yx1Z+HL0BUGbDwSGlVqliPAFF0Szh8qymBHt5iaCkSE2bkTRYgSixhv+U7Sol8dJ9bQtadJEa2ZkxAWGKxtyYSqKPkJh1LhYOgyY66gsGOPOZTs6KQdAysQW7J7gD2FbBxRhzaEKJlsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779116879; c=relaxed/simple;
	bh=yzILpXKKjOrTQfr+i4MMP1TXicuUMSWaXmmrnN/Q9gY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jnZpLeqnAE/Lo1MDI5rBOJ/ONG3nJ1xNrW+/UpQx+XRbSEnj5W7EdhxjbI/vxZqSP6n0saufpCZwggzJXS3f3rFQ0z5OVbQzV8vHZRe3FpZcN4JWL9/BAZY2LMZcEFMLPvAv8y+/jlPkFLLRHlyiP7QRGKHd5CjtNvjzybPCiSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n5HTs9cq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n5HTs9cq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 039F4C2BCB7;
	Mon, 18 May 2026 15:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779116879;
	bh=yzILpXKKjOrTQfr+i4MMP1TXicuUMSWaXmmrnN/Q9gY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=n5HTs9cq0x/vYjA7SZCMMCochu/tIwmsCqN6/0jlv4QDdBheq1ZFi/DKIJbVpM+Fm
	 QVi4ROjb67nEDuvNcVpE6ebGv5lPEnDVwQNpVLdzOrVe3FNqU4ZNBeEwGqbaiI4yeM
	 Pykc6snMO2NKFCzJBPSaOY/zh8vQ2sSfIGJNqfBR5Ka8vgMjGADFrOp0g5YF6DDJR3
	 4JpCKfVa/hVwCH/4U9gRgdXXbN1qsvCz+t9RM2a1BTx6o0WHSdgUwwQr1T1iwkIxOf
	 lOi/7wu51FfekgriVl0J/fSfIHR8a8fg6c731U76zFppNZvEoiLOhbwqHn8fYdUHA7
	 01AW6F43uTRkQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/15] arm64: dts: st: support Engicam
 MicroGEA-STM32MP257-RMM board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dario Binacchi" <dario.binacchi@amarulasolutions.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260518143150.3138712-14-dario.binacchi@amarulasolutions.com>
References: <20260518143150.3138712-14-dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 15:07:58 +0000
Message-Id: <20260518150759.039F4C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Incorrect clock override on the parent `&sai1` node.
- [Low] Redundant redeclaration of labeled sub-nodes 'sai1a' and 'sai1b'.
--

commit 33b586ab74c039ad01865906f417ac15ced15e98
Author: Dario Binacchi <dario.binacchi@amarulasolutions.com>

arm64: dts: st: support Engicam MicroGEA-STM32MP257-RMM board

This commit adds device tree support for the Engicam MicroGEA-STM32MP257-RMM
board. It configures peripherals including eMMC, DRAM, CAN, LEDs, LCD panel,
SD card, audio codec, and buzzer.

> diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts b=
/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
> new file mode 100644
> index 0000000000000..1d5e023b3b442
> --- /dev/null
> +++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts

[ ... ]

> +&sai1 {
> +	pinctrl-names =3D "default", "sleep";
> +	pinctrl-0 =3D <&sai1a_pins_a>, <&sai1b_pins_a>;
> +	pinctrl-1 =3D <&sai1a_sleep_pins_a>, <&sai1b_sleep_pins_a>;
> +	status =3D "okay";
> +	clocks =3D <&rcc CK_KER_SAI1>;

Does overriding the clocks property here remove the peripheral bus clock
reference? The base SoC device tree defines this as clocks =3D <&rcc CK_BUS=
_SAI1>
with clock-names =3D "pclk".

If the bus clock is omitted, the clock framework might disable it, potentia=
lly
leading to bus faults when the st,stm32mp25-sai driver accesses the registe=
rs.

Should the kernel clock (CK_KER_SAI1) be provided only to the sai1a and sai=
1b
sub-nodes instead?

> +
> +	sai1a: audio-controller@40290004 {

This isn't a bug, but does redefining the entire node structure and redecla=
ring
the label for sai1a (and sai1b below) clutter the tree and potentially trig=
ger
duplicate label warnings?

The idiomatic approach is usually to reference the existing labeled nodes
directly at the root level using &sai1a and &sai1b.

> +		#clock-cells =3D <0>;
> +		dma-names =3D "tx";
> +		status =3D "okay";
> +
> +		sai1a_port: port {
> +			sai1a_endpoint: endpoint {
> +				remote-endpoint =3D <&sgtl5000_tx_endpoint>;
> +				dai-format =3D "i2s";
> +				mclk-fs =3D <512>;
> +			};
> +		};
> +	};
> +
> +	sai1b: audio-controller@40290024 {
> +		dma-names =3D "rx";
> +		st,sync =3D <&sai1a 2>;
> +		clocks =3D <&rcc CK_KER_SAI1>, <&sai1a>;
> +		clock-names =3D "sai_ck", "MCLK";
> +		status =3D "okay";

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518143150.3138=
712-1-dario.binacchi@amarulasolutions.com?part=3D13
