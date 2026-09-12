Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9FD2AD3C
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 01:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789177857; cv=none; b=NIq7AzpfgC5XAi0eJ+zRcRdha4NOE5CWX7gtpan4uqgcaRrk7i+rC+zmW8M6WdpuhGM6OfA7jhlqgRaSiwDQ0PK5ePw4IOiwOWvnNHQs3RVJM2d3MCO5Rf3UF7fh0eYkQX1sYypqe0Lookt/2oUP99GgqltQLrOvXzJz4Gm1Js8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789177857; c=relaxed/simple;
	bh=XUDoO7gdqCGr6OAZFTck3NySZ0JnRQdQ+KHEj4eTusY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R819DJvh0EVGKO1zpR00x2ERVeqJXGi5+Vt9V4oPvilhNFilqLxMLPC4sgK+xHdMenEkSwjcEVZcOd6hkfxVUmFh5nT30Svwxc4wtkW/kYhIQoRMVauZ1A8nz08VCahB3uhid+wERKm6CB9r3DFkr12vEyj2RrmiBlVqUu/pGiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BrfNGaAO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BrfNGaAO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CE4B1F000FF;
	Sat, 12 Sep 2026 01:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789177855;
	bh=jsO8+xqiK/8GwVa1IkM+6Ex1lw+3exEH4XU7gSWmEc0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BrfNGaAO31765MBwvDQE7uCG2axg4/BiBk7kcbNOx4MADW4PHaIgogljZAlH5Jk2P
	 KrpTa1A0BNkFxZjkowciNDHaGkHsdQ1YSP+IPmVwfGJnBsz4zgu17zKCra09OXPZ6Y
	 oLXe6rEB3XL1CBQtUu5h+GwuxkWyzzbwlcF/HC+viYqQG/ADgxA31q3NXmYohFPbJZ
	 kr5oTCOwdCvjEBRDNjJsocK1mDIxzZF7VOPUFSk7uqmWdlNKhPO7UD5tKmm8AFUiqn
	 E3b4l50hOtzl2SNxTJFP1oECGt91IX4UF6ZeMxa0FZ9crz9vDanDLB3j6LKDOo/5Fa
	 8rrpOp69deegg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chang Yu" <marcus.yu.56@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260912013912.51887-3-marcus.yu.56@gmail.com>
References: <20260912013912.51887-1-marcus.yu.56@gmail.com>
 <20260912013912.51887-3-marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 01:50:55 +0000
Message-Id: <20260912015055.7CE4B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Hardware state leak on error path leaves REG_BANK set, potential=
ly breaking subsequent probe attempts.
--

commit 72a91926280c648f27572174db691cdd7cd7fa33
Author: Chang Yu <marcus.yu.56@gmail.com>

iio: light: add AS7343 multi-spectral sensor driver

Add a driver for the AMS AS7343 14-channel multi-spectral sensor.
The driver exposes 12 spectral channels via sysfs and implements
runtime PM to stop measurements when suspended.

> diff --git a/drivers/iio/light/as7343.c b/drivers/iio/light/as7343.c
> new file mode 100644
> index 0000000000000..9ea6a44c35b92
> --- /dev/null
> +++ b/drivers/iio/light/as7343.c
[ ... ]
> +static int as7343_setup_device(struct device *dev, struct as7343_data *d=
ata)
> +{
> +	struct regmap *map =3D data->regmap;
> +	unsigned int val;
> +	__le16 step;
> +	int ret;
> +
> +	/* Power on */
> +	ret =3D regmap_set_bits(map, AS7343_ENABLE, AS7343_ENABLE_PON);
> +	if (ret)
> +		return ret;
> +
> +	/* Need to set REG_BANK to 1 before we can access ID */
> +	ret =3D regmap_set_bits(map, AS7343_CFG0, AS7343_CFG0_REG_BANK);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_read(map, AS7343_ID, &val);
> +	if (ret)
> +		return ret;

[Severity: Medium]
If regmap_read() fails here due to a transient I2C error, the function retu=
rns
early without clearing the AS7343_CFG0_REG_BANK bit.

Since the device is left in bank 1, and power might not be cut on probe
failure (for example, if the vdd regulator is shared or a dummy regulator),
could this cause subsequent probe attempts or deferred probes to fail becau=
se
the hardware is in an unexpected state?

> +
> +	if (val !=3D 0x81)
> +		dev_info(dev, "Unknown device ID: %x\n", val);
> +
> +	ret =3D regmap_clear_bits(map, AS7343_CFG0, AS7343_CFG0_REG_BANK);
> +	if (ret)
> +		return ret;
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912013912.5188=
7-1-marcus.yu.56@gmail.com?part=3D2
