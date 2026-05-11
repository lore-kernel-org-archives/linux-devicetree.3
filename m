Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF3036A36F
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:59:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543993; cv=none; b=XvkiDeorSSDNmNB//0paChB76LSrHM9oTUgeo+5c+TN6782GI260TO92E2dUG25FmXxVGB1oVJmjBCntP/8dDxToRUoCPDtnaFAqaJ0CReAgTthaX+YgRklqRLJ980aJjV+UkYJHZrZl3Gvmk2dXLFBaVf08DIUF7IMRFeRDOIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543993; c=relaxed/simple;
	bh=+46xUJiY2mkK203gOmJD959n29LoVZx4vzqxyhL/FVU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kKRNNxHfCiTpiGIuf20kr67TKCUiOYbjBgC3XCo8OvU/0u0qzHvgMzpehPx1hw3GmEYfiuQiIkeyiwJc2DyZPRq3ZbBAT1FS3yhjpn/w0o5YtbeIdlYOiqCSR+/tJZKww2dRPtUbnwneqriz/PyLnlxRsitdHOch7ND3Breu0bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbFOW8vr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbFOW8vr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F32FBC2BCB0;
	Mon, 11 May 2026 23:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778543993;
	bh=+46xUJiY2mkK203gOmJD959n29LoVZx4vzqxyhL/FVU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=IbFOW8vrgN2qoI0Ta76+aEcb0HJ1wLVL/nomJhMVC2njI0Owo8gAOkhbAjGqO9wjj
	 vBaDC4XR7y6xO6mPlzFGobh4hTHpi42G6Eu/3SBlqXbkOnD4VCu6rtFP8XG/EstONb
	 wsfTvGBGVG/LWSU9H8t1hfuTw6928NlmnrQRn7Cts3+sJyeZRuALo9+dGxbzPYJbYu
	 x8u264FdJjbdRMusLoMt9c0qP54WcsR6JwFt8uwyT0aJbfIb85Pel0DGB1+YeZp3g6
	 dCRDhTBSP9ZRAv4P34ayA9ebI0py76TxYJ5xDo1neKCKEnbLZBgj0fNPsINXQg7mPu
	 0X2YN7PSZ0UDw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: k3: Add pwm support
Reply-To: sashiko@lists.linux.dev
To: "Yixun Lan" <dlan@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260511-04-k3-pwm-dts-v1-1-81fcde1871f8@kernel.org>
References: <20260511-04-k3-pwm-dts-v1-1-81fcde1871f8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:59:52 +0000
Message-Id: <20260511235952.F32FBC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Device tree node name collision causes silent overwrite of PWM0 pi=
n configuration.
- [Medium] PWM nodes specify two clocks, violating the schema for the fallb=
ack compatible and leaving the bus clock unmanaged.
- [Low] Widespread copy-paste errors in pinctrl child node names.
--

commit 9a4ae96f46c2dc497874c74f2a45fcc9d68ce685
Author: Yixun Lan <dlan@kernel.org>
riscv: dts: spacemit: k3: Add pwm support

This commit populates the PWM device tree nodes for the SpacemiT K3 SoC.
It also adds the corresponding pinctrl configurations to enable PWM support
in the future.

> diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/bo=
ot/dts/spacemit/k3-pinctrl.dtsi
> index 23899d3f308a0..1fd39502071be 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
> @@ -56,6 +56,596 @@ i2c8-pins {
>  		};
>  	};
> =20
> +	/omit-if-no-ref/
> +	pwm0_0_cfg: pwm0-0-cfg {
> +		pwm0-0-pins {
> +			pinmux =3D <K3_PADCONF(0, 3)>;	/* pwm0 */
> +
> +			bias-pull-up =3D <0>;
> +			drive-strength =3D <25>;
> +		};
> +	};

[ ... ]

> +	/omit-if-no-ref/
> +	pwm1_0_cfg: pwm1-0-cfg {
> +		pwm1-0-pins {
> +			pinmux =3D <K3_PADCONF(1, 3)>;	/* pwm1 */
> +
> +			bias-pull-up =3D <0>;
> +			drive-strength =3D <25>;
> +		};
> +	};
> +
> +	/omit-if-no-ref/
> +	pwm1_1_cfg: pwm0-0-cfg {

Will this cause a node name collision that silently overwrites the PWM0 pin
configuration?

The Device Tree Compiler merges nodes with identical names at the same leve=
l.
Because this is named pwm0-0-cfg instead of pwm1-1-cfg, the pinmux property
of pwm0_0_cfg will be overwritten by this node. If a board device tree
references pwm0_0_cfg, will it receive the pin configuration for PWM1 inste=
ad
of PWM0?

> +		pwm0-0-pins {

This isn't a bug, but there appear to be widespread copy-paste errors in the
pinctrl child node names.

For example, pwm1_1_cfg uses pwm0-0-pins, pwm1_2_cfg uses pwm1-0-pins, and
pwm2_1_cfg uses pwm2-0-pins. While this does not cause functional issues, it
creates a confusing device tree structure.

> +			pinmux =3D <K3_PADCONF(43, 6)>;	/* pwm1 */
> +
> +			bias-pull-up =3D <0>;
> +			drive-strength =3D <25>;
> +		};
> +	};

[ ... ]

> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/s=
pacemit/k3.dtsi
> index 815debd16409b..07e43b6b256ec 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -797,6 +797,226 @@ i2c8: i2c@d401d800 {
>  			status =3D "disabled";
>  		};
> =20
> +		pwm0: pwm@d401a000 {
> +			compatible =3D "spacemit,k3-pwm", "marvell,pxa910-pwm";
> +			reg =3D <0x0 0xd401a000 0x0 0x10>;
> +			clocks =3D <&syscon_apbc CLK_APBC_PWM0>,
> +				 <&syscon_apbc CLK_APBC_PWM0_BUS>;
> +			clock-names =3D "func", "bus";

Could these clock definitions violate the schema for the fallback compatible
and leave the bus clock unmanaged?

The dt-binding for marvell,pxa-pwm.yaml restricts clocks to maxItems: 1 and
prohibits clock-names.

Additionally, the fallback driver (drivers/pwm/pwm-pxa.c) calls
devm_clk_get(dev, NULL), which will only acquire the first func clock. If t=
he
SoC requires the APB bus clock to be explicitly enabled for register access,
could this result in a bus fault when the fallback driver probes?

> +			resets =3D <&syscon_apbc RESET_APBC_PWM0>;
> +			#pwm-cells =3D <3>;
> +			status =3D "disabled";
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-04-k3-pwm-=
dts-v1-1-81fcde1871f8@kernel.org?part=3D1
