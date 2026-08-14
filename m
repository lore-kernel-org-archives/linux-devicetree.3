Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C62E305670
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 09:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786698192; cv=none; b=ZVRc3KuLJBYEGafnmFYDZ6lhZIWBNj1Rn5TLRMdlgodTWf8J0fcRH8ayH4Qt2ApHtE8GoABZElzYAI1IM43KEqnLqlEzdDnnjNNpk6sYalF/aZeu/FNJ/Oj2z/kSe6jUAE1yn+D8ojKmcLuBTytlSadWUtFv2X5HF0bQ/HlUyMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786698192; c=relaxed/simple;
	bh=UlHr8Gg9B2tMj5LbamZ3wGgUMmhF6OXHQ3uSwtTjG+g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Uyymp0udkPF/q9y0P+o11dA1Zs3rxbg6oNP6pj51OlSr5vM/Zg4q6OMTzeNPyHp8/XPknQfDMf9ybKInIGqwylUSwnT+oNYqUT7qr3c3SkKezmFEDhMrUKXonAWa4vehd/P00GRioooKhYxL6VvgDcGjWBpklFRlnZKfnjjFT7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aJ9w8boA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aJ9w8boA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C8741F00A3D;
	Fri, 14 Aug 2026 09:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786698188;
	bh=ee99XU5gAJwGrWs6CSIxm+7BTEeryAt24rFwREyPSA8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aJ9w8boAatYlMPrLaSa5Ic+x31sDs36LyX90s8BAqll6Sp6pCCkh0rgTn0SCiBGVe
	 PrqCGjrz07SG97+1XLLNTlJJo6gXrMcugRbysS2q3gvnRrXHYs91mlONnx6DsLgmB4
	 emPzha5ZUAYEXtzN7t3VrLdSf5ekF3e/zZlCvoymuW3jyS/pi1qJ3+Vr8EyAo2/G+C
	 CYFNLQB0n7e3QCiCKCKGzZgLE1YGVuiy2MMO4Q2o7O7aWfbrks5zehKgKsBwSK0Hg1
	 XCmZJxriT0u9wwrqLZ62CJt59xq2/lLtrqNwKFXNwSsMEOEX8AuMIMM37xq/5vhuG0
	 EpYuqV/LuB2Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] of: reserved_mem: release dynamically allocated
 no-map region on init failure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260814081443.1061046-4-chenwandun1@gmail.com>
References: <20260814081443.1061046-1-chenwandun1@gmail.com>
 <20260814081443.1061046-4-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 09:03:04 +0000
Message-Id: <20260814090305.4C8741F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Initialization failure for statically defined `no-map` reserved me=
mory regions unsafely returns memory to the buddy allocator without it bein=
g mapped in the direct map.
- [High] When dynamically allocating a no-map region, if memblock_mark_noma=
p() fails, early_init_dt_alloc_reserved_memory_arch() frees the memory but =
leaves *res_base non-zero. The caller __reserved_mem_alloc_size() incorrect=
ly ignores the return code and checks `if (base =3D=3D 0)`, causing it to p=
roceed with freed memory.
--

--- Patch [3]: [PATCH 3/3] of: reserved_mem: release dynamically allocated =
no-map region on init failure ---
commit b0edc36fc6542fd03f33cbf2ed696a0cbaa2eebc
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: release dynamically allocated no-map region on init failu=
re

Dynamically reserved-memory regions are added to memblock.reserved by
memblock_phys_alloc_range() during __reserved_mem_alloc_size(). When a
reserved-memory region's driver initialization fails,
fdt_init_reserved_mem_node() cleans up the reservation, and this patch
ensures the memory is freed.

Link: https://lore.kernel.org/all/20260806100605.2C2C01F000E9@smtp.kernel.o=
rg/ [1]

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 67cb60616fc69..d09c29184acf6 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
[ ... ]
> @@ -556,7 +557,7 @@ static int __init __reserved_mem_alloc_size(unsigned =
long node, const char *unam
>  	}
> =20
>  	fdt_fixup_reserved_mem_node(node, base, size);
> -	fdt_init_reserved_mem_node(node, uname, base, size);
> +	fdt_init_reserved_mem_node(node, uname, base, size, true);
> =20
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but does checking if base =3D=3D 0 instead of=
 the
return code lead to a use-after-free or double-free?

Looking at early_init_dt_alloc_reserved_memory_arch(), if memblock_mark_nom=
ap()
fails, it frees the memory but leaves base set to a non-zero address:

drivers/of/of_reserved_mem.c:early_init_dt_alloc_reserved_memory_arch() {
    ...
    *res_base =3D base;
    if (nomap) {
        err =3D memblock_mark_nomap(base, size);
        if (err)
            memblock_phys_free(base, size);
    ...
}

Since __reserved_mem_alloc_size() ignores the return value and checks base:

drivers/of/of_reserved_mem.c:__reserved_mem_alloc_size() {
    ...
    ret =3D early_init_dt_alloc_reserved_memory_arch(... &base);
    ...
    if (base =3D=3D 0) {
        pr_err(...);
        return -ENOMEM;
    }
    ...
}

Could this cause fdt_init_reserved_mem_node() to be called on freed memory,
and with this patch, subsequently double-free the memory if initialization
fails?

[ ... ]
> @@ -697,7 +699,8 @@ static void __init fdt_init_reserved_mem_node(unsigne=
d long node, const char *un
> =20
>  		if (nomap)
>  			memblock_clear_nomap(rmem->base, rmem->size);
> -		else
> +
> +		if (dynamic || !nomap)
>  			memblock_phys_free(rmem->base, rmem->size);
>  		return;
>  	} else {

[Severity: High]
This isn't a bug introduced by this patch, but does clearing the nomap flag
for static regions on failure cause a fatal page fault later?

When early_init_dt_reserve_memory() processes static no-map regions, it mar=
ks
them MEMBLOCK_NOMAP without reserving them in memblock.reserved:

drivers/of/of_reserved_mem.c:early_init_dt_reserve_memory() {
    ...
    return memblock_mark_nomap(base, size);
}

Because of the MEMBLOCK_NOMAP flag, paging_init() skips creating direct map
page tables for this memory.

If driver initialization fails, fdt_init_reserved_mem_node() clears the nom=
ap
flag:

drivers/of/of_reserved_mem.c:fdt_init_reserved_mem_node() {
    ...
    if (nomap)
        memblock_clear_nomap(rmem->base, rmem->size);
    ...
}

Since the memory is now unreserved and no longer marked nomap, will
memblock_free_all() pass this firmware-protected memory to the buddy
allocator, resulting in an unmapped direct-map access crash when the kernel
allocates it?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814081443.1061=
046-1-chenwandun1@gmail.com?part=3D3
