Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADE43C3438
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 16:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083603; cv=none; b=N/w2/+YwjHnKhOZiqwmCetih7uy65V6JtrNlZZ2lOneD2+UrIo8AqIBplecyshldPIafuaYpJWk5/U4l1ENdri+5ONuWoF8if1TuuCsxBXNIBJU2mExnyaT0tTBTOxCZINxqM2NADHC64oe1EHzIk+L/TTBoNFWz8v/kptNTFnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083603; c=relaxed/simple;
	bh=HBSP3fUmWmrSE5yfO+IkM8xshlG1Wd0hNWXbX8vc2eY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qTSnUwMiqxSVlYFBvU2MHPHNuOpT5Te2uRzlOqINAnbWS+5mZczAn1IseX+Cz9r0xlrk0+bQRzwJNqhbiXOKNoan7zr+JpHqBCM+WhfhPNBVI5HN1EV1zTHWanqu+tlYS5K/lYhVuEUqe37BXIGW27sr9h0nvcx7S5BCjMKGeOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O/zqXeFL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O/zqXeFL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19CC71F000C4;
	Thu, 15 Oct 2026 16:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792083589;
	bh=w7qaruVYhcvxTbOdG+pc247No0a36lH4Z64OkK0a9KY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O/zqXeFLfj/rQtk8RHwquY2pW5rmZKDGJeP8i8TylsONTIW1ea6Tc4W+/gFr6SqWc
	 R7HtBShW5AaapeV0ggHHv7p9u1UqHdUVjNqvyg2AVe4TSm2lv6KnC3cBDaIVz6Ilm1
	 slYlVj3BylrQWX53kfKN7FUBkmj7eG4rhxWhD+pF76cwvdg5+ZwS4MrXo4bVjhItgj
	 1E9jNZABS1mewkgz8XJ7BgelL74eCEZThDUk3t3rIf0mQUIMgXtjjbhm1QVXuBZRsn
	 CRYENooqLqtwzMWVAy1oL8Mfv3e/HHNuNv2Yxg8RLUd1ja/ZTngdrNpF8kqlgwLclN
	 gy+H4SMzMUZFA==
Message-ID: <sashiko-outbox-173220@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/10] iio: frequency: ad9910: add axi backend driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-ad9910-backend-support-v1-6-3c21648c8e26@analog.com>
References: <20261015-ad9910-backend-support-v1-0-3c21648c8e26@analog.com>
 <20261015-ad9910-backend-support-v1-6-3c21648c8e26@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 16:59:48 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] iio: ad9910: incorrect destination mapping swaps amplitude and fre=
quency
- [High] iio: frequency: ad9910-axi: zero-divisor panic if MMIO read return=
s ~0
- [Medium] iio: ad9910-axi: profile channels return -EINVAL on disable
--

commit 07c9b224d9d92ea624369fff596857cafd508264
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date:   Thu Oct 15 16:49:46 2026 +0000

iio: frequency: ad9910: add axi backend driver

Add the driver for the AD9910 AXI backend IP core, which interfaces with
the data and control pins of the AD9910 DDS. It registers as an IIO
backend that provides buffer output, parallel data destination configuratio=
n,
and PWM integration for ramp direction control.

> diff --git a/drivers/iio/frequency/ad9910-axi-backend.c b/drivers/iio/fre=
quency/ad9910-axi-backend.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/frequency/ad9910-axi-backend.c

[ ... ]

> +static int ad9910_axi_chan_enable(struct iio_backend *back, unsigned int=
 chan)
> +{
> +	struct ad9910_axi_state *st =3D iio_backend_get_priv(back);
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	switch (chan) {
> +	/*
> +	 * Profiles are mutually exclusive, as the PROFILE[2:0] pins always
> +	 * select one of them. Enabling a profile channel selects it, which
> +	 * implicitly disables the previously selected one, hence there is
> +	 * nothing to do when disabling a profile channel.
> +	 */
> +	case AD9910_CHAN_IDX_PROFILE_0 ... AD9910_CHAN_IDX_PROFILE_7:
> +		chan -=3D AD9910_CHAN_IDX_PROFILE_0;
> +		return regmap_update_bits(st->regmap, AD9910_AXI_REG_PROFILE,
> +					  AD9910_AXI_REG_PROFILE_MSK,
> +					  FIELD_PREP(AD9910_AXI_REG_PROFILE_MSK, chan));
> +	case AD9910_CHAN_IDX_PARALLEL_AMP ... AD9910_CHAN_IDX_PARALLEL_POLAR_PH=
ASE:
> +		chan =3D min(chan - AD9910_CHAN_IDX_PARALLEL_AMP, AD9910_DEST_POLAR);

[Severity: High]
Does this subtraction incorrectly map IIO channel indices to hardware
destination codes?

Looking at enum ad9910_channel_idx, AD9910_CHAN_IDX_PARALLEL_AMP is ordered
before AD9910_CHAN_IDX_PARALLEL_FREQ. In this subtraction, Amplitude evalua=
tes
to 0 and Frequency evaluates to 2.

However, the hardware destination codes defined in ad9910.h map
AD9910_DEST_FREQUENCY to 0 and AD9910_DEST_AMPLITUDE to 2.

Will writing this mapped value to AD9910_AXI_REG_F_CFG cause the IIO
parallel amplitude channel to inadvertently configure the hardware for a
frequency destination, and vice versa?

> +		ret =3D regmap_update_bits(st->regmap, AD9910_AXI_REG_F_CFG,
> +					 AD9910_AXI_REG_F_CFG_MSK, chan);
> +		if (ret)
> +			return ret;
> +
> +		return regmap_set_bits(st->regmap, AD9910_AXI_REG_UPDATE_CTRL,
> +				       AD9910_AXI_REG_UPDATE_PAR_IF_EN_MSK);
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int ad9910_axi_chan_disable(struct iio_backend *back, unsigned in=
t chan)
> +{
> +	struct ad9910_axi_state *st =3D iio_backend_get_priv(back);
> +
> +	switch (chan) {
> +	case AD9910_CHAN_IDX_PARALLEL_AMP ... AD9910_CHAN_IDX_PARALLEL_POLAR_PH=
ASE:
> +		return regmap_clear_bits(st->regmap, AD9910_AXI_REG_UPDATE_CTRL,
> +					 AD9910_AXI_REG_UPDATE_PAR_IF_EN_MSK);
> +	default:
> +		return -EINVAL;

[Severity: Medium]
Will profile channels fall into this default case and return an error inste=
ad
of succeeding cleanly?

The ad9910_axi_chan_enable() function supports enabling profile channels
(AD9910_CHAN_IDX_PROFILE_0 to 7) and successfully returns 0. However, this
disable function lacks a corresponding case for them.

When the IIO core attempts to disable a previously enabled profile channel,
will this unconditionally return -EINVAL and potentially leave the device
state inconsistent or emit unwanted kernel log warnings during teardown?

> +	}
> +}

[ ... ]

> +static int ad9910_axi_read_raw(struct iio_backend *back,
> +			       struct iio_chan_spec const *chan, int *val,
> +			       int *val2, long mask)
> +{
> +	struct ad9910_axi_state *st =3D iio_backend_get_priv(back);
> +	u32 div;
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		switch (chan->address) {
> +		case AD9910_CHAN_IDX_PARALLEL_AMP ... AD9910_CHAN_IDX_PARALLEL_POLAR_P=
HASE: {
> +			guard(mutex)(&st->lock);
> +
> +			ret =3D regmap_read(st->regmap, AD9910_AXI_REG_PAR_RATE,
> +					  &div);
> +			if (ret)
> +				return ret;
> +
> +			iio_val_s64_decompose(div_s64(st->pd_clk_freq_uhz, div + 1),
> +					      val, val2);

[Severity: High]
Could this lead to a division-by-zero panic if the MMIO read returns ~0?

If the AXI IP core or bus becomes unresponsive or disconnected, the MMIO re=
ad
via regmap_read() may silently return 0xFFFFFFFF (~0) without an error code.

Since div is a u32, div + 1 would overflow to 0. This 0 is then passed
directly to div_s64() as the divisor.

Because ad9910_axi_read_raw can be triggered from userspace by reading sysfs
attributes, could a local attacker or unprivileged user reliably trigger a
kernel panic if the hardware enters an error state?

> +			return IIO_VAL_DECIMAL64_MICRO;
> +		}
> +		default:
> +			return -EINVAL;
> +		}
> +	default:
> +		return -EINVAL;
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-ad9910-bac=
kend-support-v1-0-3c21648c8e26@analog.com?part=3D6
