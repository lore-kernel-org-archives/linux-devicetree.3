Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AC2E4E9C19
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 15:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791473709; cv=none; b=F8LSee/Tnr94l1mE24fQkSk6RGU6ZR4jCcd0SRmQfm4wQe0bxNAlrCa+ayD2r8uJyctvYZSlIjA3+o8VFbiUxoD/L/zsvbT9zEq9EGTdJAS6u0XHWPXc6M+gJTf08Wy+G23ZgnzM4mursHEdHzRlWeaZbHZoMOIPSzzdPCVWydk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791473709; c=relaxed/simple;
	bh=GQvUF/yu3P7irY3HpvWa9sdAAKuhu613iD38mhh5/mk=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=OIYSR5bbxESBTUu+L3po5lBEgT8fcZgzMRQcJM2TBDnyXPK+qcTXWp8HDhddtxLPc3ymDPQdPmr1hGN8JrsxFAEwxwbxyNFe3nMrxm5JHkjTgztYMIqUVveO3VuvRvN9v5U977yTXNyACPWBLuv1jmFsJJhZkYcipHYuHEFCbbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHoGJsMa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHoGJsMa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5E21F000FF;
	Thu,  8 Oct 2026 15:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791473701;
	bh=PCKhw6R5l9P9RXHwTw2Gy+MWS3RDk+s3obOV6azkhgU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DHoGJsMa37nfTHGem8jna2/NtYX69PZ/s0m0Y3AawfzxZ60m56eUZM3Ejw4nA9gLp
	 9unWMXEIaVeIhUqeNA/6U6nWZmgil2Q/6GgsJBkQwrI6G11UshMVu1tgBhnHU4aJbp
	 iy7qV+eE0ZBOihWKZKhzCxiJl67XJDPKJY9MXNCkIcdX/xybRVi3ARG/h0j1OmVEou
	 ECa7Wss7EEL/vkk9Q8HtS6oMnxb2IhuYFc/riOrgs0oHgGr/r/EJ+w5rqZrtkps/Uu
	 l0uI2lbIAbHH8kAp2+NOAREH2km2zjJz+UxEf8vFKQLh9fsvZvjaOGi6wiFrwMeXyG
	 iPoIbb3qQeOZA==
Message-ID: <sashiko-outbox-164351@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] of: reserved_mem: allocate and map the
 reserved_mem array early
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Szyprowski" <m.szyprowski@samsung.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20261008152403.766439-3-m.szyprowski@samsung.com>
References: <20261008152403.766439-1-m.szyprowski@samsung.com>
 <CGME20261008152450eucas1p1d5517eadc2c1d684ff6d4ddc010f6331@eucas1p1.samsung.com>
 <20261008152403.766439-3-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 15:35:00 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] of: reserved_mem: dynamic array allocation overlaps with static re=
gions
--

commit 363ba30305c792dd8e994b354929ef72e89a362e
Author: Marek Szyprowski <m.szyprowski@samsung.com>

of: reserved_mem: allocate and map the reserved_mem array early

This commit replaces the statically sized reserved_mem array with a
dynamically allocated array using memblock_alloc_raw(). It maps the new arr=
ay
early to handle architectures where the linear map is not yet available dur=
ing
the early boot scan. The commit aims to eliminate the two-step initializati=
on,
processing all regions during the early scan.

Link: https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 300fb236ab59f..51eea497a3192 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c

[ ... ]

> @@ -381,143 +372,89 @@ static void __init __rmem_check_for_overlap(void)
>  	}
>  }
> =20

[ ... ]

>  /*
>   * fdt_scan_reserved_mem() - reserve and allocate memory occupied by
>   * reserved memory regions.
>   *
> - * This function is used to scan through the FDT and mark memory occupied
> - * by all static (defined by the "reg" property) reserved memory regions.
> - * Then memory for all dynamic regions (defined by size & alignment) is
> - * allocated, a region specific init function is called and region infor=
mation
> - * is stored in the reserved_mem array.
> + * This function is used to scan through the FDT and count the number of
> + * reserved memory regions, so the reserved_mem array can be allocated w=
ith
> + * the exact size. Then all static (defined by the "reg" property) reser=
ved
> + * memory regions are marked as reserved, memory for all dynamic regions
> + * (defined by size & alignment) is allocated, a region specific init fu=
nction
> + * is called and region information is stored in the reserved_mem array.
>   */
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
Does allocating the array here introduce a regression by creating a race
with static reserved memory regions?

Because the static regions have not yet been marked as reserved in memblock,
memblock_alloc_raw() considers their physical addresses available and might
allocate the array overlapping a device's static reserved region.

> +	if (!array) {
> +		pr_err("Failed to allocate memory for reserved_mem array\n");
> +		return -ENOMEM;
> +	}
> =20
> -		uname =3D fdt_get_name(fdt, child, NULL);
> +	map =3D reserved_mem_array_map(array, array_bytes);
> +	if (!map) {
> +		pr_err("Failed to map memory for reserved_mem array\n");
> +		memblock_free(array, array_bytes);
> +		return -ENOMEM;
> +	}
> +	memset(map, 0, array_bytes);
> =20
> -		err =3D __reserved_mem_reserve_reg(child, uname);
> -		if (!err)
> -			count++;
> +	reserved_mem =3D map;
> +	total_reserved_mem_cnt =3D cnt;
> =20
> -		/*
> -		 * Save the nodes for the dynamically-placed regions
> -		 * into an array which will be used for allocation right
> -		 * after all the statically-placed regions are reserved
> -		 * or marked as no-map. This is done to avoid dynamically
> -		 * allocating from one of the statically-placed regions.
> -		 */
> -		if (err !=3D -ENOENT || !of_get_flat_dt_prop(child, "size", NULL))
> +	/* Second pass: reserve and initialize the static regions */
> +	fdt_for_each_subnode(child, fdt, node) {
> +		if (!of_fdt_device_is_available(fdt, child))
>  			continue;
> =20
> -		if (dynamic_nodes_cnt =3D=3D MAX_RESERVED_REGIONS) {
> -			pr_err("too many defined dynamic regions, skip '%s'\n",
> -			       uname);
> +		__reserved_mem_reserve_reg(child,
> +					   fdt_get_name(fdt, child, NULL));
> +	}

If the memblock array allocation overlaps a no-map static region,
early_init_dt_reserve_memory() inside __reserved_mem_reserve_reg() will
detect the overlap, return -EBUSY, and fail the device's reservation.

If the region lacks no-map, memblock_reserve() will silently merge the
reservations. The kernel's reserved_mem array will then reside inside the
device's reserved memory, which could lead to memory corruption when the
device driver later uses this memory.

Can the memblock allocation be delayed until after the static regions are
reserved?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008152403.7664=
39-1-m.szyprowski@samsung.com?part=3D2
