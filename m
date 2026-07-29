Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A9EC43DA4A
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785314757; cv=none; b=royHcsoW6k940N4R3e1/DZo5mn+jC4e8KxpbbUyrLxYlWKfTkGL10DshSjJZ7AVOjqyHQim07raroecHw5oaT5ilPgPnHWZ8vrfhJVJdva6B34gSJbkQ4vkUl7SMhx8rFVe6Bc/CN+jGQPcUElT3oFd2zgaKt4sdWoX+zTDmHbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785314757; c=relaxed/simple;
	bh=+lXQ+3Un1FBVqsEHnJ1ITc4zSDwMw1RX0qZ1gW7uDTE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zgg9n92JGxvAJyHs35a6QAnJShpaqDjsOYpm2z0BZQ/+UoHVu7PgdZEfTn/Tl+GgaC+x4avb2O5uXY4QoNZ+e/sa6IIykieUbMdKVIcbtz0iQvfvIHUOrBcdzMXbu3TWmbtwEOoDHwEWwjx9mcJV8DeGOtdKhJbOZ02N71zylmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JY/hvz2O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JY/hvz2O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A569E1F000E9;
	Wed, 29 Jul 2026 08:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785314755;
	bh=Wnd8ULuVDrGq+CRZe9tJhHSiv8qr9YJABz2DVNMKR/A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JY/hvz2OLwShRnKAsZrlmv8nX4XIcmawk6ALCXvNdDnYx8ryn8d9DDlWFA8950XyI
	 C6SO5NxOBNXVz/1WIqqjGXJgMyifd+UoUt1UW6Et/oqog3wJwj/Ehpx1XoWUAydLUQ
	 pFiWrZGH6aHDJM+6GPk1KoEZUH1t7y56+T3PUZiC4dlR7xV3DQw/oS4PLuK2Ak+3nt
	 kjgTjRe9AkpIWlCv/4ceEgE7QwhV08oYGlsQL65XUWU/EfR9oywYPpT/2xts7aV/s5
	 +yTeioNDsf5l8h2CvvS+Fck2fm0w6ti3PIOffIFM2+8/gI3A3GK4IaQUyJPn+AkJof
	 RPFXypM1WJ9OA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 13/17] iio: frequency: ad9910: add RAM mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260729-ad9910-iio-driver-v10-13-aa1f6167729e@analog.com>
References: <20260729-ad9910-iio-driver-v10-0-aa1f6167729e@analog.com>
 <20260729-ad9910-iio-driver-v10-13-aa1f6167729e@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 08:45:55 +0000
Message-Id: <20260729084555.A569E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Incomplete error rollback when enabling or disabling RAM mode leav=
es the software cache and hardware SPI shadow registers corrupted and out o=
f sync.
--

--- Patch [13]: [PATCH v10 13/17] iio: frequency: ad9910: add RAM mode supp=
ort ---
commit c736cdf97db9c2e3b8047b8df7de313bdac03b16
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: frequency: ad9910: add RAM mode support

Add RAM control channel, which includes RAM data loading via firmware uploa=
d,
per-profile configuration, profile switching, sampling frequency control, a=
nd
read/write paths that swap register cache when RAM is active.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c

[ ... ]

> @@ -1156,6 +1257,41 @@ static int ad9910_write_raw(struct iio_dev *indio_=
dev,
>  						   AD9910_CFR2_DRG_DEST_MSK |
>  						   AD9910_CFR2_DRG_ENABLE_MSK,
>  						   tmp32, true);
> +		case AD9910_CHANNEL_RAM:
> +			if (AD9910_RAM_ENABLED(st) =3D=3D !!val)
> +				return 0;
> +
> +			/* swap profile configs */
> +			for (i =3D 0; i < AD9910_NUM_PROFILES; i++) {
> +				tmp64 =3D st->reg[AD9910_REG_PROFILE(i)].val64;
> +				ret =3D ad9910_reg64_write(st,
> +							 AD9910_REG_PROFILE(i),
> +							 st->reg_profile[i],
> +							 false);
> +				if (ret)
> +					break;
> +				st->reg_profile[i] =3D tmp64;
> +			}
> +
> +			if (ret) {
> +				/*
> +				 * After the write failure, profiles 0..i-1 were
> +				 * already swapped in SW, but Hw registers are
> +				 * still pending an IO update, so swap them back
> +				 * in SW to keep the state consistent.
> +				 */
> +				while (i--) {
> +					tmp64 =3D st->reg[AD9910_REG_PROFILE(i)].val64;
> +					st->reg[AD9910_REG_PROFILE(i)].val64 =3D st->reg_profile[i];
> +					st->reg_profile[i] =3D tmp64;
> +				}
> +				return ret;

[Severity: High]
If a SPI error occurs inside the for loop above, this while loop reverts the
software arrays (st->reg and st->reg_profile), but does it leave the hardwa=
re
shadow registers modified?

The prior successful loop iterations issued SPI writes with update =3D fals=
e.
On the next successful driver operation that triggers an IO update, could
these corrupted profiles be latched into the active hardware since no SPI
writes are issued during the rollback?

> +			}
> +
> +			tmp32 =3D FIELD_PREP(AD9910_CFR1_RAM_ENABLE_MSK, !!val);
> +			return ad9910_reg32_update(st, AD9910_REG_CFR1,
> +						   AD9910_CFR1_RAM_ENABLE_MSK,
> +						   tmp32, true);

[Severity: High]
If this ad9910_reg32_update() for CFR1 fails, the function returns
immediately.

Since the profile configs were completely swapped in the preceding loop, do=
es
this leave the software arrays (st->reg and st->reg_profile) permanently
inverted while the hardware's RAM mode state remains unchanged?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-ad9910-iio=
-driver-v10-0-aa1f6167729e@analog.com?part=3D13
