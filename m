Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4AD38B127
	for <devicetree@vger.kernel.org>; Tue, 25 Aug 2026 13:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787663401; cv=none; b=ubqQnbXgSDWfsOs3FDaM+m6H+U9ZVBMh+SmKP5VwoJQOW0Cg/6p1nSwvsokPEqU4cP63RWOoasAhrmGx0mH9djHkuFhW/q4FrPtBeGpMAqsnahbkCZl1R0Ew3/uYTKrM6UcGLQmX4cAKD/lQpdSDP719B+jZV6nYhr7hH6Oy1uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787663401; c=relaxed/simple;
	bh=Pz2OyL7hm+UEJKZvRNmA6pomgkhhIH+TmwdDTKYXYbQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HTLaZ0BhBn3ysyrdWFMhGxLcpKgvE5aIQgxbJ0AeU5Wwx9eCzJ2UhADY3jDbJ2eAGtn/rghCqL63dWXWz99w9uPReaDTvQEpzcsOw5Z3vi+m2wjKntTL7ddAROG42sAc3CIEKC9Xw1KQF9gkHiiZisSeB7GaCB9bfpmNbsUYliw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EZSOSTDQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EZSOSTDQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D021F00A3E;
	Tue, 25 Aug 2026 13:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787663393;
	bh=QhSWhZ7kbu9DLFz3OHPzYNLERzppqcImr1tFWubL7Gg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EZSOSTDQz9RZNVvO2Z23t92+Ut6ky8A2L/rTulrcb6X20spVDgZSHSd5hzEzhkjud
	 rVCpTA0rbUUF3EszPxFjw+/wA1Vpdiy+3HOUSbd5cV9tJ8Tcr5lPqxyygk4n374p4P
	 7N2/e1Iu5XuCDe45Wpp/yeNe/A0BW/TLLRIy9nSYpjVlsB00jCV5Bx1+2K4qe8Hwiz
	 c5f6Bq1xu4W3g9qyHjFqmWHGOHxBY34lIjmAeh6kN1F/w5/mhEF0d/vPJBxARaDB7j
	 dlGBRvOILocaBOMhFTLd8jM511pXnlZlrLboPOmxsrAlU8vNGq9wUPpFhJx1dqccmy
	 Lrgmj+n1+8AVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] usb: typec: mux: gpio-sbu: enable when only used
 for orientation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260825-usb-fusb340-v1-v1-2-2191179b0661@foss.st.com>
References: <20260825-usb-fusb340-v1-v1-0-2191179b0661@foss.st.com>
 <20260825-usb-fusb340-v1-v1-2-2191179b0661@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 13:09:53 +0000
Message-Id: <20260825130953.91D021F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The `mode_switch` property is initialized after the Type-C switc=
h device is registered, creating a race window where concurrent callbacks u=
se an uninitialized value.
- [Medium] The SBU lines are briefly enabled in the wrong orientation befor=
e being swapped, potentially causing a signal glitch or reversed polarity.

Pre-existing issues:
- [High] Concurrent callbacks may access freed memory if probe fails or dur=
ing device removal because devres frees `sbu_mux` before active consumer re=
ferences are revoked.
--

--- Patch [2]: [PATCH 2/2] usb: typec: mux: gpio-sbu: enable when only used=
 for orientation ---
commit fb130c070f4886abd845b89bf6f060523ddd0aaf
Author: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

usb: typec: mux: gpio-sbu: enable when only used for orientation

When used as orientation-switch only (no mode-switch, e.g. no altmode),
the optional enable gpio remains disabled.
Enable it from the switch_set() routine, in this case, when the
orientation is set and the enable-gpios property has been provided.

> diff --git a/drivers/usb/typec/mux/gpio-sbu-mux.c b/drivers/usb/typec/mux=
/gpio-sbu-mux.c
> index 1834f1a2dd9dd..4151d78e3b8d6 100644
> --- a/drivers/usb/typec/mux/gpio-sbu-mux.c
> +++ b/drivers/usb/typec/mux/gpio-sbu-mux.c

[ ... ]

> @@ -40,9 +41,13 @@ static int gpio_sbu_switch_set(struct typec_switch_dev=
 *sw,
>  		enabled =3D false;
>  		break;
>  	case TYPEC_ORIENTATION_NORMAL:
> +		if (!sbu_mux->mode_switch)
> +			enabled =3D true;
>  		swapped =3D false;
>  		break;
>  	case TYPEC_ORIENTATION_REVERSE:
> +		if (!sbu_mux->mode_switch)
> +			enabled =3D true;
>  		swapped =3D true;
>  		break;
>  	}

[Severity: Medium]
Does this result in a signal glitch?

Later in gpio_sbu_switch_set(), the code updates the enable_gpio before
the select_gpio:

	if (enabled !=3D sbu_mux->enabled)
		gpiod_set_value_cansleep(sbu_mux->enable_gpio, enabled);

	if (swapped !=3D sbu_mux->swapped)
		gpiod_set_value_cansleep(sbu_mux->select_gpio, swapped);

If both enabled and swapped transition to true here, the switch will
briefly be enabled in the normal orientation before it is swapped to the
reverse orientation.=20

Would it be safer to configure the swap GPIO before enabling the switch?

[ ... ]

> @@ -125,6 +130,8 @@ static int gpio_sbu_mux_probe(struct platform_device =
*pdev)
>  		return dev_err_probe(dev, PTR_ERR(sbu_mux->sw),
>  				     "failed to register typec switch\n");
> =20
> +	sbu_mux->mode_switch =3D device_property_read_bool(dev, "mode-switch");
> +

[Severity: Medium]
Can this create a race window during initialization?

At this point, typec_switch_register() has already been called and the
device is exposed to consumers.=20

If a concurrent consumer (like TCPM) invokes gpio_sbu_switch_set() right
after registration but before this property is read, it will see
sbu_mux->mode_switch as false.

Would it be better to read this property before registering the switch?

[Severity: High]
This is a pre-existing issue, but does the error path handling just below
this lead to a use-after-free?

If typec_mux_register() fails later in probe, the code unregisters the
switch but doesn't seem to synchronize with active consumers:

	sbu_mux->mux =3D typec_mux_register(dev, &mux_desc);
	if (IS_ERR(sbu_mux->mux)) {
		typec_switch_unregister(sbu_mux->sw);
		return dev_err_probe(...);
	}

If a concurrent consumer invokes gpio_sbu_switch_set() before the
reference is revoked, and devres synchronously frees sbu_mux after probe
returns the error, the callback will dereference the freed sbu_mux memory
when it attempts to acquire sbu_mux->lock.

A similar situation appears to happen during device removal in
gpio_sbu_mux_remove().

>  	mux_desc.drvdata =3D sbu_mux;
>  	mux_desc.fwnode =3D dev_fwnode(dev);
>  	mux_desc.set =3D gpio_sbu_mux_set;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260825-usb-fusb34=
0-v1-v1-0-2191179b0661@foss.st.com?part=3D2
