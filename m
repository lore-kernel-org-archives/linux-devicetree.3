Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000FD2E738F
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 07:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791616161; cv=none; b=PKrwcOx4mKInmDsig3FD4et7pDy5iZQAU67/6boRE+c0MwHlKub3KhM4ni2Cip6fjS6Tq/pquLo/T4brQqMWMkXD3bOhDqXw5ez8qHM0D4N5wfhpim5P3neRhwJxCSLWBuvfHyTLkxv2qOIb+6TtIyxzJ1b0h3t6Zn41LWMKbaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791616161; c=relaxed/simple;
	bh=TXyzUn4EoyKHzTVhDZR3wblvNy3CxuEKEYE05mX/ND4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=j54ScffR92usdXVPIN2En77FH97YC4e6LnqFg/DZPHRDOj36ZgrXt8NMgRE3Npa93ockp8dGOAa/5VBzwlh/G1vKX3jAnjpZZuhM8geaME5JSrwkSPQDr+kHyuZC67ze8kiohXgo1w2Di0j6+QucDWw4pAaFOxT3T44QoSjnTb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=neQYJcys; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="neQYJcys"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490EE1F000FF;
	Sat, 10 Oct 2026 07:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791616160;
	bh=oPp4vXpS+HabIVPB+kTHlxbg/r3upPlVWDoDs91wqdU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=neQYJcyshkf/ENsSYgP9F+Myhppvs+m/aFJQueFMAcpIJkwLD0UKcOgcv5Le1rgZ/
	 zUDa+BsFQ6cP8accZinn5zYBr9pecsBp+jdu7WdUUm9xyx2JuiUrD/nUQ9c0b24whO
	 zcGj+6Hk1rdU2XRPn7IDjytmP7aH3MiCKqKLjTZk6UE+LYNU7qokEmrlSRV4C9k+De
	 nIKEEi5+RlCUN10wr+OzA0l7J55aTxcij4yxYfXQwEA356umMWD7KGnGNHlp4Iu3dN
	 2UJ9vUiJe+z4sH+nIE8uzWKxOmhZme7t+4UtDyTtwpd8xwHN+R+pVpxWfvPly0Dlqz
	 lOEgh1B1760RA==
Message-ID: <sashiko-outbox-166297@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/10] iio: adc: ti-ads1262: support excitation
 currents
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261010-ads126x-v5-7-49e331cb2fed@gmail.com>
References: <20261010-ads126x-v5-0-49e331cb2fed@gmail.com>
 <20261010-ads126x-v5-7-49e331cb2fed@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 07:09:19 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] iio: adc: ti-ads1262: Build failure in min() macro due to mixed sig=
nedness
--

commit f745e114f602a4dc9a511ee58a8c5092e66748e8
Author: Kurt Borja <kuurtb@gmail.com>

iio: adc: ti-ads1262: support excitation currents

This commit adds support for the two IDAC excitation current sources on the
TI ADS1262 ADC. It allows routing IDAC outputs to pins and configuring their
magnitudes via device tree properties.

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> index 938e260753027..49d4bf206be07 100644
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c

[ ... ]

> @@ -1332,7 +1372,51 @@ static int ads1262_parse_channel_node(struct ads12=
62 *st,

[ ... ]

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

[Severity: Low]
Does this introduce a compile-time regression due to strict signed/unsigned
type checking in the min() macro?

The fwnode_property_count_u32() function returns a signed int which is
stored in the count variable, while ARRAY_SIZE() evaluates to an unsigned
size_t. The kernel's min() macro enforces that both arguments have
compatible signedness, which triggers a build-breaking assertion here.

Could min_t(size_t, count, ARRAY_SIZE(pins)) or similar be used here
instead?

> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "%pfwP: failed to read excitation-channels\n", node);

[ ... ]

> +		mags[0] =3D 0;
> +		mags[1] =3D 0;
> +		ret =3D fwnode_property_read_u32_array(node, "excitation-current-nanoa=
mp",
> +						     mags, min(count, ARRAY_SIZE(mags)));

[Severity: Low]
Does this also trigger the same min() macro signedness build regression as
above, since count is signed and ARRAY_SIZE(mags) is unsigned?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010-ads126x-v5=
-0-49e331cb2fed@gmail.com?part=3D7
