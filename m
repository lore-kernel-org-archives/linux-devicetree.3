Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1908620ED
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 00:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780274703; cv=none; b=ZRRGWs/iFPqY1VUgmR8G0lZk8AYbiiuIgNFYSH9Hcgj5EZ8e6w3feJ82lw90AIc8EfABgGI5nR1VeDx8cQCxwvlYHm2XcvU2o2Ka7bpapT+U0KmdyFmeT3KEM6aAH9xWZpiGBauQzv8bW5G4XtB9GTtK+BqgXjj4U3EEziSWrBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780274703; c=relaxed/simple;
	bh=1mtJOHJyw/69DclxGkPrN+gFk5vHFLiAalbGJxuoGdE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fz0NnyHcgLvPvCli+gN1alHfeUWl32hcNo4r1jz60Ar8qNCwxw22Wm94Xr+8xlLqJsTJoik3LPq8f5dYbvxjmvT06uBeqw+rQtuzgY3Zg12Iu5lJ94dQNThoBvnkkciQhUJijoZfZopY/eF7aiu2ImDFduiPNxFiQ0UMz/3Nt14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jxQlg5OA; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jxQlg5OA"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7dc6d090381so42023817b3.2
        for <devicetree@vger.kernel.org>; Sun, 31 May 2026 17:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780274701; x=1780879501; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9sNcx/VAiskm6FYZ+uFUhNLeXBjBzhmJKxvyu7OkeIg=;
        b=jxQlg5OAtqHM3iHTAqAp6UxfOM6O1gx3zLEHZgW8SvYTx2Qb7JNpJ5CoVijL0mpZ4+
         qB5Yc6cHva7Mey7eEAozxYMJGyGvDKybcrUmpxydgF2BzGtNF+ZwtE0rZdXEK001PHfA
         90ZOd3Ls15Y//LoA1gtf+Xbjb/AS1DbxJGNxzisj5d2EycTJAXdGjYIcNc76bGcnF46h
         gpXcYx1W3NpEllN8HyZa339SXuVOl7ba+2epq7LvLuBYnQJHg316FFu6tAbxOnenFsP2
         oMOq58jYtGFxvVDqe44fgoZTtnDEk1BHQv7Moq+oeCqejJ/M7T8FVD0PUwiitdHQgfQP
         fOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780274701; x=1780879501;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9sNcx/VAiskm6FYZ+uFUhNLeXBjBzhmJKxvyu7OkeIg=;
        b=isL+TTfFJOg+hkve/dIy4+XEFaZeNk8K7FXdUgTzfgmENpjlJvCcX2RT4nlJPeFGfI
         W4d8MwyQbkimb8bA77/XIC7doSQkZAHE3bm27yxY1Hhx8jwig4Xr7jV8GU9MuMV1WXF5
         tQ988ajt1hqsh2wON59Nmyk8CvZ3xNP33zfWJMLrN4GOKUdLpm6xDulcgOkuip5o9l36
         Ndar9Q3E1n1/X0XIqlsBE3RxNhANFe5aXIXGJ/0KkzFp42/rJpNfdKUhkZwQi/qtiLJ+
         N+QM1cn3Ry7GfdIzqeAPbUc5I15uYS99n+cRzfJPKDI437/6tRi/pWBeh7ZN80ESwGgD
         WZxg==
X-Forwarded-Encrypted: i=1; AFNElJ9pT42lSm4+gRasrmLezTi9OVyplzNAEoSXmsb791lXqKXxTjCEpejvXY9YQk6wOajSl6mHj08HEGhR@vger.kernel.org
X-Gm-Message-State: AOJu0YxG7nEgWz/RusncSq/V96JVc4gNCfxTIWo96JoUFcKb378HrI/f
	91p3+UMZyeIpZzWJ63cHoD9N4SBhOjvSHlxUqpWOBYMD5PRynO6i1gOJ
X-Gm-Gg: Acq92OGY1yY39pDJTHTkwxsYbDlB1VcKvb43h8We1aflksUq8y2XxSiUtz+LR9FcW0T
	5zlKFEm3TT/5t5lftaIMaDxLjH8vT8gw4WI7xWK/1/B3ykfocYdy/Vk3IyQHiB0fESAyxroRNrt
	DvxZ8yKYtKRQMV7gyKNTVdoOduBgpHW5M+KEBq5wr6YmuQvr73Yb5Xr6G7F5JWCquUyWyD9Ytpn
	VPKAlIhdOp2+3GoWYsE4ew1nGD5jZ73xoOubk4bvc91Kavw0RvT698frnoCYtM4Flw+cDtcGFaE
	Eiv38Rht0zwBguOXGViv4U980L25fJgmc8lQYCyJoeVYWqtYbeEdqbOiqHxGyRqx1jDPBTWhFlg
	HYVgXp0Id9jY2wwCs+lFkFV9Jz1/htKNhvdkYymXr8bxfCLiok2Cdk4W6zy9j60oOw+3/blwkh6
	xFvMpZc8BGFW372OJ3ST4yRnUBBuNZxVfzHRcQJCGNEoQ=
X-Received: by 2002:a05:690c:4a10:b0:799:198d:8c78 with SMTP id 00721157ae682-7e05f4f5035mr81162727b3.46.1780274701061;
        Sun, 31 May 2026 17:45:01 -0700 (PDT)
Received: from localhost ([2804:30c:1f02:6000:8b59:7c96:762e:9faa])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7e17ae7c667sm30748037b3.27.2026.05.31.17.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 17:45:00 -0700 (PDT)
Date: Sun, 31 May 2026 21:45:23 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Wadim Mueller <wafgo01@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Maxwell Doose <m32285159@gmail.com>, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 3/3] iio: flow: add Sensirion SLF3S liquid flow sensor
 driver
Message-ID: <ahzWI-bQwnQ8ogFL@debian-BULLSEYE-live-builder-AMD64>
References: <20260530205435.37326-1-wafgo01@gmail.com>
 <20260530205435.37326-4-wafgo01@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260530205435.37326-4-wafgo01@gmail.com>

Hello Wadim,

Some additional comments. Feel free to disregard any of them if they conflict
with previous reviews.

On 05/30, Wadim Mueller wrote:
> Add a driver for the Sensirion SLF3S family of digital
> liquid-flow sensors on I2C.  Currently supported variants are
> SLF3S-0600F, SLF3S-1300F and SLF3S-4000B; they share the same
> register map and differ only in flow-scale factor and calibrated
> measurement range.  The variant (and therefore the scale) is
> auto-detected from the product-information register at probe time.
> 
> Each measurement frame returns a 16-bit signed flow value, a
> 16-bit signed temperature reading and a status word, each
> protected by a CRC-8 byte.  The driver exposes the flow rate as
> IIO_VOLUMEFLOW and the temperature as IIO_TEMP via the standard
> IIO read_raw / read_scale interface.
> 
> The active calibration medium can be switched at runtime between
> the factory-calibrated water and isopropyl-alcohol modes via the
> in_volumeflow_medium sysfs attribute; the sensor starts in water
> mode after probe.
> 
> This driver also creates the drivers/iio/flow/ subdirectory and
> the corresponding Kconfig/Makefile glue.
> 
> Signed-off-by: Wadim Mueller <wafgo01@gmail.com>
> ---
...
> +config SENSIRION_SLF3S
> +	tristate "Sensirion SLF3S liquid flow sensor"
> +	depends on I2C
> +	select CRC8
> +	help
> +	  Say yes here to build support for the Sensirion SLF3S family
> +	  of digital liquid-flow sensors:
> +
> +	    - SLF3S-0600F
> +	    - SLF3S-1300F
> +	    - SLF3S-4000B
> +
> +	  The driver reports the volumetric flow rate and the embedded
> +	  temperature reading via the standard IIO interface.
This level of detail is probably not needed in the Kconfig entry. Though, it's
probably okay to have it anyways.

> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called slf3s.
> +
> +endmenu
> diff --git a/drivers/iio/flow/Makefile b/drivers/iio/flow/Makefile
> new file mode 100644
> index 000000000..3cf4ab95c
> --- /dev/null
> +++ b/drivers/iio/flow/Makefile
> @@ -0,0 +1,7 @@
> +# SPDX-License-Identifier: GPL-2.0
> +#
> +# Makefile for industrial I/O flow sensor drivers
> +#
> +
> +# When adding new entries keep the list in alphabetical order
> +obj-$(CONFIG_SENSIRION_SLF3S) += slf3s.o
> diff --git a/drivers/iio/flow/slf3s.c b/drivers/iio/flow/slf3s.c
> new file mode 100644
> index 000000000..497a56f59
> --- /dev/null
> +++ b/drivers/iio/flow/slf3s.c
> @@ -0,0 +1,406 @@
...
> +static const struct slf3s_variant slf3s_variants[] = {
> +	[0] = {
> +		.sub_type	= 0x03,
> +		.name		= "slf3s-0600f",
> +		.scale_num	= 1,
> +		.scale_den	= 600 * MICRO,
> +	},
> +	[1] = {
> +		.sub_type	= 0x02,
> +		.name		= "slf3s-1300f",
> +		.scale_num	= 1,
> +		.scale_den	= 30 * MICRO,
This one seems to almost zero out with 9 decimal digit precision.
And it doesn't get better if _raw * _scale is to result in m³/s.
I haven't followed it closely but, maybe this driver could use some of the new
IIO_VAL types from ADF41513 series [1].

Ignore my comment if l/s was accepted.

[1]: https://lore.kernel.org/linux-iio/20260531-adf41513-iio-driver-v15-6-da09adf1c0dd@analog.com/

> +	},
...
> +
> +static int slf3s_read_sample(struct slf3s_data *sf, int *flow, int *temp)
> +{
> +	u8 buf[9];
Can buf be 6 bytes long? 2 bytes of flow data + 1 CRC + 2 bytes of temp + 1 CRC.

> +	int ret;
> +
> +	ret = i2c_master_recv(sf->client, buf, ARRAY_SIZE(buf));
> +	if (ret < 0)
> +		return ret;
> +	if (ret != ARRAY_SIZE(buf))
> +		return -EIO;
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(buf); i += 3) {
> +		if (!slf3s_crc_valid(sf, &buf[i]))
> +			return -EIO;
> +	}
> +
> +	*flow = sign_extend32(get_unaligned_be16(&buf[0]), 15);
> +	*temp = sign_extend32(get_unaligned_be16(&buf[3]), 15);
> +
> +	return 0;
> +}
> +
...
> +static const struct iio_chan_spec_ext_info slf3s_ext_info[] = {
> +	IIO_ENUM("medium", IIO_SHARED_BY_TYPE, &slf3s_medium_enum),
> +	IIO_ENUM_AVAILABLE("medium", IIO_SHARED_BY_TYPE, &slf3s_medium_enum),
We should probably document the new 'medium' ABI.
For consolidated ABI, we document it in Documentation/ABI/testing/sysfs-bus-iio.
Since this is new stuf, maybe start with a separate ABI doc
(e.g. Documentation/ABI/testing/sysfs-bus-iio-slf3s) ?

> +	{ }
> +};

With best regards,
Marcelo
