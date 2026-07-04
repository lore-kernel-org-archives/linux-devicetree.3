Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548C629408
	for <devicetree@vger.kernel.org>; Sat,  4 Jul 2026 13:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783172755; cv=none; b=jCgBuMzxHaUg0QSWO5Rw3XLrdBxtsfWK7HP7d7IG4Gaxuu4hv90OwuXGsGh5EbBr295GAXSja/syZdUWRJa9KRYi27hhOjJ69kdS0hkmlCaiT4dllu/te1JpYMpLKx0W+SjMLEJ0W/FQJE68AMjLrXKwoj0ZwZvfRGoiwnSqHls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783172755; c=relaxed/simple;
	bh=XX0rlxQKlC72XbF8JJPz0j0CDcsiZ9Mng6bJ0nwlZqA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X3Ko2FfBosTyPEDqUwQIp3aMxdf3oaoZ7MPveqGl510C1b3tXZ2hCObAVpGAUuy/VmiP10yyOJygivvs/U1jcM4aZ1awdRjXkNvotflVtEkIDcvPjTqJJlCv8NYq2BUCsEuMNkzMkuGKV2lE4TQjmlH35CAiRbpEwIjuZySspkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e33lS//5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e33lS//5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 979031F000E9;
	Sat,  4 Jul 2026 13:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783172753;
	bh=c5Kz2dfxCpYzCiMfFQfjMy4crys0bea2FZsaF1RX92k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=e33lS//5u3UjOArJhg0VTkx5KnY4o82rQ/XVhK+t2Po0T/EW/HEFI9na2ahdsBlsR
	 zfxEyPoWLhrShsGp0wU6Ve9KpTgHNkWXmK9ln2DdzFylJYFX/9bwe6yz+xSMLXUdzB
	 pnk/8sA2IPXg1+gdReIZA6dg3upN/QwyCr6CHILR0Rtp0dBBQaZoXSL9wKirnf+Zxm
	 JCaLTvPvfpz+ZvrCtw8ETrUK/ihi0Bw2Em3KezJQ3NBsT09XKUc8/EAPcoE/e5fmIk
	 XvlhFqsjv704gsIlpPUYA70nL6yzWoysJ9VT4q9S+hFNMBgQ6LRkneB9MQuB9XOrnn
	 dxjkcVBe4mseg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 4/9] nvmem: layouts: Support fixed-layout as the
 nvmem device node itself
Reply-To: sashiko-reviews@lists.linux.dev
To: "Loic Poulain" <loic.poulain@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260703-block-as-nvmem-v8-4-98ae32bfc49a@oss.qualcomm.com>
References: <20260703-block-as-nvmem-v8-0-98ae32bfc49a@oss.qualcomm.com>
 <20260703-block-as-nvmem-v8-4-98ae32bfc49a@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 13:45:53 +0000
Message-Id: <20260704134553.979031F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Double parsing of NVMEM cells leading to duplicate sysfs entries=
 and device probe failure when a legacy provider adds the `fixed-layout` co=
mpatible string.
--

commit 5ae6267ddd6db9a2a2626cb61243805bccbca0b9
Author: Loic Poulain <loic.poulain@oss.qualcomm.com>

nvmem: layouts: Support fixed-layout as the nvmem device node itself

This commit modifies of_nvmem_layout_get_container() to return the nvmem
device node itself if it lacks an "nvmem-layout" child but has the
"fixed-layout" compatible string.

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

[Severity: Medium]
Could this lead to double parsing of NVMEM cells and device probe failures
for legacy providers?

If a legacy provider (which sets config->add_legacy_fixed_of_cells =3D true
in its driver) updates its device tree node to include the "fixed-layout"
compatible string, it looks like nvmem_register() might parse the cells
twice:

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

Because of_nvmem_layout_get_container() now returns the nvmem device node
itself, both functions would process the same child nodes.

Would nvmem_populate_sysfs_cells() then fail with -EEXIST due to duplicate
sysfs entries and abort the device registration?

> +
> +	return NULL;
>  }
>  EXPORT_SYMBOL_GPL(of_nvmem_layout_get_container);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703-block-as-n=
vmem-v8-0-98ae32bfc49a@oss.qualcomm.com?part=3D4
