Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16E483DA7DC
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046527; cv=none; b=t/z8U53pj5gGNX3trYgfHJ5s5RoV2Rvp4cbZ3dfBPfmK/Jc1TS951xsLJ6W6whjTX6DRjwwuvBrjKHZW5nuqStXH1MBqxYbkd+GBH+BMmK+YpnazcJi/LKILakRJ9jW6r3Xcchj8qlCH/C0Om8f8YS5TlYZRWfZRmAipvARj33Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046527; c=relaxed/simple;
	bh=nHw4Au4zgLZpJPJc4V6cTyT6udtJ7vL/DGaTtcYg0mM=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=KSg+si9RKilBMP67kcxukNxjY7h7UH8DzkQmmQBZn8oXJZ8TvXZIwNQiyQnmJHrrVGqsnhExxD5hA6YZBXRoVTN5drRo6P3YvFLF80Js3nzLWZbKJYuDQoZIyA/s0V2jjvGN1UFEaX+2VVNNp3eHoHp41jAkCAowvX0k1iIWhvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ViRn7HtH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ViRn7HtH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40AAD1F000C4;
	Thu, 15 Oct 2026 06:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792046525;
	bh=yujhiawfe9b4DmMrS4ot+YODzfxuwyGBR02ykO0KMlA=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=ViRn7HtHAkoxsK1UoA2Fs0Ibi2g6KWnZucm9nXNbv47qkMMKi5Dzi2BEelt0XWrI4
	 4v9IOs1wDo6hN1B4YfPOZSW/I9gKQd++Ozf6sVpLIxsvsUdJTLYdScH6CEpy3cnRII
	 VSBir92Uo8WkVDLldjAJCg1Ihogse2Bzb5taLKJPjybmdmsCuHMcqYZlN/IKkjHB9B
	 BfGDnzHXfnVkVMCL9XrcSIcKOFk/fjhV1uC79BXtoFuuq967J5LG3F1Uve59l+dnri
	 2FEFNKP1+Hdy0QtGsnZw/IUAmX0qHs896+1/au7qVf1n7PlvE7bQXfxGQyDbTy+MKi
	 wKsQoc4ybadLg==
Message-ID: <sashiko-outbox-172348@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/8] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, linusw@kernel.org, arnd@arndb.de, aaro.koskinen@iki.fi, gregkh@linuxfoundation.org, mathieu.dubois-briand@bootlin.com, michael@walle.cc, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <093672d183a06dc2f37366b2f9ff144316850863.1790847519.git.manikandan.m@microchip.com>
References: <cover.1790847519.git.manikandan.m@microchip.com>
 <093672d183a06dc2f37366b2f9ff144316850863.1790847519.git.manikandan.m@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 06:42:03 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mtd: spi-nor: UAF of SFDP cached data via NVMEM cell consumer afte=
r unbind
--

commit 27ebe83329cdf6f2e062cc50041bbf3a877fcaba
Author: Manikandan Muralidharan <manikandan.m@microchip.com>

mtd: spi-nor: sfdp: expose the SFDP as a read-only NVMEM device

This commit exposes the SFDP tables read from the SPI NOR flash as a
read-only NVMEM device. The device is conditionally registered when a
jedec,sfdp child node is present in the device tree, allowing consumers
to reference any SFDP data.

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c

[ ... ]

> +static int spi_nor_sfdp_reg_read(void *priv, unsigned int offset,
> +				 void *val, size_t bytes)
> +{
> +	struct spi_nor *nor =3D priv;
> +	struct sfdp *sfdp =3D nor->sfdp;
> +	size_t sfdp_size =3D sfdp->num_dwords * sizeof(*sfdp->dwords);
> +
> +	if (offset >=3D sfdp_size || bytes > sfdp_size - offset)
> +		return -EINVAL;
> +
> +	/* The cached SFDP is kept in on-flash (little-endian) byte order. */
> +	memcpy(val, (u8 *)sfdp->dwords + offset, bytes);

[Severity: High]
Does this code introduce a potential use-after-free if the SPI NOR device is
unbound while an NVMEM cell consumer still holds a reference?

When an in-kernel consumer driver obtains an NVMEM cell reference to the
SFDP device, it increments the nvmem_device reference count. Later, if the
SPI NOR device is unbound via sysfs, the devres framework runs
devm_nvmem_unregister.

Looking at nvmem_unregister in drivers/nvmem/core.c, it only drops the
provider's reference count. It does not explicitly block future reads, clear
the operations pointer, or disconnect active consumers. Because the consumer
still holds a cell reference, the nvmem_device object and its reg_read ops
remain active.

Devres then proceeds to free the nor struct and nor->sfdp->dwords buffers
which were allocated earlier in the probe sequence.

If the consumer subsequently calls nvmem_cell_read, the read is forwarded
to spi_nor_sfdp_reg_read, which dereferences the already freed nor and sfdp
memory.

> +
> +	return 0;
> +}

[ ... ]

> +static int spi_nor_register_sfdp_nvmem(struct spi_nor *nor)
> +{
> +	struct device *dev =3D nor->dev;
> +	struct nvmem_config config =3D { };
> +	struct nvmem_device *nvmem;
> +	struct device_node *np;
> +
> +	if (!nor->sfdp)
> +		return 0;
> +
> +	np =3D of_get_compatible_child(dev_of_node(dev), "jedec,sfdp");
> +	if (!np)
> +		return 0;
> +
> +	config.dev =3D dev;
> +	config.of_node =3D np;
> +	config.name =3D "sfdp";
> +	config.id =3D NVMEM_DEVID_AUTO;
> +	config.owner =3D THIS_MODULE;
> +	config.read_only =3D true;
> +	config.word_size =3D 1;
> +	config.stride =3D 1;
> +	config.size =3D (int)(nor->sfdp->num_dwords * sizeof(*nor->sfdp->dwords=
));
> +	config.reg_read =3D spi_nor_sfdp_reg_read;
> +	config.priv =3D nor;
> +
> +	nvmem =3D devm_nvmem_register(dev, &config);

[Severity: High]
Is there a risk to binding the NVMEM registration to the devres lifecycle
here?

Since devres tears down in reverse order, devm_nvmem_unregister will run
before the SFDP memory is freed. But as noted above, this does not safely
destroy the NVMEM device if a consumer is holding a cell reference, allowing
the operations pointer to outlive the memory it accesses.

> +	of_node_put(np);
> +	if (IS_ERR(nvmem)) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790847519.gi=
t.manikandan.m@microchip.com?part=3D4
