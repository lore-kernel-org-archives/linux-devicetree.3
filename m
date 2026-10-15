Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB34C54EECA
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 17:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083918; cv=none; b=uWCEUb8UvOwtmmDvqzFnICjHF+zz1LPWSvauDFA8FP1jbLEXB4cUaJJlKKwXj7UIrWK9Ci8mDQ4WlQNpWgRWRQIiSra66VhJyM23rvMRDp8rXrWg0hCn+vyX8MEn5GaA1qFNUAOUOh63CL2Sszf7ycnpARz/psYX7657EtXy1j4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083918; c=relaxed/simple;
	bh=mtCp2yeM8Td9NMDTPuMX3/UGNlAtezqmA33oVqb2xvY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=EZ3S0QS6WSh2x5CDrhle2iqATMbOHUOQp00Up47BeEXAtH4qp+kxpu44kGyct6FApI2Cdmu+yUshJ5VrhCdXqx41LDBe9QflGrzDYRUDW4O2gUyJD0eZ/lWcwyWa50S2JNJ9tTol/gXEdpaBmxTf/mM1VRfKMAO+dzKAGckUHao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5nDCqXe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5nDCqXe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3F611F000C4;
	Thu, 15 Oct 2026 17:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792083897;
	bh=9NcpZuae7iX9BgjyaUc/Hp91Fl5IRRu9ELhD04T8PgI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G5nDCqXehrxeJmd5GTV8I53qobg3mcEWWMr96/To2OCLczflHNugDJZim2lXV6ks6
	 AfCt6Gvf+Ge+khalYIQAe5rvrtJ9+HBTTsfhiL6o31FPB3FbT3LXrLyrb2UqiUAMen
	 i/p2Ik0qXVQjABuIECyRk9gDQtq+JZyW6FrPdobZkmLif+fDuBWK3c7dce0MvhxEs0
	 aDhG8PxqIuvrmNFj3CTexVbJ5CuCSWLJO7cTBT9Evg+sv/Fqydet/WIEgWoGFBWJ9+
	 DIK0aUtEPUwlE1IFiLXKNb4Opu/CzLRkEX7r8nUenkrz8SpBX3jqupqB32k0nFRV/r
	 g+zER2yHypxAA==
Message-ID: <sashiko-outbox-173230@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/10] iio: frequency: ad9910: support iio backend
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-ad9910-backend-support-v1-8-3c21648c8e26@analog.com>
References: <20261015-ad9910-backend-support-v1-0-3c21648c8e26@analog.com>
 <20261015-ad9910-backend-support-v1-8-3c21648c8e26@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 17:04:56 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] iio: ad9910: missing error rollback causing state desync and resou=
rce leaks
- [Medium] iio: frequency: ad9910: backend channel leak on preenable error
- [Medium] iio: frequency: ad9910: missing backend cleanup on postdisable e=
rror
--

commit 7c7244ed8ac1bd865ad6a2d0af50cec74add275e
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
Subject: iio: frequency: ad9910: support iio backend

This commit adds support for an optional IIO backend to the AD9910 parallel
data port. It handles backend data rate control and synchronizes hardware
states with buffer callbacks.

> diff --git a/drivers/iio/frequency/ad9910.c b/drivers/iio/frequency/ad991=
0.c
> index 3d517879dee39..39d65dafd5a18 100644
> --- a/drivers/iio/frequency/ad9910.c
> +++ b/drivers/iio/frequency/ad9910.c
[ ... ]
> @@ -568,6 +580,11 @@ static int ad9910_set_sysclk_freq(struct ad9910_stat=
e *st, u32 freq_hz,
> =20
>  	st->data.sysclk_freq_hz =3D sysclk_freq_hz;
> =20
> +	if (st->back)
> +		return iio_backend_set_sampling_freq(st->back,
> +						     AD9910_CHAN_IDX_PHY,
> +						     sysclk_freq_hz);
> +
>  	return 0;
>  }

[Severity: High]
If iio_backend_set_sampling_freq() fails, are the software cache and SPI
hardware states left desynchronized from the IIO backend?

It appears that st->data.sysclk_freq_hz and potentially the SPI hardware
(via earlier updates in this function) are modified before the backend call.
If the backend rejects the configuration, this returns an error without
rolling back those earlier updates, leaving the driver state inconsistent.

[ ... ]
> @@ -2278,6 +2400,72 @@ static inline void ad9910_debugfs_init(struct ad99=
10_state *st,
[ ... ]
> +static int ad9910_buffer_preenable(struct iio_dev *indio_dev)
> +{
> +	struct ad9910_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	st->scan_mask =3D *indio_dev->active_scan_mask;
> +	ret =3D iio_backend_chan_enable(st->back,
> +				      ad9910_buffer_chan_idx(indio_dev));
> +	if (ret)
> +		return ret;
> +
> +	return ad9910_reg32_update(st, AD9910_REG_CFR2,
> +				   AD9910_CFR2_PARALLEL_DATA_PORT_EN_MSK,
> +				   AD9910_CFR2_PARALLEL_DATA_PORT_EN_MSK,
> +				   true);
> +}

[Severity: High]
Does returning early here leak the backend channel if ad9910_reg32_update()
fails?

The function successfully enables the backend channel via
iio_backend_chan_enable(), but if the subsequent SPI write fails, it returns
the error code directly. Because the IIO core handles preenable() failures
by aborting the buffer enablement process without invoking postdisable(),
the backend channel seems to remain permanently enabled.

Should there be an error path here that calls iio_backend_chan_disable()
when the register update fails?

> +
> +static int ad9910_buffer_postdisable(struct iio_dev *indio_dev)
> +{
> +	struct ad9910_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	st->scan_mask =3D 0;
> +	ret =3D ad9910_reg32_update(st, AD9910_REG_CFR2,
> +				  AD9910_CFR2_PARALLEL_DATA_PORT_EN_MSK,
> +				  0, true);
> +	if (ret)
> +		return ret;
> +
> +	return iio_backend_chan_disable(st->back,
> +					ad9910_buffer_chan_idx(indio_dev));
> +}

[Severity: Medium]
Could this early return skip the required backend cleanup?

If ad9910_reg32_update() fails during this teardown path, it immediately
returns the error code, completely skipping iio_backend_chan_disable().
This could leak the backend channel and leave the backend state desynchroni=
zed
from the IIO buffer state.

Would it be better to always attempt iio_backend_chan_disable() on a
best-effort basis, even if the hardware write fails?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-ad9910-bac=
kend-support-v1-0-3c21648c8e26@analog.com?part=3D8
