Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957377;
	b=S0KzfZeBnSFsqJn/4Dm4buWzOq4y/eoqNOzL4HSf6bML98d5/bDzTxF3bnHeOnBlngwS
	 y3EXW+rXsYbfNJ51PhUSvqwALjl41PG73nB7Z2LhosihzImac4oXlWo+w36y8C1QN+xH6
	 iqtj+e9Ugji7MdvMifaqVVsmhOWEV+dlCbmbKtTP3lc3hXv+/iqcHKReHPZsrH+nq5jE7
	 9ndrAN4ofvGaVgI0xhu+lACRygOLY+btLUJA8qqyeKr0kbC+e0Dyy4Mpc+zbebryo49Gd
	 qViI2FeGdzYdMlvdzUfbSyamhhWcnHPye0N65i9EahQl//W2IeFApxFJi0YF3Ksx7pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957377;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=E0Mo22KUtdYNmnn6daUOAIrTnkHSja3umPLhoTZUivU=;
	b=v2qoyr9pNMMge0bQp8hlXoIlcaVCdcixWNl2gcpjTPIZ/GrFPJphJ6gi574JavZwQqFu
	 IMYfqYeWW6YgHn/h7hmBMBGi3kvGqQ1GQF+NsNedBYt1gWqolgReewCVcL5Qsx7qRkSlG
	 Z6aVdTER2b/F3Wg48BgXD5PgMzz4pxqMGQBJoYKw5oLxpHLx/zTZoWuYg0t2aAjV4g8D2
	 okmHRHwUmdSSprU15mYvtj7RXwwclcHnYbMLFOzRlxVyndr2qSyKQQgn6UwnIYnJQGBX3
	 9wt+Nasy+zpWkra8EPalrBcoUl9sY2Xcb9a5jFEgQBTjVnDm/QMX7JJRbW0vvLNM8Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kVjcQI4o;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46BD606D818
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kVjcQI4o
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D431F008BE;
	Fri,  6 Nov 2026 09:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957376;
	bh=E0Mo22KUtdYNmnn6daUOAIrTnkHSja3umPLhoTZUivU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kVjcQI4o+D6BJLj7ZEXhUTp7cejuNPaGxah8D6EQw6+Wuf5+l1MmJhCwy3WC3MFI2
	 2gQV4lBW72IpnDtZY4x0cfpfOmThfa8k9q9g9cQ1MFlviDy6XRq4VRFHLyLyNBCqu7
	 Hnk1t3t1xUnL3675+goLFZvQ0Ugh1ldxfn0QoOmkImtxqT93QpJITVioI2Nbft42hq
	 yC4k+QUQzHM9c4cij3rQULdks/RDyZmkVb0SK2N9/rAHJ2A8y+nS9LRjmaYFSE8mIW
	 0JM5p2SNjUNVbkszBAvfCEgMxoTuk5ncxN64GIhclnuq1wt2q7YA06dY3AD0Q72agd
	 DzWugLgA/6hmA==
Message-ID: <sashiko-outbox-201110@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] iio: light: ltr501: Switch to read_avail() op
 from manual attribute registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106091943.35783-2-clamor95@gmail.com>
References: <20261106091943.35783-1-clamor95@gmail.com>
 <20261106091943.35783-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:29:35 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] iio: light: ltr501: wrong available masks break scale_available
  sysfs ABI
- [Medium] iio: light: ltr501: ltr501_read_avail() exposes reserved gain
  entries
--

commit 62f3eb145ee7bea38108b1176e688878b094c714
Author: Svyatoslav Ryhel <clamor95@gmail.com>

iio: light: ltr501: Switch to read_avail() op from manual attribute registr=
ation

This commit replaces manual *_available sysfs attribute registration with
the IIO read_avail() callback and consolidates the per-chip iio_info
structures.

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index 302be2fc314c5..cc5d7af44d77c 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c
[ ... ]
> @@ -590,6 +604,7 @@ static const struct iio_event_spec ltr501_pxs_event_s=
pec[] =3D {
>  	.channel2 =3D (_mod), \
>  	.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW), \
>  	.info_mask_shared_by_type =3D (_shared), \
> +	.info_mask_shared_by_all_available =3D (_shared), \
>  	.scan_index =3D (_idx), \
>  	.scan_type =3D { \
>  		.sign =3D 'u', \

[Severity: High]
Does setting .info_mask_shared_by_all_available =3D (_shared) break the
sysfs ABI for scale availability?

_shared includes BIT(IIO_CHAN_INFO_SCALE), so placing it in
info_mask_shared_by_all_available registers scale_available instead of
in_intensity_scale_available (which requires
info_mask_shared_by_type_available).

In addition, the IIO_PROXIMITY channel in ltr501_channels sets
BIT(IIO_CHAN_INFO_SCALE) in .info_mask_separate without a matching
.info_mask_separate_available mask, so in_proximity_scale_available is
no longer registered on ltr501 or ltr559 and the proximity scale branch in
ltr501_read_avail() is unreachable.

> @@ -1111,111 +1126,56 @@ static int ltr501_write_event_config(struct iio_=
dev *indio_dev,
>  	return -EINVAL;
>  }
> =20
> -static ssize_t ltr501_show_proximity_scale_avail(struct device *dev,
> -						 struct device_attribute *attr,
> -						 char *buf)
> +static int ltr501_read_avail(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     const int **vals, int *type, int *length, long mask)
>  {
> -	struct ltr501_data *data =3D iio_priv(dev_to_iio_dev(dev));
> +	struct ltr501_data *data =3D iio_priv(indio_dev);
>  	const struct ltr501_chip_info *info =3D data->chip_info;
[ ... ]
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE:
> +		if (chan->type =3D=3D IIO_INTENSITY) {
> +			*length =3D info->als_gain_tbl_size * 2;
> +			*vals =3D (const int *)info->als_gain;
> +		} else {
> +			*length =3D info->ps_gain_tbl_size * 2;
> +			*vals =3D (const int *)info->ps_gain;
> +		}
> +		*type =3D IIO_VAL_INT_PLUS_MICRO;
> +		return IIO_AVAIL_LIST;

[Severity: Medium]
Does returning info->als_gain directly as IIO_AVAIL_LIST expose
LTR501_RESERVED_GAIN sentinel entries to userspace?

ltr559_als_gain_tbl (used by ltr303, ltr329, and ltr559) is indexed by
hardware register value and has two reserved entries:

drivers/iio/light/ltr501.c:
static const struct ltr501_gain ltr559_als_gain_tbl[] =3D {
    ...
	{LTR501_RESERVED_GAIN, LTR501_RESERVED_GAIN},
	{LTR501_RESERVED_GAIN, LTR501_RESERVED_GAIN},
	{0, 20000},
	{0, 10000},
};

ltr501_show_intensity_scale_avail() previously skipped entries equal to
LTR501_RESERVED_GAIN (-1), whereas iio_format_avail_list() formats each
{-1, -1} pair as "-1.000001" in sysfs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106091943.3578=
3-1-clamor95@gmail.com?part=3D1
