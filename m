Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C5938CFED
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 06:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784788088; cv=none; b=bsKtjYn/0SIQPWNWSUWWp3nBaHvtLTjqqLoxQBGhbZ7ksd0gG9UiHaleNprMGBlAm0xSLDiq99myXRYgUBk2Mj/qNfhuCZFRiObCG6idS3/IoKTQdKsZ00TDJmgW+w41TtD9LYZa10sGdF+hVOUa0hJOFDdWsVhPSZ0S9888whw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784788088; c=relaxed/simple;
	bh=TQAEV7UNUSBt5hCHAIhIYZaRcGmEyjeZFj3OyVcrCeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fy0sbrS8hapXMD0sLL2QypeHYACUtNs5Wu5Mp9XGSw/VXl+HfMppos4O8xqVQ7PZfoevikq5Oifk6yivo/bbdI16RDQONZDobUqzOXY25q4uDPLiItPabMTuWdsJRpP631Z8xDj3MpcZmcT8kFbXwTT7f671lebN0FfbLy6llTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=e8n4LgNd; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="e8n4LgNd"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-47f752b3423so132261f8f.3
        for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 23:28:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784788085; x=1785392885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2TD6c2aawyPviSqpm5Nt3rY9T6uJCx1d6aW8Jwv1HfI=;
        b=e8n4LgNdC8mDUP3yGwpA3WlCKZ3sVXKKgl7G9mOyX0iWUQKXry8iF+ynsURmyyOq4S
         Y/e05FSvJsWQE0TRHQtzo4s84+9fvoKFiFDc19mHET/KbgGDnMVth4b2XLYBuMFs6KDy
         Emt7xCYDPjrVHbUhSP7UlvYeuMXLzJs2CnZKkNg7+2zI9RdNCteuLxPSSjZ2PRh1dgV2
         2ziHW6Rm+MgeDnHuwE4Nyxwrk8a/TFe6URh6NL/TN/gPBNixDHA0DzrMj1gMIMDSErzF
         jOu53lVJs+aeG7w90UvOFiNSotx7IgIXckaIAMIuCXQVsRdkbcB668unOmHgWP1XT7cZ
         p/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784788085; x=1785392885;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2TD6c2aawyPviSqpm5Nt3rY9T6uJCx1d6aW8Jwv1HfI=;
        b=tMVrjQKVmZ6VarZh8BewuD8hBgbrgz81gZ5ZP1FCB7Lt1jj+3rS8hxUK/IyS8LSbzB
         TT+WCRzrJoiG2v6pNO7mUT5F6LgDR5lt4KKhGdJDmH3GSOiXXRwXBNmFKs4xrISku4MN
         XJwybz/tPqRJMzWzkWQ0WS71nPlYFtkbOsMOwzPcqLdZmN/2FuuaF+EqvgOOqj+GjyPl
         p2w/BJSBBmtgAdFJmJlc9UTU2gEzwl1AYEJLdkBIOEG+HOepZP69XmBHRt/Ws5270vfj
         o8TcroFDPPW8guqTurIkuhUPZz2pR7z7BtrS8ZaCo1nDppLmTW5Z3ej9CyIsE4jxCNik
         a+MQ==
X-Forwarded-Encrypted: i=1; AHgh+RruTthiRU3KKYbPcNXAZLUoO74GgbgAiPRGg0JW4YtsDi8jF41OwbIBBnMrwzKlkO9Mvx8wslGYT51K@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+523sN+tl8nWgVepZMyeuY4N/RdofAspYiF7Y05Z6Bmx8laYC
	QNwRXdz7Ecjh+v0+vH/Dk2+Nb89gI+q2NXRXgvUZz4gag9Po+YaIZFmqdlhO6jPcRxc=
X-Gm-Gg: AR+sD13JqukJFFIcEIPOuSMQJLkbPdpuvRvjyAxPknKRE2jHalmRoSFmoH5hsREFjm4
	9SjwLwwCyzAkRsL6GUg0nl6Z5lq8xSt7ApKG0/g+nC+zWuqrX0JjYRtxfnU6JTrYlcpnginnO6Y
	lNF3mPEshfVL6sSU/Y+unFBMRBB9OENWxH3NUfu8rcP822iOUIpRZviTH6Uq9amv+TEb2IVT4LY
	MBtWV1berCUg5I2w6qatarCbowixGguHNSIHfOM/t4KW2nRU4stt9SbkKjfH20sPH/FDTzogF3T
	sMdoA7edwbheD8f3coWkzi+PjKXhnsuHhPHGrvSdAriYh7DV/5MnIWaOreoigxxvi/0wSjVtF8s
	Qu8NzUHarDGzG4loZukV8yjyFO4/SpIYEYEfyet6sR+rYHH/scp75STSK63AXDc4TOylTUXRVmM
	hDw21FIyA=
X-Received: by 2002:a05:6000:22c7:b0:47f:6fd2:12ff with SMTP id ffacd0b85a97d-47f8da5c9efmr1980906f8f.9.1784788085516;
        Wed, 22 Jul 2026 23:28:05 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f85b9a5c4sm12114701f8f.8.2026.07.22.23.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 23:28:04 -0700 (PDT)
Date: Thu, 23 Jul 2026 08:28:03 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] hwmon: (emc1403) Convert to use OF bindings
Message-ID: <amGz2YZogakb5XAv@monoceros>
References: <20260721095935.439174-1-clamor95@gmail.com>
 <20260721095935.439174-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l6sn4pufjezkt2ci"
Content-Disposition: inline
In-Reply-To: <20260721095935.439174-3-clamor95@gmail.com>


--l6sn4pufjezkt2ci
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 2/3] hwmon: (emc1403) Convert to use OF bindings
MIME-Version: 1.0

Hello,

On Tue, Jul 21, 2026 at 12:59:34PM +0300, Svyatoslav Ryhel wrote:
> From: Jonas Schw=F6bel <jonasschwoebel@yahoo.de>
>=20
> Add OF match compatible table to be able to use this driver with Device
> Trees.
>=20
> Signed-off-by: Jonas Schw=F6bel <jonasschwoebel@yahoo.de>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Please put your S-o-b line last.

> ---
>  drivers/hwmon/emc1403.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
> index cd753b38709f2..b7ab6069ec7b1 100644
> --- a/drivers/hwmon/emc1403.c
> +++ b/drivers/hwmon/emc1403.c
> @@ -16,6 +16,7 @@
>  #include <linux/hwmon.h>
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/err.h>
> +#include <linux/mod_devicetable.h>

Don't add <linux/mod_devicetable.h> please. struct of_device_id is also
provided by <linux/i2c.h> so adding <linux/mod_devicetable.h> isn't
needed.

>  #include <linux/sysfs.h>
>  #include <linux/regmap.h>
>  #include <linux/util_macros.h>
> [...]
> @@ -682,10 +683,21 @@ static const unsigned short emc1403_address_list[] =
=3D {
>  	0x18, 0x1c, 0x29, 0x3c, 0x4c, 0x4d, 0x5c, I2C_CLIENT_END
>  };
> =20
> +static const struct of_device_id emc1403_of_match[] =3D {
> +	{ .compatible =3D "smsc,emc1402", .data =3D (void *)emc1402 },
> +	{ .compatible =3D "smsc,emc1403", .data =3D (void *)emc1403 },
> +	{ .compatible =3D "smsc,emc1404", .data =3D (void *)emc1404 },
> +	{ .compatible =3D "smsc,emc1428", .data =3D (void *)emc1428 },
> +	{ }
> +

Unusual empty line here.

> +};
> +MODULE_DEVICE_TABLE(of, emc1403_of_match);
> +

Best regards
Uwe

--l6sn4pufjezkt2ci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmphtHEACgkQj4D7WH0S
/k4H9Qf/eIS4Qz8jNjTZB5EcrdJYqD0cdgZY44kCeDGMBB625M8vmpG7qAv2xnqF
0lGgOTpDoCEs+IgmNz8ISciUqEeY7PWmCge3u6jKZteesuUBX1tMrtnR5DPjVNUv
jV6gAM1O287rIzQjp59TZ6tcQe670H3YK+tZAZOIOgpCg5C8FNUOanj9B/sGgnn8
lF3XTCng+Kh6FacdHSPIEwi/FURNxIwy0aKXjPsxEse7EcC4fsTnmjHubUsWdtOm
r8cBcczstoZwosFPOMzSGgft070Ay2Xq2J18y7uYgjpK22gqxuxI6tXe4fucREy9
YSZUBJ9ebV0SVa8smQjX8NPHHGxKJA==
=n8hC
-----END PGP SIGNATURE-----

--l6sn4pufjezkt2ci--
