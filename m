Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F83325B0BE
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 23:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628645; cv=none; b=rgcp5jxbU6juBa2h0dpO7ynBzC9f6HgkTRDwA15Su2lgvTD6QMNHg1xaMQFpmC1zkzwzBSx1u+PVosxOqulUQkQIX7+Iu3L1re5ANiF5GtpKix3vErE5cfdTB4rYJke9j+6l/TT9TFTkVrT+gAuML5c1eIpZT77Z8AOX/w5Wa/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628645; c=relaxed/simple;
	bh=V4pNiiLLaFTxy8DuJntqaQJCwNSZXDqQP/EamFmWXws=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i3Zwd20iiBPGOnyo9KiuGxwokeDdjTIvV9a5HlNe25tOqBz3hEvbrFJU6aIHa9evWWrEQ7CgDuiyLkW88wNBqzuw0zcfXttwBLYo/pR3LbnKReSqoPFUjT+uiO9e0MoVHYGhpcHG3iIrEvkgPbCNcbhmoIOv5KwnqH6rTRY1r5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oeIE1ZCG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oeIE1ZCG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A41DC2BCB0;
	Tue, 12 May 2026 23:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778628644;
	bh=V4pNiiLLaFTxy8DuJntqaQJCwNSZXDqQP/EamFmWXws=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=oeIE1ZCGtQHGvtMYJgEzOjQdp63/qzUFSvtsAmOHS22OVQMvxb0jiMknvzZBBv1N9
	 reL1qLEPEM2o18jpx5VkEhsMUXVR0z2w4lRfsPWWt0lX5S0yu7v2IS/tIq0eHVCG/N
	 WQGz0hVd43mi0IS7NluzUW/med3yBFkqjWPazg+bR8F0Hpa9U+vjiErziE1CWU3U12
	 0+dA82Rt3TRiLHetIsObaCNssgSA6CP5VZXKPl5skEFzvhySHWBysxkNBlDHExZZpZ
	 fpcArS9xlHOXyYeJS9WaGA3J+vWDlTdw+RrOsr7dt0uXEjrKbxsfE4v8qS8uYTgHn9
	 NyB3dEkOVhlUw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 v8 06/11] iio: adc: hx711: introduce hx711_chip_info
 structure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Piyush Patle" <piyushpatle228@gmail.com>
Cc: devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511174342.123820-7-piyushpatle228@gmail.com>
References: <20260511174342.123820-7-piyushpatle228@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 23:30:44 +0000
Message-Id: <20260512233044.8A41DC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The probe function unconditionally fails if `device_get_match_data=
()` returns NULL, breaking legacy non-DT platform instantiations.
- [Low] The `__counted_by_ptr` macro is undefined in the Linux kernel heade=
rs, causing a build failure.
--

commit c0e541cc80817071cecb490c0510348025ebed7a
Author: Piyush Patle <piyushpatle228@gmail.com>

iio: adc: hx711: introduce hx711_chip_info structure

This commit adds a per-variant static configuration structure and populates
the IIO device fields from it at probe time to prepare for more hardware
variants.

> diff --git a/drivers/iio/adc/hx711.c b/drivers/iio/adc/hx711.c
> index 823fd74f9cf95..062d6860da7d6 100644
> --- a/drivers/iio/adc/hx711.c
> +++ b/drivers/iio/adc/hx711.c

[ ... ]

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

Will this cause a build failure?

It looks like __counted_by_ptr is undefined in the kernel headers. The
compiler might treat this as an undeclared identifier.

[ ... ]

> @@ -473,6 +498,12 @@ static int hx711_probe(struct platform_device *pdev)
> =20
>  	mutex_init(&hx711_data->lock);
> =20
> +	chip_info =3D device_get_match_data(dev);
> +	if (!chip_info)
> +		return dev_err_probe(dev, -ENODEV, "missing driver data\n");

Does this introduce a regression for legacy platform instantiations?

For platform devices instantiated by name without a firmware node,
device_get_match_data() returns NULL. Prior to this patch, these devices
probed successfully using hardcoded defaults.

Since this driver does not provide a platform_device_id table, is it
possible we need a fallback to a default configuration, such as &hx711_chip,
to avoid breaking backwards compatibility for non-DT users?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511174342.1238=
20-1-piyushpatle228@gmail.com?part=3D6
