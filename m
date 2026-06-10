Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEBA3FBA7
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 02:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781057666; cv=none; b=WT0umgL8ji1yfkWHXtBkf7nM3tGZWB0EQPXtt58iI4ParoApf3QUf3ASRXoHAu5VRcuHZDUgO67WjY0/UfPnU4M0Lp+KqlBU1VlC6exywrK2Zk8EKgGJ3dil5R0D4CWEJzr5xOXgtyzkQsXY9CJhEKAXh3XmPrzTD02SsHU9k9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781057666; c=relaxed/simple;
	bh=oEUF13re047Hnc0C7a0zhG/Dw9pyrW9E+7/wCn4fdhA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dgNekDq1UU/Firg+E2HwnWf8ZH9zCStLEe/QMpgyQAZIVOqL4GBPIjBPqEVX/wY0mvsQOEX1C7ZVRfNQ1CdBzhM2fsq17mp/m/UnJ9bAcGv2HRGVfPJ5aRP469qZMqWHQ5WdwS/ItkPlggkQEi3kIHyIjskT/amHOlLtT/tWQqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TeNULo+x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TeNULo+x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A41A1F00893;
	Wed, 10 Jun 2026 02:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781057665;
	bh=e1TQyt/cxynxFiOwDWVMcLV7a/sWHQ3O8A/mq9bYLxw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TeNULo+xg3SRlp7Sv1GsN0ykyElfgkfyPpwPwHYq5chzSosmiJ3sjg7GAYFxSgWyQ
	 0JvP7oBJkwDEhSDaFHtdAVwnhEH4KNLimMixVEYCUx14SU69SZWPeFV1eVsOpgmq7M
	 SqTY5bzNaf1Cw8EgiWDvFx6x9qW4BWQQvJ7zyh/pUqv3HZXls+4gffgf85MVYDyi2a
	 DitZBPmsbXxDwPpEqWko4eO3hb5ieH17PRtaY3FMyI36k67K2soBK0+YjQMNJ9aOuL
	 xHXPXoCvDc7KhtyW1NNQHvlTfanJxLt1aE1WrQr6OaZROiswcQpRYID1oeNvTyodOe
	 ylOAsOr4ULy/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iio: pressure: ms5637: Add variant specific
 temperature compensation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis Adamian" <adamianlouis@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260610020458.104818-3-adamianlouis@gmail.com>
References: <20260610020458.104818-3-adamianlouis@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 02:14:25 +0000
Message-Id: <20260610021425.8A41A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Explicit cast to 64-bit in modulo operation causes build failure on=
 32-bit architectures.
--

commit 5b2cfee8f94f3621de42a9388dafb2dae478fda9
Author: Louis Adamian <adamianlouis@gmail.com>

iio: pressure: ms5637: Add variant specific temperature compensation

This commit adds variant-specific temperature compensation and pressure
scaling for ms5637, ms5803, and ms5837 sensors. It extracts the compensation
constants into a per-device structure to handle differences across the
sensor variants.

> diff --git a/drivers/iio/pressure/ms5637.c b/drivers/iio/pressure/ms5637.c
> index 03945a4fc7188..36bda9694b4c4 100644
> --- a/drivers/iio/pressure/ms5637.c
> +++ b/drivers/iio/pressure/ms5637.c
[ ... ]
> @@ -73,8 +74,10 @@ static int ms5637_read_raw(struct iio_dev *indio_dev,
> =20
>  			return IIO_VAL_INT;
>  		case IIO_PRESSURE:	/* in kPa */
> -			*val =3D pressure / 1000;
> -			*val2 =3D (pressure % 1000) * 1000;
> +			*val =3D pressure / dev_data->comp_consts->press_scale;
> +			*val2 =3D (pressure %
> +				 (s64)dev_data->comp_consts->press_scale) *
> +				(1000000 / dev_data->comp_consts->press_scale);

[Severity: Low]
Does casting this modulo divisor to a 64-bit integer cause a build failure
on 32-bit architectures?

Since pressure is an unsigned int and press_scale is a u32, the s64 cast
promotes the modulo operation to 64-bit. On 32-bit platforms, this typically
results in an undefined reference to __moddi3 because the kernel does not
link libgcc.

Since the modulo result easily fits within a 32-bit integer, can this s64
cast be removed to prevent breaking 32-bit compile targets?

> =20
>  			return IIO_VAL_INT_PLUS_MICRO;
>  		default:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610020458.1048=
18-1-adamianlouis@gmail.com?part=3D2
