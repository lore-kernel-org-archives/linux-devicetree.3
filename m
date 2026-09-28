Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057F37A843
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 10:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790592923; cv=none; b=NdfnfYzp2L+EL+UqbMKO20xB14AcG/GY577iIrdzIuqVrGU/7oFHjR7/ZlB70Z0R0ukUMhIb7+9WNYPCem3xgw6IADRNJPj2/QFbeAsanl+3Kft3c+8XXEhUvsA5/KYtZB+GRAa8vb3qDLMzKkJjfe6CzSwF6mmxplO4b1qC7+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790592923; c=relaxed/simple;
	bh=ODgW4EyWJLBwqv9lYN/NzlVxulfOJS9Zh6B4atKEq24=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C9cctCRHF+8XZHRT2wTNbTbxsMQGiuRPc6BMVg00NiKKWwvKOL/TWWxmC3P9DZePCt3PKrXj6GkzuTCQu9/hbG6Gg8VVRywvekYb4O3VK/CaywPWmUSCDF6PXSc1b4SonPthc5hbiobKdFB/uA/nYPKzZghI/N9wCBKuH1f6LVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gZz9JX90; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gZz9JX90"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC471F000FF;
	Mon, 28 Sep 2026 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790592921;
	bh=h/62yJ63NjhlI5gD7fM2KRgJx07sYVgJA2n7CrGEQZc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gZz9JX9036kK7jcYbTex5aqKBlZQX3n+zN5a97nBo63Dppoihq5XgThAxP/Dc/TJI
	 DQAyOKZz3hyT62BbYQFuEGLsN1MkSIPBZtit6yjkVy444znKWNXGCGhZjsnauFf7al
	 5Xu72YZcn+mf2aaqqZwybEyrn5E/7nUBm5NgofhVuuc2wuzh3o+uMnApxYgmP4VreL
	 UwZSxIfx4Bwgkas23T2jgpaE293cBzHGVeGm++2tkSRFlcN68RAs+/b7OEI0FMCG3S
	 nPFl18i1IZuf6AlDs9ojYZw+bHi+WVfNsf64nHJ/luZOrP27cZWgBqSpwKidBXbC0+
	 5X+eeRzIxJi8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Paul Louvel" <paul.louvel@bootlin.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20260928-paul-v7-3-rc1-edac-v4-2-4646a5b7cac9@bootlin.com>
References: <20260928-paul-v7-3-rc1-edac-v4-0-4646a5b7cac9@bootlin.com>
 <20260928-paul-v7-3-rc1-edac-v4-2-4646a5b7cac9@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 10:55:21 +0000
Message-Id: <20260928105521.9BC471F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] edac: use-after-free of mci structure in interrupt handler
- [Medium] edac: incomplete memory size calculation misses discontiguous ba=
nks
--

commit a92ae5cd8100995af0607d832e0079266536f567
Author: Paul Louvel <paul.louvel@bootlin.com>

EDAC/cadence: Add Cadence DDR EDAC driver

Add the Cadence EDAC driver found on Renesas RZ/N1x SoC.
The memory controller supports ECC, software scrubbing, and SECDED.

> diff --git a/drivers/edac/cadence_edac.c b/drivers/edac/cadence_edac.c
> new file mode 100644
> index 0000000000000..3f27bbb94c53c
> --- /dev/null
> +++ b/drivers/edac/cadence_edac.c

[ ... ]

> +static int cdns_get_mem_sz(resource_size_t *mem_sz)
> +{
> +	struct device_node *np;
> +	struct resource res;
> +	int ret;
> +
> +	np =3D of_find_node_by_name(NULL, "memory");
> +	if (!np)
> +		return -ENODEV;
> +
> +	ret =3D of_address_to_resource(np, 0, &res);

[Severity: Medium]
By hardcoding index 0 in of_address_to_resource(), does this calculation
only fetch the first contiguous memory region? On systems with multiple
memory nodes or discontiguous memory banks, it appears this will
under-report the total system memory capacity to the EDAC core. Could we
iterate over all available memory regions instead?

> +
> +	of_node_put(np);

[ ... ]

> +static int cdns_setup_irq(struct platform_device *pdev, struct mem_ctl_i=
nfo *mci)
> +{
> +	int irq, ret;
> +
> +	irq =3D platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return dev_err_probe(&pdev->dev, irq, "unable to get irq\n");
> +
> +	ret =3D devm_request_irq(&pdev->dev, irq, cdns_mc_err_handler, 0, dev_n=
ame(&pdev->dev), mci);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "unable to request irq %d\n", ir=
q);
> +
> +	return 0;
> +}

[ ... ]

> +static int cdns_setup_mc(struct platform_device *pdev, void __iomem *io_=
base)
> +{

[ ... ]

> +	ret =3D cdns_setup_irq(pdev, mci);
> +	if (ret)
> +		goto free_edac_mc;
> +
> +	ret =3D edac_mc_add_mc(mci);
> +	if (ret) {
> +		dev_err_probe(&pdev->dev, ret, "failed to add mc\n");
> +		goto free_edac_mc;
> +	}
> +
> +#ifdef CONFIG_EDAC_DEBUG
> +	cdns_setup_debugfs(mci);
> +#endif
> +
> +	edac_mc_chipset_printk(mci, KERN_DEBUG, DRV_NAME, "ECC %s\n",
> +			       (mci->edac_cap =3D=3D EDAC_FLAG_NONE) ? "disabled" : "enabled"=
);
> +
> +	return 0;
> +
> +free_edac_mc:
> +	edac_mc_free(mci);

[Severity: High]
In the probe error path, mci is explicitly freed while the devres-managed
interrupt handler is still registered. Since hardware interrupts are trigge=
red
asynchronously, could a spurious interrupt fire before the devres cleanup
runs?

If it does, the interrupt handler cdns_mc_err_handler() will dereference the
freed mci and priv pointers:

static irqreturn_t cdns_mc_err_handler(int irq, void *dev_id)
{
        struct mem_ctl_info *mci =3D dev_id;
        struct cdns_mc_priv *priv =3D mci->pvt_info;
        ...

Would it be safer to explicitly free the irq or use the non-devres variant
of request_irq() to ensure it is freed before the mci structure?

> +	return ret;
> +}

[ ... ]

> +static void cdns_mc_remove(struct platform_device *pdev)
> +{
> +	struct mem_ctl_info *mci =3D platform_get_drvdata(pdev);
> +	struct cdns_mc_priv *priv =3D mci->pvt_info;
> +
> +	writel(CDNS_DDR_ECC_INT_CTRL_MASK_ALL, priv->io_base + CDNS_DDR_ECC_INT=
_CTRL);
> +#ifdef CONFIG_EDAC_DEBUG
> +	edac_debugfs_remove_recursive(priv->debugfs);
> +#endif
> +	edac_mc_del_mc(&pdev->dev);
> +	edac_mc_free(mci);

[Severity: High]
Similarly, since the interrupt handler was registered using devm_request_ir=
q(),
its cleanup is deferred until after this remove function completes. Does
explicitly calling edac_mc_free() here create a window where a concurrent
interrupt could fire and access the freed mci structure?

Even though interrupts are masked at the device level earlier in this
function, an interrupt handler could already be executing concurrently on
another CPU when edac_mc_free() is called.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-paul-v7-3-=
rc1-edac-v4-0-4646a5b7cac9@bootlin.com?part=3D2
