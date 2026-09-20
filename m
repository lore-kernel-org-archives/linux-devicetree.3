Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25083EB0FB
	for <devicetree@vger.kernel.org>; Sun, 20 Sep 2026 10:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899216; cv=none; b=smCMAf1PeRQWF2r/K9ZybITFLvx2fcESTTfnE2Km2nn6PYiV9dr2W20hXBpn2xU/IjZYrZFGkCUtTUa986EmPzOtMpBh1De0/MAQ+rlfE98z/F7x/aVPpnmYGF+uf1eGqkhNzV6ulRfsyfE6syPQ2cACmDFvhUIoRdkmdf7E10E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899216; c=relaxed/simple;
	bh=nbT1O1h+hPpotRTgsN7QS3bvB2PwZ4ajRmrGDXKDxR0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iK9yGxKcY2MsyeMcPU3z9ih+WWOH2UBGec0Dzt8X42j11smcVbOZJo3VRjS4pN0MfbyJNJPxgso9K34d1hr4wYPJIeuEYmPk2HUtpnkvgx3ujUWK5JmwZpdBY7Iu6VLiDanN9JIc2HRwahX4S7gFePk26bIQnvvqrWHfOxbUvK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOVN5xQX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOVN5xQX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DE8A1F000FF;
	Sun, 20 Sep 2026 10:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789899214;
	bh=Ux5zy2F4VF7IqbxsSu2BczmSOlFBU2rHHmy54jES3lE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FOVN5xQXLQuQZz0DscbmBegaqjbg/Znr5iIp4dQiP0zE7u5WrLn69K8m1SHKayLeZ
	 QpzuN6d2MHq4wS34bu7+yy8khSNLS0cXl+/+AWZJNKtFJ8WkYQyJZgJNHmBumMPxa/
	 m3vVFTfJeEWuNp1FVU2f5ZcivDbHhESNsU6NojF+A86mxgIDQkRQ28rO6vGoZ3GGMy
	 rxaZBi/PF4k6kP/bqMu2yyW++3thy+cSdQi68iKRaoLOmKh4Gj/586DCdTD+Mh7BnJ
	 FLg/iz34Li3lcrZ3kvrH5TSQdN9GX3zcQsRSrOeKbcbnoyAn103+Etenu6wHqfU4oS
	 u4MWSSDSLYLJA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] of: reserved_mem: reject static mapped regions
 overlapping existing reservations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260920092852.614973-6-chenwandun1@gmail.com>
References: <20260920092852.614973-1-chenwandun1@gmail.com>
 <20260920092852.614973-6-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 20 Sep 2026 10:13:33 +0000
Message-Id: <20260920101334.5DE8A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] of/reserved_mem: valid overlapping reservations are broken by unco=
nditional rejection
--

commit f3ecc5d72c441ce7fd915e30544e07c69215f6c4
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: reject static mapped regions overlapping existing reserva=
tions

This commit modifies early_init_dt_reserve_memory() to reject static
reserved-memory regions that overlap with existing memblock reservations.
It aims to prevent memory corruption when initialization of a statically
placed region fails and memblock_phys_free() returns the overlap to the
buddy allocator.

Link: https://sashiko.dev/#/message/20260806100605.2C2C01F000E9%40smtp.kern=
el.org [1]

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 8d2057f2ac12e..2d1e01c0f8867 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -141,6 +141,10 @@ static int __init early_init_dt_reserve_memory(phys_=
addr_t base,
>  		return ret;
>  	}
> =20
> +	if (memblock_is_region_reserved(base, size) ||
> +	    memblock_overlaps_nomap_region(base, size))
> +		return -EBUSY;
> +

[Severity: High]
Does this code unconditionally reject reserved-memory nodes that perfectly
describe memory already reserved by the architecture or EFI setup?

If a bootloader (like U-Boot or EFI) reserves a memory region (e.g.
EFI_RESERVED_TYPE) and also passes a /reserved-memory DT node describing the
same region to ensure compatibility, it looks like
early_init_dt_reserve_memory() will now find the region already reserved in
memblock and return -EBUSY. This bypasses memblock_mark_rsrv_rmem().

Later in the boot process, fdt_scan_reserved_mem_late() checks for the
MEMBLOCK_RSRV_RMEM flag on the region:

drivers/of/of_reserved_mem.c:fdt_scan_reserved_mem_late() {
    ...
    if (!memblock_is_region_rsrv_rmem(base, size, nomap))
        continue;
    ...
}

If the flag is missing, it skips calling fdt_init_reserved_mem_node(). Could
this cause valid overlapping DT nodes to be silently discarded, causing
devices relying on these nodes (like DRM display drivers using an EFI
framebuffer) to fail to probe because of_reserved_mem_lookup() will return
NULL?

Additionally, does the existing check in the if (nomap) block earlier in
early_init_dt_reserve_memory() have the same effect? It appears to reject
no-map DT nodes if the region was already marked nomap by EFI, effectively
destroying those DT nodes as well.

>  	ret =3D memblock_reserve(base, size);
>  	if (!ret)
>  		memblock_mark_rsrv_rmem(base, size);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260920092852.6149=
73-1-chenwandun1@gmail.com?part=3D5
