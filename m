Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDB531618B
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 07:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975858; cv=none; b=TwM1wjx5lue5Eav0WZ+A4Pb+m9UkFUlHjmV38c2ss398Tt22gX9KYKGqt1FK8ZvcbxkU54YAkikTqScAiKxucoZEGONAlrPfC3+Z/TMfFnOndhfVH3gBX8dgkPXIZUlcdAdcCcnd76JtDPeRLpYQeRUQASUKv7Y30mzFOY+IkAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975858; c=relaxed/simple;
	bh=C2nAfVEEODf6N9DxK8O6DZpy8b0FHBKxNBLv99oz/dw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Jl8CxJhCWA8bxHYujOywpBk+VNn6zJ5iHfAn3y3FgtRWWWqEvpZ0LvyI1Bjw163MHyUrPiM59jjHxvfRnepPr5yEBv8UxtYcrQihP+vszKr1zk270ingQNG+EGPovjLPWCq1Syjyk58p0rPxc8yn8Bt2Htpi1IngGRU+up7tsOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/fhUT5b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/fhUT5b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108E31F00893;
	Mon, 21 Sep 2026 07:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789975856;
	bh=q1MqyDBwbKZobtPO4dvFdIW+cP6DII8YrTDCUR1tuDw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l/fhUT5bF3qzdh2YAtFKEbx2ixFt4xGAoQ4EYeAOguW2wHDfBwb9BObQxmQtffikH
	 5xDtNxv/7+6VwVAFmgtbl7fRsLhxAFfeQ+fCF4qMFUENi9LYsUsHBgFQc6ww+zMsAG
	 h/41HlzGlo+6HLFP5hvKxV7No8Fdqx+wHq6g+MFfWIRaaDn1pG+HFQPNkhvMHoXq1K
	 Nkfpi9UpIpH84Wh7wBr/Ux7h+FVZYAJS0XL7V5oEAZAdikuFHVICWwDE2P4iteucbJ
	 mbGRYxj/PfAIulNCwXhmvaXAY4K+ixmc+npgQqIZVZSeBNlvWg6KUfL3lBP0x6kniT
	 H43wEdZjkcNVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] gpio: axiado: add AX3005 SGPIO controller
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petar Stepanovic" <pstepanovic@axiado.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260921-axiado-ax3000-sgpio-controller-v4-2-79c444be7faf@axiado.com>
References: <20260921-axiado-ax3000-sgpio-controller-v4-0-79c444be7faf@axiado.com>
 <20260921-axiado-ax3000-sgpio-controller-v4-2-79c444be7faf@axiado.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 21 Sep 2026 07:30:55 +0000
Message-Id: <20260921073056.108E31F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] gpio: axiado: SGPIO_POS macro sets identical first and last positi=
ons
- [Medium] gpio: axiado: spurious interrupts due to unsynchronized input ca=
che initialization
--

commit 19833b35bd592291102f572f7810cdc59b72089f
Author: Petar Stepanovic <pstepanovic@axiado.com>

gpio: axiado: add AX3005 SGPIO controller support

This commit adds support for the Axiado AX3005 SGPIO controller. It provides
a serialized interface for controlling multiple GPIO signals over limited
physical lines, registering the controller as a standard gpio_chip with
interrupt support.

> diff --git a/drivers/gpio/gpio-axiado-sgpio.c b/drivers/gpio/gpio-axiado-=
sgpio.c
> new file mode 100644
> index 0000000000000..b57a5074ccef3
> --- /dev/null
> +++ b/drivers/gpio/gpio-axiado-sgpio.c

[ ... ]

> +/* A POS register holds the first and the last position driven by the sl=
ice. */
> +#define SGPIO_POS_FIRST			GENMASK(31, 16)
> +#define SGPIO_POS_LAST			GENMASK(15, 0)
> +#define SGPIO_POS(pos)			(FIELD_PREP(SGPIO_POS_FIRST, (pos)) | \
> +					 FIELD_PREP(SGPIO_POS_LAST, (pos)))

[Severity: High]
Does this macro intentionally set both the start and end positions to the
identical value?=20

When using SGPIO_POS_FULL_BANK, this populates both the first and last
bitfields with the same position, reducing the active slice range to a sing=
le
position rather than the full range from 0 to 31. Will this prevent the
hardware from shifting out the required number of signals per bank and break
the serialized data exchange?

[ ... ]

> +static int axiado_sgpio_probe(struct platform_device *pdev)
> +{
> +	struct gpio_regmap_config config =3D { };

[ ... ]

> +	/*
> +	 * From here on the hardware may be running, so the shutdown action has
> +	 * to be in place before the first register is programmed. It only ever
> +	 * writes zeroes, which is harmless if initialisation never got that
> +	 * far, and it runs before the APB clock is disabled because that was
> +	 * requested earlier.
> +	 */
> +	rc =3D devm_add_action_or_reset(&pdev->dev, axiado_sgpio_disable, sgpio=
);
> +	if (rc)
> +		return rc;
> +
> +	rc =3D axiado_sgpio_hw_init(sgpio);
> +	if (rc)
> +		return dev_err_probe(&pdev->dev, rc,
> +				     "Failed to initialize hardware\n");
> +
> +	rc =3D axiado_sgpio_init_input_cache(sgpio);
> +	if (rc)
> +		return dev_err_probe(&pdev->dev, rc,
> +				     "Failed to initialize input cache\n");

[Severity: Medium]
Is there a race condition between initializing the hardware and reading
the input cache here?

axiado_sgpio_hw_init() enables the background shift engine, but
axiado_sgpio_init_input_cache() immediately reads the din_ss registers to
populate din_shadow. If the first serial hardware exchange has not yet
completed, won't din_shadow be initialized with stale or uninitialized zero
values?=20

Could this cause consumers to receive a spurious edge interrupt during
initialization if a signal is physically high, as the parent handler will l=
ater
observe a transition from the zeroed cache to the true physical level?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260921-axiado-ax3=
000-sgpio-controller-v4-0-79c444be7faf@axiado.com?part=3D2
