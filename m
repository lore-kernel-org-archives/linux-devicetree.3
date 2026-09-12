Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45053306B3B
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 13:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789220952; cv=none; b=JjE/Yeu1Vdyr2hSvFTg0pKnbxs957t3DNqsJtDTunAEpUzMaSJAGMigBNpgY6D4CI4oP/GZCy4AMWErb74PtXcqEC26ibQaM8twh4825jtLNgKZyilgS6meR2Z8bYTf9B38Jbjq4AFlOkBtUjZlS1FMo+87ckxQecOmpApFcbUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789220952; c=relaxed/simple;
	bh=rmo74maxpXzrpF1B9u1+6x/+jENNsybB4q6F2yVWIJM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BcQgnyWnGOBmHRbJ4v4oyhRKSWntpuEhYEaOBDOr+chfSrvmOuGEb8kMDTLtWH7tIKRLbbaSbCCG//ICFazjme3324ZFOqoXT48O9+GKsVw6ypTLYv3nMcZloPvxc8E7F/b0aHBYpx0REnNQPbimdi4jYZOvT5pW+UWK0QekK10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y3J0B8kI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y3J0B8kI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A19E81F00893;
	Sat, 12 Sep 2026 13:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789220950;
	bh=orG/bN02hy3y82vn/Mb9PmR4WDObY4Nf8qHPed4r6YU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y3J0B8kIREtMTyIhMtTKouzqvBV1JRNqLbF9t0Qc0ktraZ1rQ6g4Xbgv2SU8Y8ClG
	 xNoXLQWxh/rT04vEAD28UG/fvYDO61t12Dhv9DQRbYIo1HI1/LvXDuH+wdPiGkpA5Z
	 37mfmh1KSQQFqvQPMuCFWrcnZbB9lSksCZ3b/MC3AJwps1ZpNmtB+APU+v5wKZNPEq
	 ecU3ncV+zwt6m2jSFOvkJ1cLl9k1Mp0Y7hWeizmobtWDuYLSZTOKktBQj+4Kj7YohR
	 UIylVMwQ7g1M+mgnaKiuUEnEANPI3DB1nw3hZAg25JH4697Qk1iLqlh+hR+bidYZ47
	 V8bKRZGEmMHvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: msm8917-xiaomi-wingtech: enable flash
 LED
Reply-To: sashiko-reviews@lists.linux.dev
To: Martin <hemisputnik@proton.me>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260912134056.3347741-1-hemisputnik@proton.me>
References: <20260912134056.3347741-1-hemisputnik@proton.me>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 13:49:10 +0000
Message-Id: <20260912134910.A19E81F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Setting 'output-high' in the pinctrl default state drives the flas=
h LED pins high, turning on the LED at maximum brightness during boot and b=
ypassing safety timeouts.
- [Low] The new compatible string "sgmicro,sgm3780" is used but not documen=
ted in the YAML bindings.
- [Low] Missing `flash-max-timeout-us` property causes an unconditional ker=
nel warning on boot.
--

commit 900520fbc3c9b249fa3d066d01078e01c28af4a8
Author: hemisputnik <hemisputnik@proton.me>

arm64: dts: qcom: msm8917-xiaomi-wingtech: enable flash LED

This commit adds the SGM3780 flash LED controller to the msm8917-xiaomi-win=
gtech
device tree. It falls back to the existing sgm3140 driver compatibility to
enable torch functionality.

> diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi b/arch=
/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
> index 69eda5f42c069..c0b5094efced3 100644
> --- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-wingtech.dtsi
[ ... ]
> @@ -25,6 +26,20 @@ pwm_backlight: backlight {
>  		default-brightness-level =3D <128>;
>  	};
> =20
> +	flash-led-controller {
> +		compatible =3D "sgmicro,sgm3780", "sgmicro,sgm3140";

[Severity: Low]
Will make dtbs_check fail with this change? The new compatible string
"sgmicro,sgm3780" doesn't appear to be documented in the YAML bindings yet.

> +		enable-gpios =3D <&tlmm 93 GPIO_ACTIVE_HIGH>;
> +		flash-gpios =3D <&tlmm 90 GPIO_ACTIVE_HIGH>;
> +
> +		pinctrl-0 =3D <&flash_led_default>;
> +		pinctrl-names =3D "default";
> +
> +		led {
> +			function =3D LED_FUNCTION_FLASH;
> +			color =3D <LED_COLOR_ID_WHITE>;

[Severity: Low]
Will this cause a kernel warning on every boot? The sgm3140 driver expects
the flash-max-timeout-us property to be defined in the led child node.

If it is missing, the driver falls back to a default value but emits a
dev_warn during probe, which can unnecessarily pollute the kernel log.

> +		};
> +	};
> +
[ ... ]
> @@ -306,6 +321,14 @@ tsp_int_rst_default: tsp-int-rst-default-state {
>  		drive-strength =3D <8>;
>  		bias-pull-up;
>  	};
> +
> +	flash_led_default: flash-led-default-state {
> +		pins =3D "gpio90", "gpio93";
> +		function =3D "gpio";
> +		drive-strength =3D <2>;
> +		bias-disable;
> +		output-high;

[Severity: High]
Does configuring output-high here risk permanent hardware damage?

The pinctrl framework applies the flash_led_default state during device
binding, which sets the flash-gpios and enable-gpios pins high before the
driver probes, or permanently if probing is deferred or fails.

This turns on the flash LED at maximum brightness during boot and bypasses
the driver's safety timeouts. Flash LEDs are typically not designed for
continuous operation at high brightness and can quickly overheat.

> +	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912134056.3347=
741-1-hemisputnik@proton.me?part=3D1
