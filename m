Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574306;
	b=5p/G6uDqHizwwiR++c9msqflvnuy0bJJ4F+GoPyR8d/ufdPR4wmj4rneS3Wqb2Tm9Bib
	 dJarpRqyAWBlAJvAVpnWF3PTaSkkTv59NfGVpBT8ggusDVpYp3quk4jcsG+qnrqWBrZHV
	 c4Gs3YhstDd00hNJiM0o1f9a+LzsH4Lhk+tmqSTqiRqisjG6aCZXRr7UdCn0ADxbcSh//
	 NX+4rP2l4jgVXRgKseG5btFWFb2Ebzqmjgb/9BuhGi8MjgXJ1X7hh/n6PYie6ToCkGbmy
	 F5Vb1UV5RxWwt/EQxytIPeSKz/22WqJ5Pszb85MwoC4tIl6bnwJgPpZaneju5F5EElA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574306;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=DlD+SXi8ilN1nbvw3zTuFdKBU8rJFqi0j1tprnf86+c=;
	b=Kg+SvwN09qEXALTW8TGgjetY0jsM6OAODRGCYqwW15fdASOKsLCdJnm+DmE9F0HxMUBY
	 x1MmdpBHVkBZLL00vY222vkDIuxzH4iVuDDJY+zmcNGPWs5pUaLqTq3ax6dC+XUr4fZ6A
	 3qz7lWA7v7YegcKkfPa0VlYRlAFOkBmvIsvED2v0hDOCqC+g74bNZClDES8zo/5/haauy
	 Se7XSHpreic9Hc6RhPXRvTzLx0SLPHVF19tKPuj/XN6GtEot4+qXcfBrSF75I+947dHg5
	 Fi36M3gIUYpfSsjT7MpdMiADQU4aGcaRftsX0zOwsx6wx7wyvZzD59Ee0stQXQZc0WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DVmaxU7k;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B6F606A323
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DVmaxU7k
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D69501F000C6;
	Fri, 13 Nov 2026 12:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794574306;
	bh=DlD+SXi8ilN1nbvw3zTuFdKBU8rJFqi0j1tprnf86+c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DVmaxU7kGuaDv0boB3cttsOZ5x9CLbxNH8j7IdHP8vGlnqiwYfHsIcNETTNLhAxo7
	 a9WNKN04KGtwg8gKhJS4xdAgH+yMRuJzhj6MKIeBUjsJ1JzwO8A8dCWYbTUXt5Cpuk
	 7+oaLKcUKvh1NbC2EBY6oIV1VTyhMrZG9WFLTvACF3vsuFbJcXkS6AzGmySEgXvBCC
	 S6qNTC8Eg4FnXfBo4O/n4bRUkJ8Zk6a7IZ0/JASXvkEM8xOQTGK7+FfjzzD7UUS5j4
	 h7COPqaxTXAyjDcJ2MqB6mKMXzxpH8+j/Vs4OO2FSWCqyhaTwovxG3x/T4C9JdwRNI
	 BoefImuad9U6Q==
Message-ID: <sashiko-outbox-212791@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 6/8] iio: imu: adis16607: Add FIFO-based buffered
 capture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau" <radu.sabau@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-adis16607-v6-6-3f678719942a@analog.com>
References: <20261113-adis16607-v6-0-3f678719942a@analog.com>
 <20261113-adis16607-v6-6-3f678719942a@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 12:51:45 +0000
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
- [Low] iio: imu: adis16607: initial fifo_watermark in adis16607_probe()
  is overwritten on buffer enable
--

commit 432b63f4ff217d947afef093d1237f760013e881
Author: Radu Sabau <radu.sabau@analog.com>

iio: imu: adis16607: Add FIFO-based buffered capture

This commit adds hardware FIFO buffered capture support to the adis16607
driver using a kfifo buffer, a level-triggered threaded interrupt handler,
and configurable watermark attributes.

> diff --git a/drivers/iio/imu/adis16607.c b/drivers/iio/imu/adis16607.c
> index f5dc37c54191e..377e7c46f860b 100644
> --- a/drivers/iio/imu/adis16607.c
> +++ b/drivers/iio/imu/adis16607.c
[ ... ]
> @@ -228,6 +262,333 @@ static const struct adis_ops adis16607_ops =3D {
[ ... ]
> +static ssize_t hwfifo_watermark_show(struct device *dev,
> +				     struct device_attribute *attr,
> +				     char *buf)
> +{
> +	struct iio_dev *indio_dev =3D dev_to_iio_dev(dev);
> +	struct adis16607 *st =3D iio_priv(indio_dev);
> +
> +	return sysfs_emit(buf, "%u\n", st->fifo_watermark);
> +}
[ ... ]
> +static int adis16607_set_watermark(struct iio_dev *indio_dev, unsigned i=
nt val)
> +{
> +	struct adis16607 *st =3D iio_priv(indio_dev);
> +
> +	val =3D clamp(val, 1, ADIS16607_MAX_FIFO_WM);
> +	st->fifo_watermark =3D val;
> +
> +	return 0;
> +}
[ ... ]
> @@ -792,6 +1183,8 @@ static int adis16607_probe(struct spi_device *spi)
>  	indio_dev->info =3D &adis16607_info;
>  	indio_dev->modes =3D INDIO_DIRECT_MODE;
> =20
> +	st->fifo_watermark =3D ADIS16607_MAX_FIFO_WM;

[Severity: Low]
Does initializing st->fifo_watermark to ADIS16607_MAX_FIFO_WM take effect
when the buffer is enabled?

devm_iio_kfifo_buffer_setup_ext() initializes buffer->watermark to 1 via
iio_kfifo_allocate() -> iio_buffer_init(), and iio_enable_buffers() calls
hwfifo_set_watermark() with that value before postenable() runs. As a
result, hwfifo_watermark reports 38 in sysfs before the first capture while
buffer/watermark is 1, and enabling the buffer immediately overwrites
st->fifo_watermark with 1 before adis16607_buffer_postenable() programs
ADIS16607_REG_USER_FIFO_CFG.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-adis16607-=
v6-0-3f678719942a@analog.com?part=3D6
