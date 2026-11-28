Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874591;
	b=qgzHrsaj9VPUXU5vMV0GPSHBEoR+HLaTc1v64uJqbJePjBbHVLltYfliJXLL/tsc6Zdc
	 bp4P4KmKBPosLc3tmWNm823Fgl+q3QWmHUYEisl7FSH0CYJtzrwHM2pEPcN1Jm6qZfVa9
	 v+tJ9xrI5mY6x4sVtExzx6EruEGS1OJz+dACvliC4T16XhJPsLbiEMBs40kiyLOmrMFhe
	 A6YqXyHUCIoA++oZwtRiRC17xuZK9wp8JsHhIE4OJg0WoI+yR6eof7/y0kZyPtwyoZXXn
	 KpSUeAG345vkYhHqqeHztMuvpzGaxUrfWj24meGG+VU/iOM/uBArH91/7gpZiAxlIqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874591;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=wq7+1npazsL3L4BbEgddagOwCROxtlqGUXm19aAHbVg=;
	b=ysRxhx6DZ5kCQO/hnSAih6yW7fWKhuJ7hSx+dyapX3Gb7h5+Yjya0AzVqUKGWbxE0bCc
	 vK4iUQg5I6GeQ4enLi88mUhU0o03OALJ+nWljZ+ra+YKldyBvFe695qmHNtGn6CqM6b1A
	 nFT25rzwPnKU6Fa+eVZ/zzU/NUvOJdnLZw8jGD8zLiC4ln/B9N+8fRxZcSltST8cJclkv
	 d2/pKA6/58NYTgJuM7XfFixiO1t2GtlvQZ/rg2QFRC8msJtmODvnhxHJfI/QCVnO91boC
	 TxTSipSjM96g2olwQYD9nI1z9Rn3DGzC/xpViIgZtoWvz4qHFfOaMZepcr1pd3D6g8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="N6S/oq5P";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D87A5606A321;
	Sat, 28 Nov 2026 14:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N6S/oq5P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C7D01F000C1;
	Sat, 28 Nov 2026 14:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795874591;
	bh=wq7+1npazsL3L4BbEgddagOwCROxtlqGUXm19aAHbVg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N6S/oq5Pmq9SXgGyRiHc3cd2fMkQPoq71EfZPNQejJJvSJn9gFpFcqfqjUVYlLw2W
	 dUxyZhpA5ggqYSu/S8+z8rsncoVkIVTgAgdl9+x6W2mF+Ti5ORAu72hjm/91FdY0wI
	 hydaKf87B9oZ/U8/n9ePIX8Z2QwitJ2H1mlzhbHDXgggrbUSGT48/8ySuclIKSIG8u
	 rZDuFWHQZilaqIso5ySho4E3G4SzfDCQ9cAvSgexj3AUDl3B5U4xQlNS6+5kqDU21U
	 qXLYjZCD5J2CKDuzN9vBxbZZIQPJbDOMCOxbjP1kP+WuS3aADHCC4iY1/ituOiOKAe
	 D0xnd67uRwgHw==
Message-ID: <sashiko-outbox-238744@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] Input: s6sy761 - add SPI support for S6SY791
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukas Timmermann" <foss@timmermann.space>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dmitry.torokhov@gmail.com
In-Reply-To: <20261128-lat3st-google-raven-touch-upstream-v2-4-1be5c1029087@timmermann.space>
References: <20261128-lat3st-google-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space>
 <20261128-lat3st-google-raven-touch-upstream-v2-4-1be5c1029087@timmermann.space>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 28 Nov 2026 14:03:11 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] Input: s6sy761: DMA-unsafe stack buffers in s6sy761_i2c_read()
--

commit 41cdfc7d2236b662f8b09dd26455edb5cb7aa912
Author: Lukas Timmermann <foss@timmermann.space>

Input: s6sy761 - add SPI support for S6SY791

This commit adds an SPI transport module for the Samsung S6SY791 touchscreen
controller using the shared s6sy761 core driver.

> diff --git a/drivers/input/touchscreen/s6sy761_spi.c b/drivers/input/touc=
hscreen/s6sy761_spi.c
> new file mode 100644
> index 0000000000000..ddb849cd48457
> --- /dev/null
> +++ b/drivers/input/touchscreen/s6sy761_spi.c
[ ... ]
> +static int s6sy761_spi_read(struct device *dev, u8 *xfer_buf,
> +			    u8 cmd, size_t length, void *values)
> +{
[ ... ]
> +	memset(xfer_buf, 0, ALIGN(resp_len, 4));
> +	reply.tx_buf =3D xfer_buf;
> +	reply.rx_buf =3D xfer_buf;
> +	reply.len =3D ALIGN(resp_len, 4);
> +	ret =3D spi_sync_transfer(spi, &reply, 1);
> +	if (ret)
> +		return ret;
> +
> +	if (xfer_buf[0] !=3D S6SY761_SPI_SYNC_CODE ||
> +	    xfer_buf[5] !=3D cmd ||
> +	    xfer_buf[resp_len - 1] !=3D
> +			s6sy761_spi_checksum(xfer_buf, resp_len - 1))
> +		return -EIO;
> +
> +	memcpy(values, xfer_buf + S6SY761_SPI_READ_HEADER_SIZE, length);
> +
> +	return 0;
> +}

[Severity: High]
While s6sy761_spi_read() bounces transfers through the heap-allocated
xfer_buf, does s6sy761_i2c_read() in commit "Input: s6sy761 - split into
core and I2C modules" pass stack buffers directly to i2c_transfer()?

drivers/input/touchscreen/s6sy761_i2c.c:s6sy761_i2c_read() {
	struct i2c_client *client =3D to_i2c_client(dev);
	struct i2c_msg msgs[2] =3D {
		{
			.addr	=3D client->addr,
			.len	=3D 1,
			.buf	=3D &cmd,
		},
		{
			.addr	=3D client->addr,
			.flags	=3D I2C_M_RD,
			.len	=3D length,
			.buf	=3D values,
		},
	};
	int ret;

	ret =3D i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
    ...
}

msgs[0].buf points to the stack parameter cmd, and callers such as
s6sy761_power_on() and s6sy761_hw_init() also pass stack buffers as values.
Because I2C controllers may DMA directly from and into i2c_msg buffers,
passing stack addresses under CONFIG_VMAP_STACK can fail DMA mapping or
corrupt memory.  Should s6sy761_i2c_read() use xfer_buf for both messages
and copy the result into values?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261128-lat3st-goo=
gle-raven-touch-upstream-v2-0-1be5c1029087@timmermann.space?part=3D4
