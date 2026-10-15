Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4C54C6531
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 08:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054318; cv=none; b=PdP4Vojq6/EOxGsn0X7j9CZ87jTn7XNXAo/Is1cmv0n/h3+wFCwnjPaFKFKz05sVK3kQ7/DNrWx3fe0hYLp4jwqrubqrWye7GhUNLpdLnyWPcMdm8g5QJsNzvea8cvfgKOcWIMzs3L88zcjG2dcaN3j3bvWeje1hFTdjtiM0X1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054318; c=relaxed/simple;
	bh=Xhe12g4dSxKf6b40jd8XbuogFcTU3hR5lA457Fxwmfs=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=GPcxtkDqf6rJvhINuh+8Ci4SeBiB9PIOWeBe+ejDtFw9y9gAhq7RY+0m06d7RpEMndL3dv3DNnSdjHDEmt6MY7FrzrLqyKlRO6uo65H+mGz3yNnGWJb6F1AqaTAuKyUx0wSbGjzaXrUZ0/sYVPK33Nxx7UBdqHOSqR3eP+F4xxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=apKDf96n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="apKDf96n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 727A41F000C4;
	Thu, 15 Oct 2026 08:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792054312;
	bh=0r61TlrE+NIRa75CITh1VeXZ5XKqip7dVjZ3X9FLGCg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=apKDf96nvzk9iJUoLcAQxJLaIG0/kx1zEEtVWZuBh0QSEpg4yKQf/sRMkAw4goVNY
	 3iMqSWpI0tugxXXEsJ08/YyAcmD7KyjskhuutecG37gbek2v8j378U80nEpkblb1l2
	 KDnAJETRZuj/fnOmoVRArJ3phVcFIWbmp/kwgPPwSkPCBWycpfP/jMxyis27mIYVNk
	 i7Jy7lhvIlsYwi/zLQqwg/ZAPTPcublS7fe+h4MrnxE13hIqtXGMg11xx8bf2NSQiy
	 W6enWnRh+OZTcFli9Azz5rpZwqyyF/5NrIk/w6TVN8pKQL0Uj9lKDeu6qzaG1iHQZ1
	 PpwJVbc7UtF8g==
Message-ID: <sashiko-outbox-172520@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] of: reserved_mem: allocate and map the
 reserved_mem array early
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marek Szyprowski" <m.szyprowski@samsung.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015082315.56876-3-m.szyprowski@samsung.com>
References: <20261015082315.56876-1-m.szyprowski@samsung.com>
 <CGME20261015082334eucas1p2a3bbf3650f279abbd39d05d63e35aba6@eucas1p2.samsung.com>
 <20261015082315.56876-3-m.szyprowski@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 08:51:51 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] of: memory corruption due to initializing unreserved memory regions
- [Medium] of: memory leak on dynamically-placed nomap region init failure
--

commit cc45d1ed473ae1f1390908145c8217f0d9614ac0
Author: Marek Szyprowski <m.szyprowski@samsung.com>

    of: reserved_mem: allocate and map the reserved_mem array early
   =20
    Get rid of the static, limited-size reserved_mem array and replace it
    with array allocated by memblock_alloc_raw() and accessed directly or
    through a temporary early_memremap() mapping.

    Link: https://lore.kernel.org/all/asc6brs_g0ky0wOM@kernel.org/

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 300fb236ab59f..0fd1683cba011 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -381,143 +384,109 @@ static void __init __rmem_check_for_overlap(void)
[ ... ]
> +	/* Second pass: initialize the static regions */
> +	fdt_for_each_subnode(child, fdt, node) {
>  		if (!of_fdt_device_is_available(fdt, child))
>  			continue;
> =20
> -		uname =3D fdt_get_name(fdt, child, NULL);
> -
> -		err =3D __reserved_mem_reserve_reg(child, uname);
> -		if (!err)
> -			count++;
> +		__reserved_mem_init_reg(child, fdt_get_name(fdt, child, NULL));
> +	}

[Severity: High]
Does this unconditionally initialize memory regions even if they failed
reservation in the first pass?

If __reserved_mem_reserve_reg() fails for a region, it sets
reserved_mem_reserve_failed =3D true but does not exclude the node. When
__reserved_mem_init_reg() is called here, it will invoke
fdt_init_reserved_mem_node() for that node anyway.

Could this lead to blindly adding unreserved physical memory to the
reserved_mem array, allowing drivers to silently overwrite standard memory
that the page allocator considers free?

Additionally, if the node initialization subsequently fails (e.g. due to a
missing compatible match), could it execute memblock_phys_free() or
memblock_clear_nomap() on memory it never successfully owned?

drivers/of/of_reserved_mem.c:fdt_init_reserved_mem_node() {
    ...
	err =3D __reserved_mem_init_node(rmem, node);
	if (err !=3D 0 && err !=3D -ENODEV) {
		pr_info("node %s compatible matching fail\n", rmem->name);
		rmem->name =3D NULL;

		if (nomap)
			memblock_clear_nomap(rmem->base, rmem->size);
		else
			memblock_phys_free(rmem->base, rmem->size);
		return;
    ...
}

> =20
> -		/*
> -		 * Save the nodes for the dynamically-placed regions
> -		 * into an array which will be used for allocation right
> -		 * after all the statically-placed regions are reserved
> -		 * or marked as no-map. This is done to avoid dynamically
> -		 * allocating from one of the statically-placed regions.
> -		 */
> -		if (err !=3D -ENOENT || !of_get_flat_dt_prop(child, "size", NULL))
> -			continue;
> +	/*
> +	 * Allocate the dynamically-placed regions only after all the
> +	 * statically-placed ones are reserved, to avoid overlapping with them.
> +	 */
> +	fdt_for_each_subnode(child, fdt, node) {
> +		int len;
> =20
> -		if (dynamic_nodes_cnt =3D=3D MAX_RESERVED_REGIONS) {
> -			pr_err("too many defined dynamic regions, skip '%s'\n",
> -			       uname);
> +		if (!of_fdt_device_is_available(fdt, child) ||
> +		    (of_flat_dt_get_addr_size_prop(child, "reg", &len) && len))
>  			continue;
> -		}
> =20
> -		dynamic_nodes[dynamic_nodes_cnt] =3D child;
> -		dynamic_nodes_cnt++;
> -	}
> -	for (int i =3D 0; i < dynamic_nodes_cnt; i++) {
> -		const char *uname;
> -		int err;
> -
> -		child =3D dynamic_nodes[i];
> -		uname =3D fdt_get_name(fdt, child, NULL);
> -		err =3D __reserved_mem_alloc_size(child, uname);
> -		if (!err)
> -			count++;
> +		__reserved_mem_alloc_size(child,
> +					  fdt_get_name(fdt, child, NULL));
>  	}

[Severity: Medium]
If a dynamically-placed 'no-map' reserved memory region fails initialization
here, does it permanently leak memory from memblock.reserved?

When __reserved_mem_alloc_size() allocates memory via
memblock_phys_alloc_range(), the memory is added to memblock.reserved. It
then calls fdt_init_reserved_mem_node(), which has the following error
handling path:

drivers/of/of_reserved_mem.c:fdt_init_reserved_mem_node() {
    ...
	err =3D __reserved_mem_init_node(rmem, node);
	if (err !=3D 0 && err !=3D -ENODEV) {
		pr_info("node %s compatible matching fail\n", rmem->name);
		rmem->name =3D NULL;

		if (nomap)
			memblock_clear_nomap(rmem->base, rmem->size);
		else
			memblock_phys_free(rmem->base, rmem->size);
		return;
    ...
}

For 'no-map' regions, this clears the nomap flag but appears to omit
memblock_phys_free(rmem->base, rmem->size), which would leave the dynamical=
ly
allocated region permanently trapped in memblock.reserved.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015082315.5687=
6-1-m.szyprowski@samsung.com?part=3D2
