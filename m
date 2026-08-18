Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50ED442386
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046055; cv=none; b=f3jZqx5ZcLp9uqAy6X/v7Y02JKKDtcEa24WJJVGkL+iESRwHsSA8QuESjKgEg6KBK914QhnF0avaIytmxTJnFoZWJBxoUV4wpXMfb7id7bebTpqzOojqpORltve4+svmAw3cpQIZuIhc3hAL2xItuGZQkdVi7R6BxIFr9TdjDPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046055; c=relaxed/simple;
	bh=CfpLrLVwOfOpecHhzb0xBAXiLsHhMd7vQNrgNBl1Ndk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FLJNRyxYagh06V7tqgC10fknr5N0eaI1W3P89fz+wkCYQMrn+uonzEBhPMtB98s3dEteg4quBjISnynnFnayGeMIzuGYP7pmGxt8jWYpMG1ZsZ135WFw00jk4XWjz/AWwpEC77o4xuDatcgKnZOpFyg0JxZvOzcJyrdycwFT1Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VnZY+VG/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VnZY+VG/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CD11F00A3A;
	Tue, 18 Aug 2026 09:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787046051;
	bh=8J5QkVNfHFc9ulT/thx/UfNunpJ6i8dhNL5NCSyWxBc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VnZY+VG/ZofMdUbioH7CeMhpXZKr7u4Rm/hvt2TFrR24jGdgIbi50vWnnLb6jg0dh
	 2XhCRh+BMoJ+0xTHvb5A7klQkkmvUSGIKVms0vwPMORNaXUzyGhuwcLvGhuvKrwuS6
	 3TWI/CgcRMSl0G3INrqMqoioXzvhNc8oOMmYUIbHXRxrGtoKTlsCKQhuWbgsQ7S0Da
	 dMH3qpKeyjr/FgxBf9vxoS3oFviuP2svfGolmiExPrE2tE8ZWQWbqJIBJ+YOBjLkqt
	 gw9jRGqU/a3FbQxxzl2258onz4Bs/bWJXo1CXc5lKQzWwPPHzvqvbBXRsKZdGDeWTe
	 SS+1bfMlUONdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/5] of: reserved_mem: reject static regions
 overlapping no-map memory
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260818092420.2859026-3-chenwandun1@gmail.com>
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
 <20260818092420.2859026-3-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 09:40:50 +0000
Message-Id: <20260818094051.50CD11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The patch provides an incomplete fix for overlapping reservations,=
 allowing a static `map` region to silently overlap an existing `no-map` re=
gion.
- [High] Error handling in `__reserved_mem_alloc_size()` ignores the return=
 code, leading to a Use-After-Free of physical memory if marking a dynamic =
`no-map` region fails.
--

--- Patch [2]: [PATCH v2 2/5] of: reserved_mem: reject static regions overl=
apping no-map memory ---
commit 5bad18fc3e691089fa21e129bf6cd3d6145676c4
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: reject static regions overlapping no-map memory

Static no-map reserved-memory regions are marked in memblock.memory rather
than memblock.reserved. So the reservation overlap check does not reject
a static region that overlaps existing no-map memory. Both regions can then
be initialized and hand the same physical memory to different drivers.
This commit rejects static regions that overlap existing no-map memory.

Link: https://sashiko.dev/#/message/20260814084718.29C341F000E9%40smtp.kern=
el.org [1]

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 491d64d93d707..f25dc0cca2f06 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -152,7 +152,8 @@ static int __init early_init_dt_reserve_memory(phys_a=
ddr_t base,
>  		 * if the region isn't memory as it won't be mapped.
>  		 */
>  		if (memblock_overlaps_region(&memblock.memory, base, size) &&
> -		    memblock_is_region_reserved(base, size))
> +		    (memblock_is_region_reserved(base, size) ||
> +		     memblock_overlaps_nomap(base, size)))
>  			return -EBUSY;
> =20
>  		return memblock_mark_nomap(base, size);

[Severity: High]
This isn't a bug introduced by this patch, but since this patch is fixing
overlap checks, does the !nomap path still allow a static map region to
silently overlap an existing no-map region?

If a Device Tree contains a no-map region followed by a regular map region
pointing to the same physical address, the no-map region is processed first.

When the map region is processed, nomap is false, so it bypasses the
overlap check updated here and directly calls memblock_reserve():

    drivers/of/of_reserved_mem.c:early_init_dt_reserve_memory() {
        if (nomap) {
            ...
            return memblock_mark_nomap(base, size);
        }
        return memblock_reserve(base, size);
    }

Since memblock_reserve() adds the region to memblock.reserved without
checking for MEMBLOCK_NOMAP overlaps in memblock.memory, both regions
can be initialized. This would hand the same physical memory to different
reserved-memory drivers.

Should the !nomap path also check for overlaps against existing no-map
memory?


While reviewing the memory allocation paths, I also noticed a pre-existing
issue in __reserved_mem_alloc_size().

[Severity: High]
This is a pre-existing issue, but could this error handling cause a
use-after-free of physical memory if memblock_mark_nomap() fails?

Looking at early_init_dt_alloc_reserved_memory_arch():

    drivers/of/of_reserved_mem.c:early_init_dt_alloc_reserved_memory_arch()=
 {
        ...
        base =3D memblock_phys_alloc_range(size, align, start, end);
        if (!base)
            return -ENOMEM;

        *res_base =3D base;
        if (nomap) {
            err =3D memblock_mark_nomap(base, size);
            if (err)
                memblock_phys_free(base, size);
        }
        ...
        return err;
    }

If memblock_mark_nomap() fails, it frees the allocated memory and returns
the error code, but *res_base (the base pointer in the caller) remains
set to the freed address.

In __reserved_mem_alloc_size(), the return code is ignored:

    drivers/of/of_reserved_mem.c:__reserved_mem_alloc_size() {
        ...
        ret =3D early_init_dt_alloc_reserved_memory_arch(size, align,
                                                       0, 0, nomap, &base);
        if (ret =3D=3D 0)
            pr_debug(...);

        if (base =3D=3D 0) {
            pr_err(...);
            return -ENOMEM;
        }

        fdt_init_reserved_mem_node(node, uname, base, size);
        ...
    }

Because __reserved_mem_alloc_size() ignores ret and only checks
if (base =3D=3D 0), it will proceed with the freed memory and register it v=
ia
fdt_init_reserved_mem_node(). The page allocator will hand this memory to
regular allocations while a reserved-memory driver also uses it.

Should this check be if (ret !=3D 0) or if (base =3D=3D 0 || ret !=3D 0) to
properly catch allocation failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818092420.2859=
026-1-chenwandun1@gmail.com?part=3D2
