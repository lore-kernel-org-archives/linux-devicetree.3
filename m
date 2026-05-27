Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EBC421A17
	for <devicetree@vger.kernel.org>; Wed, 27 May 2026 13:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779889970; cv=none; b=HweqnxX9TbDqXun0z8Tg1vIzPGAufcOxryQkAwOhmTI0BLJ9yA50zCmQJmyydbJ+51py8wW6xio4l0cUzFcaRPKDJ684tabyTb12xBMRi2a60nlYWCFkygMUP8sqATiTA6tjBdw14V0WGWQ7Lh8ackXeoA3vKr4opkJnB8yYjg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779889970; c=relaxed/simple;
	bh=27u0AAbUJG4G7EIF+sio0ST5MkujIWtgzEiMmgEHhGQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Aol3FRyCHg79xOG6khBOMnIEMN3GpWt5Xtt+OYFGlarlLBwGuLR2iYJof4wl9rVTik+I7zzEPBAxWZdxl6OFOoMIlCE5UJJpbrCQNvcVX24G1Mx73uVqjlSpI9mHrVR7qwZU1jWRjJv+rMuNDxz72KvAfwGDsqp+EuJxnT9Ewq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BxT/Qyxi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BxT/Qyxi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A9A1F000E9;
	Wed, 27 May 2026 13:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779889968;
	bh=3QCDoRVEvk8RWCL0d5CUTWj6/kVcP6+4BLvJ588GAvw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BxT/QyxiaqWaIi+xWh1MO9hwfoNdNfF4BRkPCkTincj9OlToAxyuQy7FlEENwEDWP
	 YdrGEJWGB5FAspGfQMa3OHjDZJg33RSYxKXjvFihpuYNRybMvjmAKwFjPCCQN6/+nx
	 bqFBZJ9wAbh0uOei0rOruyod4Ly95FpoWva9YZ1NbmfQFSGMe+dZMtYuPZ0m3ZDbLc
	 f9WnUa9wPXFnaPETkhZGPg+WCcza6JlDA3xadnjodQMh5WdSfkgVDNV1nPXHmFJ5YA
	 SW7M7aAQU97t0bnrCzrBHPHmtsBiISHwNiRVazjzVelRlrsvofGXVIXbnMLZdaOJ6N
	 lq2ANn3PX3XCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] iio: adc: versal-sysmon: add oversampling
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Salih Erim" <salih.erim@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527114211.174288-6-salih.erim@amd.com>
References: <20260527114211.174288-6-salih.erim@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 13:52:48 +0000
Message-Id: <20260527135248.66A9A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Oversampling ratio is incorrectly exposed as a type-wide attribu=
te for all temperature channels, while hardware only supports it for satell=
ite channels.
- [Medium] Software oversampling state is initialized to 1 but not synchron=
ized with the hardware during probe.
- [Medium] Unlocked read of oversampling ratios causes a data race with con=
current writes.
--

commit 747d3ecadc20e43c2e94e634cd186da1e49aea29
Author: Salih Erim <salih.erim@amd.com>

iio: adc: versal-sysmon: add oversampling support

This commit adds support for reading and writing the oversampling ratio
through the IIO oversampling_ratio attribute. It configures averaging
for temperature and supply channels and updates the hardware registers.

> diff --git a/drivers/iio/adc/versal-sysmon-core.c b/drivers/iio/adc/versa=
l-sysmon-core.c
> index 04977c9c8871f..7775a4cfa6deb 100644
> --- a/drivers/iio/adc/versal-sysmon-core.c
> +++ b/drivers/iio/adc/versal-sysmon-core.c

[ ... ]

> @@ -205,6 +211,12 @@ static int sysmon_read_raw(struct iio_dev *indio_dev,
>  	unsigned int regval;
>  	int ret;
> =20
> +	if (mask =3D=3D IIO_CHAN_INFO_OVERSAMPLING_RATIO) {
> +		*val =3D (chan->type =3D=3D IIO_TEMP) ? sysmon->temp_oversampling :
> +						 sysmon->supply_oversampling;
> +		return IIO_VAL_INT;
> +	}
> +

[Severity: Medium]
Is it safe to read sysmon->temp_oversampling and sysmon->supply_oversampling
without holding the mutex here?

Since sysmon_write_raw() modifies these values under sysmon->lock,
could reading them before the guard(mutex) call introduce a data race
regression?

>  	if (mask !=3D IIO_CHAN_INFO_RAW && mask !=3D IIO_CHAN_INFO_PROCESSED)
>  		return -EINVAL;
> =20
>  	guard(mutex)(&sysmon->lock);

[ ... ]

> @@ -849,6 +979,10 @@ static int sysmon_parse_fw(struct iio_dev *indio_dev=
, struct device *dev,
>  			.info_mask_separate =3D
>  				BIT(IIO_CHAN_INFO_RAW) |
>  				BIT(IIO_CHAN_INFO_PROCESSED),
> +			.info_mask_shared_by_type =3D
> +				BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),
> +			.info_mask_shared_by_type_available =3D
> +				BIT(IIO_CHAN_INFO_OVERSAMPLING_RATIO),

[Severity: Medium]
Is it correct to use info_mask_shared_by_type for the satellite temperature
channels?

The hardware writes in sysmon_osr_write() only configure the satellite
channels via SYSMON_TEMP_SAT_CONFIG_MASK, leaving the main core temperature
channel unaffected. Exposing this as a type-wide attribute might incorrectly
imply to userspace that the setting applies to all temperature channels.

Would it be better to use info_mask_separate to avoid a regression in how
userspace configures the main core temperature channel?

>  			.scan_type =3D {
>  				.sign =3D 's',
>  				.realbits =3D 15,

[ ... ]

> @@ -902,6 +1036,8 @@ int sysmon_core_probe(struct device *dev, struct reg=
map *regmap)
> =20
>  	sysmon =3D iio_priv(indio_dev);
>  	sysmon->regmap =3D regmap;
> +	sysmon->temp_oversampling =3D 1;
> +	sysmon->supply_oversampling =3D 1;

[Severity: Medium]
Are the initial oversampling values synchronized with the hardware state?

The software state is initialized to 1 here, but it doesn't appear to write
these defaults to the device or read the initial state from SYSMON_CONFIG.

Could this cause a regression where the driver and hardware state silently
mismatch if a bootloader left the device in a different state?

> =20
>  	ret =3D devm_mutex_init(dev, &sysmon->lock);
>  	if (ret)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527114211.1742=
88-1-salih.erim@amd.com?part=3D5
