Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08E83AFD07
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 19:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785268627; cv=none; b=OzO02BVm2YymL42VW8uGKjUeoH4U88V9Et59aH7fpqhhAZQiA7RaOoUZAI/A+LeLYHBDnm9VrzeDLKrUT0XnF3EIn+vXl26ckJfBRaac+HYa3ELiejVRRj4GADLKwfXTzz81tDKeEHzKGXP56KTRC53t4Lbf/zYnrSY6G1IuT3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785268627; c=relaxed/simple;
	bh=LcAM2CgM9QPft5xkOCPJbqlA6H6pGs4qYIIQO/iOiR8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=glZXKGldz+7ozN3t5KNGUAK7bf8fa6QVozCXSczTKKdEb7I6lHo7WKyJxJRWJOpIQoM8hjBHHSI5eHwUT6gfJiDgjMIYutSkv5xmHtVjYJqOqYfDsrAvAXaJzWhQTtWta0m/LCdhxTwpt/Vp2C5doxlug3rMAA8bWtYcrkOaV1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nOeYthQV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nOeYthQV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5C41F00A3A;
	Tue, 28 Jul 2026 19:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785268626;
	bh=AFRuPxr/fN5ycCq1UYFgEo/76uhm86e5fNzzL5fqInQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nOeYthQVmiVRzthYJrgelwBNLZDtiFJGAcp4szfyfClVl/z+Kl8svJUnKYShQMuvM
	 XzSGgD2GOKMpPy0k5yXEPwDO8Q69IR+7sMU2nwzxjjK/ItzdXB2pHqbgYuP1hnJVcm
	 LY/mJtv0fnnjSzjq4gc6mmafpb1i6tQoP0KjuH1eUqD0mn69XU8nzlgxn0BTxV/Sqf
	 OCFMFXJQ8VxSnc47h0Z/TYcgcfpqImVtMmSSOtIlogGVbj8xKuIoJkT0mRb8qNhIXA
	 k7a1cVRBp+PyN0hQTEiPU8qmgu1h6IdB3PbnmZHNZV9qRfrFarBX6YMV68t5IOe+Hg
	 PkSobN1StJwkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: ti: k3-am67a-beagley-ai: Add gpio
 ranges
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RGF2aWQgTGVjaG5lciAoVEkp?= <dlechner@baylibre.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260728-arm-dts-beagleyai-gpio-info-v1-1-783ec90d54da@baylibre.com>
References: <20260728-arm-dts-beagleyai-gpio-info-v1-0-783ec90d54da@baylibre.com>
 <20260728-arm-dts-beagleyai-gpio-info-v1-1-783ec90d54da@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 19:57:05 +0000
Message-Id: <20260728195706.3D5C41F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Adding `pinctrl-single,gpio-range` on K3 platforms causes dynamic =
GPIO requests to silently overwrite the entire pad configuration register, =
destroying previously applied board-specific settings like pull-ups and dri=
ve strengths.
--

--- Patch [1]: [PATCH 1/2] arm64: dts: ti: k3-am67a-beagley-ai: Add gpio ra=
nges ---
commit c5d1a1cd5d0bb91d0c680ae90328952c44500103
Author: David Lechner (TI) <dlechner@baylibre.com>

arm64: dts: ti: k3-am67a-beagley-ai: Add gpio ranges

Add pinctrl-single,gpio-range properties to the BeagleY-AI .dts so that
GPIOs get the correct pin mux when requested.

> diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/=
boot/dts/ti/k3-am67a-beagley-ai.dts
> index 5255e04b9ac76..599d576f694f6 100644
> --- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> +++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
> @@ -149,6 +149,19 @@ led-1 {
>  };
> =20
>  &main_pmx0 {
> +	pinctrl-single,gpio-range =3D
> +		<&main_pmx0_range 0 32 PIN_GPIO_RANGE_IOPAD>,
> +		<&main_pmx0_range 33 38 PIN_GPIO_RANGE_IOPAD>,

[Severity: High]
Does adding pinctrl-single,gpio-range here cause dynamic GPIO requests to
silently overwrite the entire pad configuration register?

On K3 platforms, the pinctrl-single,function-mask is typically <0xffffffff>,
meaning the pad electrical properties and mux mode share the same register.
When a GPIO in these ranges is requested via gpiod_get(), the gpiolib path
calls the pinctrl driver's pcs_request_gpio().

Since the function mask is 0xffffffff, pcs_request_gpio() will execute:

    data &=3D ~pcs->fmask;
    data |=3D frange->gpiofunc;

Could this completely erase any previously applied board-specific settings
like pull-ups or drive strengths from a device's pinctrl-0 property, and
replace them with PIN_GPIO_RANGE_IOPAD (which includes PULL_DISABLE)?

[ ... ]

> @@ -267,6 +280,15 @@ &main_uart0 {
>  };
> =20
>  &mcu_pmx0 {
> +	pinctrl-single,gpio-range =3D
> +		<&mcu_pmx_range 0 21 PIN_GPIO_RANGE_IOPAD>,
> +		<&mcu_pmx_range 23 1 PIN_GPIO_RANGE_IOPAD>,

[Severity: High]
Will this have the same pad configuration overwrite issue for the MCU domain
GPIOs when requested?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-arm-dts-be=
agleyai-gpio-info-v1-0-783ec90d54da@baylibre.com?part=3D1
