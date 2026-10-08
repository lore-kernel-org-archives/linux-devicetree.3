Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4504648FF75
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453593; cv=none; b=K7IwitU1TfPBkKHPHkNjCYs1t4punq+ELOX9WMFKy/jQbn+gD4bgCSUFB6mmhH3THKsDKkiq/GZ5dcatx6ureZW0ND8RXKTvXayLOgwpVFaxOs3+zRXzPePRJwGroUPT64aCUn+JMqvJzWD5J2+wWoeji2E1ajNiwaJLftoansM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453593; c=relaxed/simple;
	bh=ZCh1vwPaSCJ+pOEAmrLAy1fXhFKvi/y2VvSmhhnNiCE=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=lFMWzwXv0e4KDyXUr2fhJSUefdftQAhjmPE6WVfCFFvYRJ/0W73XXZdf36gvbalLNYWb+v3yDh2oEx82nK2WhxOzi8tpFG6k6ynyRs5MT6WBZbfwoItj6zo9N9+9QGyrFZIxDJz0CfhHaHi+wkdO0P5+v8PQ6OiOxUJ8uLLid5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Va2pwPyd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Va2pwPyd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACEF91F000FF;
	Thu,  8 Oct 2026 09:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791453591;
	bh=SFzec6GxjNEDAB6yjU5QPZUl091F5Abr9OyK2KNV5T8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Va2pwPydZtO7slcAcQ4iCnXM5z+8cXnmACh+mJ4qWCRZ+s2fO8hc7CIti1K+j3dA6
	 aBS9YOjGyXDccp5sbIvRD789jSXK4WE+VVKcOYxMd1+EMJisu8BX2mag6bzI2iv5Bw
	 TK3F8nBtLmKkIiPft+5Yv0UoJ7eAkAaMoQS0knMxO/QYcApql2tjXibLmGqH1/Dzjq
	 kj1OmkqZyyGxtI8AnmKcwPLj5OF1Zkr5tt2FQ/GttH4YDJ5wxkmfkUG/5RYcRyoLJW
	 6YP4cHGvgW1iNI45NMCMCc3CetED1Bo19AXUIX/WULUj+lyApyMlbWNyx+Ef9Tu3Bt
	 ERnI9d7BM3QNA==
Message-ID: <sashiko-outbox-163975@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] of: reserved_mem: allocate and map the reserved_mem
 array early
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Szyprowski" <m.szyprowski@samsung.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261008094125.3197971-3-m.szyprowski@samsung.com>
References: <20261008094125.3197971-1-m.szyprowski@samsung.com>
 <CGME20261008094130eucas1p1120c66c914aa2b93fa3d7e6e494e7eea@eucas1p1.samsung.com>
 <20261008094125.3197971-3-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:59:51 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] of: reserved_mem array allocated before static regions are reserved
--

commit cee7768ed6d5a3ae8d8c64404da579769becebbc
Author: Marek Szyprowski <m.szyprowski@samsung.com>

of: reserved_mem: allocate and map the reserved_mem array early

This commit replaces the statically-sized reserved_mem array with a
dynamically allocated array using memblock_alloc_raw(). It accesses the
array through a temporary early mapping so that all regions can be processed
in a single early boot scan.

Link: https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c

[ ... ]

> @@ -381,143 +376,89 @@ static void __init __rmem_check_for_overlap(void)

[ ... ]

>  int __init fdt_scan_reserved_mem(void)
>  {
> -	int node, child;
> -	int dynamic_nodes_cnt =3D 0, count =3D 0;
> -	int dynamic_nodes[MAX_RESERVED_REGIONS];
> +	struct reserved_mem *array, *map;
> +	size_t array_bytes;
> +	int node, child, cnt;
>  	const void *fdt =3D initial_boot_params;
> =20
>  	node =3D fdt_path_offset(fdt, "/reserved-memory");
> -	if (node < 0) {
> -		total_reserved_mem_cnt =3D 0;
> +	if (node < 0)
>  		return -ENODEV;
> -	}
> =20
>  	if (__reserved_mem_check_root(node) !=3D 0) {
>  		pr_err("Reserved memory: unsupported node format, ignoring\n");
> -		total_reserved_mem_cnt =3D 0;
>  		return -EINVAL;
>  	}
> =20
> -	fdt_for_each_subnode(child, fdt, node) {
> -		const char *uname;
> -		int err;
> +	/* First pass: count the entries needed for the reserved_mem array */
> +	cnt =3D count_reserved_mem_nodes(fdt, node);
> +	if (!cnt)
> +		return 0;
> =20
> -		if (!of_fdt_device_is_available(fdt, child))
> -			continue;
> +	array_bytes =3D array_size(cnt, sizeof(*array));
> +	array =3D memblock_alloc_raw(array_bytes, SMP_CACHE_BYTES);

[Severity: High]
Could this allocate the array inside one of the statically-placed reserved
memory regions?

At the time of this memblock_alloc_raw() call, statically-placed reserved
memory regions (defined by the reg property) have not yet been marked as
reserved in memblock. The allocator considers the physical memory intended
for these static regions as available.

> +	if (!array) {
> +		pr_err("Failed to allocate memory for reserved_mem array\n");
> +		return -ENOMEM;
> +	}

[ ... ]

> +	reserved_mem =3D map;
> +	total_reserved_mem_cnt =3D cnt;
> =20
> -		uname =3D fdt_get_name(fdt, child, NULL);
> +	/* Second pass: reserve and initialize the static regions */
> +	fdt_for_each_subnode(child, fdt, node) {
> +		if (!of_fdt_device_is_available(fdt, child))
> +			continue;
> =20
> -		err =3D __reserved_mem_reserve_reg(child, uname);
> -		if (!err)
> -			count++;
> +		__reserved_mem_reserve_reg(child,
> +					   fdt_get_name(fdt, child, NULL));

[Severity: High]
If the array was allocated inside a static region above, won't this late
reservation either overlap and fail, or silently succeed?

If it succeeds, it places the kernel's reserved_mem array in physical
memory expected to be exclusively owned by a hardware device or firmware.
When the device later uses this memory, it might overwrite the array,
potentially leading to memory corruption and boot failure.

> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008094125.3197=
971-1-m.szyprowski@samsung.com?part=3D2
