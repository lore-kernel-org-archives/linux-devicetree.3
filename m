Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793957521;
	b=fE5K4Gmw9YIvNAuK/q/xLWKBY85oI3Hsf0nNNhFAkKTkRYoDjK+aMrUBmLk622x5Tq1m
	 +bwM2VZIwN+D2zqrB41Cd3nKKDLYreQr8ZwdbsIgrOYknGvdrBkBWN30lqP93aBHy2UKD
	 VSWV9yd0szGZ4yhmvt3MpASol7oNpUcpJ2owxa6dyLI82Hj2IWtRnU+D6FB+9RAaV8lb/
	 yzu2wNgmV4ANjZQ/O+fc46xsJGpxohGugcT8UA+69XNkgYBeRlJ01nL/ZqQBtN47G5R/h
	 W1Ubt+k8xuMgKsLVL+z5a1ipwvEcs+ACF6L1yb2Iah/SjJvWrsJoFmvrdtgexaKz6wQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793957521;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=XVCiM/XmMmFs/c6zrvuFdZxMwAK3g2nr/jb2Qhyt9NI=;
	b=4cT6MCbokKO3/1d1TmAVoxBYH1idrOixeG6PxYLDPORn0+8n48sv1JiG7tcFBRHlFbR1
	 o5RsocpMrRGKecr87fDtnUs0LzklTAIr27u86MwL1O9nM/5UWfH5Y3nvrpWA6RHVgBp2h
	 w1VkdDB5QymGJnERhrATA5WVrZN3VFjyLVYh3MZSPD5C/NcSLNtS0DlIlEeIJeB9oSV8k
	 Ygy4afNB+mukhwAdC6XLmfnSSC+geXtIlEMdXYBV0g8nF3djY3zWqn5QUuPQ5FRYnLM7w
	 R9w6OF1qihxwBpmdmdNOqJ8csyi0QsAA+6qQOOkqY+AEnQzrtIQrQnRoIqtrSyUr9cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FqBkFKLS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B02606A329
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FqBkFKLS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2056A1F008A3;
	Fri,  6 Nov 2026 09:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793957520;
	bh=XVCiM/XmMmFs/c6zrvuFdZxMwAK3g2nr/jb2Qhyt9NI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FqBkFKLS7FSIiASlOzzXtWAO5z0j3ObNLsTFfDEQfg2E43l3TOuKb9wg0zzEzXban
	 WAcEEk0JaaHFt+Jzn+dyjTU+P+dYtEO7nI6xDs3kIhQspFcRLFKS3aqIhEy7Pg7xM1
	 pLmSRoIzDvU5NG991mpCfmIlrBYsp/qL6N5okY3lqtL1NnPXUK6gE4ry7BQaGCJ5Y7
	 4O80xtBLiaMbpC/es7/DZJGLTvJURFoADtiHOmirM7IfM9eXoG8Bv7L03wweXsrtQZ
	 3zt30dcOR0CVT5dj7arUEsUhCQhNFAtUvHk5f7gEfbp/ZBTGLKGBzJGK10eMy+vApE
	 3ex3jqXUFhwaQ==
Message-ID: <sashiko-outbox-201111@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] iio: light: ltr501: Add support for the
 LTR-659PS-01 proximity sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106091943.35783-5-clamor95@gmail.com>
References: <20261106091943.35783-1-clamor95@gmail.com>
 <20261106091943.35783-5-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:31:59 +0000
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
- [Medium] iio: light: ltr501: unguarded ALS register read in
  ltr501_init()
--

commit ee234def6f10d9aedb1149ec4e47b6d46e491495
Author: Svyatoslav Ryhel <clamor95@gmail.com>

iio: light: ltr501: Add support for the LTR-659PS-01 proximity sensor

This commit adds support for the Lite-On LTR-659PS-01 proximity sensor,
gates ALS register accesses behind a no_als_support flag, and updates
ltr501_trigger_handler() to check channel types instead of hardcoded scan
indices.

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index d5ce6468a229b..e7762115df913 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c

[ ... ]

> @@ -1251,16 +1291,21 @@ static irqreturn_t ltr501_trigger_handler(int irq=
, void *p)
>  		aligned_s64 ts;
>  	} scan =3D { };
>  	__le16 als_buf[2];
> +	unsigned int i;
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
> +	for_each_set_bit(i, indio_dev->active_scan_mask, indio_dev->num_channel=
s) {
> +		const struct iio_chan_spec *chan =3D &indio_dev->channels[i];
> +
> +		if (chan->type =3D=3D IIO_INTENSITY)
> +			mask |=3D LTR501_STATUS_ALS_RDY;
> +
> +		if (chan->type =3D=3D IIO_PROXIMITY)
> +			mask |=3D LTR501_STATUS_PS_RDY;
> +	}

[Severity: High]
Does indexing indio_dev->channels[] with the bit position from
active_scan_mask inspect the wrong channel on existing sensors?

Bit positions in active_scan_mask correspond to chan->scan_index, not the
array index in indio_dev->channels[].  In ltr501_channels and
ltr301_channels, channels[0] is LTR501_LIGHT_CHANNEL() with scan_index -1,
which shifts all buffered channels by one slot: channels[1] and
channels[2] are IIO_INTENSITY (scan_index 0 and 1), and in ltr501_channels
channels[3] is IIO_PROXIMITY (scan_index 2).

As a regression on LTR-501 and LTR-559, enabling buffered proximity sets
bit 2 in active_scan_mask, which inspects channels[2] (IIO_INTENSITY)
instead of channels[3] (IIO_PROXIMITY).  LTR501_STATUS_PS_RDY is never set
in mask, LTR501_PS_DATA is never read, and zeroed proximity values are
pushed to the IIO buffer.  Similarly, enabling only scan_index 0 on any of
the existing ALS sensors inspects channels[0] (IIO_LIGHT), leaving mask at
0 and pushing zeroed ALS data.

> @@ -1328,11 +1373,13 @@ static int ltr501_init(struct ltr501_data *data)
>  {
>  	int ret, status;
> =20
> -	ret =3D regmap_read(data->regmap, LTR501_ALS_CONTR, &status);
> -	if (ret < 0)
> -		return ret;
> +	if (ltr501_has_als_support(data->chip_info)) {
> +		ret =3D regmap_read(data->regmap, LTR501_ALS_CONTR, &status);
> +		if (ret < 0)
> +			return ret;
> =20
> -	data->als_contr =3D status | data->chip_info->als_mode_active;
> +		data->als_contr =3D status | data->chip_info->als_mode_active;
> +	}
> =20
>  	ret =3D regmap_read(data->regmap, LTR501_PS_CONTR, &status);
>  	if (ret < 0)

[Severity: Medium]
Should the IIO_INTENSITY persistence read later in ltr501_init() also be
guarded by ltr501_has_als_support()?

drivers/iio/light/ltr501.c:ltr501_init() {
    ...
	if (ltr501_has_irq_support(data->chip_info)) {
		ret =3D ltr501_read_intr_prst(data, IIO_INTENSITY, &data->als_period);
		if (ret < 0)
			return ret;
    ...
}

Because ltr659_chip_info_tbl has irq support enabled, probing an
LTR-659PS-01 calls ltr501_read_intr_prst() for IIO_INTENSITY, which reads
reg_als_prst and calls ltr501_als_read_samp_period() to read the reserved
LTR501_ALS_MEAS_RATE register.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106091943.3578=
3-1-clamor95@gmail.com?part=3D4
