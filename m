Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2363F44D6
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 10:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781000994; cv=none; b=BFwe2K9xk+GB9monIB+pb/kP304UyuTA6+xvb7peJ2M4RHciMqNAaGVKt/7PZG1nitsKm38VOgvLFgwqdRZOYqAh+K7LBs+3foTv8WArriNxNj1iKstOkbbavsYMOg7mVmjZvI4y68VO3w8UcseaW6bfJfagisrEq+/FoEO9jKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781000994; c=relaxed/simple;
	bh=OWdt92dqFO8q/wITvpe3IjK/fZc+Ccu4+f5vzeI3WAg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N7aiLZ/V0b33wLrJFDR3d/fKuXSKcmp7n/mIOkVU0LRR9sC48mPd0xqX0cma+xGYqIJBRhVczLWPFpPELVat471HQp97S9ttPQVcBueKlIN2JaBBWImKZGSKP62/78UC9iwoarTI4DU9zO3iHBx0wgRvyTjBIMy47qVq8WhFcwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o2uF3Hi7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o2uF3Hi7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14E01F00898;
	Tue,  9 Jun 2026 10:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781000993;
	bh=2cI/ltojbAmaQfLP5j0hl9iRVp3GsqNjIhYUU9LGwnw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o2uF3Hi7ytW9n2Tb85o4JFwV2iFrKBd6fdIHfMb+HjRtPG7ITW9msqlo8WkzO0LBo
	 DLDdKWzO0Ohvb4OfHf06t/wynHPLmy3sC9J6GXx9D3OzeYL6iwb/Vgdp4wHmILTFBU
	 +l6jyMSd44gAnKmAGhA+gEQ7zH5n4E/JPtm9Cvk4qDF/bFLDngDgKoQRUw7nF0xLSM
	 AffJVyb+DzF+VvoIhSCK5xb8wQbpDdQuKHviEB+G9smBfnDHheh/1G41+phZlfrPXg
	 TRBDgDABdu5vzizWL0ScVIum1PhCRA0tj+sU2MOlfnQFXeCrtMN2nfuR0rehhianiW
	 RNJ03erNhPMNw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/12] iio: dac: ad5686: consume optional reset
 signal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260609-ad5686-new-features-v2-6-70b423f5c76d@analog.com>
References: <20260609-ad5686-new-features-v2-6-70b423f5c76d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 09 Jun 2026 10:29:52 +0000
Message-Id: <20260609102952.F14E01F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Premature reset line deassertion during power ramp-up due to the=
 use of '_deasserted' combined with a manual pulse.
--

commit 61717352bc99739a9f89195c3320a934e033ad38
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: dac: ad5686: consume optional reset signal

Add RESET pin GPIO support through an optional reset control, which is local
to the probe function, and include a delay for the required reset pulse wid=
th.

> diff --git a/drivers/iio/dac/ad5686.c b/drivers/iio/dac/ad5686.c
> index fc3863274b291..700798b80f044 100644
> --- a/drivers/iio/dac/ad5686.c
> +++ b/drivers/iio/dac/ad5686.c
[ ... ]
> @@ -506,7 +508,15 @@ int ad5686_probe(struct device *dev,
>  		return dev_err_probe(dev, -EINVAL,
>  				     "invalid or not provided vref voltage\n");
> =20
> +	rstc =3D devm_reset_control_get_optional_exclusive_deasserted(dev, NULL=
);

[Severity: Medium]
Does this prematurely deassert the reset line during power ramp-up?

Because devm_reset_control_get_optional_exclusive_deasserted() automatically
and immediately deasserts the reset line upon acquisition, the reset line is
driven high while the power supply is still stabilizing, before the 5 us
power-up delay has elapsed.

This creates an unwanted rising edge on the reset pin during power ramp-up,
which could cause the device to enter an unknown state or latch up.

Should this use devm_reset_control_get_optional_exclusive() instead, which
does not modify the line state during acquisition, allowing the manual togg=
le
sequence below to safely reset the device after power is stable?

> +	if (IS_ERR(rstc))
> +		return dev_err_probe(dev, PTR_ERR(rstc),
> +				     "Failed to get reset control\n");
> +
>  	fsleep(5); /* power-up time */
> +	reset_control_assert(rstc);
> +	fsleep(1); /* reset pulse: comfortably bigger than the spec */
> +	reset_control_deassert(rstc);
> =20
>  	/* Initialize masks to all ones */
>  	st->pwr_down_mask =3D ~0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609-ad5686-new=
-features-v2-0-70b423f5c76d@analog.com?part=3D6
