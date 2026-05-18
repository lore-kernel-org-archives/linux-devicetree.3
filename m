Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D65E2D5A01
	for <devicetree@vger.kernel.org>; Mon, 18 May 2026 20:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779137781; cv=none; b=Xj2BbiqgHnu1hc8VCQyTbI4Ww9o0a5HuzYwUafvv6GQdIHPV+6jrVgEmzvVG1q/vYKa3XzhdbVYaosYrwWH075EreszXriSOsu+R+gLM1GUqVmyf1pFZOwQQLdVkX73jfXPlywf5yp+y+DNm3SPEMwkTf+WTluuqUQnmUABRFuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779137781; c=relaxed/simple;
	bh=gRvS2RP5VtFp12MWm7XHVIHFW5iUeBqMckbLzmS9O+A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S/XErxUjUU6G+rX1nWEDUXDbVcuXZe5522ushEkJMBZI1+HzNMhR1ElLZv2ePs7RiB4T+brdFJ7lsk0ba1WCvRviqsGIcvBO7OpGCyGZIy9Q/TJZ/l7N8UDdL8KlQpw4gWqhoCZFNJwfIKoJ/dSDBjO4yqNzxHOZmqsW+PZj/qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ask/1xp0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ask/1xp0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C802CC2BCB7;
	Mon, 18 May 2026 20:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779137781;
	bh=gRvS2RP5VtFp12MWm7XHVIHFW5iUeBqMckbLzmS9O+A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Ask/1xp0QOPDwDYQJoY64hIMpbWeyvnVKJbhJPtGM5250wkyoFWWwAtDfcoMMHcIZ
	 jKFqS8cdzNLQ9UMpNQuXqlQp2aD7tzljl0s/nvDM96A1hyjjPGG9BaFJT+viPjZW3q
	 Iw11786TTBM6b8aJz8A5PBnyFzHzzkWMmInKEPxuHglsR+ggohM+6PPDz5HjJPwJs+
	 4itJH9tMW9Yx7A602fvLqnJW5nrnDdslEDIBzhfSCNZiDo500sH5ZiMnKfiE5ERVyI
	 wboX7ASncwmykDqIYeZKsHjq2eyd0XN4dO12ygyFBELFFsOTtOZheeQZyTUJAxcFJ3
	 8ESzMqYOC3I9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V8 06/10] iio: imu: inv_icm42607: Add Buffer support for
 icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260518200526.458421-7-macroalpha82@gmail.com>
References: <20260518200526.458421-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 18 May 2026 20:56:20 +0000
Message-Id: <20260518205620.C802CC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] inv_icm42607_buffer_set_fifo_en() writes an invalid state to the F=
IFO mode register when disabling the last sensor, clobbering the bypass mod=
e.
- [High] Unaligned memory accesses when dereferencing packed struct members=
 trigger kernel panics on strict-alignment architectures.
- [Medium] Teardown state variables are not unconditionally cleared on erro=
r paths, causing permanent buffer desynchronization.
--

commit 741f353925a2f661ebf37513ef1196056f86f563
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add Buffer support for icm42607

This commit adds FIFO parsing and reading functions to support the
buffer in the inv_icm42607 driver.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c b/drivers=
/iio/imu/inv_icm42607/inv_icm42607_buffer.c
> new file mode 100644
> index 0000000000000..a011f1f728b98
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_buffer.c

[ ... ]

> +struct inv_icm42607_fifo_1sensor_packet {
> +	u8 header;
> +	struct inv_icm42607_fifo_sensor_data data;
> +	s8 temp;
> +} __packed;

[ ... ]

> +ssize_t inv_icm42607_fifo_decode_packet(const void *packet, const void *=
*accel,
> +					const void **gyro, const int8_t **temp,
> +					const void **timestamp)
> +{
> +	const struct inv_icm42607_fifo_1sensor_packet *pack1 =3D packet;

[ ... ]

> +	/* accel only */
> +	if (header & INV_ICM42607_FIFO_HEADER_ACCEL) {
> +		*accel =3D &pack1->data;

Could this pointer assignment lead to an alignment fault on strict-alignment
architectures?

Because struct inv_icm42607_fifo_1sensor_packet is marked __packed and
starts with a u8, the data member sits at an odd byte offset. This unaligned
address is assigned to accel, which is later passed to
inv_icm42607_fifo_is_data_valid() where it expects a naturally aligned
struct inv_icm42607_fifo_sensor_data pointer.

Dereferencing this pointer could trigger kernel panics on architectures
that strictly enforce alignment.

> +		*gyro =3D NULL;
> +		*temp =3D &pack1->temp;
> +		*timestamp =3D NULL;
> +		return INV_ICM42607_FIFO_1SENSOR_PACKET_SIZE;
> +	}

[ ... ]

> +int inv_icm42607_buffer_set_fifo_en(struct inv_icm42607_state *st,
> +				    unsigned int fifo_en)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	/* update FIFO EN bits for accel and gyro */
> +	val =3D 0;
> +	if (fifo_en & INV_ICM42607_SENSOR_GYRO)
> +		val |=3D INV_ICM42607_FIFO_CONFIG1_MODE;
> +	if (fifo_en & INV_ICM42607_SENSOR_ACCEL)
> +		val |=3D INV_ICM42607_FIFO_CONFIG1_MODE;
> +	if (fifo_en & INV_ICM42607_SENSOR_TEMP)
> +		val |=3D INV_ICM42607_FIFO_CONFIG1_MODE;
> +
> +	ret =3D regmap_write(st->map, INV_ICM42607_REG_FIFO_CONFIG1, val);

Could this write an invalid state when disabling the last sensor?

If fifo_en is 0, val evaluates to 0 and is directly written to the FIFO
mode register. However, the correct disabled state for this register appears
to be INV_ICM42607_FIFO_CONFIG1_BYPASS.

Writing 0 might overwrite the bypass mode and leave the FIFO in an unspecif=
ied
state. It also looks like INV_ICM42607_FIFO_CONFIG1_MODE is redundantly ORed
multiple times for each active sensor.

> +	if (ret)
> +		return ret;
> +
> +	st->fifo.en =3D fifo_en;
> +	inv_icm42607_buffer_update_fifo_period(st);
> +
> +	return 0;
> +}

[ ... ]

> +static int inv_icm42607_buffer_predisable(struct iio_dev *indio_dev)
> +{
> +	struct inv_icm42607_state *st =3D iio_device_get_drvdata(indio_dev);
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	if (st->fifo.on > 1) {
> +		st->fifo.on--;
> +		return 0;
> +	}
> +
> +	/* set FIFO in bypass mode */
> +	ret =3D regmap_write(st->map, INV_ICM42607_REG_FIFO_CONFIG1,
> +			   INV_ICM42607_FIFO_CONFIG1_BYPASS);
> +	if (ret)
> +		return ret;

Could returning early here leave the driver state permanently desynchronize=
d?

If this or the subsequent operations fail, the function returns early and
st->fifo.on is never reset to 0. Since the IIO core ignores teardown
errors and considers the buffer disabled anyway, a subsequent call to
inv_icm42607_buffer_postenable() will see st->fifo.on > 0, assume the
hardware is already fully initialized, and skip programming the hardware.

This would leave the hardware permanently disabled while the software thinks
it is streaming, leading to silent data loss.

> +
> +	/* flush FIFO data */
> +	ret =3D regmap_write(st->map, INV_ICM42607_REG_SIGNAL_PATH_RESET,
> +			   INV_ICM42607_SIGNAL_PATH_RESET_FIFO_FLUSH);
> +	if (ret)
> +		return ret;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518200526.4584=
21-1-macroalpha82@gmail.com?part=3D6
