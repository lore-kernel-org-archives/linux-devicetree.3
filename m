Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8481EEA31
	for <devicetree@vger.kernel.org>; Wed, 17 Jun 2026 02:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781662441; cv=none; b=mTnCxnK7gv/W6NdjuF437Pl2mdZgx6wWtrOX/XmfvHwFBcJIlUvJ0HD4UpCwva0mt7V3tTx3Epf589SqbzuVLu2/MAT8Gw+T0lOjEAaSZ20Pzkztj7LbBmOSnGpDsWFlIj65V0jY52nOssWxvi8S6K5wKqdqBaA8Wu+UlJzNLDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781662441; c=relaxed/simple;
	bh=PO3yO3dBl1wyUK8KnQT58LVt3ZIF8l3V6DHpYK5Ljpc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GV34ueYtxMryWA1ox+/tUQ11h1GGhJ+tziedWbgkU9blno6QFHDEX/kRJf6eTwekHDXJ2nPcaSUKp8qH0yzf8uwB1gDqR8tgQNze/nqt84UmUzlXkqzyf/TzLP7CYCquR2sWVAXAHGNYuIPyXySvKUKHe6pep1FPTz1yc4Uy4uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gaOkdEHK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gaOkdEHK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4C761F000E9;
	Wed, 17 Jun 2026 02:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781662440;
	bh=7ytRLuSkbANWs2LUDqMG5NaADvUNZVlSd10vJgNDeYA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gaOkdEHKYlLEpyHCsZoBouqhRgWQdImBFdzBNpCeT6nMawq7as69nGQs33dw6DA6s
	 8IGAfYePj00rsdnxvRl9gVCYhbgQWmMSdND3vstwWLOFmO2e/5yXSyPuhmBzHdRXKG
	 HtegD0OHCgj9wqqwQhAZc3ZrwD//6LzEOu/l3jsKsdBWDPUlij1gY2sPFFRkgL6nTV
	 8RVeC9FclUK6mCfSs4qG+Zh2S5vSxITXTvQp5goAllLKuGxNAH7SSTeFWcFIhDqP/O
	 yWebtxWtIKs5HEvnS2HwF1/O+2Uy+Yi2ovqvMvSal43ldQpKiXZKxRZ9nwV7q+1Iw3
	 lPAfwi6zw/WyQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH v3 3/5] iio: buffer: Extend DMAengine buffer
 interfaces to take extra sysfs attributes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <a09f2cac2d26fe385f1f7790b0db64b7d9953ac6.1781661028.git.marcelo.schmitt@analog.com>
References: <cover.1781661028.git.marcelo.schmitt@analog.com>
 <a09f2cac2d26fe385f1f7790b0db64b7d9953ac6.1781661028.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 02:13:59 +0000
Message-Id: <20260617021359.C4C761F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Critical] Unconditional assignment of `buffer->attrs` overwrites the def=
ault DMAengine buffer attributes, removing `length_align_bytes` from sysfs =
and breaking the userspace ABI.

Pre-existing issues:
- [High] The ad4691 driver manually overwrites the IIO buffer's `attrs` fie=
ld after setup, clobbering the generic DMAengine buffer attributes.
--

commit e15805cbfeb85d6ab2a3f8819279738d4402da62
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: buffer: Extend DMAengine buffer interfaces to take extra sysfs attribu=
tes

This patch extends the IIO DMAengine buffer setup interfaces to accept an
additional parameter for extra sysfs attributes. It updates all existing
callers to pass NULL for this new parameter.

> diff --git a/drivers/iio/adc/ad4691.c b/drivers/iio/adc/ad4691.c
> --- a/drivers/iio/adc/ad4691.c
> +++ b/drivers/iio/adc/ad4691.c
> @@ -1980,7 +1980,8 @@ static int ad4691_setup_offload(struct iio_dev *ind=
io_dev,
>  		indio_dev->setup_ops =3D &ad4691_cnv_burst_offload_buffer_setup_ops;
> =20
>  	ret =3D devm_iio_dmaengine_buffer_setup_with_handle(dev, indio_dev, rx_=
dma,
> -							  IIO_BUFFER_DIRECTION_IN);
> +							  IIO_BUFFER_DIRECTION_IN,
> +							  NULL);

[Severity: High]
This is a pre-existing issue, but does manually assigning the buffer attrib=
utes
further down in this function clobber the generic DMAengine buffer attribut=
es?

Following this setup call in ad4691_setup_offload(), the driver manually
assigns:

indio_dev->buffer->attrs =3D ad4691_buffer_attrs;

Could this overwrite the default DMAengine buffer attributes like
length_align_bytes? Since the new API allows injecting custom attributes,
should this driver be updated to pass ad4691_buffer_attrs into
devm_iio_dmaengine_buffer_setup_with_handle() rather than passing NULL and
manually overwriting it afterwards?

>  	if (ret)
>  		return ret;
> =20

[ ... ]

> diff --git a/drivers/iio/buffer/industrialio-buffer-dmaengine.c b/drivers=
/iio/buffer/industrialio-buffer-dmaengine.c
> --- a/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> +++ b/drivers/iio/buffer/industrialio-buffer-dmaengine.c
> @@ -289,7 +289,8 @@ EXPORT_SYMBOL_NS_GPL(iio_dmaengine_buffer_teardown, "=
IIO_DMAENGINE_BUFFER");
>  static struct iio_buffer
>  *__iio_dmaengine_buffer_setup_ext(struct iio_dev *indio_dev,
>  				  struct dma_chan *chan,
> -				  enum iio_buffer_direction dir)
> +				  enum iio_buffer_direction dir,
> +				  const struct iio_dev_attr **buffer_attrs)
>  {
>  	struct iio_buffer *buffer;
>  	int ret;
> @@ -301,6 +302,7 @@ static struct iio_buffer
>  	indio_dev->modes |=3D INDIO_BUFFER_HARDWARE;
> =20
>  	buffer->direction =3D dir;
> +	buffer->attrs =3D buffer_attrs;

[Severity: Critical]
Does unconditionally overwriting buffer->attrs here remove the default
DMAengine buffer attributes?

Since iio_dmaengine_buffer_alloc() sets up the default attributes array
(which exposes length_align_bytes to userspace), and all current callers
updated in this patch pass NULL for buffer_attrs, it appears this will
silently delete length_align_bytes from sysfs for all IIO DMAengine buffers.

Could this break the userspace ABI, as applications might rely on
length_align_bytes to determine the required memory alignment for DMA
buffers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781661028.gi=
t.marcelo.schmitt@analog.com?part=3D3
