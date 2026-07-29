Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A380D47F2D1
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:08:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785326887; cv=none; b=CotS6YP7DYoGKJ9JsAGNl3wOwlt+RIj9t7JLP6hOw/XgfiNV5w3UvhpXdAiP+BBTEdtLP8scKSCoVXIPIIPwE9e0Y4V89pYU77+pAZ8JGsndt6TlgaV3hInvGYHfiJvNzYQ1hcv3xEOefAi3ED3L8T0jctt+eWVmCSTBtNNe828=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785326887; c=relaxed/simple;
	bh=FWrJjj7dBTYxI+LIG7LHhLaYY2G5QrKMkQAoTR8U14I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rby6BVcEpyfQYjRI55346dW5/FsMkLrf3SUtCykr0AnGsPcIDQrU/Xk0p7HhLAD2ekS0jeuhXtFa4Mj3WcD6vxV8iBeB0Dw3fp0tHbqcsrJdWSVY6rlbXbR94MtVZ/6/aGJJwE73uvEcZyHBvpmZc55yVFpCGZ0EnSl7y67QZOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GcKFzC+P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GcKFzC+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F38E71F00A3A;
	Wed, 29 Jul 2026 12:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785326886;
	bh=F/XIL3zOUCaz+ySplfXKASyxGJ9qtVNzL+LagsFuKSc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GcKFzC+PEybwmm9K6LhFHT/IFcsYECHO0TBKTIKhBWzmiyQ0iPoFhR29BpX+/vEfV
	 VTfe3mX7kW/kPjwMh9PltehMh7CwI3igIBeOMLQltBsq0FXrFXw5kNctczpFVfQY5a
	 AmM7Ajm14BuaLw6rbEyO3DyjCajIFaouoQucuqeHW7yOvoVk3GVOzAXQnqudhovk6M
	 T6dtGrsqLM1LUae1N+m8TdhNukMBXArWPh2wV4ErGbC1TR+w5AVS39L8lhR3f9lAtc
	 ic5oyeeZOqDQxsx02/OFCGT5e9mwwJz8PInogltI4kC4V/ZJMr+OFlze9aOx89RYI8
	 6NBxjmYyepMpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/4] ARM: dts: aspeed: bletchley: Add second source
 PCA9532 LED controllers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cosmo Chou" <chou.cosmo@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260729114312.3947300-4-chou.cosmo@gmail.com>
References: <20260729114312.3947300-1-chou.cosmo@gmail.com>
 <20260729114312.3947300-4-chou.cosmo@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 12:08:05 +0000
Message-Id: <20260729120805.F38E71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The alternative PCA9532 LED controllers use incorrect GPIO active =
polarity flags, causing the LEDs to operate inverted compared to the primar=
y PCA9552 controllers.
--

--- Patch [3]: [PATCH v2 3/4] ARM: dts: aspeed: bletchley: Add second sourc=
e PCA9532 LED controllers ---
commit a1677ab804733ff8d7d1bbc1ba314032d50ddf82
Author: Cosmo Chou <chou.cosmo@gmail.com>

ARM: dts: aspeed: bletchley: Add second source PCA9532 LED controllers

This commit adds alternative PCA9532 LED controllers at address 0x66 to
support boards populated with the PCA9532 instead of the primary PCA9552
at 0x67.

> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts b=
/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> index e1fa3a18ea5cf..3da1cf9bbb990 100644
> --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dts

[ ... ]

> @@ -86,6 +87,66 @@ led-7 {
>  		};
>  	};
> =20
> +	fan_gpio_leds_alt {
> +		compatible =3D "gpio-leds";
> +
> +		led-0 {
> +			default-state =3D "on";
> +			gpios =3D <&fan_leds_alt 8 GPIO_ACTIVE_HIGH>;

[Severity: High]
Will this GPIO active polarity cause the LED to operate inverted compared t=
o the
primary PCA9552 controller?

The leds-pca955x driver maps a raw value of 1 to High-Z and 0 to Output LOW,
whereas the leds-pca9532 driver maps a raw value of 1 to Output LOW and 0 to
High-Z.

Because the two drivers map raw GPIO values to opposite electrical states, =
does
this flag need to be GPIO_ACTIVE_LOW to produce the same physical state when
logically ON?

> +			label =3D "fan0_blue";
> +			retain-state-shutdown;
> +		};
> +

[ ... ]

> @@ -162,6 +223,24 @@ led-1 {
>  		};
>  	};
> =20
> +	sled1_gpio_leds_alt {
> +		compatible =3D "gpio-leds";
> +
> +		led-0 {
> +			default-state =3D "keep";
> +			gpios =3D <&sled1_leds_alt 0 GPIO_ACTIVE_LOW>;

[Severity: High]
Similar to the fan LEDs above, does this polarity need to be GPIO_ACTIVE_HI=
GH
for the PCA9532 to output the same physical LOW state when logically ON?

The current GPIO_ACTIVE_LOW flag appears to be copied from the primary PCA9=
552
node, but due to the inverted semantics of the leds-pca9532 driver, this mi=
ght
result in inverted electrical signals.

Does this polarity issue also apply to the alternative nodes for sled2 thro=
ugh
sled6?

> +			label =3D "sled1_amber";
> +			retain-state-shutdown;
> +		};
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729114312.3947=
300-1-chou.cosmo@gmail.com?part=3D3
