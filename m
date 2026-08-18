Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E830F43F0B1
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046079; cv=none; b=BRbUBNwg50cZEuC/DphTMpji1dGW3yR4o3Y4fW3l8cBGh+4TxjgCXGDImyOxpEsJ65inM6fOLtGv43EZsVdbMdmk5JF2s8mZVtCUwKmXFh2l4972rFas0SAenCpBsaG5vFJkEMDK8c/22eSJD7QIP2fqB9PU0yc65itJxBdxmXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046079; c=relaxed/simple;
	bh=jDlY+XkaRrmAVPnt1O/wUJa3/9ipaNlbm6DjMNFT23M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s3+Cd4rRHWGmzTAKhYoM4nIy5fICUwIZbbvF4hhsYSfW0fpU7lVq/MGkaVReKN671T9EKr7gI1aCI4pVeZz8n+wz/zza++B2XkxEE2IDAc5435ivEHrmK0gmJbbPeeZUmFUiKslKGnRJndP0mJGDbht6oQdeSPUo3sSC+TYymYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQD85tzi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQD85tzi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D2471F000E9;
	Tue, 18 Aug 2026 09:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787046077;
	bh=GmC3eyV/TpmKOONhiwLQI5O91cFYYuwo0+WQxrOC0Sw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KQD85tzipvTAslVUqqQdZBrm2Jhk5LRxPn/PtcTOdBy35Cmz9EpVFMZ8jYtKURfeh
	 aJ3nMJjeGbJqbAKvW14AdQ7yDAXwnMP7azAmQu9cGDOUoi42Pl6rVrOpNvMbvp8isE
	 +hYL531drRW0SYyfI4uAd3yc+mEXucjBKeFJJlMVEUNQc5fr9jGbacnt1O3Rm6sJ5R
	 R15aNZNCkIgrbqHl6jzMiIl55nY4LbjQo1JOOVyT5fBm5fU7OA0q0MOfsM7bYyG2x/
	 iPx0EKgYNv8cMba72q6Jdhb4ub8oGc/KwNVEF7eR2ZYWT6mqC0h+BW+jT6mYbmsI5V
	 aZjFoTdg733YQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] of: reserved_mem: reject statically placed
 regions overlapping existing reservations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260818092420.2859026-4-chenwandun1@gmail.com>
References: <20260818092420.2859026-1-chenwandun1@gmail.com>
 <20260818092420.2859026-4-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 09:41:17 +0000
Message-Id: <20260818094117.8D2471F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Rejecting overlapping memblock reservations up-front breaks platfo=
rms where memory is legitimately reserved early (e.g., by EFI or architectu=
re code) and then described by a DT reserved-memory node.
- [High] An array overflow in `reserve_failed_nodes` bypasses the failed-no=
de skip logic, leading to memory corruption.

Pre-existing issues:
- [Critical] Dynamic allocation of reserved memory regions ignores internal=
 failures, leading to initialization of freed memory.
- [High] The patch fails to prevent overlaps with `/memreserve/` entries, l=
eaving the memory corruption bug unfixed for those regions due to execution=
 ordering.
- [High] Dynamically allocated `nomap` reserved memory regions are permanen=
tly leaked if their initialization fails.
--

--- Patch [3]: [PATCH v2 3/5] of: reserved_mem: reject statically placed re=
gions overlapping existing reservations ---
commit 1c8f1d8c03461ed83a10e5698047d85d76387f8b
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: reject statically placed regions overlapping existing res=
ervations

This patch rejects overlapping memblock reservations up front for
statically placed regions, preventing them from corrupting memory if
initialization fails. Dynamically allocated regions are unaffected.

Link: https://sashiko.dev/#/message/20260806100605.2C2C01F000E9%40smtp.kern=
el.org [1]

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index f25dc0cca2f06..71a879628c4aa 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -158,6 +158,11 @@ static int __init early_init_dt_reserve_memory(phys_=
addr_t base,
> =20
>  		return memblock_mark_nomap(base, size);
>  	}
> +
> +	if (memblock_is_region_reserved(base, size) ||
> +	    memblock_overlaps_nomap(base, size))
> +		return -EBUSY;

[Severity: High]
Will this upfront overlap rejection break platforms where memory is
legitimately reserved early by EFI or architecture code, and then described
by a device tree reserved-memory node?

If architecture code like efi_init() on ARM64 cleanly reserves memory using
memblock_reserve() before fdt_scan_reserved_mem() executes, the new
memblock_is_region_reserved() check will evaluate to true and reject the
node unconditionally with -EBUSY.

[Severity: High]
This isn't a bug introduced by this patch, but does this overlap check miss
/memreserve/ entries entirely due to execution ordering?

In early_init_fdt_scan_reserved_mem(), fdt_scan_reserved_mem() executes
before the /memreserve/ blocks are iterated and reserved. Because of this,
when memblock_is_region_reserved() runs here, the /memreserve/ regions are
not yet known.

If a reserved-memory node overlaps a /memreserve/, it bypasses the check.
If the node's driver later fails initialization, its error path executes
memblock_phys_free(), which will still wrongly free the /memreserve/ memory.

> +
>  	return memblock_reserve(base, size);
>  }

[Severity: High]
Can an array overflow in reserve_failed_nodes bypass the failed-node skip
logic?

If the MAX_RESERVED_REGIONS limit is exceeded, record_reserve_failed_node()
returns false. The fallback logic in fdt_scan_reserved_mem() then
increments count instead of skipping the node:

drivers/of/of_reserved_mem.c:fdt_scan_reserved_mem() {
    ...
    else if (should_record_failed_node &&
             !record_reserve_failed_node(child, uname))
        count++;
    ...
}

Later, in fdt_scan_reserved_mem_late(), reserved_mem_node_reserve_failed()
returns false for this untracked node, passing it to
fdt_init_reserved_mem_node().

If initialization fails, the error path frees the memory, potentially
corrupting an existing overlapping reservation.

[Severity: High]
This is a pre-existing issue, but do dynamically allocated nomap reserved
memory regions permanently leak if their initialization fails?

In early_init_dt_alloc_reserved_memory_arch(), dynamic regions are added to
memblock.reserved. If driver initialization fails in
fdt_init_reserved_mem_node(), the error path only clears the nomap flag:

drivers/of/of_reserved_mem.c:fdt_init_reserved_mem_node() {
    ...
    if (nomap)
        memblock_clear_nomap(rmem->base, rmem->size);
    else
        memblock_phys_free(rmem->base, rmem->size);
    ...
}

This completely omits the memblock_phys_free() call for nomap regions,
creating a physical memory leak.

[Severity: Critical]
This isn't a bug introduced by this patch, but does the error handling in
__reserved_mem_alloc_size() ignore internal failures and lead to early boot
use-after-free issues?

In early_init_dt_alloc_reserved_memory_arch(), the output parameter
*res_base is populated before calling memblock_mark_nomap():

drivers/of/of_reserved_mem.c:early_init_dt_alloc_reserved_memory_arch() {
    *res_base =3D base;
    if (nomap) {
        err =3D memblock_mark_nomap(base, size);
        if (err)
            memblock_phys_free(base, size);
    }
    ...
    return err;
}

If memblock_mark_nomap() fails, it frees the memory but leaves the freed
physical address in *res_base.

The caller, __reserved_mem_alloc_size(), ignores the return code and
checks the base address instead:

drivers/of/of_reserved_mem.c:__reserved_mem_alloc_size() {
    ...
    ret =3D early_init_dt_alloc_reserved_memory_arch(size, align, 0, 0,
                                                   nomap, &base);
    ...
    if (base =3D=3D 0) {
        pr_err("failed to allocate memory...");
        return -ENOMEM;
    }
    ...
}

Because base contains the freed address rather than 0, the check passes and
the freed memory block is incorrectly passed to fdt_init_reserved_mem_node(=
).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818092420.2859=
026-1-chenwandun1@gmail.com?part=3D3
