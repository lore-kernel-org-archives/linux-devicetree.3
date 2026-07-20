Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460ED3C9437
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 20:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784579831; cv=none; b=j8T1GSkoSrrMak2h3yza1JKGiUXXjUdzay5vaNyLfktt066qea5Red3bti2SmDzVQx48HTAgLMGD9yhEM9X0GHbTSh8aLNgK6oT/ctymvQIlXWJ4GXJuNx24VyryZqQgZB/OF3I96UEYNFmPFVipG5pxWPLLcNsdPmWr2+M7FKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784579831; c=relaxed/simple;
	bh=9j2gTi+Z02cFmywuL68D/TcEHo5kAlcxrbRO/+DMNl0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NglVIliqZlxGHSgiJq70C4qUCmgC8qdhdEkzBK8876LFiKeiKboK+YbG+GrrYtEdsZIIxVQJrHFIrsj7qC5IEzW208htMh/cF7IV/H6kYiZJr1BSJYd0qUgXY3IRqSvoTh3ZlmYljzHIxze5r+Lgr8y46xqbDFCjppvoyV+JNWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ohtdqdok; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ohtdqdok"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92571F000E9;
	Mon, 20 Jul 2026 20:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784579830;
	bh=ZSUSCiaZnyZ7JN6sQHg1YOmetHZJDoJriEz/o8+aTwU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ohtdqdokiu7cVlWJL4bv3ObdeSO/I1JgnL6aVytFiEoIb2dlBmwj8iQ1OZQCTDm4X
	 5n9HT1jGUw75nZTC68aR3jyDwRR03G66q7B7yQ2w8cyhZESL/mb1YnNQJGAlmOtrI1
	 CkvxR4qaeJ6NGBJaxqgW+EWkK3dNDm5VJ2awJ6L4J7Uoeqhn/CYZAei1x09m3JZFRL
	 kssd7YuzNaMU8pxJ1VuHYBeiSye/eOl9QtJQc/Mljee3BmR3nGMx3TAmpuqWJbOBRU
	 NB8KN4Pcz0A40vf5zf0PDuR0KgXGk9FZoMobaW1vG7lUX8ZY6Gt1VfyjCu+a2tDLOV
	 IrQVfvsh880FQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V18 7/9] iio: imu: inv_icm42607: Add Gyroscope to
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720202343.70138-8-macroalpha82@gmail.com>
References: <20260720202343.70138-1-macroalpha82@gmail.com>
 <20260720202343.70138-8-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 20:37:09 +0000
Message-Id: <20260720203709.E92571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Hardcoded array index `5` is used instead of the enum `INV_ICM42607=
_ODR_1600HZ`.
--

--- Patch [7]: [PATCH V18 7/9] iio: imu: inv_icm42607: Add Gyroscope to icm=
42607 ---
commit 0113579c2d489acc250c7a465387a225805368b5
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Gyroscope to icm42607

This commit adds gyroscope functions to the icm42607 driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_gyro.c
> new file mode 100644
> index 0000000000000..6af7b143e6a15
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_gyro.c

[ ... ]

> +static int inv_icm42607_gyro_read_avail(struct iio_dev *indio_dev,
> +					struct iio_chan_spec const *chan,
> +					const int **vals,
> +					int *type, int *length, long mask)
> +{
> +	switch (mask) {

[ ... ]

> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		*vals =3D (const int *)inv_icm42607_gyro_odr[5];
> +		*type =3D IIO_VAL_INT_PLUS_MICRO;
> +		*length =3D (ARRAY_SIZE(inv_icm42607_gyro_odr) - 5) * 2;
> +		return IIO_AVAIL_LIST;

[Severity: Low]
Would it be safer to use INV_ICM42607_ODR_1600HZ here instead of the
hardcoded index 5? If the enum ever changes, this hardcoded index will
silently misrepresent the available ODRs to userspace and cause incorrect
pointer and length calculations.

> +	default:
> +		return -EINVAL;
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720202343.7013=
8-1-macroalpha82@gmail.com?part=3D7
