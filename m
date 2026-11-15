Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732641;
	b=sv/Mw/Ao/S1MWhT0n5JnjqpKDUDKdwE/+NC33jJ2J8XL1wy0mkR7qarWtFpbPKTaRzJE
	 hjcm3TkNJtGjUOHAk9Joj79VYDOE1B7yVIKFqeu+3rM5eDIuIvqPG28MRF7o30ejBWDXb
	 9mXlIRoxG/vq3OotQmjN+Ziltbj2WOHGJRKO5dsOpk1xNT5Rh+eYfKFTF24U2XLoUvrLT
	 0WFrI1KMEzL0KZP/KGXONu1XqkkUz8SWolMqFGfwV0z0kmjK4Dvilj/C3hmmv9BrJqaF6
	 oK6uqsz/mlY9jZ8GsTanei3pJQTT+wd4lYQSB9ygdtIP463aIhIdEeEfsFgz22exb2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732641;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=QoC7wQGN1tet066YAZxGgVzWrz1pUHwSyZtu2HSm6CQ=;
	b=TbcqEUm7VP1b3U5K3o5DNPi2Uofbwnct/sTGi/tXZWVm5zX4G2xLJnvF/3kjUH9nFGNu
	 TTR7Cr4MbM2PAv8zh3TORnFom5Pmqh9zwut7uWaZ/YIpJeJ7MdIA8DfRgGgtmCAfT1UHm
	 HJdQj2ARj9O7ymmyEmd+LRzO17nxooJ5QzaOOJV7A8Kqki7M5qkVl/ptNtduTZEmv//D+
	 uBrSKac/xIPC3F0Yaolv/v7qSNX28/kOBJYqia3GC4GZlFEz7ufKsW1Ww+8kt5txGyI3J
	 XqFfzqXe2ThkZwTZUcaPsgkXhMwsnvynDXwKuJRvecHOu5xrKR2B/n5DSQ+HOXi4nQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jlHM+YYd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ADB3606A31D
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 08:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jlHM+YYd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1457F1F000C7;
	Sun, 15 Nov 2026 08:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794732641;
	bh=QoC7wQGN1tet066YAZxGgVzWrz1pUHwSyZtu2HSm6CQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jlHM+YYdXxEJ/lBwMvhtQG4P8kBWkHOkIbj5/eBqnW/Jue/X+xvcH5RAYpCGCvp7S
	 oQiNHelR+uI9M211FELOdNWnAyGWz5jRLPyuKxvfDSvQ7d83wTOgo75e5vD4gd0U9Z
	 trMfiUDrO68wDev+ZJc0eY2OHzssoR6M6SLbXyAY2lc3BCxS9NOiMvrxWPEy2cTGQ2
	 oYEKTMLiMI1yMXnx8hQmuIos5oWGokwNuBEzDxMSe+oAhWudt6Gsp2MUbHC0QmpZug
	 p5ffp/NaZ06zP8MAhbxmQ+gVmt5jxsxRQ188UPAWdWymUrUXCSbGGLDdifd5/QHSvY
	 N7inWPYQQlzLg==
Message-ID: <sashiko-outbox-215308@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/4] iio: light: ltr501: Add support for the
 LTR-659PS-01 proximity sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115083741.62140-5-clamor95@gmail.com>
References: <20261115083741.62140-1-clamor95@gmail.com>
 <20261115083741.62140-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 08:50:40 +0000
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
- [High] iio: light: ltr501: wrong channel lookup in
  ltr501_trigger_handler()
- [High] iio: light: ltr501: out-of-bounds write to als_gain_tbl in
  ltr501_probe()
--

commit 5a33f9170cb34d957e4ef6fd2754b95efed27186
Author: Svyatoslav Ryhel <clamor95@gmail.com>

iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor

This commit adds support for the Lite-On LTR-659PS-01 proximity-only sensor
by introducing a no_als_support flag to skip ALS register accesses and
updating ltr501_trigger_handler() to check channel types when building the
data-ready mask.

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index bf3cc32a55c3c..394e08c78005e 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c
[ ... ]
> @@ -1251,16 +1286,21 @@ static irqreturn_t ltr501_trigger_handler(int irq=
, void *p)
>  		aligned_s64 ts;
>  	} scan =3D { };
>  	__le16 als_buf[2];
> +	unsigned int chan_idx;
>  	u8 mask =3D 0;
>  	int j =3D 0;
>  	int ret, psdata;
> =20
>  	/* figure out which data needs to be ready */
> -	if (test_bit(0, indio_dev->active_scan_mask) ||
> -	    test_bit(1, indio_dev->active_scan_mask))
> -		mask |=3D LTR501_STATUS_ALS_RDY;
> -	if (test_bit(2, indio_dev->active_scan_mask))
> -		mask |=3D LTR501_STATUS_PS_RDY;
> +	iio_for_each_active_channel(indio_dev, chan_idx) {
> +		const struct iio_chan_spec *chan =3D &indio_dev->channels[chan_idx];
> +
> +		if (chan->type =3D=3D IIO_INTENSITY)
> +			mask |=3D LTR501_STATUS_ALS_RDY;
> +
> +		if (chan->type =3D=3D IIO_PROXIMITY)
> +			mask |=3D LTR501_STATUS_PS_RDY;
> +	}

[Severity: High]
Does indexing indio_dev->channels[] with chan_idx look up the wrong channel
on chips that include LTR501_LIGHT_CHANNEL()?

iio_for_each_active_channel() iterates over set bit positions in
active_scan_mask, which are scan_index values rather than array indices into
indio_dev->channels[].  In ltr501_channels[] and ltr301_channels[],
channels[0] is LTR501_LIGHT_CHANNEL() with scan_index =3D -1, shifting all
buffered channels by one position:

drivers/iio/light/ltr501.c:ltr501_channels[] {
	LTR501_LIGHT_CHANNEL(),
	LTR501_INTENSITY_CHANNEL(0, LTR501_ALS_DATA0, IIO_MOD_LIGHT_BOTH,
				 ltr501_als_event_spec,
				 ARRAY_SIZE(ltr501_als_event_spec)),
	LTR501_INTENSITY_CHANNEL(1, LTR501_ALS_DATA1, IIO_MOD_LIGHT_IR, NULL, 0),
	{
		.type =3D IIO_PROXIMITY,
    ...
		.scan_index =3D 2,
    ...
}

On LTR-501 and LTR-559, enabling proximity (scan_index 2) inspects
channels[2] (IIO_INTENSITY) instead of channels[3] (IIO_PROXIMITY), so
LTR501_STATUS_PS_RDY is never set in mask, LTR501_PS_DATA is never read, and
buffered proximity capture always pushes zeroed data.  Likewise, enabling
only scan_index 0 inspects channels[0] (IIO_LIGHT), leaving mask as 0 and
pushing zeroed ALS samples without reading the sensor.

[ ... ]
> @@ -1580,6 +1624,7 @@ static const struct i2c_device_id ltr501_id[] =3D {
>  	{ .name =3D "ltr329", .driver_data =3D (kernel_ulong_t)&ltr329_chip_inf=
o_tbl },
>  	{ .name =3D "ltr501", .driver_data =3D (kernel_ulong_t)&ltr501_chip_inf=
o_tbl },
>  	{ .name =3D "ltr559", .driver_data =3D (kernel_ulong_t)&ltr559_chip_inf=
o_tbl },
> +	{ .name =3D "ltr659", .driver_data =3D (kernel_ulong_t)&ltr659_chip_inf=
o_tbl },
>  	{ }
>  };

[Severity: High]
In ltr501_probe(), introduced earlier in this series by commit "iio: light:
ltr501: Switch to read_avail() op from manual attribute registration", does
the gain table initialization overflow data->als_gain_tbl[]?

drivers/iio/light/ltr501.c:ltr501_probe() {
    ...
	for (int i =3D 0; i < data->chip_info->als_gain_tbl_size; i++) {
		if (data->chip_info->als_gain[i].scale =3D=3D LTR501_RESERVED_GAIN)
			continue;

		data->als_gain_tbl[j++].scale =3D data->chip_info->als_gain[i].scale;
		data->als_gain_tbl[j++].uscale =3D data->chip_info->als_gain[i].uscale;
	}
	data->als_gain_tbl_len =3D j;
    ...
}

Because j is post-incremented on both assignments, each iteration advances j
by two elements instead of one, leaving half of each entry zeroed.  When
probing LTR-303, LTR-329, or LTR-559, which have 6 non-reserved entries in
ltr559_als_gain_tbl, j reaches 12 and writes past the 8-element
data->als_gain_tbl[] array at the end of struct ltr501_data, corrupting up
to 32 bytes of adjacent kernel heap memory.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115083741.6214=
0-1-clamor95@gmail.com?part=3D4
