Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794131429;
	b=1p+tOhK44tWCvO434l5LNOdSc2W5mUFFy3BOgIh7qv+Wcn6H3J0o3spltqGCS3r7yQ/q
	 Fq/2brdHmU4T8kTI1xNjb7RuY3PnvSx0PkLB5E9lm6QG9e4ZuQvBjpHaKfGunOCTy1Pj9
	 I8t8th96eUBQywPi9Ao0Ypa0jpyxyoDMA/x0siiHeTlOXrEvcyEx0ZUtVxwr0OuqziWxF
	 g9BpOQqH7hbX2G3hzwJNhd5a6fi2FcuEvYKslEqxVIc3q4OSx++7KzKMAG8JDUrtibovX
	 QRnhk0tKdNnW22Jmal+HMJzbJdEtRGPoz/I7wLli+HJEMZprhOryDdvmXWe29pXecuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794131429;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=GuS+i74VaCbk/eFYFvugEDTjcOPPWu9nkqtUta44M00=;
	b=TaY8iKeJsH0OE+KsdVFKlhlysaoZdMMtPnnz/ts+Ce5+usVCYuVO6sahkqD/V2n3ctF9
	 TIp2jNUP106A8ymS6Rxf+wEO4+RN/7fq2gb0hAzhouIFeN/NuLKrWqND/CnvPZQvKaXgl
	 ApUcZpEGHdJW3IR0TYRlMZdg7BZ4VE/3huzGJeQ1hZpMkY/7SNHjX+loJoQ7I+ezIQ2Zw
	 aaD6REPWZ1VNn1mR/dR4X3wMn6PcP9dEgN7qUiJ8w6ecIuLaQ6uQpe0st/ZRxrPSNpUGV
	 g2Rjb480Cb8yxYPMMQrOZ5rQnkYNzjkk/1ReDalL56yqqF4E0a5nMggKxV7V8ZL9wUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jVQQx3fS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F9F606A320
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 09:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jVQQx3fS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED5611F0089F;
	Sun,  8 Nov 2026 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794131428;
	bh=GuS+i74VaCbk/eFYFvugEDTjcOPPWu9nkqtUta44M00=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jVQQx3fSO/R0QllRMHu95qGXJm8/ScdkoLSfv0wI2W+FicfcjYJ0BS6XhECrJEdaO
	 Rad8cslELskD6XH4r7/B2tk0m/Bir+j/8kc8jKW/+8sJbWVFmN3VtDlA7YYZgZispE
	 C1C8NtYD+3B3dWmcW62rVw98imDtrGr1DYZub9A8y4O4YKIozbdDGIgqVyqamWve8+
	 W/6YSI/LUh4oTh3LY/iAMq7SG6U/TkdLpxjaIv7j3qnmCymKUPjeJf4+JmK5fEL26i
	 5wdH7XGttin29ngefWm61h9+movawbKDZrmEDoJi9sNxZ6rI03ZGXWuJNWpRWtMyvr
	 RQf9qv36c7saQ==
Message-ID: <sashiko-outbox-203672@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] iio: light: ltr501: Switch to read_avail() op
 from manual attribute registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108094253.83899-2-clamor95@gmail.com>
References: <20261108094253.83899-1-clamor95@gmail.com>
 <20261108094253.83899-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 09:50:27 +0000
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
- [High] iio: light: ltr501: stack use-after-return in
  ltr501_read_avail()
--

commit 865563656e5e5188134453546f2c2ea7f31369cb
Author: Svyatoslav Ryhel <clamor95@gmail.com>

iio: light: ltr501: Switch to read_avail() op from manual attribute registr=
ation

This commit replaces manual *_available sysfs attribute registration in
the ltr501 driver with the IIO read_avail() callback and channel
info_mask_*_available masks.

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index 302be2fc314c5..1ddd0dfd55ea2 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c

[ ... ]

> @@ -1111,111 +1124,67 @@ static int ltr501_write_event_config(struct iio_=
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
> -	ssize_t len =3D 0;
> -	int i;
> -
> -	for (i =3D 0; i < info->ps_gain_tbl_size; i++) {
> -		if (info->ps_gain[i].scale =3D=3D LTR501_RESERVED_GAIN)
> -			continue;
> -		len +=3D scnprintf(buf + len, PAGE_SIZE - len, "%d.%06d ",
> -				 info->ps_gain[i].scale,
> -				 info->ps_gain[i].uscale);
> -	}
> =20
> -	buf[len - 1] =3D '\n';
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE:
> +		if (chan->type =3D=3D IIO_INTENSITY) {
> +			int valid_als_gains[ARRAY_SIZE(ltr559_als_gain_tbl) * 2];
> +			int j =3D 0;
> +
> +			for (int i =3D 0; i < info->als_gain_tbl_size; i++) {
> +				if (info->als_gain[i].scale =3D=3D LTR501_RESERVED_GAIN)
> +					continue;
> +
> +				valid_als_gains[j++] =3D info->als_gain[i].scale;
> +				valid_als_gains[j++] =3D info->als_gain[i].uscale;
> +			}
> +
> +			*length =3D j;
> +			*vals =3D (const int *)valid_als_gains;

[Severity: High]
Does assigning valid_als_gains to *vals return a dangling stack pointer?
valid_als_gains has automatic storage duration inside the if block, so
when iio_read_channel_info_avail() calls iio_format_avail_list() after
ltr501_read_avail() returns, reading in_intensity_scale_available
triggers a stack use-after-return and exposes kernel stack contents to
userspace.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108094253.8389=
9-1-clamor95@gmail.com?part=3D1
