Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D693AC0EC
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786113587; cv=none; b=fe6Dmh8pLKUWPTwzurjuQg0SiKSWPl1I7Azoa+3pEBuw9xQuzMM4OyAx2l+nk95rRUkkyhGYZLExYRSCrqgMcNgIGqB5hThUdl7sthPtlVGeen6rfgR9APeaNpr//Ac34t50A37gbTDRfoLTZ6ErS2F7QbVqR+/rofZG0bsLt2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786113587; c=relaxed/simple;
	bh=qEtECZ/J0Ib3WNpJqOc1ZxTp0ykkSA0NER5U0OdRbno=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=q+ivAqmoQKNVGYajg2Djr8EAa8k8NBnpRmCuyd8fUrvgO/6Ob8f0d8JCIXtz22ZhE3Q5pVt3bkhqZBSi73cFUZMU9SmFjo2HZ3l53McVeqANAdMhZD8UhHI5gjqaRQ7pvZ0ZaVd+XaylJlr+A/AFbXJE+Fi6lB/hi+wdbL+/kDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxhctqJo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxhctqJo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF591F00A3F;
	Fri,  7 Aug 2026 14:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786113572;
	bh=J7EJIZDT+QZjxS7+Tew48C1xnB7yJAi5RjVRz2pSBoI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mxhctqJoPOrTw21ZRwnuvJXtikM2SQCCN6UMPp0lTYXsi/ycwo/peUztT/t3q12vY
	 j352FQDC3jwa/1T4IOxyngpKpMhFXrspljUUZbiWJzL2i1pLBvZw6EaIlp0qIQd7/0
	 wGk9WiZ15UKN3IUvMQQJgqvByRJp8jAtbSQUxZc+CW5T3KjrEDlRzgSm90rbHi3Y82
	 5tNlIJQw/QruAL1fQ8i9BHXHWpX/yuWi2FWQxtnCLNHYGt7JCOu+QJC7iAIfXfhee5
	 ghbaQToS4bAVDalIPm5S6Chxk3f6N0mKAlFSWpabIGdqOL/XRHSHZc69LYm1BAu2M/
	 nOlrN/lUBBZZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 04/10] nvmem: layouts: Support fixed-layout as the
 nvmem device node itself
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260806-block-as-nvmem-v10-4-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
 <20260806-block-as-nvmem-v10-4-be598b2a5606@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 14:39:31 +0000
Message-Id: <20260807143931.ECF591F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] A device tree updated to explicitly mark a legacy NVMEM provider w=
ith `compatible =3D "fixed-layout"` will cause duplicate cell registration =
and fail the driver probe.
--

--- Patch [4]: [PATCH v10 04/10] nvmem: layouts: Support fixed-layout as th=
e nvmem device node itself ---
commit d0f87955eb48c0cfb8be42e6d6cfadf192c1f792
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

nvmem: layouts: Support fixed-layout as the nvmem device node itself

The commit modifies of_nvmem_layout_get_container() to fall back to returni=
ng
the nvmem device node itself if it's compatible with "fixed-layout". This
allows cell parsing for providers whose DT node is the fixed-layout contain=
er
directly.

> diff --git a/drivers/nvmem/layouts.c b/drivers/nvmem/layouts.c
> index b90584e1b99ea..efa631ce7283b 100644
> --- a/drivers/nvmem/layouts.c
> +++ b/drivers/nvmem/layouts.c
> @@ -167,7 +167,18 @@ static int nvmem_layout_bus_populate(struct nvmem_de=
vice *nvmem,
> =20
>  struct device_node *of_nvmem_layout_get_container(struct nvmem_device *n=
vmem)
>  {
> -	return of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
> +	struct device_node *np;
> +
> +	/* Search for nvmem-layout child */
> +	np =3D of_get_child_by_name(nvmem->dev.of_node, "nvmem-layout");
> +	if (np)
> +		return np;
> +
> +	/* The nvmem of_node is itself a fixed-layout node */
> +	if (of_device_is_compatible(nvmem->dev.of_node, "fixed-layout"))
> +		return of_node_get(nvmem->dev.of_node);

[Severity: High]
Does this new logic allow a legacy provider's device node to be returned as=
 a
fixed-layout container and parsed a second time?

If a device tree author updates a legacy NVMEM provider node (where the dri=
ver
sets config->add_legacy_fixed_of_cells =3D true) to explicitly include the
"fixed-layout" compatible property, nvmem_register() will parse it twice:

drivers/nvmem/core.c:nvmem_register() {
    ...
	if (config->add_legacy_fixed_of_cells) {
		rval =3D nvmem_add_cells_from_legacy_of(nvmem);
		if (rval)
			goto err_remove_cells;
	}

	rval =3D nvmem_add_cells_from_fixed_layout(nvmem);
	if (rval)
		goto err_remove_cells;
    ...
}

Because nvmem_add_one_cell() does not check for duplicates, identical cells
will be appended, causing nvmem_populate_sysfs_cells() to fail with -EEXIST
and cleanly abort the driver probe.

> +
> +	return NULL;
>  }
>  EXPORT_SYMBOL_GPL(of_nvmem_layout_get_container);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806-block-as-n=
vmem-v10-0-be598b2a5606@oss.qualcomm.com?part=3D4
