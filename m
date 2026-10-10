Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCA948F030
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 13:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791638064; cv=none; b=N1ReevK0Yf2JvEyVTCx29bk6JRYSgvUKXW2mgTtj5cicNVwxD+rtQvWesr+Jf3NVVTyVb1SdDdENkJy6Si1/16691ONXHPzh4rZlPJWXI+8A7LpAM3FML6qdC8iKdH/ixxPNFgNdIHD5JCGOXAmylOlw884FqHuoFjK8BdS0hs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791638064; c=relaxed/simple;
	bh=uGb7EECgc7DJV5gScQL0HJA5PLqWNFpNvYkJsd1Yghw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=h2NHKEytHOA5mVj9Loh8hpANwbJK+O3H77bvAvn//+8k1cvcJKcyPxFwEI7UiYw/7su8lMFpHDlAg7aJDyhve52v7f2DGzUHTKYArliDPYNDVSQQaRUBi33BI7PHu399QizbR37xHJSIVgZtYopAdPyP8En0429s8gc51nFgND0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/N49PPX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/N49PPX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F851F000FF;
	Sat, 10 Oct 2026 13:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791638063;
	bh=DFHMp15EmosJTI+glRkodkhjnraHh08fID9QyvLnzFs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b/N49PPX9DszLtHrc3MtdFbGae9Rwbft5baCGn+iEyssD3nKrdQJQ4xy6zK8LGDJy
	 jhVNIw7wXMEgNPJp/7lpb/81/oq38mPtoynCHYO9neO8VW7UPp1KYJ3ZT8Jx5NpxXn
	 wKrA5LkVYB8achMibVEF7eST4NI+ew7aJs8VU2ooE9oYcLFq9Q2qp9SHeZHPeieqiw
	 r8y7WUvklFN6F83DYud+Qy0kLjznn7T8fcQY5o/k1Wh3OYy5yCFGSzRkrK6OfydyKc
	 x0rG6DLtx80PeFZIOQFMZxyiLNOC6RdwziqFLHm1BVI0Aig84BU3bpBGboOsGi3GAZ
	 qZ1hTy1vYW/5Q==
Message-ID: <sashiko-outbox-166577@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/24] gpio: Add ZTE ZX279128S GPIO driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navid Ghahremani" <ghahramani.navid@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261010130024.177503-10-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-10-ghahramani.navid@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 13:14:22 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] gpio: mmio: 16-bit I/O access to 32-bit aligned registers may caus=
e bus faults
--

commit 827bf2313ced7a306a6c929c27e8898eb758b78c
Author: Navid Ghahremani <ghahramani.navid@gmail.com>

gpio: Add ZTE ZX279128S GPIO driver
   =20
Expose the six banks using the generic GPIO implementation and enable
the register clock before accessing the bank.

> diff --git a/drivers/gpio/gpio-zx279128s.c b/drivers/gpio/gpio-zx279128s.c
> new file mode 100644
> index 0000000000000..8f37b908bb007
> --- /dev/null
> +++ b/drivers/gpio/gpio-zx279128s.c
[ ... ]
> +/*
> + * Each bank has 16 lines, one bit per line in each register. The regist=
ers
> + * at 0x04-0x10 and 0x28-0x34 control the interrupts, which are not supp=
orted
> + * yet.
> + */
> +#define ZX279128S_GPIO_DIR	0x00	/* 1: output */
> +#define ZX279128S_GPIO_DATA	0x14	/* line level */
> +#define ZX279128S_GPIO_SET	0x18	/* write 1: drive high */
> +#define ZX279128S_GPIO_CLEAR	0x1c	/* write 1: drive low */
> +
> +static int zx279128s_gpio_probe(struct platform_device *pdev)
> +{
> +	struct gpio_generic_chip_config config =3D { };
[ ... ]
> +	clk =3D devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "failed to get the clock\n");
> +
> +	config.dev =3D dev;
> +	config.sz =3D 2;

[Severity: High]
Does configuring the GPIO framework for 16-bit I/O access on 32-bit aligned
hardware registers risk triggering bus faults?

The register offsets defined above (0x14, 0x18, 0x1c) are 4-byte aligned,
which indicates they are likely 32-bit hardware registers. Setting config.sz
to 2 causes the generic framework to use 16-bit memory accessors, and
performing 16-bit accesses to 32-bit peripheral registers on ARM APB/AHB
buses typically causes bus faults.

Would it be safer to set config.sz =3D 4 for safe 32-bit accesses, and
explicitly restrict the line count by setting chip->gc.ngpio =3D 16 before
calling gpio_generic_chip_init()?

> +	config.dat =3D base + ZX279128S_GPIO_DATA;
> +	config.set =3D base + ZX279128S_GPIO_SET;
> +	config.clr =3D base + ZX279128S_GPIO_CLEAR;
> +	config.dirout =3D base + ZX279128S_GPIO_DIR;
> +
> +	ret =3D gpio_generic_chip_init(chip, &config);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261010130024.1775=
03-1-ghahramani.navid@gmail.com?part=3D9
