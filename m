Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A053D9557
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 09:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786010224; cv=none; b=iV0HcqLbRD0EPU/S9BWnFIZVAiDU/7oQxSaE55ql1viX8h/mP6RtD8xPLvO+2iIOQ0jxIcKikqazwfO2yGQ77yQi53raiQz6SN6P3TO/zzuXklpJazKVjd0BcLToD0uYLr42rWXfbuGsNfGlhRkCuTCnc3eJ4/2V+w+kwOqZ6GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786010224; c=relaxed/simple;
	bh=uIH2dG6sYAEpRbM3u+3ImTFH9s6EMI1P6LlnHlb8Wvw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JPgAHD9E6ZhU0qhsDSJNd1dq52RK0E9W3C5AmF/9FhtrvFeBb1Cm3poxsydJO6HERrP6fua+wVefcZ1EwYTVo+CC5S/vxLInNunJrscDo3bb+1h+53tw0mQRiNj3Mb1JvSEODPqJz7Qn0iJ5qximIU36ainV4xEVEgQI1t5iwt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CvcQ1jI0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvcQ1jI0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFA11F000E9;
	Thu,  6 Aug 2026 09:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786010222;
	bh=B2jswFXfJ+EJJ9Jdy37EnqrOGZk+/tRLW9FZmJZUTTY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CvcQ1jI0bl3xlJq6xrWIcfMb9akOKDTL3U8HyWmrEPE59H7LlQ9vpTl7jPqKf6QEV
	 9n0tLXis57vc4YWNgXSxK2kEPMeNkohFO5LXJvKy3gLtG/+QRnyhWCnS9UtVoFZ9D7
	 LLcLPfA/NATINSopxbP/GSmRwaZzZfw2wolSwDn1JJxnsZDEq0Y6AqykQTRSbm74ph
	 N06D+y8qmbVbZGves0bygb/w2eig3B+ULgjjAVJXLsflDNZ8r1wp6+i12y7pVU0vDy
	 StJMTAFgeb4o54yHQXu4s5lVLHYYKH2dJrwc1gGc5I/WQaBv39YWNSeTaBHgX0MRDv
	 Kxk4FGXrr7b0Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/8] of: reserved_mem: mark /memreserve/ entries as
 MEMBLOCK_NODUMP
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wandun Chen" <chenwandun1@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260806093519.2907771-5-chenwandun1@gmail.com>
References: <20260806093519.2907771-1-chenwandun1@gmail.com>
 <20260806093519.2907771-5-chenwandun1@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 06 Aug 2026 09:57:00 +0000
Message-Id: <20260806095702.ADFA11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] 64-bit FDT memreserve base and size values bypass overlap checks d=
ue to type mismatch and implicit truncation to 32-bit.
- [High] The overlap check between the memreserve region and dumpable reser=
ved memory regions fails due to 32-bit arithmetic overflow.
--

--- Patch [4]: [PATCH v5 4/8] of: reserved_mem: mark /memreserve/ entries a=
s MEMBLOCK_NODUMP ---
commit 224ae2a2bcff895e0e857319035a55e95d869a02
Author: Wandun Chen <chenwandun@lixiang.com>

of: reserved_mem: mark /memreserve/ entries as MEMBLOCK_NODUMP
   =20
The /memreserve/ entries are memory reservations made by the bootloader
or firmware, their contents are not needed for kernel crash analysis,
so mark them MEMBLOCK_NODUMP to have kdump omit them from the vmcore.

Entries that overlap a dumpable region (such as CMA) are left unmarked,
because the pages of a dumpable region may carry crash-relevant data.

> diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
> index f38d11df6f152..f0683b5d77b30 100644
> --- a/drivers/of/of_reserved_mem.c
> +++ b/drivers/of/of_reserved_mem.c
[ ... ]
> @@ -251,6 +251,38 @@ static void __init __rmem_check_for_overlap(void)
>  	}
>  }
> =20
> +void __init fdt_mark_memreserve_nodump(void)
> +{
> +	u64 base, size;
> +	int n;
> +	const void *fdt =3D initial_boot_params;
> +
> +	if (!IS_ENABLED(CONFIG_CRASH_DUMP))
> +		return;
> +
> +	if (!fdt)
> +		return;
> +
> +	for (n =3D 0; ; n++) {
> +		int i;
> +
> +		if (fdt_get_mem_rsv(fdt, n, &base, &size))
> +			break;
> +		if (!size)
> +			break;
> +
> +		for (i =3D 0; i < reserved_mem_count; i++) {
> +			struct reserved_mem *rmem =3D &reserved_mem[i];
> +
> +			if (rmem->dumpable && base < rmem->base + rmem->size &&
> +			    rmem->base < base + size)

[Severity: High]
Does this overlap check suffer from a 32-bit arithmetic overflow?

Both rmem->base and rmem->size are phys_addr_t. On 32-bit systems, their
addition evaluates as a 32-bit operation. If a dumpable memory region exten=
ds
exactly to the end of the 32-bit address space, rmem->base + rmem->size cou=
ld
overflow and wrap to 0.

The wrapped value 0 would then be zero-extended to u64 for the comparison
against the u64 base. The comparison base < 0ULL will always evaluate to fa=
lse,
causing the overlap check to silently fail and incorrectly mark the memrese=
rve
as MEMBLOCK_NODUMP.

> +				break;
> +		}
> +		if (i =3D=3D reserved_mem_count)
> +			memblock_mark_nodump(base, size);

[Severity: High]
Could this implicitly truncate the 64-bit base and size values to 32-bit?

The base and size variables are u64, but memblock_mark_nodump() expects 32-=
bit
phys_addr_t parameters on 32-bit systems without PAE.

If an FDT contains a memory reservation with a base address above 4GB, the
64-bit value passes the overlap check above but gets implicitly truncated h=
ere.
This modifies the truncated 32-bit address instead, completely bypassing the
overlap check for the address actually being modified, and could erroneously
mark valid dumpable memory regions as MEMBLOCK_NODUMP.

> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806093519.2907=
771-1-chenwandun1@gmail.com?part=3D4
