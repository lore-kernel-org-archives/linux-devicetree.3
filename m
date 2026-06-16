Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7146F315793
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 08:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781598626; cv=none; b=PcROhFwmHt74eubRvNTcwgQinkHTJhFq6jQqV4T4ObJ9xmwcFS10yHfhK+lp1ADDGyNwlK63p5TevqkmtOX6PPWZ/Qw2Gyf54dZiizt91IQcNJr/+ZfBVZ1iyrKasUDc3bApGl1rN5aM/i6jjiXrUxv5dUVKGZjDgafY9OquPOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781598626; c=relaxed/simple;
	bh=Uxc1tBxQnhY9odqukfXK9XM8Ge99uvanvulAG6DDdNE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lBRF98bnVHiFvl6yGsaYVRkfN1gZOKGqtobkZrVgy4A/FP5FlvEkSedgv3eIKy4gybhf8j/mDB013753uCeGv+mTLtziLvtVeBzikoGKUATC6w9GyW0PaNv57fLTitlPGESW6RQJXQ0q9rUJSvmGCguT3P2Fe8ODI5Fku2ewLvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l5rbf+cX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l5rbf+cX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E851F1F000E9;
	Tue, 16 Jun 2026 08:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781598625;
	bh=n5H8GgdKz4wsDCBPXlNBgLS1HMwF+xZOCx9wMLIoIzM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l5rbf+cXuT3qQQnNOHgc2c+euitUCxawJ6TM397+3gL8GrzWTemTEL6noLv1nh38c
	 zF+w4oIBTcjoTiVvr97BsGv8qTsS7Vt9RaCQVi9OKiHcbYXORZuVwQ718QEoW2+ZlE
	 zRS/TvNi9906ZyvfHM5JEaVZ9/l1wqQOK7ly9RosnSVpw1Ob532tWy95yAzHrH2zz8
	 9+mXigWk0DjofcfCd3RjtnjxOMWVFX+DVUjs+uYk74lH4C/QmPpQckMlV3jDNLF+Y+
	 ELOU06OuYs4/8Q8buO/QTLnSFdxEuGiY8NjSVr+MPs2c4IBK4rHfhRwFNa32iZubiB
	 xFfKrFDeLcCyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/12] iio: dac: ad5686: consume optional reset
 signal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260616-ad5686-new-features-v3-6-f829fb7e9262@analog.com>
References: <20260616-ad5686-new-features-v3-6-f829fb7e9262@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 16 Jun 2026 08:30:24 +0000
Message-Id: <20260616083024.E851F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing return value checks for `reset_control_assert()` and `rese=
t_control_deassert()`.
- [High] The reset pin is left in a deasserted (driven) state on probe fail=
ure or device unbind, leading to potential back-powering of the DAC.
- [Medium] Acquiring the reset control after enabling regulators causes unn=
ecessary power toggling on `-EPROBE_DEFER` and leaves the reset pin floatin=
g during power-up.
- [Medium] Missing recovery delay after deasserting the hardware reset may =
cause subsequent device communications to fail on fast CPUs.
--

commit c3eb5fda0704f698d1f8b2f76769857300b80132
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: dac: ad5686: consume optional reset signal
   =20
This commit adds GPIO support for the RESET pin using an optional
reset control local to the probe function. It manually generates
a reset pulse after the device is powered up.

> diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
> index fc3863274b291..a48acedff51c1 100644
> --- a/drivers/iio/dac/ad5686.c
> +++ b/drivers/iio/dac/ad5686.c
[ ... ]
> @@ -508,6 +510,15 @@ int ad5686_probe(struct device *dev,
> =20
>  	fsleep(5); /* power-up time */
> =20
> +	rstc =3D devm_reset_control_get_optional_exclusive(dev, NULL);

[Severity: Medium]
Is it intentional to fetch the reset control after the regulators are
enabled and the 5=C2=B5s power-up delay has occurred?

If devm_reset_control_get_optional_exclusive() returns -EPROBE_DEFER,
the driver will disable the regulators and have to retry the sequence
later. Fetching the reset control before enabling regulators might also
prevent the reset pin from floating during power-up.

> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc),
> +				     "Failed to get reset control\n");
> +
> +	reset_control_assert(rstc);

[Severity: High]
Do we need to check the return value of reset_control_assert() and
reset_control_deassert()?

These functions can fail and return error codes, particularly if the
reset controller is behind a slow bus. Proceeding without checking
could cause the driver to communicate with a device that is still held
in reset.

> +	fsleep(1); /* reset pulse: comfortably bigger than the spec */
> +	reset_control_deassert(rstc);

[Severity: Medium]
Does the device need a guaranteed recovery delay after the reset is
deasserted?

Exiting the hardware reset initiates an internal power-on reset
sequence. On faster CPUs, the execution time before the first SPI/I2C
command might be shorter than the device's required reset recovery time.

[Severity: High]
Should there be a registered devm action to assert the reset pin on
driver removal or probe failure?

Currently, the reset pin is deasserted here but never asserted again on
cleanup. Since devm_regulator_get_enable() automatically disables the
VDD and VLOGIC regulators during cleanup, leaving this pin driven HIGH
while the device is unpowered could forward-bias ESD protection diodes
and back-power or damage the DAC.

> +
>  	/* Initialize masks to all ones */
>  	st->pwr_down_mask =3D ~0;
>  	st->pwr_down_mode =3D ~0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260616-ad5686-new=
-features-v3-0-f829fb7e9262@analog.com?part=3D6
