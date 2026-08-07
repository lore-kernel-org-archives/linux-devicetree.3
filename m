Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F202543F086
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 06:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085504; cv=none; b=oUM0+VjGAMB2poWGuMgTZLHvVyUJ2c4aC+wFlLqgEUwZ8NPd1QddUHZ9m4XiBTRoz4NgAxywSNrynkOyUOxXx8aIK7cV3zlCbPQpAN7W4NzQRGRVF5baZW6pq4nHo//fcoTp4vu8xene4OVtfEGLSzkXPJVOEIHGTyHb/+twwpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085504; c=relaxed/simple;
	bh=m0laloMpKSr7uIa8AwnGbdvwVDgCcxGm+s8WMzXxF3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBozhbIz3JcD8ve0lqn3hPi3Df34e3xM2jWiRENPG6eFUveOcYBYVKCzKNwhRXmyF4d1zYL7r3XQ+wyQQxKAgD+aobWLl5IKKjrsDcj8oWWntj2eIXJ7ExxiRCHizAeTsJDeECUKSGFibl1b7D1+/VEzcsjuXTxZ2vRfZbGc+oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Ncz4Gk4Q; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Ncz4Gk4Q"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-472326ca506so1959528f8f.2
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 23:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786085500; x=1786690300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1OsKlbBv8VRzXB7EPMl6FVJX+np6CvLV/zSoSFWgKAI=;
        b=Ncz4Gk4QNZKAEYB5U/6CCP+UTEZrk/9NZ9d1R5mgHmYe0/9Bx0rWyw9FnmqTZWdjJf
         FkDZI4NbW/TFjTbp0UqjWWFLfbGtRZt/a7Wute0s57Z4MZWuKPILXSK9p0fTuIZz5IQc
         HcRmszR6dnOsKA42NJlYf35qG4+elkUugusBEezjgW0NH1LKpjVs/ZU3KvbvobRKuJCU
         JDek/j+zvwbWq9PVCVP/CCSAO0oJxgOE+JXDyG/PG+rjI2kdMM6+K+vZ4iIIrM4rfBSs
         7d/0IbQAdThX6RV//XHxUTVZcqMWKe83uxTCsCy9iSozPlVn0kpG+MrIiD9jMieJW3w1
         3OfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085500; x=1786690300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OsKlbBv8VRzXB7EPMl6FVJX+np6CvLV/zSoSFWgKAI=;
        b=UoYIhOGBrcHm3DY9p6JbFsxn9x/Hd8HOKtqpdYkUrHvIqKI7jWqZFD1PviJuu806ol
         pHnJ1dmrx3v98rYk8bsRNoWOlKzti+Zvvu1pbbyRSDkMsonx1dwhB8EGCu6b/VgKNKBh
         SW6+wr7VpUC1iwCdEPOkav2IWj+QkJ5U5mBMaaaghgHH39ZS3myZ1ATTSyQdkfQZ25E2
         EpZLH2eqqdddFLCfOTkHBgRCPHUEEkgcbgsLb2slf99ZMykG66HnI4gqoacyyLVHhhXw
         SFtdzp/zXRk2+8UK0b4Uyzfv978el87MZ3yWztuByjTYUACazyOyHqom/nH21ME+vGAY
         R9Dw==
X-Forwarded-Encrypted: i=1; AHgh+Rrkkx/ZoigP6tLqcSOIY4NB+lMKdvGHTtAG16dDGsxd8Fsqhm//hSQOROeDRvP637wizRX1p/I1xUXb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+tinLns4DQgCMGU/hj78Yd7KFixiJ4CYmVmImVeJAXD4bOK/p
	YMm4Ms2nxv950kSmxnbxACMRlOX79ALCMduilRMlADTwCSF1JkUlhnL3ze102QNZ4cc=
X-Gm-Gg: AR+sD113bY4YoHd/YFq8vcOjwZ4OIc+SLAR5coxPK6X7NZIa0NuoaEhg/MmOC3IQiIX
	UhBxfHjfA3sI4sRq7ibf32k0anff4EaiRNxdDDHV1Ybr/+quXFSHI68TfMq4ku+eEt6beAUjRWA
	7gvzPDxH+HZmNIfs9Yr8ciuGiuNxH1XL7g0/p54NmjsCBanf3OpTHcZA2sOfqKOCdg9MiRd3qUV
	0Zp4c89oRaxsmAX1R2VEV4gUGh+YRmYjGyOVmkjivlpflbwypwOsavAmEWeOb9CgmHJKJOK+8tp
	9gH4nGau9fD5aSeltGpCFIaB4E3q/C9EY5gCm8E4asMkAUsdm6PToe0uwhk+7p4R5IR57cjDgWK
	vZtVxKBP3i/kUoJ0prSzfnd0AB/vzCnev7CFMd7RsPEXm0UrpFfUz/PemdJvEimUhQk4F7ax2iy
	5vTASXLirpmC+0r3CeAqyXOlLC/dGsDvWd6XUBSPZIB1fEMmuY2LJU7ghxr+JiNStA6z6zLOoDu
	Qe2vIqk2SdYqlIfV+PA/GANDR4lLTM0iiM3LRh8Cb8GH3WCykat
X-Received: by 2002:a05:600c:c043:b0:495:7a5a:d96c with SMTP id 5b1f17b1804b1-4994e7d89cfmr216500515e9.18.1786085500227;
        Thu, 06 Aug 2026 23:51:40 -0700 (PDT)
Received: from localhost (p200300f65f017104bf0aa590e17c3201.dip0.t-ipconnect.de. [2003:f6:5f01:7104:bf0a:a590:e17c:3201])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4995e9e7164sm15486115e9.2.2026.08.06.23.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:51:39 -0700 (PDT)
Date: Fri, 7 Aug 2026 08:51:38 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Kanak Shilledar <kanak.shilledar@axis.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Grimler <henrik.grimler@axis.com>, Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@axis.com
Subject: Re: [PATCH 2/3] iio: accel: Add support for ICM42370P
Message-ID: <anV_NpsTKyQN26ip@monoceros>
References: <20260806-b4-inv_icm42370p-v1-0-670837f5842f@axis.com>
 <20260806-b4-inv_icm42370p-v1-2-670837f5842f@axis.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="246ya6rzrkkoj5dz"
Content-Disposition: inline
In-Reply-To: <20260806-b4-inv_icm42370p-v1-2-670837f5842f@axis.com>


--246ya6rzrkkoj5dz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] iio: accel: Add support for ICM42370P
MIME-Version: 1.0

Hello,

On Thu, Aug 06, 2026 at 02:46:28PM +0200, Kanak Shilledar wrote:
> diff --git a/drivers/iio/accel/inv_icm42370_core.c b/drivers/iio/accel/inv_icm42370_core.c
> new file mode 100644
> index 0000000000000..9f6c302e6f331
> --- /dev/null
> +++ b/drivers/iio/accel/inv_icm42370_core.c
> @@ -0,0 +1,1251 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2020 Invensense, Inc.
> + * Copyright (C) 2026 Axis Communications AB
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/irq.h>
> +#include <linux/slab.h>
> +#include <linux/mod_devicetable.h>

<linux/i2c.h> already provides structs i2c_device_id and of_device_id.
So please drop the explicit include for <linux/mod_devicetable.h>, as
this will go away soon.

> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +
> +#include <linux/iio/common/inv_sensors_timestamp.h>
> +#include <linux/iio/iio.h>
> +#include <linux/iio/sysfs.h>
> +
> [...]
> +static const struct i2c_device_id inv_icm42370_id[] = { { "icm42370",
> +							  INV_CHIP_ICM42370 },
> +							{} };

Please use named initializers and saner code style. I suggest:

	static const struct i2c_device_id inv_icm42370_id[] = {
		{ .name = "icm42370", .driver_data = INV_CHIP_ICM42370 },
		{ }
	};

> +MODULE_DEVICE_TABLE(i2c, inv_icm42370_id);
> +
> +/**
> + * inv_icm42370_of_matches - struct for all the compatibe strings
> + *
> + */
> +static const struct of_device_id inv_icm42370_of_matches[] = {
> +	{
> +		.compatible = "invensense,icm42370",
> +		.data = (void *)INV_CHIP_ICM42370,
> +	},
> +	{}

{ } please

> +};
> +MODULE_DEVICE_TABLE(of, inv_icm42370_of_matches);
> +
> +static struct i2c_driver inv_icm42370_driver = {
> +	.driver = {
> +		.name = "inv-icm42370-i2c",
> +		.of_match_table = inv_icm42370_of_matches,
> +	},
> +	.probe = inv_icm42370_probe,

	.id_table = inv_icm42370_id,

> +};
> +module_i2c_driver(inv_icm42370_driver);
> +
> +MODULE_AUTHOR("Kanak Shilledar <kanak.shilledar@axis.com>");
> +MODULE_AUTHOR("Henrik Grimler <henrik.grimler@axis.com>");
> +MODULE_DESCRIPTION("InvenSense ICM-42370P I2C driver");
> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("IIO_ICM42370");

Best regards
Uwe

--246ya6rzrkkoj5dz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmp1gHcACgkQj4D7WH0S
/k7XBgf/Z+tqCQDXT2HAnKQdR86gJdY5hQRxvCok3pNk7z5dId/KYuqrKXlSqx2c
ddani4W4y/3ToOSAd2YAU6Tft4qzdX61+PKLOTDmNR3vdfdnBApCt3GTZAYU8Tte
djpEINGcy9O8Yg1HEEHPZm1vo8ew0Shw/JGEigFdh6wO652FRcpC84CQYaOojcyk
WeoxCdeBa1K+HNdTZYOH1m7SPO9KcwFqybtc078GGgaAh4IXikas4qfEPdezu86p
ZlCnErsjIm5Lhqt6LVGJqvx+fjfrSdYim2wWF0f5V8QzGqt/6ahn0lUacDyJa9H6
DmtrPqH8EsmoRmT/mT3em6xkhSHZZg==
=pUIb
-----END PGP SIGNATURE-----

--246ya6rzrkkoj5dz--
