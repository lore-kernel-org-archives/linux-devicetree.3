Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C8333263F
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 13:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790257845; cv=none; b=uiiJYbGsrCiBaQnkfqOMnjTPN3Ve4BEeRuosUbvdpzmuckb4EdW8ToZbB7XrudCrWEAP4g83R4AbNx6EOpr7sai/5PSTpw3zYNeZ+2iizyMHtmmmZrf2CY0mlTEwnnLXtdcvg5ixAFtTzhL8h790ZypXcizJk3GX4A7MJS9MiKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790257845; c=relaxed/simple;
	bh=DhtXdFNCKlo5fy+qlHVpuEPor0EBoBvKd1iR6okbib0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DFt47uxO7mJmWZM0ddTUX7kdT3mCLoRRikX8rz+Dq+VIVgcHmwOe3E4HOOmBUiiwdmtMS0KJO6LlNI9b9kqsNAdAQw9NXlLWkFXonGxgHwd7c1dOtZ0rN5VBcG1x+0CAV1cOLqbDe6pyf5/2BV2HdOJW0QefetN/k39m8BYSOL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ou+/DeG7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ou+/DeG7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F561F000FF;
	Thu, 24 Sep 2026 13:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790257843;
	bh=rP/M4pI7EGA83XYbtCik6o/KQJ/h669p7L5RGMPRl34=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ou+/DeG7ApQHz26SFUYbVSIIfbu4nUJh2/Qo/Jt7CajrfJU1HQauuGvYQE+07lzep
	 FjAGy0SILbjrEHz9IVC0q4zszl3SEToTzh/Gmmbq2QgD+24YMEOoEkyrx67ALxA2rE
	 SmfHCWuiBk6gt6enRZJhppWUh/0kxqxUfIisS1xLL4e0+8YZwFokn7xqzhZO0M1/iQ
	 ricWc6zhnDzLjNQghSa8ojRPtGx/Rw2tIcls8LnDK2Gqk+AEg+hAtSDkuGiWA5JSqj
	 qNPLxfmucD4pxrKYndhmsD2CDKlkiOzpQKZtEd6iyzBD/XrzliO+SX+yUL4I/aYi42
	 a/tDowk736RsA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260924-paul-v7-3-rc1-edac-v2-2-bc1406161ecc@bootlin.com>
References: <20260924-paul-v7-3-rc1-edac-v2-0-bc1406161ecc@bootlin.com>
 <20260924-paul-v7-3-rc1-edac-v2-2-bc1406161ecc@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 13:50:42 +0000
Message-Id: <20260924135043.45F561F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] locking: uninitialized mutex priv->lock causes panic on sysfs write
- [Medium] driver-core: premature sysfs registration creates probe failure =
race
- [Low] build: FIELD_MODIFY fails build with non-constant mask parameter
- [Low] log: missing newline in edac_mc_chipset_printk format string
--

commit a0e3a033fb0a852091db86b577bfa6524860f48e
Author: Paul Louvel <paul.louvel@bootlin.com>

EDAC/cadence: Add Cadence DDR EDAC driver

This commit adds a new EDAC driver for the Cadence DDR memory controller
found on the Renesas RZ/N1x SoC. It supports single bit error correction,
double bit error detection, and software scrubbing.

> diff --git a/drivers/edac/cadence_edac.c b/drivers/edac/cadence_edac.c
> new file mode 100644
> index 0000000000000..7edac7795fa70
> --- /dev/null
> +++ b/drivers/edac/cadence_edac.c
[ ... ]
> +static void cdns_rmw(struct cdns_mc_priv *priv, u32 reg, u32 mask, u32 v=
al)
> +{
> +	u32 regval;
> +
> +	mutex_lock(&priv->lock);
> +	regval =3D readl(priv->io_base + reg);
> +	FIELD_MODIFY(mask, &regval, val);

[Severity: Low]
Will this cause a build failure on some configurations? FIELD_MODIFY
internally requires its mask parameter to be a compile-time constant,
enforced via a build-time check. Since cdns_rmw() takes mask as a standard
function parameter and isn't explicitly inlined, the compiler might not be
able to resolve it as a constant.

> +	writel(regval, priv->io_base + reg);
> +	mutex_unlock(&priv->lock);
> +}
[ ... ]
> +static int cdns_mc_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	mci->pdev =3D &pdev->dev;
> +	priv =3D mci->pvt_info;

[Severity: High]
Is priv->lock missing a call to mutex_init()?=20

The edac_mc_alloc() function allocates mci->pvt_info with kzalloc(), meaning
the mutex is zero-initialized but never properly initialized. Calling
mutex_lock() on this in cdns_rmw() can corrupt the wait list or trigger a
kernel panic, which could be reached if userspace writes to the inject_ctrl
sysfs attribute.

> +
> +	priv->io_base =3D devm_platform_ioremap_resource(pdev, 0);
[ ... ]
> +	ret =3D edac_mc_add_mc_with_groups(mci, cdns_edac_groups);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "failed to add mc\n");
> +
> +	ret =3D devm_add_action_or_reset(&pdev->dev, devm_cdns_edac_del, &pdev-=
>dev);
> +	if (ret)
> +		return ret;
> +
> +	writel(CDNS_DDR_ECC_INT_CTRL_MASK_ALL, priv->io_base + CDNS_DDR_ECC_INT=
_CTRL);
> +
> +	irq =3D platform_get_irq(pdev, 0);

[Severity: Medium]
Could exposing the sysfs interface before claiming the IRQ create a race
condition?

Calling edac_mc_add_mc_with_groups() registers the controller and exposes
sysfs attributes like inject_ctrl to userspace. If platform_get_irq() or the
subsequent devm_request_irq() defers or fails, the probe unwinds and tears
down the device. A concurrent userspace access during this window might
interact with a partially initialized or destroyed state.

> +	if (irq < 0)
> +		return dev_err_probe(&pdev->dev, irq, "unable to get irq\n");
[ ... ]
> +	edac_mc_chipset_printk(mci, KERN_DEBUG, DRV_NAME, "ECC %s",
> +			       (mci->edac_cap =3D=3D EDAC_FLAG_NONE) ? "disabled" : "enabled"=
);

[Severity: Low]
Is this format string missing a trailing newline?=20

The edac_mc_chipset_printk() macro translates directly to a printk() call
and does not append a newline character automatically. Without it, subseque=
nt
logs might end up appended to the same line in dmesg.

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924-paul-v7-3-=
rc1-edac-v2-0-bc1406161ecc@bootlin.com?part=3D2
