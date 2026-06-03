Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0EA37207A
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 19:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780513265; cv=none; b=hqHEZtW6kff5n9wAXv8XnzEpMjdVvbxH9oV45Fw7ajfbdtjz6WvHCQyL3TGNMqxezvYkcPvUG5ps1/MgsSiFCjUB/gbppg1gzCK4rJeXVG9SqOAXc/G+7DpRnjVZY86DI0MxRAq24HDqzUPw4aCNpSUUG60B9o7j/eflLixTywQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780513265; c=relaxed/simple;
	bh=cHq8Msx/dcbDSgKtL/QoV+NcLgKX8Ww7ToAl39l0/qo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IV/WOJ8Foh/g7r5TvscqNxcSKACphbXfEDYPwrniwgda92eAFnXWFY5uYY88vTDfUaHwgS6srmqL17k6K3XeVoGjkgbTZEhMcCPv6laJBs68msS4aIflMKypEw45/4kCYK6ygWVashCR0blth66gJvn7QIkRf/pRAeda+lAMEEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G6Pf+P4X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G6Pf+P4X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1F71F00893;
	Wed,  3 Jun 2026 19:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780513254;
	bh=/WBdF/EIjcRkjk09GfWIkk6BUAGQssyAJ7s+rfEvbwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G6Pf+P4X9sogQZbGPE6sQPj4WUdaByLjrfIxmuyLG3ECr9Wg2D2G3LGv2Iz9suF0H
	 yw1UXLDY3cTV56QQEq6T3ah/jp2iN6P2+bB7iobPVMKrP643tfL2Wwe1kMKmC4ka4h
	 ooM8OZKm7qRQ5Hi/hubhQoeI/YSrIyYLfTKP3GRJDko9QVIKD6U82ZeQ8uPPL3dq2Y
	 ujXFafBvudB5WJR+M/6uR8nbwwNgd0L4geMCZCYK6TmhqPptv9yHd5JIiFQzUFXvGY
	 B1l01qoN9qkx+bWNBLKfooH2luBX5eYsbVO7+G7FCwnKwn8FrFbG4lMZllRdRZlQ5u
	 SSP7BpWE7OLyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 06/11] iio: adc: hx711: introduce hx711_chip_info
 structure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Piyush Patle" <piyushpatle228@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260603184859.89693-7-piyushpatle228@gmail.com>
References: <20260603184859.89693-7-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 19:00:53 +0000
Message-Id: <20260603190053.CE1F71F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The driver now unconditionally fails to probe if `device_get_match=
_data()` returns NULL, which breaks legacy platform device instantiation.
- [Low] The patch uses an undefined macro `__counted_by_ptr` in the definit=
ion of `struct hx711_chip_info`, causing a syntax error and build failure.
--

commit 9bf695b7a4a3ec692793615e524f77137dfcf73f
Author: Piyush Patle <piyushpatle228@gmail.com>

iio: adc: hx711: introduce hx711_chip_info structure
   =20
Add a per-variant static configuration structure and populate the IIO
device fields from it at probe time. This prepares the driver for
supporting more compatible hardware variants.

> No functional change for existing HX711 users.

[Severity: High]
Is this description accurate? For legacy platform devices instantiated by
name, the newly added match data check prevents the driver from probing.

> diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
> index 823fd74f9cf95..062d6860da7d6 100644
> --- a/drivers/iio/adc/hx711.c
> +++ b/drivers/iio/adc/hx711.c
[ ... ]
> @@ -74,6 +76,20 @@ static int hx711_get_scale_to_gain(const int *gain_sca=
le, int scale)
>  	return -EINVAL;
>  }
> =20
> +/**
> + * struct hx711_chip_info - per-variant static configuration
> + * @name: IIO device name
> + * @channels: channel specification array
> + * @num_channels: number of entries in @channels
> + * @iio_info: IIO info ops for this variant
> + */
> +struct hx711_chip_info {
> +	const char			*name;
> +	const struct iio_chan_spec	*channels __counted_by_ptr(num_channels);

[Severity: Low]
Does this compile? The macro __counted_by_ptr is not defined anywhere in
the kernel headers, which causes a syntax error and build failure.

> +	unsigned int			num_channels;
> +	const struct iio_info		*iio_info;
> +};
[ ... ]
> @@ -473,6 +498,12 @@ static int hx711_probe(struct platform_device *pdev)
> =20
>  	mutex_init(&hx711_data->lock);
> =20
> +	chip_info =3D device_get_match_data(dev);
> +	if (!chip_info)
> +		return dev_err_probe(dev, -ENODEV, "missing driver data\n");

[Severity: High]
Will this break legacy platform device instantiation?

For devices instantiated manually via board files matching the driver name
hx711-gpio, device_get_match_data() will return NULL because the driver
does not provide a platform_device_id table.=20

Prior to this patch, the probe function ran successfully for these devices.
Now it aborts with -ENODEV.

> +
> +	hx711_data->chip_info =3D chip_info;
> +
>  	/*

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603184859.8969=
3-1-piyushpatle228@gmail.com?part=3D6
