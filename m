Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E16B47255F
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057460; cv=none; b=hkRnnYty56APRB3nE4p7gO5uH0I0EUouSqj/y25lHsVkxO2otiTdFbkizMuZEZfU8z4TRMtpdjaRt0MpMPyQmaHk05fQzkATFJ96cQY1xHbN7VXGjM2CqirkMhVdlKEv5mAJihBTlDyO8LGtxHyFH26uNXLSIQ24noLDfo0fKoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057460; c=relaxed/simple;
	bh=e7eVVKzvtyMo03EGicETHhe7yNpi0j+yeOluCWX2d9c=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=eNKR1Rq7T/O9bJFQrFy1LSNJavXBHno1dANLgdTh1WWe0E8OrDTE26UqhcY/VO5+SuTZg0ZRy6xK7gv0MperELeASPVHkTwuC1dd8fIWsBOrq09ZZVenJlaoToGbQwtfIh/25g8nKmIZMvntJ9Fhp92vfa1bc3iiD4RRXm22esw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCIYJgBJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCIYJgBJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4123C1F000C4;
	Thu, 15 Oct 2026 09:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792057459;
	bh=5ZunHcx/eukN99+v1/KGL6OyMBdjLWh9MqGh5ieBiwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eCIYJgBJQ+LBHDs9dUMsLQDE+VxmGw7Pq/44fWeL956l6B58Z7ptVtr8qXHD5flJ5
	 a1nloxAyJa1PMmE3pR5CrQV+al2WFfuS+Pl3zt1NMIGRG91jOsq+KwYRovOG4ZqCl9
	 hFGnLN9YKkLKM9soeUdYPUgMF5vqajjXRoF8gRJOuf1reVdqFWYVT54pM2NXf5Qdpm
	 QOhVgA9fY5NFdOP1xNESP48eG/420VaWDks967cKujeFYJ4oydLYX3ln43vqwbpNo2
	 m4xV1jwqUBryygyQBuIHYupSNu9XpkOlYYr9S3eHcRvHJa2aG1wvtuPVG0qUKjC4xx
	 CdFCbUyHY/LwQ==
Message-ID: <sashiko-outbox-172590@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/6] iio: imu: Add driver for the ADI ADIS16607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau" <radu.sabau@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-adis16607-v3-3-f972d4efee85@analog.com>
References: <20261015-adis16607-v3-0-f972d4efee85@analog.com>
 <20261015-adis16607-v3-3-f972d4efee85@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:44:18 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] spi: DMA cacheline sharing violation between rx and tx buffers
- [Medium] iio: missing hardware state teardown on self-test error
--

commit 7828515c587fd9239b2490c3f7b3aebfd3b79eaf
Author: Radu Sabau <radu.sabau@analog.com>

iio: imu: Add driver for the ADI ADIS16607

This commit introduces the base driver for the Analog Devices ADIS16607
series of IMUs. It includes probe functionality, raw channel reads,
frequency control, startup sequence, and debugfs support.

> diff --git a/drivers/iio/imu/adis16607.c b/drivers/iio/imu/adis16607.c
> new file mode 100644
> index 0000000000000..1d471f59f043d
> --- /dev/null
> +++ b/drivers/iio/imu/adis16607.c
> @@ -0,0 +1,855 @@
[ ... ]
> +static int adis16607_spi_read(struct adis *adis, unsigned int reg,
> +			      unsigned int *val, unsigned int size)
> +{
> +	struct spi_message msg;
> +	struct spi_transfer xfers[2] =3D {
> +		{
> +			.tx_buf =3D adis->tx,
> +			.len =3D 4,
> +			.bits_per_word =3D 8,
> +			.cs_change =3D 1,
> +		},
> +		{
> +			.tx_buf =3D adis->tx,
> +			.rx_buf =3D adis->rx,
> +			.len =3D 4,
> +			.bits_per_word =3D 8,
> +		},

[Severity: Medium]
Does this simultaneous DMA mapping of both adis->tx and adis->rx violate
DMA cacheline coherency?

In include/linux/iio/imu/adis.h, struct adis defines tx and rx adjacently:
    u8 tx[10] __aligned(IIO_DMA_MINALIGN);
    u8 rx[4];

Because rx lacks its own alignment boundary and tx is 10 bytes, rx falls
within the same DMA cacheline as tx. On non-cache-coherent architectures,
mapping both buffers concurrently in opposite DMA directions can discard
ongoing cache flushes or CPU writes for tx during the cache invalidation
for rx, potentially leading to hardware data corruption.

[ ... ]
> +static int adis16607_sensor_self_test(struct adis16607 *st)
> +{
> +	struct adis *adis =3D &st->adis;
[ ... ]
> +	/* Read second set of self-test data */
> +	for (i =3D 0; i < 6; i++) {
> +		ret =3D __adis_read_reg_16(adis, ADIS16607_REG_SELF_TEST_DATA(i),
> +					 &st2_val[i]);
> +		if (ret)
> +			return ret;
> +
> +		if (!adis16607_delta_check((s16)st1_val[i], (s16)st2_val[i],
> +					   delta_max[i])) {
> +			dev_err(&adis->spi->dev,
> +				"Self-test failed for axis %d: delta out of range\n", i);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	/* Clear self-test register */
> +	ret =3D __adis_write_reg_16(adis, ADIS16607_REG_SELF_TEST, 0);

[Severity: Medium]
Will returning early from the loop bypass the teardown of the self-test mod=
e?

If the second read fails or adis16607_delta_check() fails, the function
returns immediately. This skips the final __adis_write_reg_16() that clears
the ADIS16607_REG_SELF_TEST register, leaving the sensor hardware locked
in an active diagnostic/force state.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-adis16607-=
v3-0-f972d4efee85@analog.com?part=3D3
