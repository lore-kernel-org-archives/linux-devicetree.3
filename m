Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8837277818
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 14:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787063959; cv=none; b=p5FrECSSj3V6nmytJ86eqBrgh+yHloF8UtELlKTDK6X4rTajBc80V97PPLxIhBOm7cqZhycuVFRIidUdxIkT1fxMnfhrn4+OX0Z8CfEtD0YcDPu9YaNSEqvb8sBUugj4v9VIAwpWxChb1w9RZ6jexZTLZzXMaNx5O+ud+dX2WNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787063959; c=relaxed/simple;
	bh=ncKRj7hi7UFH7vTCKsQ1DQRX1q2FXfq3iTNaE9iUy2Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FXTqvDDcKfKtXSDL2AcQRS72TmQmvyIfit8eMypAuMjbzI/nUJW8U55cd1OtfK+9FON7lvcOumj0LjzSPvGEnZfck3N05WMMH/5UT3wm5LC/GaV5WsalhA/hbM1Qdr5yp5T7pUMDIqTVmTQe9AtyQX1ZcWe7zIzL1Z/cULCABgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GekLQFSE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GekLQFSE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FE41F000E9;
	Tue, 18 Aug 2026 14:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787063956;
	bh=UGDuNr9sZWxDtixetFtcS92woZm77HPp0MBJUo66ZYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GekLQFSE3XOeAHpnvlzL9kgMLla5ioIeNgheCo9XGRZ9vdl52SLSzcaRzS1MzJ82e
	 hKIlEgfLPTOSY7yCk+yS8Voy8f3D6rgAj3T+wnDVpOEClzLjzyjMS64py652mtHK6/
	 xuxyitd4EJ3C/+/aoW/mQ1ozjfz4vEsypWRjP9s1V1XgeAHDhM2mzzjpUsth6IgF2U
	 MdKmVMDfc+WXa81zLNIqXL6uDu2b0Uht/beAuR21K2L8vOnPoVkKESkulq9tmXTu2Q
	 BPPEwcSxzEHv+JPmsoK5r2ImF18LO9ZczLOcVPIZ5TMHD0RbpvGMJLIVGgE3je2AoY
	 z5/QyKLRf9MTA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 2/2] iio: adc: add MAX40080 current-sense amplifier
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Popa" <stefan.popa@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260818142928.8244-3-stefan.popa@analog.com>
References: <20260818142928.8244-1-stefan.popa@analog.com>
 <20260818142928.8244-3-stefan.popa@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 14:39:16 +0000
Message-Id: <20260818143916.96FE41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Uninitialized stack memory disclosure due to insufficient length c=
heck on I2C block read
- [Medium] Data race and torn read risk due to missing READ_ONCE()/WRITE_ON=
CE() for concurrent lockless state access
--

--- Patch [2]: [PATCH v7 2/2] iio: adc: add MAX40080 current-sense amplifie=
r driver ---
commit ea9754605e8a1fb9ab674845d433d119d507e471
Author: Stefan Popa <stefan.popa@analog.com>

iio: adc: add MAX40080 current-sense amplifier driver

This commit adds an IIO driver for the MAX40080 bidirectional
current-sense amplifier. It supports single-measurement mode via SMBus
Quick Command and exposes current and voltage channels.

> diff --git a/drivers/iio/adc/max40080.c b/drivers/iio/adc/max40080.c
> new file mode 100644
> index 0000000000000..4b397bcd145b2
> --- /dev/null
> +++ b/drivers/iio/adc/max40080.c

[ ... ]

> +static int max40080_read_iv_once(struct max40080_state *st, u32 *iv)
> +{
> +	u8 buf[4];
> +	int ret;
> +
> +	ret =3D i2c_smbus_read_i2c_block_data(st->client, MAX40080_REG_IV,
> +					    sizeof(buf), buf);
> +	if (ret < 0)
> +		return ret;
> +
> +	*iv =3D get_unaligned_le32(buf);

[Severity: High]
i2c_smbus_read_i2c_block_data() returns the number of bytes read on success.
If a short read occurs (e.g., returning 1 to 3 bytes), ret will be positive
and pass the if (ret < 0) check.=20

Does this allow get_unaligned_le32() to read uninitialized stack memory from
buf, potentially exposing it to userspace or causing the driver's polling
loop to incorrectly evaluate the validity bit?

Should this check be if (ret !=3D sizeof(buf))?

[ ... ]

> +static int max40080_set_range(struct max40080_state *st, unsigned int ra=
nge)
> +{
> +	int ret;
> +
> +	ret =3D max40080_update_bits(st, MAX40080_REG_CFG, MAX40080_CFG_RANGE_M=
SK,
> +				   FIELD_PREP(MAX40080_CFG_RANGE_MSK, range));
> +	if (ret)
> +		return ret;
> +
> +	st->range =3D range;

[Severity: Medium]
This plain write updates the shared state without WRITE_ONCE(), which might
allow compiler reordering that exacerbates the race condition in
max40080_read_raw().

[ ... ]

> +static int max40080_read_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int *val, int *val2, long mask)
> +{
> +	struct max40080_state *st =3D iio_priv(indio_dev);
> +	unsigned int range;
> +	int ret;
> +
> +	switch (mask) {

[ ... ]

> +	case IIO_CHAN_INFO_SCALE:
> +		if (chan->type =3D=3D IIO_CURRENT) {
> +			/*
> +			 * The selectable current-sense range is exposed through
> +			 * scale: each RANGE setting has its own precomputed
> +			 * mA-per-code value. Userspace picks the range by writing
> +			 * the matching scale.
> +			 *
> +			 * Take a local copy of range to ensure val and val2 come
> +			 * from the same setting even if a concurrent write changes
> +			 * st->range between the two accesses.
> +			 */
> +			range =3D st->range;
> +			*val =3D st->current_scale[range][0];
> +			*val2 =3D st->current_scale[range][1];

[Severity: Medium]
The comment mentions taking a local copy to prevent issues if a concurrent
write changes st->range. However, since this is a plain C assignment, can t=
he
compiler optimize out the local copy and reload st->range directly from mem=
ory
for each array access?

If max40080_write_raw() concurrently updates st->range, could the two scale
components be torn, defeating the explicit purpose of the local copy? Should
this use READ_ONCE() along with a matching WRITE_ONCE() in
max40080_set_range() to guarantee this behavior?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818142928.8244=
-1-stefan.popa@analog.com?part=3D2
