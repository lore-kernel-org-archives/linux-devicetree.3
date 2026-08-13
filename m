Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D599C41D102
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618334; cv=none; b=EItpSVUl1vyAJlyVxLyAHiFTSARXXcxq0ICnJsiQNsDV4qfhLG00nvic39DlWXS7dTh5YCiqK1xmSmRyPvVcvlcBVkchoeoMHu2gJETr8mlc8kh82DNkCUhGXCAcBli3P8bGI23+vrAUgQrgpKRDgiF8KmEZhO5OHQ82M2r5zpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618334; c=relaxed/simple;
	bh=OsSsuntJKexA0BMJgHflq7lhogjFiMAFdJ94nIf3azE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BBQnAnYdiJuYX1Hog8A5C0TEcF2dwc0wXtd7eyrIAw7F0sGTYhMORlf5/R1ZaLse4lM/P13C42EMNC5ZMBkkcbrKhS3Ng3JrINzqxWegrgs2k1NGAGLqKI8DT6el1WiLwnEAsvvDt66ufJkfBhUDVHda3lFRr5XE6VAcG85FFNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O5J7aQ38; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5J7aQ38"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFB3A1F00A3D;
	Thu, 13 Aug 2026 10:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786618321;
	bh=dSUvB9bJEibE8ZOKbYg7qeeKlNQXq2+Ex+3PM69/3rE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O5J7aQ38rdMRq5CIDrPZRCAhfPtjWRntJS74nb3o8zzx61NPBvMv7fQc+cN2CPdyf
	 tlEa6L9VkldsNKa3CRnbqZk04Vv9ZsWHCdbNJC0NQoXCNd8c6J3AqyQDoYRk6cIkB/
	 8k0xbM5c8WEJ3z2EeEHteJb+GfI3jGMl/QjFoJbBNyHGiT9EpdzUnXrm/DvZawaEvs
	 PNQvvQdtzxav96RKJ6CLaDuWpnwei4vmlNMnSUdas7bARYE08+E4hd0igHcbuEP3j1
	 0dPXasy1PXv98smA1ey0/AdetlZlkY3V/gISmzcLD/OTpmZKbTF+28Eyb5JBHUVm4w
	 GPewTUb27WIjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/7] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>
Cc: devicetree@vger.kernel.org, "Michael Walle" <mwalle@kernel.org>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Takahiro
 Kuwano" <takahiro.kuwano@infineon.com>, "Richard Weinberger" <richard@nod.at>, robh@kernel.org, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, conor+dt@kernel.org
In-Reply-To: <20260812104955.485667-4-manikandan.m@microchip.com>
References: <20260812104955.485667-1-manikandan.m@microchip.com>
 <20260812104955.485667-4-manikandan.m@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 10:52:00 +0000
Message-Id: <20260813105200.EFB3A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Use-After-Free of device tree node in NVMEM device due to prematur=
e of_node_put().
--

--- Patch [3]: [PATCH v7 3/7] mtd: spi-nor: sfdp: expose the SFDP as a read=
-only NVMEM device ---
commit d892664b27bcd5da338917980297630345d51e30
Author: Manikandan Muralidharan <manikandan.m@microchip.com>

mtd: spi-nor: sfdp: expose the SFDP as a read-only NVMEM device

This commit exposes the cached SFDP table as a read-only NVMEM device
in on-flash byte order. The NVMEM device is registered only when an
sfdp node is present in the device tree.

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index ccf4396cdcd04..0425af6e898fd 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c

[ ... ]

> @@ -3001,6 +3002,75 @@ static void spi_nor_init_fixup_flags(struct spi_no=
r *nor)
> +static int spi_nor_register_sfdp_nvmem(struct spi_nor *nor)
> +{

[ ... ]

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
> +	of_node_put(np);

[Severity: High]
Does calling of_node_put() here leave the NVMEM device with a dangling
pointer to the device tree node?

The nvmem core assigns config.of_node to the underlying device structure
but does not take an additional reference count on the node itself.=20

If a device tree overlay is removed later, causing the node's reference
count to drop to zero, could this lead to a use-after-free when the nvmem
framework or sysfs subsequently accesses the node?

> +	if (IS_ERR(nvmem)) {
> +		/* NVMEM support is optional. */

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812104955.4856=
67-1-manikandan.m@microchip.com?part=3D3
