Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F742357CE1
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789558200; cv=none; b=q2D47n+/1jFJhnWCw0aaga7zHwS97VxWYg9+auc2MKR6VGzWFC9p0Qw7WsmOwNIOY1ndyvW6IL8a/aPkU/JsW+266nsMW6+8H76qA2guvg3DAokVOWi4ictijyXqju0bsIBU70l28jvreB1zG/Rm9TmDsGfMaLJXCKdm9xdv73Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789558200; c=relaxed/simple;
	bh=MS24WgFO4HSBWUBb8aXNGo3SwzaPat3+DeN9dYoWRMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KrcXtIJ1GtzxHm2D6QVwI4u9ey6qvRV57t9L+Ogk3Njv6ZSYWdrJiumz/VBTFkSXGsVzfoA4R4A+4HDVula5CARnLTuBVWryLp5TorTMUJW/MOhzSTyDZj6Ejic0Wj+tFi+Jyzt2CPDqZpF4gPQ49oLnUNZKeySbCXYv1Grk2oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M++z37wU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M++z37wU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DB5B1F000FF;
	Wed, 16 Sep 2026 11:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789558194;
	bh=5b0dJjx5GDqEXRtsQzeDy91fgpHb962lEz6Q4zg32Ts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M++z37wUeHJ6hESTJUpkFkEzP6Xi8+RzqEEL74fdlbu0M4vJKRy5lLLdl55SzYSan
	 hvKzYLEkXApt91/1kvoxnkKVaektuxFz7tJKrhhaHc6tEHd04Ugy497HfkxqEXYNIy
	 uCABPJVWlyJQ0qg7VqHi2qlEZ49FdOJ02CCS31wNZ3fRPcrV9UxjKA7ZORW6QW7ALa
	 PoxlI0jKEfFUU/LAKzabvFKqNlLZrTXqdBmYDB53GgR/5WlrvSg/SuAi6oY7pgmmOm
	 PuH6z4dbK2g9dcHlPW6P8k8ELEpcJe4Wno/tDkvcTiiPSq8KfmKmcPArwHcxd8MVzb
	 x3B8IPkDCwtkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 05/17] iio: adc: Add AD7768 and AD7768-4 core support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260916-ad7768-driver-v8-5-27aa24db5225@analog.com>
References: <20260916-ad7768-driver-v8-0-27aa24db5225@analog.com>
 <20260916-ad7768-driver-v8-5-27aa24db5225@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 11:29:53 +0000
Message-Id: <20260916112954.1DB5B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] pm: missing pm_runtime_mark_last_busy() defeats autosuspend delay
- [Medium] spi: DMA API violation by reusing buffer across spi_transfer in =
same message
- [Medium] iio: adc: ad7768: CH_STANDBY uses logical instead of physical ch=
annel mask
--

commit 7e51bcc24a25f10a36ea6f88decaae9ab960a856
Author: Janani Sunil <janani.sunil@analog.com>

    iio: adc: Add AD7768 and AD7768-4 core support
   =20
    Add core support for the AD7768 and AD7768-4 simultaneous sampling ADCs.
    Configure supplies, clock and reset, use a custom regmap bus for the SPI
    protocol, and parse the enabled channels and input buffer settings from
    devicetree.

> diff --git a/drivers/iio/adc/ad7768.c b/drivers/iio/adc/ad7768.c
> new file mode 100644
> index 0000000000000..2c5d0657edf95
> --- /dev/null
> +++ b/drivers/iio/adc/ad7768.c
[ ... ]
> +static u8 ad7768_all_standby_mask(const struct ad7768_state *st)
> +{
> +	return GENMASK(st->chip_info->num_channels - 1, 0);
> +}

[Severity: Medium]
Does this correctly handle the physical channels for the AD7768-4?

The AD7768-4 uses physical channels 0, 1, 4, and 5 (as defined in
ad7768_4_chan_map). Generating a logical mask of GENMASK(3, 0) yields
0x0F, which would write 0 to bits 4 and 5 in the CH_STANDBY register.=20
Since 0 means active, won't this force physical channels 4 and 5 to remain=
=20
permanently active and cause a continuous power leak?

[ ... ]
> +static int ad7768_regmap_read(void *context, const void *reg_buf,
> +			      size_t reg_size, void *val_buf, size_t val_size)
> +{
> +	struct ad7768_state *st =3D spi_get_drvdata(context);
> +	struct spi_device *spi =3D context;
> +	struct spi_transfer t[] =3D {
> +		{
> +			.tx_buf =3D &st->d16,
> +			.len =3D sizeof(st->d16),
> +			.cs_change =3D 1,
> +		}, {
> +			/*
> +			 * Register responses are delayed by one CS frame. While
> +			 * receiving the response to this read, the device also
> +			 * decodes another command on SDI. Repeat the read
> +			 * command to avoid sending an unspecified dummy
> +			 * command.
> +			 */
> +			.tx_buf =3D &st->d16,
> +			.rx_buf =3D &st->d16,
> +			.len =3D sizeof(st->d16),
> +		},
> +	};

[Severity: Medium]
Can reusing the same virtual address (&st->d16) across multiple spi_transfer
structures in the same message lead to DMA mapping conflicts?

When spi_sync_transfer() processes this message, it maps the buffers for ea=
ch
transfer. Won't this cause &st->d16 to be mapped as DMA_TO_DEVICE for the
first transfer, and then immediately mapped as DMA_BIDIRECTIONAL for the=20
second transfer without an unmap in between, potentially violating the
DMA API and causing cache coherence issues?

[ ... ]
> +static int ad7768_buffer_postdisable(struct iio_dev *indio_dev)
> +{
> +	struct ad7768_state *st =3D iio_priv(indio_dev);
> +
> +	pm_runtime_put_autosuspend(regmap_get_device(st->regmap));
> +
> +	return 0;
> +}

[Severity: Medium]
Will this suspend the device synchronously and immediately rather than
honoring the autosuspend delay?

Since pm_runtime_mark_last_busy() is not called before
pm_runtime_put_autosuspend(), the last_busy timestamp will not be refreshed.
If the device was active for longer than the 2000ms autosuspend delay, won't
this result in unnecessary power cycling? This pattern also appears to be
missing in other disable paths.

[ ... ]
> +static int ad7768_parse_config(struct iio_dev *indio_dev,
> +			       struct device *dev)
> +{
[ ... ]
> +		if (channel >=3D st->chip_info->num_channels)
> +			return dev_err_probe(dev, -ECHRNG,
> +					     "Invalid channel %u in firmware\n",
> +					     channel);
> +
> +		ret =3D regmap_clear_bits(st->regmap, AD7768_REG_CH_STANDBY,
> +					BIT(channel));

[Severity: Medium]
Is it intentional to use the logical channel index here instead of the
mapped physical channel?

If this is the AD7768-4, the parsed channel index might be 2 or 3, but the
hardware channels that should be taken out of standby are 4 and 5. Should
this use ad7768_channel_mask(st, channel) to derive the correct physical
bits instead of BIT(channel)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916-ad7768-dri=
ver-v8-0-27aa24db5225@analog.com?part=3D5
