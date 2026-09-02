Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AAE463B8E
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 11:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788346983; cv=none; b=bBSUVw1zm51f3d2+lEZbhoT0Bu1UpMgxvuSTR3Jpdnzh2FD21MFiqQd1PCR9iporUEMVEEcpF0uy0whfXNJLcV5S8S2a5pME5BoIxzP7TdkjAaOQntK2mJT9iNLcri0mGHQg3v0f6ToWHVXuu7BpBvMV2f0GVaNWPuTYiAQEoew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788346983; c=relaxed/simple;
	bh=4/E5CoZHLQ5W0KQLWJMkMKA69A/Y6PzpzdTgMkQ4Y10=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lUDJckAKLPyPn1cvp9O1xYznPJlVl0KPsI6+YFtKInXgqe2tHQArduxAashO3j+La7VZtotbB2tj0lo327n2swGhb8cx1MiCB0lChbllycCCCe7YHXjMpQsJDCKjOjxLMomLhOu8QHvXdJA3XYVlEk9wV17TW6maI5N1TUCM+EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xgs6TiwS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xgs6TiwS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABBBF1F000E9;
	Wed,  2 Sep 2026 11:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788346980;
	bh=ksOOU28g5JphzEPrWBF8z99lin7oY3Eo58VnahdRil8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xgs6TiwSXSaPxvixlcoAybEpX8AZ932TOlTpY7n7UxYepbwLsSodjSzA97naiHF/8
	 +KbcYh9YcPDnVhk5EVxv02P6P00Y+5QcdgykzrATnKMGRpKBdVTu0g8HRH0qdgirap
	 C8oVSqnfne5q8fiRLUzk3ZwEbnSEePGeL7ZIAWNUxl1opNJZqmixjIDru1EtCc/Hcp
	 +FiqRtJQmQ6UqJZaYFZG40RlirPip7lTKH1tGVJ1Q+8i/jXokhrVqLcYTW8ooqaDY9
	 dV/qlj04Ad37KvOoZRbtm2cRMa5Q36gFwbxwHGyahSetwVN6MV1NMmUtd0WCAdij/8
	 H5rTmFInX0sow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 02/10] of: reserved_mem: Introduce "ll-map" property
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Donnefort" <vdonnefort@google.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260902104712.2399797-3-vdonnefort@google.com>
References: <20260902104712.2399797-1-vdonnefort@google.com>
 <20260902104712.2399797-3-vdonnefort@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:02:59 +0000
Message-Id: <20260902110300.ABBBF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [Low] Unreachable rollback logic in error paths attempting to clear the L=
LMAP flag when NOMAP fails.

Pre-existing issues:
- [High] Failed memory allocations for reserved memory regions are incorrec=
tly treated as successful, leading to use-after-free of physical memory.
--

commit 08fe7ffd815bf0c630423a7e7417a3bec7a82b60
Author: Vincent Donnefort <vdonnefort@google.com>

of: reserved_mem: Introduce "ll-map" property

This commit introduces an "ll-map" property for reserved-memory regions,
allowing them to keep last-level mappings. This helps avoid splitting blocks
when mapping or unmapping pages from the kernel direct map.

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index 8c9d6395d6a39..9ff2d02cb1491 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
> @@ -46,10 +69,21 @@ static int __init early_init_dt_alloc_reserved_memory=
_arch(phys_addr_t size,
>  		return -ENOMEM;
> =20
>  	*res_base =3D base;
> -	if (nomap) {
> +	if (flags & OF_RMEM_LLMAP) {
> +		err =3D memblock_mark_llmap(base, size);
> +		if (err) {
> +			memblock_phys_free(base, size);
> +			return err;
> +		}
> +	}

[Severity: High]
This is a pre-existing issue, but does this error path lead to a use-after-=
free
of physical memory?

The output parameter *res_base is populated with the physical address before
the failure paths free the memory. If memblock_mark_llmap() (or
memblock_mark_nomap()) fails, memblock_phys_free() is called and an error
code is returned.

However, looking at the caller __reserved_mem_alloc_size():

drivers/of/of_reserved_mem.c:__reserved_mem_alloc_size() {
    ...
    ret =3D early_init_dt_alloc_reserved_memory_arch(size, align,
                                                   0, 0, flags, &base);
    ...
    if (base =3D=3D 0) {
        pr_err("failed to allocate memory for node '%s': size %lu MiB\n",
               uname, (unsigned long)(size / SZ_1M));
        return -ENOMEM;
    }
   =20
    fdt_fixup_reserved_mem_node(node, base, size);
    fdt_init_reserved_mem_node(node, uname, base, size);
    ...
}

Because __reserved_mem_alloc_size() checks if (base =3D=3D 0) instead of
checking the returned error code ret, the check passes (since base was
populated), and the freed memory is subsequently registered as a valid
reserved memory region.

> +
> +	if (flags & OF_RMEM_NOMAP) {
>  		err =3D memblock_mark_nomap(base, size);
> -		if (err)
> +		if (err) {
> +			if (flags & OF_RMEM_LLMAP)
> +				memblock_clear_llmap(base, size);

[Severity: Low]
Is this rollback logic reachable?

Since of_reserved_mem_flags() enforces that OF_RMEM_NOMAP and
OF_RMEM_LLMAP are strictly mutually exclusive (returning -EINVAL if both
are set), it doesn't seem possible for flags to have both bits set
simultaneously.

Therefore, the if (flags & OF_RMEM_LLMAP) block inside the
if (flags & OF_RMEM_NOMAP) condition appears to be dead code.

>  			memblock_phys_free(base, size);
> +		}
>  	}
> =20
>  	if (!err)

[ ... ]

> @@ -119,17 +153,29 @@ static int fdt_fixup_reserved_mem_node(unsigned lon=
g node,
>  				       phys_addr_t base, phys_addr_t size);
> =20
>  static int __init early_init_dt_reserve_memory(phys_addr_t base,
> -					       phys_addr_t size, bool nomap)
> +					       phys_addr_t size,
> +					       enum of_rmem_flags flags)
>  {
> -	if (nomap) {
> +	int err;
> +
> +	if (flags & OF_RMEM_LLMAP) {
> +		err =3D memblock_mark_llmap(base, size);
> +		if (err)
> +			return err;
> +	}
> +
> +	if (flags & OF_RMEM_NOMAP) {
>  		/*
>  		 * If the memory is already reserved (by another region), we
>  		 * should not allow it to be marked nomap, but don't worry
>  		 * if the region isn't memory as it won't be mapped.
>  		 */
>  		if (memblock_overlaps_region(&memblock.memory, base, size) &&
> -		    memblock_is_region_reserved(base, size))
> +		    memblock_is_region_reserved(base, size)) {
> +			if (flags & OF_RMEM_LLMAP)
> +				memblock_clear_llmap(base, size);

[Severity: Low]
Similar to the above, is this rollback logic reachable?

Since OF_RMEM_NOMAP and OF_RMEM_LLMAP are mutually exclusive, this
cleanup code inside the OF_RMEM_NOMAP block should never execute.

>  			return -EBUSY;
> +		}
> =20
>  		return memblock_mark_nomap(base, size);
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902104712.2399=
797-1-vdonnefort@google.com?part=3D2
