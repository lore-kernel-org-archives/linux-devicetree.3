Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B242394464
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 06:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782888760; cv=none; b=lNSg6R7PDfNCn/Z8DXagbnuOqpOOOtl7e1fTFCIfvQuhANKgHOsMgGfnwy6NdKbe3QrW5viXFcvLsColFE4NKno4SHB7ooecO+lBXINhynJchxaM1Jlvdnm0RcBcj8fIB8vSugTM4iFOVyn9qQHL/0RoCRgZbH/pzdmzrq4Zdmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782888760; c=relaxed/simple;
	bh=cdRJHhhaorlopohfnbweSKw/LsxARRMMD75FKnurig8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b9I+2pvPr4RuPNIFq9NaXF7o4wzjmDtnZ4QOsswlkVTEbTtWSLuKhaGWWDOXDv7AhpxQNahGDYJQImmZKdR7jVLttlqbAHAzyg2tlVc3bT82G4wGLVUoXdNOjnfB4sMuiEefxR95yCyD8lZnYje2X9GXGq/IiobADFw3OxeB3hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XamqQPcS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XamqQPcS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DD671F00A3A;
	Wed,  1 Jul 2026 06:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782888758;
	bh=0ALanpgDRgZ4JRoDVrqVK3LvtFDtWFxJe8hdOk33WU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XamqQPcSSeH35t66bBBctofyLWPnC4EzxV8lbPWdsRWu2haUbA+pR5tQ5Ccegzj0B
	 uKPL8Oh8o7tdeCJ+yFpke8iAnyMeXZFSe5DYiuMvsZ65KsU+JgyfWEQZeOBefMhKJc
	 OhCL4YfFj1or5v+eXBlqH1hcWhcqXJhaJar5mBUtPTIvxL0AB9T8oiBcRc41o+KCtm
	 QtFcpLZmmWnLkQiVSGvQOXfAJfkWLI5XIHtGT6gKBoOXyVLmtkvtoYAnu5AQ6bchJ4
	 1JKqagpMqKL8/0j6RDjdn/TKSm1ZsiY9/ADO7gBOY3KyN3RTX/a2a6YDzXV6CaZ/i2
	 LGV+MeNtUHM2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] iio: dac: Add AD5529R DAC driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260701-ad5529r-driver-v5-3-ed087900e642@analog.com>
References: <20260701-ad5529r-driver-v5-0-ed087900e642@analog.com>
 <20260701-ad5529r-driver-v5-3-ed087900e642@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 06:52:38 +0000
Message-Id: <20260701065238.8DD671F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Channels not specified in the device tree are exposed to userspace=
 but their hardware range is not explicitly configured.
--

commit eb86f7024ceca6fa634016d239f7ccfbf35f6a11
Author: Janani Sunil <janani.sunil@analog.com>
Date:   Wed Jul 1 06:40:41 2026 +0000

iio: dac: Add AD5529R DAC driver support

This commit adds support for the Analog Devices AD5529R 16-channel, 12/16-b=
it
Digital to Analog Converter. The device communicates over SPI and supports
per-channel output range configuration.

> diff --git a/drivers/iio/dac/ad5529r.c b/drivers/iio/dac/ad5529r.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/iio/dac/ad5529r.c
[ ... ]
> +static int ad5529r_parse_channel_ranges(struct device *dev,
> +					struct ad5529r_state *st)
> +{
> +	s32 vals[2];
> +	int ret, range_idx;
> +	u32 ch;
> +
> +	device_for_each_child_node_scoped(dev, child) {
> +		ret =3D fwnode_property_read_u32(child, "reg", &ch);
> +		if (ret)
[ ... ]
> +		st->output_range_idx[ch] =3D range_idx;
> +		ret =3D regmap_write(st->regmap_16bit,
> +				   AD5529R_REG_OUT_RANGE(ch), range_idx);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to configure range for ch %u\n",
> +					     ch);
> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static int ad5529r_probe(struct spi_device *spi)
> +{
[ ... ]
> +	ret =3D ad5529r_parse_channel_ranges(dev, st);
> +	if (ret)
> +		return ret;
> +
> +	indio_dev->name =3D st->model_data->model_name;
> +	indio_dev->info =3D &ad5529r_info;
> +	indio_dev->modes =3D INDIO_DIRECT_MODE;
> +	indio_dev->channels =3D st->model_data->channels;
> +	indio_dev->num_channels =3D st->model_data->num_channels;

[Severity: High]
If a channel is omitted from the device tree during
ad5529r_parse_channel_ranges(), will it remain uninitialized in hardware
while still being unconditionally exposed to userspace here?

Since ad5529r_parse_channel_ranges() only configures the output range
registers for channels explicitly defined in the device tree child nodes,
unlisted channels will retain whatever state the hardware bootloader or res=
et
left them in.

The software state for these unlisted channels in st->output_range_idx
defaults to 0 (AD5529R_RANGE_0V_5V). Could this discrepancy cause unexpected
high-voltage outputs if userspace writes to these unconfigured hardware
channels?

> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701-ad5529r-dr=
iver-v5-0-ed087900e642@analog.com?part=3D3
