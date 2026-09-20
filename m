Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D3053C4B64
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 12:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789908820; cv=none; b=GMeYWjhs+ocFqY4tQQfQJHAlMSu2xtVPdMeyG593g6M3xe2MvcKblJzOa7YyFY4092kPlWVHAmxollxbDUyBi6rfp1wG7LFZOBu3SdFGZQIHOYI7apAegFIFSbduwLw8MWwH3LP3ju4vbD5boFWq64m4If5tsriXAAX3QRYjUzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789908820; c=relaxed/simple;
	bh=R4UcuqzIlFWHBmzfgEM5UeCp1dFiViecARR39DX9uzY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HGZFt7RnZv2vKVgUZGRjG/SY90n9DNOumujmRtQmPkAhJkYLeV63+JTth7aNrPNXl+bKel2LnuMGGxSDY9bLZQAc2zZgNhJC2Lwhela9UH4vJ562100XwHsKpg6at4G2ZMhpWc1+eVwC5Z5aynLaVWYDvFN5oyavxrIbqg9b5Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aY6ZDoRu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aY6ZDoRu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D9001F00893;
	Sun, 20 Sep 2026 12:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789908799;
	bh=v2l60P4XbYSqxLiNQ8qMCT/wM2wFsRk4MS6VFdhfcT8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aY6ZDoRuX5g8Q/4j1I9SAc4qGTr7860RAN/xeYOYo+gu3Rap5/2T3zmNv6ICaVRhR
	 xJRoA3FjUvBtCtwrcMM0L91UzN9gJdDCKxge7r2uHeFD4b7wCbjWdtU4xPVV5Dkacp
	 OfpuLpAQAVPZT1spzrL0pVeDIwgiOvXe5m9l4PS9eA5D2kaDf/ceUpBnLUioCT99In
	 pscJU3xTvnlID9ljUMm7f9F0ZNBS00pevyK0z4NRRwZM3dFF91BcRMF+0Us928tYUQ
	 /Vn9n1SCIrVkEFVRWP+4zgFa6RUXYNoo4Xt4hfLGDwGmvU2y+aPtNI0vSxtcmv3/aw
	 51IiYUpY7h79Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 07/11] net: pcs: xpcs: add Rockchip RK3568
 platform glue driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: conor+dt@kernel.org, wsa+renesas@sang-engineering.com, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, vkoul@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org
In-Reply-To: <20260919125119.2107089-8-coiaprant@gmail.com>
References: <20260919125119.2107089-1-coiaprant@gmail.com>
 <20260919125119.2107089-8-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 12:53:19 +0000
Message-Id: <20260920125319.8D9001F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] net: pcs: xpcs-rk: UAF in xpcs_rk_create due to TOCTOU and unprote=
cted devres access
--

commit 2e7f490907e83788481369bf43ad35abe0d56504
Author: Coia Prant <coiaprant@gmail.com>

net: pcs: xpcs: add Rockchip RK3568 platform glue driver

This commit introduces a generic platform glue driver for the Synopsys
DesignWare XPCS on Rockchip RK3568 SoCs. It translates standard MDIO
operations into APB3 memory-mapped register accesses by creating a
virtual MDIO bus.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part1%20V1.1-20210301.pdf
Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part2%20V1.1-20210301.pdf

> diff --git a/drivers/net/pcs/pcs-xpcs-rk.c b/drivers/net/pcs/pcs-xpcs-rk.c
> new file mode 100644
> index 0000000000000..84f8ea7fa57e8
> --- /dev/null
> +++ b/drivers/net/pcs/pcs-xpcs-rk.c

[ ... ]

> +struct dw_xpcs *xpcs_rk_create(struct device *dev, struct device_node *n=
p)
> +{
> +	struct platform_device *pdev;

[ ... ]

> +	if (!device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_CONSUMER)) {
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	device_lock(&pdev->dev);
> +	if (!device_is_bound(&pdev->dev)) {
> +		device_unlock(&pdev->dev);
> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +	device_unlock(&pdev->dev);
> +
> +	pxpcs =3D platform_get_drvdata(pdev);
> +	if (!pxpcs || !pxpcs->bus) {

[Severity: High]
Can this result in a use-after-free of the supplier devres data?

If the XPCS driver unbinds while a second MAC consumer probes, the newly
created device link will be in the DL_STATE_SUPPLIER_UNBIND state. Because
of this state, device_links_unbind_consumers() ignores it and does not wait.

Since the device_lock() is dropped before calling platform_get_drvdata(),
could the unbind finish and free the pxpcs devres allocation before we
dereference pxpcs->bus below?

CPU1 (Supplier Unbinding)             CPU2 (Consumer Probing)
                                      device_link_add()
                                      device_lock()
                                      device_is_bound() returns true
                                      device_unlock()
unbind completes
devres frees pxpcs
                                      pxpcs =3D platform_get_drvdata(pdev);
                                      xpcs_create_mdiodev(pxpcs->bus, ...)

> +		put_device(&pdev->dev);
> +		return ERR_PTR(-EPROBE_DEFER);
> +	}
> +
> +	xpcs =3D xpcs_create_mdiodev(pxpcs->bus, (int)port);
> +	if (IS_ERR(xpcs)) {
> +		put_device(&pdev->dev);
> +		return xpcs;
> +	}

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260919125119.2107=
089-1-coiaprant@gmail.com?part=3D7
