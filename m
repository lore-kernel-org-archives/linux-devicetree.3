Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F8A2C3257
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 23:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783724660; cv=none; b=DSQcpkQgLdZdA0gfGZIctT+PF1BGKFaRuBZgeGHvRV7sAz+1CcTg4J7/AC92knVDK8IwYFXEHm75DaYFBlUKJgpyifxF8GZ9qTeijHXytONDFYpAi6rzhEqrCWGblgFLZ/h2N5b5RWQAVpZvKkgsrl4UtErkMTHuJ5u1WMkd/Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783724660; c=relaxed/simple;
	bh=CinSyIaGV5EaSPqXG6OkjA6YQin24ox/ppVZAJ0PvpI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WYHChxnKjBVdlRHacO+Odlh8i5J2c9XSh4PQvlgJAypOFh9hkvteYdO/6bm58LYFKiUWl9GxJHRRrH6o/x3ZcB2v27lN7eJx2y5WJNNiAy3Adzgw5Uz4EjxyEa9gwMBNl6U8+swxaGoDU/ZS7MYiposE57s13Su7auN82LA8dpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxhEhxxj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxhEhxxj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12E3B1F000E9;
	Fri, 10 Jul 2026 23:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783724659;
	bh=JKcG9Z9tLmRz+JzofZOuSpNYNEc8AzQBQXQBRZvxc7I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bxhEhxxj0IH4uy9FMCdCpYvv2fgsBGylw1S0FTGdnaMlZjbapg+Q1efxhoH6QP408
	 QVrQ8YeL0GNROZtRXp+dH74Psj5QCbabNqvJfqRAKDmeimv2Zq13l8FLzcxYThAcjk
	 bYC56h6PggxPNycGRkqZoIBRuCbOhMrcKij3rM18pJzT45XeW8WIxjc3oL6gDAEv70
	 mHvjJEN0rnAPT0AXIW5ZIxKR0ayAtMZAWo90qHC+GJ8IlHp89qhJ7TH7YFvDwUMvBr
	 8cBrJe8rwbqqr6QlwJDLAq+8qWRvSgSbaw4nftOMBSF4R6wpqdFW7vLmPc+k3K4feA
	 tcWgQ4I/8YNyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/8] iio: adc: ti-ads112c14: implement gain on
 internal short SYS_MON channel
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RGF2aWQgTGVjaG5lciAoVEkp?= <dlechner@baylibre.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260710-iio-adc-ti-ads122c14-v3-7-746d52cbf1d0@baylibre.com>
References: <20260710-iio-adc-ti-ads122c14-v3-0-746d52cbf1d0@baylibre.com>
 <20260710-iio-adc-ti-ads122c14-v3-7-746d52cbf1d0@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 23:04:18 +0000
Message-Id: <20260710230419.12E3B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `read_avail` callback incorrectly casts a native `s64` array=
 to `const int *` for the IIO core, which corrupts scale values on big-endi=
an architectures.
--

--- Patch [7]: [PATCH v3 7/8] iio: adc: ti-ads112c14: implement gain on int=
ernal short SYS_MON channel ---
commit 6c0e6ddc837dab31f5440831baff3fcb1a43f658
Author: David Lechner (TI) <dlechner@baylibre.com>

iio: adc: ti-ads112c14: implement gain on internal short SYS_MON channel

This commit implements support for the programmable gain amplifier on the
internal short SYS_MON channel. The scale_available table is populated
during probe to allow the PGA to be set to the same gain as external
channels.

> diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c1=
4.c
> index 4d2e7d37be829..2ce4411a0d86f 100644
> --- a/drivers/iio/adc/ti-ads112c14.c
> +++ b/drivers/iio/adc/ti-ads112c14.c
[ ... ]
> @@ -402,6 +430,69 @@ static int ads112c14_read_raw(struct iio_dev *indio_=
dev,
>  	}
>  }
> =20
> +static int ads112c14_read_avail(struct iio_dev *indio_dev,
> +				const struct iio_chan_spec *chan, const int **vals,
> +				int *type, int *length, long mask)
> +{
> +	struct ads112c14_data *data =3D iio_priv(indio_dev);
> +
> +	if (chan->channel =3D=3D ADS112C14_SYS_MON_CHANNEL_SHORT) {
> +		*vals =3D (const int *)data->sys_mon_chan_short_scale_available;
> +		*length =3D 2 * ARRAY_SIZE(data->sys_mon_chan_short_scale_available);
> +		*type =3D IIO_VAL_DECIMAL64_PICO;

[Severity: Medium]
Does casting a native s64 array to a const int pointer corrupt the scale
values on big-endian architectures?

When the IIO core processes these values as 32-bit pairs, vals[0] becomes
the most significant 32 bits and vals[1] the least significant on big-endian
systems. If the core later composes this via iio_val_s64_compose(vals[0],
vals[1]), the halves will be swapped, resulting in a mangled 64-bit scale
value.

Should the driver explicitly decompose the 64-bit values into an integer
array before handing them to the IIO core to avoid endianness issues?

> +		return IIO_AVAIL_LIST;
> +	}
> +
> +	return -EINVAL;
> +}
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-iio-adc-ti=
-ads122c14-v3-0-746d52cbf1d0@baylibre.com?part=3D7
