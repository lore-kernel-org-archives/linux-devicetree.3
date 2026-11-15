Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794732414;
	b=k4PlWackT/biz3Uuq+ofPs9a2p90SgjtA4boau4SdSIM/XVeO0TkLpklhSk2Xtb7uuka
	 VvhMW7Z7liL5KR2nR1h5XS3xDlqyoaimYe6djVbx6Jb44YyFdI9NE1asObrDxj9wQaA1E
	 gUZ9vWd//nbRuskKgaQa9CUcB92L3d14f7j4d++uOzEfp9Z0FgALiRUcDfZwJCLgdJh+V
	 SAyw3znSNVw3DMy/cDDSO8ndBWNS2//Fp0uyr6f3lbEJxoKO6ILVEgtJx+LjUUdMyQh38
	 oRhhE5tywlAZdiUEmgcmzAL+kJlgYwgDPrGmZv0NOcqp3LSVGfrsfg42wSP1JrXAr1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794732414;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jN7JoDvMHxXujqu7SIoANdngQWWHg2rHqyNhkYxXE4g=;
	b=n5823RxvxbOw6p4d262Qk7atyWpyMYUzHqcOMXt4zvqSRvfftc1l/qQjt80QVdyjQuPo
	 mVN135NM0PAo8wvv4bfinAQvd9K6TGulV8abYYfnZFe+bh9T3ZGR4KeLsA67nDyg/rEbC
	 2HfEcX1lFswdV5JGetn5/IpJol4268pCFFRg8TzmdkHvsNWI6vifrKlFyv0WRIqGzhd/P
	 8xRihNle7v2B6zXCI0sw57wsWA8E70ISc5NfhPR+4LJ3S6DhAyVdyjMgYI4WR3WiPwsf0
	 2zo9DixJZMqnrPPLf5A+UhsC8AXV+jW4IIDu5DJpZuFJjjEMKOS1OhjVchjd55E0v/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jUdjfENm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF09606A31A
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 08:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jUdjfENm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691311F000C4;
	Sun, 15 Nov 2026 08:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794732413;
	bh=jN7JoDvMHxXujqu7SIoANdngQWWHg2rHqyNhkYxXE4g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jUdjfENmzogBa9umJnpcLw3/eJH25ke2IiV63rdsXEI30VhwsfPpwfGN6YdUSllgZ
	 euIZ0XVsZPS2ssD+2mhc2ZwLpl7N2ms5xdM5leUy0zQmzT0LFLo5uDGFxdzNdnt2Pn
	 vVZLBBgH9Xw+gBrItrMq7v/6MVAIYjBtmE7YoYDfIED85CjBOi1Q488QExVZ2RLp53
	 a1Kk/6XLsjus1IXHXgsu43pBU1chVkrnGesWI2w7ZiVfCpYlJpVYDxnFD+daS78s7+
	 U+NZcmojaR6rxunq6hpxpJyBCkn0iP/MsiPfWDJwxyFq9O7i85jYO5lVS1k5kXC3RN
	 1Q+NsvjOZujww==
Message-ID: <sashiko-outbox-215305@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] iio: light: ltr501: Switch to modern match
 mechanism
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261115083741.62140-3-clamor95@gmail.com>
References: <20261115083741.62140-1-clamor95@gmail.com>
 <20261115083741.62140-3-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 08:46:51 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] iio: light: ltr501: out-of-bounds write in ltr501_probe() gain
  table loop
--

commit 2ee88d940ef79eabde357ad61e65124e0b97da91
Author: Svyatoslav Ryhel <clamor95@gmail.com>

iio: light: ltr501: Switch to modern match mechanism

This commit replaces the chip enum and ltr501_chip_info_tbl array with
per-chip structures retrieved via i2c_get_match_data().

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index 3662aed5225bc..bf3cc32a55c3c 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c

[ ... ]

> @@ -1481,18 +1473,10 @@ static int ltr501_probe(struct i2c_client *client)
>  	if (ret < 0)
>  		return ret;
> =20
> -	if (id) {
> -		name =3D id->name;
> -		chip_idx =3D id->driver_data;
> -	} else {
> -		name =3D iio_get_acpi_device_name_and_data(&client->dev, &ddata);
> -		chip_idx =3D (intptr_t)ddata;
> -	}
> -	if (!name)
> +	data->chip_info =3D i2c_get_match_data(client);
> +	if (!data->chip_info)
>  		return -ENODEV;
> =20
> -	data->chip_info =3D &ltr501_chip_info_tbl[chip_idx];
> -
>  	if ((partid >> 4) !=3D data->chip_info->partid)
>  		return -ENODEV;

[Severity: High]
Can the gain table loop right below this in ltr501_probe() overflow
data->als_gain_tbl[]?

The earlier commit "iio: light: ltr501: Switch to read_avail() op from
manual attribute registration" in this series added:

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

Each element of data->als_gain_tbl[] is a struct ltr501_gain holding both
scale and uscale, and the array is sized to ARRAY_SIZE(ltr559_als_gain_tbl)
(8 elements).  Post-incrementing j on both assignments advances by two
elements per entry, leaving interleaved zeros in the table exposed by
ltr501_read_avail().  On chips using ltr559_als_gain_tbl (such as ltr559,
which has 6 non-reserved entries), j reaches 12 and writes past the end of
data->als_gain_tbl[], overwriting data->als_gain_tbl_len and adjacent slab
memory after struct ltr501_data.

j should be incremented once per non-reserved entry, with
data->als_gain_tbl_len set to j * 2 for IIO_VAL_INT_PLUS_MICRO.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261115083741.6214=
0-1-clamor95@gmail.com?part=3D2
