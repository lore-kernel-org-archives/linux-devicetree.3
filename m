Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6D33B7B7B
	for <devicetree@vger.kernel.org>; Sun, 27 Sep 2026 14:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790517848; cv=none; b=TyHiuhnJsU23JFafT/pVQ+i+dt3KBU4G76Kn6ok/lkJrKHvTjJYwnzT8j6OneOjDNds1WsQ60ul4XE+B8DPAKvSw02n2v4q5VC/LLJ9Q7X3kwKL56kYeUG+qXKfgBNk4BI7T/sXaCMfGe5Zz7hdnrzRo6XTDjlSxQPqSnsatUK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790517848; c=relaxed/simple;
	bh=W/lGGGdJTtSZ2FLPO+7g4xVK6aWn+QeP64wquj6HK24=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CE6eKHwtbdJwiVESKgaxvKmLgFtC8qbjd+LSaMP1ggqh2D2E+A5/79V44SDOph+RXfeRe5k3FaaM5k75lShsRIRWdq4jC8HZkKhRibfJ9/XbOuwEQ8HhnNknuVvI/2pbmjdOtDB27EH+7zbC/zzKNbJpBlF/kdPpB3WulEM/u74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RPD1aNB4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RPD1aNB4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C3381F000FF;
	Sun, 27 Sep 2026 14:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790517846;
	bh=4BbJgMQ5RUgYdKStq7aQw7rGy6bDFesgjb5xUCS/X0k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RPD1aNB4/y+GHk3otetM+JXdtD6JoldeQ2IskNtK/mvMLYSqqv8msoNDCXV2ovsiC
	 bSHEMe4tm1iVm4ENEAyZyhuj/T4QI4I1dj2PfyxxSHQzuQvwr1kIg/4iPsz1b0dZ73
	 8Fs17tSFLsAWNnHiFUrEp3jO84rJZ8lj30na6ch2GJfNuh6IU/dU0YTT5FKKKkdGRa
	 QMQAqMjp+N3Qk/mxw9RNGe718+83Plk81GRwchX7LKVtnmH5tIlnPYu3R29mf7j+c6
	 mszi4ipAVOa5GCwTAddmPlC13cdce+MGApckMmH7TegCn5fjzuR6Nxff7dg+DTiqfE
	 PIvaOhLWM+lIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2
Reply-To: sashiko-reviews@lists.linux.dev
To: BG9OXA <bg9oxa@163.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <179051709216.31632.15211548199122954003@163.com>
References: <179051707448.31632.10412780322071844492@163.com>
 <179051709216.31632.15211548199122954003@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 14:04:05 +0000
Message-Id: <20260927140406.5C3381F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] dt: missing enable-active-high property in vbus5v0_typec forces in=
correct active-low polarity
- [Medium] dt: encoding Linux driver preference into compatible string inst=
ead of describing hardware
--

commit fc725bef630578d1f6fd74bd033f6824e7bb9013
Author: BG9OXA <bg9oxa@163.com>

arm64: dts: rockchip: add ALIENTEK QuarkPi-CA2

Add a device tree for the ALIENTEK QuarkPi-CA2, an RK3588S based
single board computer.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts b/arch/=
arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts
> new file mode 100644
> index 0000000000000..f6bfce3680bf2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-quarkpi-ca2.dts

[ ... ]

> +	/*
> +	 * Type-C port VBUS 5V -- the vendor dtb has gpio =3D <&gpio1 0x1d 0>,
> +	 * i.e. gpio1 PD5 (enable-active-high; ACTIVE_HIGH is equivalent).
> +	 * Note: PC5 is i2s0_lrck (the audio LRCLK), so driving the regulator
> +	 *    from it takes the audio pin over and leaves the real PD5
> +	 *    undriven, which means VBUS is never switched on (self-powered
> +	 *    devices still work, so such a mistake is easy to miss).
> +	 */
> +	vbus5v0_typec: vbus5v0-typec {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "vbus5v0_typec";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		gpios =3D <&gpio1 RK_PD5 GPIO_ACTIVE_HIGH>;

[Severity: High]
Does this node need the enable-active-high property?

Because vbus5v0-typec is a regulator-fixed node, omitting enable-active-high
causes the kernel's of_gpio_quirk_polarity() in drivers/gpio/gpiolib-of.c to
ignore the GPIO_ACTIVE_HIGH flag.=20

When the Type-C or USB host controller enables the regulator at runtime,
gpiolib will force the pin to a logical active-low polarity, driving the pin
to physical 0 (low) instead of high. This will prevent the Type-C VBUS power
from turning on, preventing connected peripherals from receiving power.

> +		vin-supply =3D <&vcc5v0_sys>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&typec5v_pwren>;
> +	};
> +};
> +
> +/*
> + * =3D=3D=3D=3D=3D ES8388 audio (ported from the vendor BSP) =3D=3D=3D=
=3D=3D
> + *

[ ... ]

> +&i2c1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c1m4_xfer>;
> +	status =3D "okay";
> +
> +	es8388: audio-codec@11 {
> +		/* everest,es8323 must be listed first.
> +		 *   Reasons (driver source plus the module present on the board):
> +		 *   - Mainline es8328.c is the simplified driver (888 lines),
> +		 *     es8323.c is the complete one (791 lines, with set_dai_fmt /
> +		 *     set_dai_sysclk / pcm_hw_params and the coeff_div table).
> +		 *   - compatible lists are matched in order: with
> +		 *     'everest,es8388' first, es8328 claims the device, so es8323
> +		 *     has to come first for the complete driver to bind.
> +		 *   - The driver is built as a module (module alias
> +		 *     of:N*T*Ceverest,es8323), so it binds once the node exists.
> +		 *   - The upstream board with the same codec,
> +		 *     rk3588-youyeetoo-yy3588.dts, also lists only
> +		 *     es8323.
> +		 *   - The vendor 6.1 BSP dtb uses the same pair,
> +		 *     "everest,es8388","everest,es8323".
> +		 */
> +		compatible =3D "everest,es8323", "everest,es8388";

[Severity: Medium]
Is it appropriate to list everest,es8323 ahead of everest,es8388 for an ES8=
388
codec merely to trick Linux into binding the more fully-featured es8323 dri=
ver?

This violates device tree architectural principles by describing a software
preference rather than the actual hardware. Should the compatible string pu=
rely
describe the hardware, while any driver workarounds are handled in the kern=
el?

> +		reg =3D <0x11>;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/179051708845.31632.=
10915026963421643453@163.com?part=3D2
