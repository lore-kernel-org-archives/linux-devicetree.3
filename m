Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE823CF678
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 06:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900232; cv=none; b=C4pHtOPfewsaa2759ox3DBBEuDuXJFzKwAHa1QXKZ6jbx8+5fb9mBqhr8UgRSXkR0GHuNJfS+pMr5lfCEAS6aw9yXwQDr2dBw9Q+n6XXTM9LkRgX/+tlEXJsJ4uC9n4rT5GJal8Fp0SyMNXE5LfK9moaa4pCReIrxBYdRdDQLv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900232; c=relaxed/simple;
	bh=WshRva789d0hF4zd0pGM9CTViq9gJ9gvRodHi+i4WeE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UycAL9YXEOM3M1+9dnyzSD/XZMfoyjDBbtHOTiYpsGWcvb1gIVuFE4UgvuY1nPI8CidDs+5Ue537ZVkLaH3X6JMRNN6L/EObzudnqK7C/pc8gBEZucTHyCCHcCzzW8DlZKePT3XRt/VbvYjAVhelVHOIR1IYYOgNJiTf8P8U4KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dv9B42ZF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dv9B42ZF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653641F000E9;
	Fri, 28 Aug 2026 06:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787900231;
	bh=2Wmnz+skobVyyWDFY3kVCgR5UOSk/8HoEqlwn7wlliI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dv9B42ZFDSj0IFcQUPQGSK5Fc9kH9vg8V4H9ZmzFUWZRgWEr5NgDSjp5dfgGwOPi/
	 3JIvR3wjElOI23FKo/4HryVfpYXadiyddhVssQ5lG0hlNwMIA1g0ukt/uxIXUP31SD
	 lKzSDFjJ/gwByCGZCrkGavT9bNwBxLcWIyPiDFYzY6pVXcRiaWL9HvRVPppGE17vgT
	 bPlps0GTNrYYCMRQMW0pS4qORJZuOOkpDuqNnLJM3hPwIV9JKQWNpuyba7cSpiqJjr
	 cTzimdB6cnHuzG4MWU8Dai6IVWZC1ykpTXJhvEB/NnSLrL9C3ikdxulEO5KeQVuyOk
	 4nTWKFLs3B3pA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 07/10] iio: adc: ti-ads1262: support excitation
 currents
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260828-ads126x-v4-7-1dc27e9c0260@gmail.com>
References: <20260828-ads126x-v4-0-1dc27e9c0260@gmail.com>
 <20260828-ads126x-v4-7-1dc27e9c0260@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 06:57:10 +0000
Message-Id: <20260828065711.653641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Using `min()` with variables of different signedness (`int` and `si=
ze_t`) triggers a `BUILD_BUG_ON` compiler error from the kernel's `<linux/m=
inmax.h>`.
--

commit b2756d4b7fc670f092613a6125bee27988772b27
Author: Kurt Borja <kuurtb@gmail.com>

iio: adc: ti-ads1262: support excitation currents

Support the two IDAC excitation current sources. Each channel can route
its IDAC1/IDAC2 outputs to a pin via the "excitation-channels" property
and select a magnitude via "excitation-current-nanoamp".

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> index 4d38da092001b..04566d00d7cb8 100644
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c

[ ... ]

> @@ -1356,7 +1393,51 @@ static int ads1262_parse_channel_node(struct ads12=
62 *st,
>  		}
>  	}
> =20
> +	if (fwnode_property_present(node, "excitation-channels")) {
> +		count =3D fwnode_property_count_u32(node, "excitation-channels");
> +		if (count < 0)
> +			return dev_err_probe(dev, count,
> +					     "%pfwP: failed to count excitation-channels\n", node);
> +
> +		pins[0] =3D ADS1262_IDACMUX_NO_CONN;
> +		pins[1] =3D ADS1262_IDACMUX_NO_CONN;
> +		ret =3D fwnode_property_read_u32_array(node, "excitation-channels",
> +						     pins, min(count, ARRAY_SIZE(pins)));
                                                                   ^^^^^^^^=
^^^^^^^^^^^^^^^^

[Severity: Low]
Does this code trigger a build failure from a BUILD_BUG_ON() in the min()
macro?

The min() macro enforces strict type checking. The count variable is a sign=
ed
int, while ARRAY_SIZE(pins) evaluates to an unsigned size_t. Would it be
better to use min_t(size_t, count, ARRAY_SIZE(pins)) here?

> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "%pfwP: failed to read excitation-channels\n", node);
> +		if (pins[0] > ADS1262_IDACMUX_NO_CONN || pins[1] > ADS1262_IDACMUX_NO_=
CONN)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "%pfwP: excitation-channels not in range\n", node);
> +		chan->idac_mux[0] =3D pins[0];
> +		chan->idac_mux[1] =3D pins[1];
> +
> +		mags[0] =3D 0;
> +		mags[1] =3D 0;
> +		ret =3D fwnode_property_read_u32_array(node, "excitation-current-nanoa=
mp",
> +						     mags, min(count, ARRAY_SIZE(mags)));
                                                                   ^^^^^^^^=
^^^^^^^^^^^^^^^^

[Severity: Low]
Does this min() macro invocation also trigger a build failure due to the sa=
me
mismatched types?

> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "%pfwP: failed to read excitation-current-nanoamp\n",
> +					     node);
> +
> +		ret =3D ads1262_find_one(ads1262_idac_mags_nA,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-ads126x-v4=
-0-1dc27e9c0260@gmail.com?part=3D7
