Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793544990;
	b=G5WEr3xRJjI0V1a+wgHAOAkW7cN5mq1j7+Zl3BfmSsbd/+kmjpaEeb//vzq84OZ0NJz8
	 cMjcPxvxZAqJEVcn8rF7o9SR1QJFUHxUpML8cCLwF8Iv+xVn20grjWxly6sjk8834upJQ
	 8fa8ce/bpFRZ3J3bNVAfVnqsMgky12ZNdPOQWdxfhPG9db84gwcInRxKcCmqExjm88ObZ
	 LrzYxdcRvXu6BZ+g4m7RG+ux0hIxYh3lWxZtyTja4rh8jVb4eqhQmOV/CazXAUQKxLFGW
	 jgDTrcvQGzaHmYYqqb1paJ5RdEUcwa3ZEOdrRL0a9jOQkty6neJVNWumByEyn0GExdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793544990;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vAmezfwE8XW000e+W3Et8mIuZ0cV7cf3ZSUtVv7EuaI=;
	b=wwlHD0CdKLou8IdzTtvS6DjOEAS0V6KPm4zoQxqbkwXn8hPAVh2cFbp0tLmO1iShud/0
	 vYkyjtT/ihA0n5Pl5HwCB6fsKSg8n+TNq8uuckhIec8bw6vHm3jnZf3s8Vttg8SZckhEk
	 5C52S1c9mj3sYEw+63731yfMqkNbQKnb43VZb44BB3bnoy1y4DtI1RfD2pJTnOCxJAtY+
	 KSpFKPA6QB/7ALuxg/hLf2/nuQ58yeyQKsoH0y4EOXsH6YBGX1PRBSxVbFxOtgkx6CmpZ
	 dm6uWiylxs5wX8lbJq1g9OBFyOSL8/IK1FB0Sd/4lS2bS53UBc0xeNKSIQsHOv+Vmqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxhmDhvY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33F8606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dxhmDhvY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FCB91F000C1;
	Sun,  1 Nov 2026 14:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793544989;
	bh=vAmezfwE8XW000e+W3Et8mIuZ0cV7cf3ZSUtVv7EuaI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dxhmDhvYgF4JqoJ3O4azyptw+NJ6JXZy6Nr5N4xQ5GIDuUfriuQeHV2Iuxy7nTBje
	 TJvyEsJcETGc02uSCuASX9SYgMfk+mzxbFuYxDDH4Ld2+sHKHJvUsddE/ympIWtsc9
	 kS5wduVulBE23QL+LuaRIRWDO+Q52tGVmcOeZi4S7UYiQngoist7Bape1uNZYLhxHi
	 fZhByklH/cBpV/gxEHf7Jp3Ob7tsgbaZaIo1SzMtKCkhpiXAjxlEA97nV++GPlx4oo
	 09DK8HstvINqyDni/SZI9TiBOZJt92fJiuiI0cwCyohNNbgFfJ1tc+68CM/bwOFfzU
	 IShzalUeRLVUg==
Message-ID: <sashiko-outbox-192460@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: light: Add Capella CM3217 ambient light sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Patrick Fischer" <admin@tsv-stahl-riesa.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261101-upstream-iio-cm3217-v1-2-5e1724cae7b7@tsv-stahl-riesa.de>
References: <20261101-upstream-iio-cm3217-v1-0-5e1724cae7b7@tsv-stahl-riesa.de>
 <20261101-upstream-iio-cm3217-v1-2-5e1724cae7b7@tsv-stahl-riesa.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 14:56:28 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: light: cm3217: data race on scale_avail in cm3217_read_avai=
l()
--

commit 3a1806ec170fd01b8d751c110690623e96b608ae
Author: Patrick Fischer <admin@tsv-stahl-riesa.de>

iio: light: Add Capella CM3217 ambient light sensor driver

This commit adds an IIO ambient light sensor driver for the Capella
CM3217, communicating over two fixed I2C addresses (0x10 and 0x11) to
configure integration time and range and read the 16-bit light count.

> diff --git a/drivers/iio/light/cm3217.c b/drivers/iio/light/cm3217.c
> new file mode 100644
> index 0000000000000..9e0e9afee0925
> --- /dev/null
> +++ b/drivers/iio/light/cm3217.c
> @@ -0,0 +1,383 @@

[ ... ]

> +struct cm3217_data {
> +	struct i2c_client *client;
> +	struct i2c_client *client_lsb;
> +	/* protects the command bytes, the scale table and ready */
> +	struct mutex lock;
> +	u8 cmd1;
> +	u8 cmd2;
> +	ktime_t ready;
> +	int scale_avail[4][2];
> +};

[ ... ]

> +static void cm3217_update_scale_avail(struct cm3217_data *data)
> +	__must_hold(&data->lock)
> +{
> +	unsigned int fd_it =3D FIELD_GET(CM3217_CMD2_FD_IT, data->cmd2);
> +	unsigned int i;
> +	u32 rem;
> +	u64 nlux;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(data->scale_avail); i++) {
> +		nlux =3D div_u64(CM3217_NLUX_MS << (3 - i), cm3217_fd_it_ms[fd_it]);
> +		data->scale_avail[i][0] =3D div_u64_rem(nlux, NANO, &rem);
> +		data->scale_avail[i][1] =3D rem;
> +	}
> +}

[ ... ]

> +static int cm3217_read_avail(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     const int **vals, int *type, int *length,
> +			     long mask)
> +{
> +	struct cm3217_data *data =3D iio_priv(indio_dev);
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE:
> +		*vals =3D (const int *)data->scale_avail;
> +		*length =3D 2 * ARRAY_SIZE(data->scale_avail);
> +		*type =3D IIO_VAL_INT_PLUS_NANO;
> +		return IIO_AVAIL_LIST;

[Severity: Medium]
Can concurrent sysfs reads of in_illuminance_scale_available and writes to
in_illuminance_integration_time race on data->scale_avail?

In cm3217_read_avail(), a raw pointer to data->scale_avail is returned to t=
he
caller without holding data->lock, and the caller in
drivers/iio/industrialio-core.c reads and formats the array elements after
cm3217_read_avail() returns:

iio_read_channel_info_avail()
  indio_dev->info->read_avail() -> cm3217_read_avail()
  iio_format_avail_list(buf, vals, type, length)

At the same time, cm3217_write_raw() or cm3217_resume() can call
cm3217_write_cmd() -> cm3217_update_scale_avail(), overwriting
data->scale_avail[i][0] and data->scale_avail[i][1] in place while
iio_format_avail_list() is iterating over vals. That can produce torn integ=
er
and fractional scale pairs or a list mixing scales from two integration
times.

Since there are only 8 fixed integration times in cm3217_fd_it_ms[] and 4
ranges per integration time, could the scale tables be stored in a static
const table indexed by the integration time selector so cm3217_read_avail()
can return a pointer to an immutable row under data->lock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101-upstream-i=
io-cm3217-v1-0-5e1724cae7b7@tsv-stahl-riesa.de?part=3D2
