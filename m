Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD3311CBA
	for <devicetree@vger.kernel.org>; Mon,  3 Aug 2026 17:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785779082; cv=none; b=r7y5OMuqKnqdsatfwEZ1CEjujPcZ2S09yHUzOQ78VL1VPU4leF483CI6aM2/hfZEoctgr/5lzI15WUTxRFTLOjGTbvwtautMFO0ANzjgXdIK52OP37YtReHCMlaT5NQN9YJWOqPwBQGD+W4z2rhIFAhzL0kWlmOumM+rSHtGwv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785779082; c=relaxed/simple;
	bh=dSE2p6pZtl3Eecy5hdjRNjPJisO9eHmq+e4tMSl01pY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IN3mxyJ92syw2DdE9khVn/+T6UlccYcPk2Yj54qEb8IUDv2NX7kZZxSy7DI4D9MQnxl7hAvaxYVAE5BViLftADOU5qXVfbS7L0m9UyHyQZ01pTdrBz2LhYaaDtqTytKlq67Wh6HFE/u2B6b6DorZn8TugNFT8vZtPg6vy1GNrmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uzin+D0K; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uzin+D0K"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 294171F000E9;
	Mon,  3 Aug 2026 17:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785779081;
	bh=Xl8zwObqQknpSaeR99I80qnr5YAA0oqRT9U0qhseZMA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uzin+D0KqTkykZjRQmv5t8Yw4wK+fjHlTeShVIUI+ll3jNDuPLO5qJJK+OV50ynW3
	 TjMf0wy0Lr8B6x1ul4+U49TGRVtoy/xkl1GDYHroJY1pG0qKzw8nzfr7lrYH3AE70W
	 FFAVPflOMkT1yQoc4d94i75IALDNR9aqrb0pj1BOISSziKJ2EUALC2/itiGs0Hmj2X
	 esQXmVikmM6mxkhnhxcDtZLvcAw/TeW27k6VzRMnY72QdDQ+NCe5mLtwj8rNNM2gFk
	 +5y6dEQcqFOHGV1T2w3u0wCF0i8z0Q9h1Pu/g24FeowcOyEgM2KzHFPcnPWoIaAfSG
	 2fVXXUx6al4yA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] iio: dac: mcp47a1: add support for new device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <joshua.crofts1@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260803-mcp47a1-add-support-v3-2-540e71b4fd2e@gmail.com>
References: <20260803-mcp47a1-add-support-v3-0-540e71b4fd2e@gmail.com>
 <20260803-mcp47a1-add-support-v3-2-540e71b4fd2e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 17:44:40 +0000
Message-Id: <20260803174441.294171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect SMBus commands send extra bytes and corrupt the DAC ha=
rdware state.
--

--- Patch [2]: [PATCH v3 2/2] iio: dac: mcp47a1: add support for new device=
 ---
commit f73263d5ea24798a693c0c4cfa738627794988ba
Author: Joshua Crofts <joshua.crofts1@gmail.com>

iio: dac: mcp47a1: add support for new device

This commit introduces a new driver for the Microchip MCP47A1 6-bit volatile
DAC. It supports writing and reading the raw values and exposing the scale
using I2C.

> diff --git a/drivers/iio/dac/mcp47a1.c b/drivers/iio/dac/mcp47a1.c
> new file mode 100644
> index 0000000000000..0bf994aa0e4f5
> --- /dev/null
> +++ b/drivers/iio/dac/mcp47a1.c

[ ... ]

> +static int mcp47a1_write(struct iio_dev *indio_dev,
> +			 struct iio_chan_spec const *chan,
> +			 int val, int val2, long mask)
> +{
> +	struct mcp47a1_data *data =3D iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		if (!in_range(val, 0, MCP47A1_MAX_STEPS))
> +			return -EINVAL;
> +
> +		return i2c_smbus_write_byte_data(data->client, MCP47A1_CMD_CODE,
> +						 val);

[Severity: Medium]
Could this corrupt the DAC hardware state by sending an extra byte?

If the MCP47A1 expects a single byte without a command code, using
i2c_smbus_write_byte_data() will send a 2-byte payload, writing 0x00 to the
DAC before the actual value. This could potentially cause an output glitch.

> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int mcp47a1_read(struct iio_dev *indio_dev,
> +			struct iio_chan_spec const *chan,
> +			int *val, int *val2, long mask)
> +{
> +	struct mcp47a1_data *data =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		ret =3D i2c_smbus_read_byte_data(data->client, MCP47A1_CMD_CODE);

[Severity: Medium]
Does this destructively reset the DAC on every read?

If the device does not expect a command code and interprets it as a data by=
te,
calling i2c_smbus_read_byte_data() will perform a write of 0x00 before read=
ing,
destructively resetting the DAC output to 0.

> +		if (ret < 0)
> +			return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-mcp47a1-ad=
d-support-v3-0-540e71b4fd2e@gmail.com?part=3D2
